#version 330 core

#define M_PI 3.1415926535897932384626433832795

out vec4 fColor;
in vec2 UV;
in vec2 vertexPosition;
in float positionZ;
in vec4 shadowCoord;

uniform float seaLevel;
uniform mat4 modelview;
uniform sampler2D textureGrass;
uniform sampler2D textureRock;
uniform sampler2D textureSand;
uniform sampler2D textureSnow;
uniform sampler2DShadow shadowMap;
uniform sampler2D textureHeightMap;
uniform float gridRange;

uniform vec3 sunPosition;

//-------------------------------
// PARAMETERS
//-------------------------------
//float angle = sunPosition * M_PI/2/9;
vec3 sun_direction = normalize((modelview * vec4(sunPosition, 0)).xyz);
//vec3 sun_direction = normalize((modelview * vec4(cos(angle), 0, sin(angle), 0)).xyz);
vec3 Id_sun = vec3(0.75f, 0.75f, 0.67f);
vec3 Id_ambient = vec3(0.7, 0.7, 1.0);
float kd_ambient = 0.5;
float kd_sun = 1.0;
// Predefinite terrain levels
float sandGrassInter = 2;
float grassLevel = 3;
float snowLevel = 6.5;

// Parameter for the calculation of normals (higher = smoother)
float small_offset = 1.0/textureSize(textureHeightMap, 0).x;
//float small_offset = gridRange/512.0; //  textureSize(textureHeightMap, 0).x / nbOfVertices

float bias = 0.005;

float alpha(float x) {
    return min(pow(1.05*x,6),1);
}

mat4 biasMatrix = mat4(
0.5, 0.0, 0.0, 0.0,
0.0, 0.5, 0.0, 0.0,
0.0, 0.0, 0.5, 0.0,
0.5, 0.5, 0.5, 1.0
);

vec2 poissonDisk[16] = vec2[](
   vec2( -0.94201624, -0.39906216 ),
   vec2( 0.94558609, -0.76890725 ),
   vec2( -0.094184101, -0.92938870 ),
   vec2( 0.34495938, 0.29387760 ),
   vec2( -0.91588581, 0.45771432 ),
   vec2( -0.81544232, -0.87912464 ),
   vec2( -0.38277543, 0.27676845 ),
   vec2( 0.97484398, 0.75648379 ),
   vec2( 0.44323325, -0.97511554 ),
   vec2( 0.53742981, -0.47373420 ),
   vec2( -0.26496911, -0.41893023 ),
   vec2( 0.79197514, 0.19090188 ),
   vec2( -0.24188840, 0.99706507 ),
   vec2( -0.81409955, 0.91437590 ),
   vec2( 0.19984126, 0.78641367 ),
   vec2( 0.14383161, -0.14100790 )
);

// Get the height at a particular position
float height(vec2 position, vec2 offset) {
    return texture(textureHeightMap, (position / gridRange + 0.5) + offset).r;
}

void main() {

    vec4 shadowCoord2 = shadowCoord;
    shadowCoord2.xyz /= shadowCoord2.w;
    shadowCoord2 = biasMatrix * shadowCoord2;
    //float shadow = texture(shadowMap, shadowCoord2.xy).x;
    //fColor = vec4(shadow, shadow, shadow, 1.0);

   float visibility = 0.0;
//    if (texture(shadowMap, shadowCoord2.xy).x < shadowCoord2.z-bias) {
//        visibility = 0.5;
//    }
    for (int i = 0 ; i < 4 ; ++i) {
        int index = i;
        visibility += 0.2 * texture(shadowMap, vec3(shadowCoord2.xy + poissonDisk[index]/700.0, shadowCoord2.z - bias));
    }
    //visibility = texture(shadowMap, vec3(shadowCoord2.xy, shadowCoord2.z - bias));


    float hL = height(vertexPosition, vec2(-small_offset, 0.0));
    float hR = height(vertexPosition, vec2(small_offset, 0.0));
    float hD = height(vertexPosition, vec2(0.0, -small_offset));
    float hU = height(vertexPosition, vec2(0.0, small_offset));

    vec3 normalN = normalize((modelview * vec4((hL-hR)*10, (hD-hU)*10, 2.0, 0.0)).xyz);
    vec3 color;
    vec3 illumination = kd_ambient*Id_ambient+visibility*kd_sun*max(dot(normalN, sun_direction), 0.0)*Id_sun;

    vec3 upN = normalize((modelview * vec4(0,0,1,0)).xyz);
    float slope = clamp(alpha(dot(normalN, upN)), 0, 1);

    vec3 terrainColor = mix(texture(textureRock, 1*UV).rgb, texture(textureGrass, 2*UV).rgb, slope);

    if (positionZ <= grassLevel) {
        color = mix(texture(textureSand, 50*UV).rgb, terrainColor, smoothstep(sandGrassInter, grassLevel, positionZ));
    } else if (positionZ + slope >= snowLevel + 1) {
        color = texture(textureSnow, 30*UV).rgb;
    } else {
        color = terrainColor;
    }

    color *= illumination;
    fColor = vec4(color, 1.0);
}
