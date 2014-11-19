#ifndef GRID_H
#define GRID_H

#include "common.h"
#include "ShaderProgram.h"
#include "HeightMap.h"
#include "terrain_fshader.h"
#include "terrain_vshader.h"
#include "water_fshader.h"
#include "water_vshader.h"
#include "Config.h"
#include "Texture.h"
#include "ShadowMap.h"

class Grid
{
public:
    Grid(unsigned int size, float range, float startingPos);
    ~Grid();
    void render(const mat4& projection, const mat4& modelview, int sunPosition);
private:
    unsigned int mSize;
    float mRange;
    float mStartingPos;

    GLuint mVAO;
    GLuint mIndexBuffer;
    GLuint mVertexBuffer;
    GLuint mUVBuffer;

    ShaderProgram mShader;
    ShaderProgram mWaterShader;
    Texture mTextureGrass;
    Texture mTextureRock;
    Texture mTextureSand;
    Texture mTextureSnow;

    HeightMap mHeightMap;
    ShadowMap mShadowMap;

    vector<vec2> mVertices;
    vector<vec2> mUV;
    vector<unsigned int> mIndices;

    mat4 mLightProj;
    mat4 mLightView;
    vec3 mLightPos;

    void initVertices();
    void initIndices();
    void bufferGrid();
};

#endif // GRID_H
