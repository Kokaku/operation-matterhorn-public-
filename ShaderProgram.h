#ifndef SHADERPROGRAM_H
#define SHADERPROGRAM_H

#include "common.h"
#include "Shader.h"

class ShaderProgram
{
public:
    ShaderProgram();
    ~ShaderProgram();
    void loadString(GLenum type, const string& source);
    void loadFile(GLenum type, const string& filename);
    void linkProgram();
    void bind() const;
    void unbind() const;
    GLuint attribute(const string& name) const;
    GLuint uniform(const string& name) const;
private:
    GLuint mHandle;
    bool mLinked;
    vector<GLuint> mAttachedShaders;
    map<string, GLuint> mAttributesList;
    map<string, GLuint> mUniformsList;
};

#endif // SHADERPROGRAM_H
