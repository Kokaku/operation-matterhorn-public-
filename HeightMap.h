#ifndef HEIGHTMAP_H
#define HEIGHTMAP_H

#include "common.h"
#include "ShaderProgram.h"
#include "noise_vshader.h"
#include "noise_fshader.h"

class HeightMap
{
public:
    HeightMap(GLsizei size, float seaLevel, unsigned int seed = 0);
    ~HeightMap();
    void bind() const;
private:
    static const GLfloat gradient[];
    static int random(int max);

    GLsizei mSize;
    unsigned int mSeed;
    GLuint mTextureHeightMap;
    GLuint mTexturePerm;
    GLuint mTextureGradient;
    GLfloat mSeaLevel;
    vector<GLubyte> mPermutation;

    void generatePerm();
    void generateTextures();
    void draw();
};

#endif // HEIGHTMAP_H
