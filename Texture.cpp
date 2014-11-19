#include "Texture.h"

Texture::Texture()
{
    glGenTextures(1, &mHandle);
}

Texture::~Texture()
{
    glDeleteTextures(1, &mHandle);
}

void Texture::bind() const
{
    glBindTexture(GL_TEXTURE_2D, mHandle);
}

void Texture::unbind() const
{
    glBindTexture(GL_TEXTURE_2D, 0);
}

void Texture::loadTGA(const string &filename)
{
    // We keep this texture unit for loading so that we not mess
    // up the other ones while binding and setting the texture parameters
    glActiveTexture(GL_TEXTURE0);

    bind();


    if (!glfwLoadTexture2D(filename.c_str(), GLFW_NO_RESCALE_BIT)) {
        cerr << "Couldn't load texture: " << filename << endl;
        exit(EXIT_FAILURE);
    }

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
    glGenerateMipmap(GL_TEXTURE_2D);

    unbind();
}
