#include "HeightMap.h"

const GLfloat HeightMap::gradient[] = {
    1,1,0,   -1,1,0,   1,-1,0,   -1,-1,0,
    1,0,1,   -1,0,1,   1,0,-1,   -1,0,-1,
    0,1,1,   0,-1,1,   0,1,-1,   0,-1,-1,
    1,1,0,   0,-1,1,   -1,1,0,   0,-1,-1
};

HeightMap::HeightMap(GLsizei size, float seaLevel, unsigned int seed)
    : mSize(size), mSeed(seed), mSeaLevel(seaLevel)
{
    generatePerm();
    generateTextures();
    draw();
}

HeightMap::~HeightMap()
{
    glDeleteTextures(1, &mTextureHeightMap);
}

/**
 * Fill the permutation array for terrain generation
 */
void HeightMap::generatePerm()
{
    if (!mSeed) {
        unsigned int seed = time(0);
        cout << "Using the seed " << seed << endl;
        srand(seed);
    } else {
        srand(mSeed);
    }

    mPermutation.reserve(256);

    for (int i = 0; i < 256; ++i) {
        mPermutation.push_back(i);
    }

    random_shuffle(mPermutation.begin(), mPermutation.end(), HeightMap::random);
}

int HeightMap::random(int max)
{
    return rand() % max;
}

void HeightMap::generateTextures()
{
    // Generate the height map texture and configure it
    glGenTextures(1, &mTextureHeightMap);
    glBindTexture(GL_TEXTURE_2D, mTextureHeightMap);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_R32F, mSize, mSize, 0, GL_RED, GL_UNSIGNED_BYTE, NULL);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

    // Generate the texture storing the permutation array values and configure it
    glGenTextures(1, &mTexturePerm);
    glBindTexture(GL_TEXTURE_1D, mTexturePerm);
    glTexImage1D(GL_TEXTURE_1D, 0, GL_RED, 256, 0, GL_RED, GL_UNSIGNED_BYTE, &mPermutation[0]);
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    // Generate the texture storing the gradient array values and configure it
    GLuint textureGradient;
    glGenTextures(1, &mTextureGradient);
    glBindTexture(GL_TEXTURE_1D, mTextureGradient);
    glTexImage1D(GL_TEXTURE_1D, 0, GL_RGB32F, 16, 0, GL_RGB, GL_FLOAT, gradient);
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
}

void HeightMap::draw()
{
    // Save the current shader to restore it later
    GLint formerShader;
    glGetIntegerv(GL_CURRENT_PROGRAM, &formerShader);

    // Create and bind a VAO
    GLuint vertexArray;
    glGenVertexArrays(1, &vertexArray);
    glBindVertexArray(vertexArray);

    ShaderProgram shader;
    shader.loadString(GL_VERTEX_SHADER, noise_vshader);
    shader.loadString(GL_FRAGMENT_SHADER, noise_fshader);
    shader.linkProgram();
    shader.bind();

    // Generate and bind a framebuffer to write to the height map texture
    GLuint frameBuffer;
    glGenFramebuffers(1, &frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
    // Keep the window size to set it back after drawing
    GLint windowSize[4];
    glGetIntegerv(GL_VIEWPORT, windowSize);
    glViewport(0, 0, mSize, mSize); // We want to draw the whole texture
    glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, mTextureHeightMap, 0);

    // Set the permutation texture for use in the shaders
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_1D, mTexturePerm);
    glUniform1i(shader.uniform("texturePermutation"), 0);

    // Set the gradient texture for use in the shaders
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_1D, mTextureGradient);
    glUniform1i(shader.uniform("textureGradient"), 1);

    // Check if the framebuffer is correctly set up
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        cout << "Unable to create the framebuffer to render the noise texture." << endl;
        exit(EXIT_FAILURE);
    }

    // These vertices span the whole framebuffer
    const GLfloat vertices[12] = { -1, -1, 0, 1, -1, 0, -1, 1, 0, 1, 1, 0 };

    // Buffer the vertices
    GLuint vertexBuffer;
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

    // Set the attribute in the shaders
    GLuint vPosition = shader.attribute("vPosition");
    glEnableVertexAttribArray(vPosition);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glVertexAttribPointer(vPosition, 3, GL_FLOAT, GL_FALSE, 0, (GLvoid*) 0);

    glUniform1f(shader.uniform("seaLevel"), mSeaLevel);
    glUniform1i(shader.uniform("size"), mSize);

    // Draw the vertices to generate the texture
    glClear(GL_COLOR_BUFFER_BIT);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

    // Set the viewport to its former size
    glViewport(windowSize[0], windowSize[1], windowSize[2], windowSize[3]);

    // Cleanup
    glDeleteFramebuffers(1, &frameBuffer);
    glDeleteTextures(1, &mTextureGradient);
    glDeleteTextures(1, &mTexturePerm);
    glDeleteBuffers(1, &vertexBuffer);
    glDeleteVertexArrays(1, &vertexArray);

    // Set the current shader to the former one
    glUseProgram(formerShader);
}

void HeightMap::bind() const
{
    glBindTexture(GL_TEXTURE_2D, mTextureHeightMap);
}
