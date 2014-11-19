#version 330 core

in vec3 vPosition;

uniform mat4 projection;
uniform mat4 modelview;

mat4 PMV = projection * modelview;

void main() {
    gl_Position = PMV * vec4(vPosition.xyz, 1);
}
