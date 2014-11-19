#include "ShadowMap.h"

ShadowMap::ShadowMap(GLfloat ratio)
    : mRatio(ratio)
{
    init();
}

ShadowMap::~ShadowMap()
{
    glDeleteFramebuffers(1, &mFrameBuffer);
    glDeleteTextures(1, &mDepthTexture);
}

void ShadowMap::init()
{
    // Generate the shadow map texture and configure it
    glGenTextures(1, &mDepthTexture);
    glBindTexture(GL_TEXTURE_2D, mDepthTexture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT16, WINDOW_WIDTH * mRatio, WINDOW_HEIGHT * mRatio, 0, GL_DEPTH_COMPONENT, GL_FLOAT, NULL);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_COMPARE_FUNC, GL_LEQUAL);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_COMPARE_MODE, GL_COMPARE_REF_TO_TEXTURE);

    mShader.loadString(GL_VERTEX_SHADER, terrain_vshader);
    mShader.loadString(GL_FRAGMENT_SHADER, shadow_fshader);
    mShader.linkProgram();

    // Generate and bind a framebuffer to write to the shadow map texture
    glGenFramebuffers(1, &mFrameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, mFrameBuffer);
    glFramebufferTexture(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, mDepthTexture, 0);

    // Check if the framebuffer is correctly set up
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        cout << "Unable to create the framebuffer to render the shadow map." << endl;
        exit(EXIT_FAILURE);
    }

    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}

void ShadowMap::shadowPassBegin(const mat4& lightProj, const mat4& lightView) const
{
    mShader.bind();
    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, mFrameBuffer);

    glViewport(0, 0, WINDOW_WIDTH * mRatio, WINDOW_HEIGHT * mRatio); // We want to draw the whole texture
    glDrawBuffer(GL_NONE);

    glClear(GL_DEPTH_BUFFER_BIT);

    glUniformMatrix4fv(mShader.uniform("projection"), 1, GL_FALSE, lightProj.data());
    glUniformMatrix4fv(mShader.uniform("modelview"), 1, GL_FALSE, lightView.data());
}

void ShadowMap::shadowPassEnd() const
{
    // Set the viewport to its former size
    glViewport(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
    glBindFramebuffer(GL_FRAMEBUFFER, 0);

    mShader.unbind();
}

const ShaderProgram& ShadowMap::shader() const
{
    return mShader;
}

void ShadowMap::bind() const
{
    glBindTexture(GL_TEXTURE_2D, mDepthTexture);
}

