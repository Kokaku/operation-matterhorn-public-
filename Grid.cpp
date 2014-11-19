#include "Grid.h"

Grid::Grid(unsigned int size, float range, float startingPos)
    : mSize(size), mRange(range), mStartingPos(startingPos),
      mHeightMap(TEXTURE_SIZE, SEA_LEVEL, SEED), mShadowMap(3)
{
    mTextureGrass.loadTGA("grass.tga");
    mTextureRock.loadTGA("rock.tga");
    mTextureSand.loadTGA("sand.tga");
    mTextureSnow.loadTGA("snow.tga");
    initVertices();
    initIndices();
    bufferGrid();
}

Grid::~Grid()
{
    glDeleteBuffers(1, &mVertexBuffer);
    glDeleteBuffers(1, &mIndexBuffer);
    glDeleteBuffers(1, &mUVBuffer);
    glDeleteVertexArrays(1, &mVAO);
}

/**
 * Create the vertices for the grid
 */
void Grid::initVertices()
{
    const float spacing = mRange / (mSize - 1);
    const unsigned int nbVertices = mSize * mSize;

    glPrimitiveRestartIndex(nbVertices);
    mVertices.reserve(nbVertices);
    mUV.reserve(nbVertices);

    for (unsigned int y = 0; y < mSize; ++y) {
        for (unsigned int x = 0; x < mSize; ++x) {
            const float xPos = mStartingPos + x * spacing;
            const float yPos = mStartingPos + y * spacing;
            mVertices.push_back(vec2(xPos, yPos));

            const float uCoord = x / float(mSize-1);
            const float vCoord = y / float(mSize-1);
            mUV.push_back(vec2(uCoord, vCoord));
        }
    }
}

/**
 * Initializes the indices array used for to draw the grid
 */
void Grid::initIndices() {
    const unsigned int nbStrips = mSize-1;
    const unsigned int verticesPerStrip = mSize*2;
    const unsigned int nbReset = nbStrips-1;
    const unsigned int nbVertices = mSize * mSize;
    const unsigned int nbIndices = nbStrips * verticesPerStrip + nbReset;

    mIndices.reserve(nbIndices);

    for (unsigned int y = 0; y < nbStrips; ++y) {
        for (unsigned int x = 0; x < mSize; ++x) {
            mIndices.push_back((y+1) * mSize + x);
            mIndices.push_back(y * mSize + x);
        }

        if (y < nbStrips-1) {
           mIndices.push_back(nbVertices);
        }
    }
}

/**
 * Send the formerly generated data to the GPU and set up the shaders attributes
 */
void Grid::bufferGrid()
{
    // Enable blending
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    glGenVertexArrays(1, &mVAO);
    glBindVertexArray(mVAO);

    glGenBuffers(1, &mIndexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, mIndexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, mIndices.size() * sizeof(unsigned int), &mIndices[0], GL_STATIC_DRAW);

    glGenBuffers(1, &mVertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, mVertices.size() * sizeof(vec2), &mVertices[0], GL_STATIC_DRAW);

    glGenBuffers(1, &mUVBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, mUVBuffer);
    glBufferData(GL_ARRAY_BUFFER, mUV.size() * sizeof(vec2), &mUV[0], GL_STATIC_DRAW);

    // Set up the shaders
    mShader.loadString(GL_VERTEX_SHADER, terrain_vshader);
    mShader.loadString(GL_FRAGMENT_SHADER, terrain_fshader);
    mShader.linkProgram();
    mShader.bind();

    GLuint position = mShader.attribute("vPosition");
    glEnableVertexAttribArray(position);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glVertexAttribPointer(position, 2, GL_FLOAT, GL_FALSE, 0, (GLvoid*) 0);

    GLuint vertexUV = mShader.attribute("vertexUV");
    glEnableVertexAttribArray(vertexUV);
    glBindBuffer(GL_ARRAY_BUFFER, mUVBuffer);
    glVertexAttribPointer(vertexUV, 2, GL_FLOAT, GL_FALSE, 0, (GLvoid*) 0);

    glActiveTexture(GL_TEXTURE1);
    mHeightMap.bind();
    // Now we can reactive the linear filtering
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glUniform1i(mShader.uniform("textureHeightMap"), 1);

    glActiveTexture(GL_TEXTURE2);
    mTextureGrass.bind();
    glUniform1i(mShader.uniform("textureGrass"), 2);

    glActiveTexture(GL_TEXTURE3);
    mTextureRock.bind();
    glUniform1i(mShader.uniform("textureRock"), 3);

    glActiveTexture(GL_TEXTURE4);
    mTextureSand.bind();
    glUniform1i(mShader.uniform("textureSand"), 4);

    glActiveTexture(GL_TEXTURE5);
    mTextureSnow.bind();
    glUniform1i(mShader.uniform("textureSnow"), 5);

    glUniform1f(mShader.uniform("seaLevel"), SEA_LEVEL);

    glUniform1f(mShader.uniform("gridRange"), mRange);
    glUniform1f(mShader.uniform("nbOfVertices"), mSize);

    // Set up the water shader
    mWaterShader.loadString(GL_VERTEX_SHADER, water_vshader);
    mWaterShader.loadString(GL_FRAGMENT_SHADER, water_fshader);
    mWaterShader.linkProgram();
    mWaterShader.bind();

    GLuint positionWater = mWaterShader.attribute("position");
    glEnableVertexAttribArray(positionWater);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glVertexAttribPointer(positionWater, 2, GL_FLOAT, GL_FALSE, 0, (GLvoid*) 0);

    glUniform1f(mWaterShader.uniform("seaLevel"), SEA_LEVEL);

    // Set up the matrices for shadow mapping (light POV)
    mLightProj = Eigen::ortho(-40.0f, 40.0f, -30.0f, 30.0f, -90.0f, 90.0f);

    // Unbind the VAO to avoid to mess it up somewhere else
    // Can be ignored for optimization since we usually call Grid::render() afterwards
    glBindVertexArray(0);
}

void Grid::render(const mat4& projection, const mat4& modelview, int sunPosition)
{
    // Bind the correct VAO and shader before rendering
    glBindVertexArray(mVAO);

    // Needed for drawing the grid
    glEnable(GL_PRIMITIVE_RESTART);

    float angle = sunPosition * M_PI/2/8;
    mLightPos = vec3(30*cos(angle), 0, 30*sin(angle));
    vec3 cam_look(0.0f, 0.0f, 0.0f);
    vec3 cam_up(0.0f, 0.0f, 1.0f);
    mLightView = Eigen::lookAt(mLightPos, cam_look, cam_up);

    // Set up the terrain shader to use these matrices
    mShader.bind();
    glUniformMatrix4fv(mShader.uniform("projectionDepth"), 1, GL_FALSE, mLightProj.data());
    glUniformMatrix4fv(mShader.uniform("modelviewDepth"), 1, GL_FALSE, mLightView.data());

    // Draw to the shadow map
    mShadowMap.shadowPassBegin(mLightProj, mLightView);

    // Set the attribute in the shaders
    GLuint vPosition = mShadowMap.shader().attribute("position");
    glEnableVertexAttribArray(vPosition);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glVertexAttribPointer(vPosition, 2, GL_FLOAT, GL_FALSE, 0, (GLvoid*) 0);
    glUniform1i(mShadowMap.shader().uniform("textureHeightMap"), 1);
    glUniform1f(mShadowMap.shader().uniform("gridRange"), mRange);

    // Drawing
    glDrawElements(GL_TRIANGLE_STRIP, mIndices.size(), GL_UNSIGNED_INT, (void*) 0);

    // Finish to draw to the shadow map
    mShadowMap.shadowPassEnd();

    // Set up the terrain shader to use the shadow map texture
    mShader.bind();
    glActiveTexture(GL_TEXTURE6);
    mShadowMap.bind();
    glUniform1i(mShader.uniform("shadowMap"), 6);

    // Render the terrain
    glUniformMatrix4fv(mShader.uniform("projection"), 1, GL_FALSE, projection.data());
    glUniformMatrix4fv(mShader.uniform("modelview"), 1, GL_FALSE, modelview.data());
    glUniform3fv(mShader.uniform("sunPosition"), 1, mLightPos.data());

    glDrawElements(GL_TRIANGLE_STRIP, mIndices.size(), GL_UNSIGNED_INT, (void*) 0);

    mShader.unbind();

    // Render the water
    mWaterShader.bind();

    glUniformMatrix4fv(mWaterShader.uniform("projection"), 1, GL_FALSE, projection.data());
    glUniformMatrix4fv(mWaterShader.uniform("modelview"), 1, GL_FALSE, modelview.data());

    glDrawElements(GL_TRIANGLE_STRIP, mIndices.size(), GL_UNSIGNED_INT, (void*) 0);

    glDisable(GL_PRIMITIVE_RESTART);

    mWaterShader.unbind();

    glBindVertexArray(0);
}
