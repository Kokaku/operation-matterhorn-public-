#include "Skybox.h"

const GLfloat Skybox::vertices[] = {
    -1.0,  1.0,  1.0,
    -1.0, -1.0,  1.0,
     1.0, -1.0,  1.0,
     1.0,  1.0,  1.0,
    -1.0,  1.0, -1.0,
    -1.0, -1.0, -1.0,
     1.0, -1.0, -1.0,
     1.0,  1.0, -1.0,
};

const GLushort Skybox::indices[] = {
    0, 1, 2,
    0, 2, 3,
    3, 2, 6,
    3, 6, 7,
    7, 6, 5,
    7, 5, 4,
    4, 5, 1,
    4, 1, 0,
    0, 3, 7,
    0, 7, 4,
    1, 2, 6,
    1, 6, 5
};

Skybox::Skybox()
{
    loadCubeMap();
    init();
}

Skybox::~Skybox()
{
    glDeleteBuffers(1, &mVertexBuffer);
    glDeleteBuffers(1, &mIndexBuffer);
    glDeleteVertexArrays(1, &mVAO);
    glDeleteTextures(1, &mTexture);
}

void Skybox::loadCubeMap()
{
    glActiveTexture(GL_TEXTURE7);
    glEnable(GL_TEXTURE_CUBE_MAP_SEAMLESS);

    glGenTextures(1, &mTexture);
    glBindTexture(GL_TEXTURE_CUBE_MAP, mTexture);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);

    GLFWimage xpos, xneg, ypos, yneg, zpos, zneg;
    glfwReadImage("skybox_xpos.tga", &xpos, GLFW_NO_RESCALE_BIT);
    glfwReadImage("skybox_xneg.tga", &xneg, GLFW_NO_RESCALE_BIT);
    glfwReadImage("skybox_ypos.tga", &ypos, GLFW_NO_RESCALE_BIT);
    glfwReadImage("skybox_yneg.tga", &yneg, GLFW_NO_RESCALE_BIT);
    glfwReadImage("skybox_zpos.tga", &zpos, GLFW_NO_RESCALE_BIT);
    glfwReadImage("skybox_zneg.tga", &zneg, GLFW_NO_RESCALE_BIT);

    glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X, 0, xpos.Format, xpos.Width, xpos.Height, 0, xpos.Format, GL_UNSIGNED_BYTE, xpos.Data);
    glTexImage2D(GL_TEXTURE_CUBE_MAP_NEGATIVE_X, 0, xneg.Format, xneg.Width, xneg.Height, 0, xneg.Format, GL_UNSIGNED_BYTE, xneg.Data);
    glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_Y, 0, ypos.Format, ypos.Width, ypos.Height, 0, ypos.Format, GL_UNSIGNED_BYTE, ypos.Data);
    glTexImage2D(GL_TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, yneg.Format, yneg.Width, yneg.Height, 0, yneg.Format, GL_UNSIGNED_BYTE, yneg.Data);
    glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_Z, 0, zpos.Format, zpos.Width, zpos.Height, 0, zpos.Format, GL_UNSIGNED_BYTE, zpos.Data);
    glTexImage2D(GL_TEXTURE_CUBE_MAP_NEGATIVE_Z, 0, zneg.Format, zneg.Width, zneg.Height, 0, zneg.Format, GL_UNSIGNED_BYTE, zneg.Data);

    glfwFreeImage(&xpos);
    glfwFreeImage(&xneg);
    glfwFreeImage(&ypos);
    glfwFreeImage(&yneg);
    glfwFreeImage(&zpos);
    glfwFreeImage(&zneg);
}

void Skybox::init()
{
    glGenVertexArrays(1, &mVAO);
    glBindVertexArray(mVAO);

    glGenBuffers(1, &mVertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

    glGenBuffers(1, &mIndexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, mIndexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

    // Set up the shaders
    mShader.loadString(GL_VERTEX_SHADER, skybox_vshader);
    mShader.loadString(GL_FRAGMENT_SHADER, skybox_fshader);
    mShader.linkProgram();
    mShader.bind();

    GLuint position = mShader.attribute("position");
    glEnableVertexAttribArray(position);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glVertexAttribPointer(position, 3, GL_FLOAT, GL_FALSE, 0, (GLvoid*) 0);

    glActiveTexture(GL_TEXTURE7);
    glBindTexture(GL_TEXTURE_CUBE_MAP, mTexture);
    glUniform1i(mShader.uniform("textureSky"), 7);

    glBindVertexArray(0);
}

void Skybox::render(const mat4& projection, const mat4& modelview) const
{
    glBindVertexArray(mVAO);
    mShader.bind();

    glUniformMatrix4fv(mShader.uniform("projection"), 1, GL_FALSE, projection.data());
    glUniformMatrix4fv(mShader.uniform("modelview"), 1, GL_FALSE, modelview.data());

    glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_SHORT, 0);

    mShader.unbind();
    glBindVertexArray(0);
}
