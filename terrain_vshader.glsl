#version 330 core

in vec2 vPosition;
in vec2 vertexUV; // Used when we need to map the heightmap texture to the grid (for development)
out vec2 UV; // Ditto
out vec2 vertexPosition;
out float positionZ;
out vec2 position;
out vec4 shadowCoord;

uniform mat4 projection;
uniform mat4 modelview;
uniform sampler2D textureHeightMap;
uniform float gridRange;

uniform mat4 projectionDepth;
uniform mat4 modelviewDepth;

mat4 PMV = projection * modelview;
mat4 PMV_Depth = projectionDepth * modelviewDepth;

// Get the height at a particular position
float height(vec2 position, vec2 offset) {
    return texture(textureHeightMap, (position / gridRange + 0.5) + offset).r;
}

void main() {
    float z = height(vPosition.xy, vec2(0,0));
    positionZ = z;
    vertexPosition = vPosition;
    position = vPosition;
    gl_Position = PMV * vec4(vPosition, z, 1);
    UV = vertexUV;

    shadowCoord = PMV_Depth * vec4(vPosition, z, 1);
}

