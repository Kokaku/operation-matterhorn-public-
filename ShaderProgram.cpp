#include "ShaderProgram.h"

ShaderProgram::ShaderProgram()
    : mLinked(false)
{
    mHandle = glCreateProgram();
}

ShaderProgram::~ShaderProgram()
{
    glDeleteProgram(mHandle);
}

void ShaderProgram::loadString(GLenum type, const string& source)
{
    Shader shader(type);
    shader.loadFromString(source);
    glAttachShader(mHandle, shader.handle());
    mAttachedShaders.push_back(shader.handle());
}

void ShaderProgram::loadFile(GLenum type, const string& filename)
{
    Shader shader(type);
    shader.loadFromFile(filename);
    glAttachShader(mHandle, shader.handle());
    mAttachedShaders.push_back(shader.handle());
}

void ShaderProgram::linkProgram()
{
    glLinkProgram(mHandle);

    GLint status;
    glGetProgramiv(mHandle, GL_LINK_STATUS, &status);

    if (!status) {
        GLint logLength;
        glGetProgramiv(mHandle, GL_INFO_LOG_LENGTH, &logLength);

        GLchar logString[logLength + 1];
        glGetProgramInfoLog(mHandle, logLength, NULL, logString);
        cerr << "Shader program linking failed:\n" << logString << endl;
        exit(EXIT_FAILURE);
    } else {
        // Success, we can now detach the shaders to free some memory
        for (size_t i = 0; i < mAttachedShaders.size(); ++i) {
            glDetachShader(mHandle, mAttachedShaders[i]);
        }
        mAttachedShaders.clear();
        mLinked = true;
    }
}

void ShaderProgram::bind() const
{
    if (!mLinked) {
        cerr << "Shader program not linked." << endl;
    } else {
        glUseProgram(mHandle);
    }
}

void ShaderProgram::unbind() const
{
    glUseProgram(0);
}

GLuint ShaderProgram::attribute(const string& name) const
{
    GLuint attribute = glGetAttribLocation(mHandle, name.c_str());

//    if (attribute == -1) {
//        cerr << "Invalid attribute name specified: " << name << endl;
//        exit(EXIT_FAILURE);
//    }

    return attribute;
}

GLuint ShaderProgram::uniform(const string& name) const
{
    GLuint uniform = glGetUniformLocation(mHandle, name.c_str());

//    if (uniform == -1) {
//        cerr << "Invalid uniform name specified: " << name << endl;
//        exit(EXIT_FAILURE);
//    }

    return uniform;
}
