#ifndef TEXTURE_H
#define TEXTURE_H

#include "common.h"

class Texture
{
public:
    Texture();
    ~Texture();
    void loadTGA(const string& filename);
    void bind() const;
    void unbind() const;
private:
    GLuint mHandle;
};

#endif // TEXTURE_H
