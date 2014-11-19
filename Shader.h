#ifndef SHADER_H
#define SHADER_H

#include "common.h"
#include <fstream>

class Shader
{
public:
    Shader(GLenum type);
    ~Shader();
    void loadFromFile(const string& filename) const;
    void loadFromString(const string& source) const;
    GLuint handle() const;
private:
    GLuint mHandle;
    string mType;

    void compile() const;
};

#endif // SHADER_H
