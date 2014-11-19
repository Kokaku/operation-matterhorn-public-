#version 330 core

#define M_PI 3.1415926535897932384626433832795

in vec3 position;
out vec3 texCoord;

uniform mat4 projection;
uniform mat4 modelview;

mat4 scale(float factor) {
    return mat4(
        factor, 0, 0, 0,
        0, factor, 0, 0,
        0, 0, factor, 0,
        0, 0, 0, 1
    );
}

mat3 rotX(float angle) {
    return mat3(
        1, 0, 0,
        0, cos(angle), sin(angle),
        0, -sin(angle), cos(angle)
    );
}

// TODO : use a uniform instead of this magic number
mat4 PMV = projection * modelview * scale(300);

void main() {
    gl_Position = PMV * vec4(position, 1);
    texCoord = rotX(M_PI/2.0) * position;
}

