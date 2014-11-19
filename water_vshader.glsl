#version 330 core

in vec2 position;

uniform float seaLevel;

uniform mat4 projection;
uniform mat4 modelview;

mat4 PMV = projection * modelview;

void main() {
    gl_Position = PMV * vec4(position, 2.7 + seaLevel, 1);
}

