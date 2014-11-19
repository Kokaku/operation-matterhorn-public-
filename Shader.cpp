#include "Shader.h"

Shader::Shader(GLenum type)
{
    switch (type) {
        case GL_VERTEX_SHADER:
            mType = "Vertex";
            break;
        case GL_GEOMETRY_SHADER:
            mType = "Geometry";
            break;
        case GL_FRAGMENT_SHADER:
            mType = "Fragment";
            break;
        case GL_TESS_CONTROL_SHADER:
            mType = "Tessellation control";
            break;
        case GL_TESS_EVALUATION_SHADER:
            mType = "Tessellation evaluation";
            break;
        default:
            cerr << "Invalid shader type." << endl;
            exit(EXIT_FAILURE);
    }

    mHandle = glCreateShader(type);
}

Shader::~Shader()
{
    glDeleteShader(mHandle);
}

GLuint Shader::handle() const
{
    return mHandle;
}

void Shader::loadFromString(const string& source) const
{
    char const *sourcePointer = source.c_str();

    glShaderSource(mHandle, 1, &sourcePointer, NULL);
    compile();
}

void Shader::loadFromFile(const string& filename) const
{
    ifstream file(filename.c_str());

    if (!file) {
        cerr << "Failed to open file: " << filename << endl;
        exit(EXIT_FAILURE);
    }

    // Read all the file content to a string
    stringstream buffer;
    buffer << file.rdbuf();

    file.close();

    string source = buffer.str();
    return loadFromString(source);
}

void Shader::compile() const
{
    glCompileShader(mHandle);

    GLint status;
    glGetShaderiv(mHandle, GL_COMPILE_STATUS, &status);

    if (!status) {
        GLint logLength;
        glGetShaderiv(mHandle, GL_INFO_LOG_LENGTH, &logLength);

        GLchar logString[logLength + 1];
        glGetShaderInfoLog(mHandle, logLength, NULL, logString);
        cerr << mType << " shader compilation failed:\n" << logString << endl;
        exit(EXIT_FAILURE);
    }
}

