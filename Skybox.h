#ifndef SKYBOX_H
#define SKYBOX_H

#include "common.h"
#include "ShaderProgram.h"
#include "Texture.h"
#include "skybox_vshader.h"
#include "skybox_fshader.h"

class Skybox
{
public:
    Skybox();
    ~Skybox();
    void render(const mat4& projection, const mat4& modelview) const;
private:
    GLuint mVAO;
    GLuint mVertexBuffer;
    GLuint mIndexBuffer;
    GLuint mTexture;

    ShaderProgram mShader;

    static const GLfloat vertices[];
    static const GLushort indices[];

    void loadCubeMap();
    void init();
};

#endif // SKYBOX_H
