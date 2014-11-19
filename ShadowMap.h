#ifndef SHADOWMAP_H
#define SHADOWMAP_H

#include "common.h"
#include "ShaderProgram.h"
#include "terrain_vshader.h"
#include "shadow_fshader.h"
#include "Config.h"

class ShadowMap
{
public:
    ShadowMap(GLfloat ratio);
    ~ShadowMap();
    void shadowPassBegin(const mat4& lightProj, const mat4& lightView) const;
    void shadowPassEnd() const;
    const ShaderProgram& shader() const;
    void bind() const;
private:
    GLfloat mRatio;
    GLuint mDepthTexture;
    GLuint mFrameBuffer;

    ShaderProgram mShader;

    void init();
};

#endif // SHADOWMAP_H
