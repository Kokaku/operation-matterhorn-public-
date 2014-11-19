#version 330 core

out vec4 color;
in vec3 texCoord;

uniform samplerCube textureSky;

void main() {
    color = texture(textureSky, texCoord).rgba;
}
