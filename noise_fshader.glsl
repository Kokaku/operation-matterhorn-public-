#version 330 core

//-------------------------------
// INPUT / OUTPUT
//-------------------------------
out vec3 fColor;

uniform sampler1D texturePermutation;
uniform sampler1D textureGradient;
uniform float seaLevel;
uniform int size;

//-------------------------------
// PARAMETERS
//-------------------------------
float baseFrequency = 0.007;
float lacunarity = 2.05;
float gain = 1/lacunarity;
int octaves = 4;

//-------------------------------
// FUNCTIONS
//-------------------------------

vec3 fade(vec3 t) {
    return t * t * t * (t * (t * 6 - 15) + 10);
}

float perm(float x) {
    return texture(texturePermutation, x / 256.0).r * 256;
}

float grad(float x, vec3 p) {
    return dot(texture(textureGradient, x).rgb, p);
}

// Perlin noise
float inoise(vec3 p) {
    vec3 P = mod(floor(p), 256.0);
    p -= floor(p);
    vec3 f = fade(p);

    float A = perm(P.x) + P.y;
    float AA = perm(A) + P.z;
    float AB = perm(A + 1) + P.z;
    float B = perm(P.x + 1) + P.y;
    float BA = perm(B) + P.z;
    float BB = perm(B + 1) + P.z;

    return mix(
        mix(mix(grad(perm(AA), p),
                grad(perm(BA), p + vec3(-1, 0, 0)), f.x),
            mix(grad(perm(AB), p + vec3(0, -1, 0)),
                grad(perm(BB), p + vec3(-1, -1, 0)), f.x), f.y),
        mix(mix(grad(perm(AA + 1), p + vec3(0, 0, -1)),
                grad(perm(BA + 1), p + vec3(-1, 0, -1)), f.x),
            mix(grad(perm(AB + 1), p + vec3(0, -1, -1)),
                grad(perm(BB + 1), p + vec3(-1, -1, -1)), f.x), f.y),
        f.z);
}

// Fractional brownian motion (with or without turbulence)
float fbm(bool turbulence) {
    float result = 0.0;
    float amplitude = 1;
    float frequency = baseFrequency;

    for(int i = 0; i < octaves; i++) {
        float noise = inoise(gl_FragCoord.xyz*frequency);
        if (turbulence) {
            noise = abs(noise);
        }
        result += noise*amplitude;
        frequency *= lacunarity;
        amplitude *= gain;
    }
    return result;
}

float fbm2(vec3 coord, float H, float lacunarity, float octaves) {
    float value = 0.0;

    for (int i = 0; i < octaves; ++i) {
        value += inoise(coord) * pow(lacunarity, -H*i);
        coord *= lacunarity;
    }
    return value;
}

float multifractal(vec3 coord, float H, float lacunarity, float octaves, float offset) {
    float value = 1.0;

    for (int i = 0; i < octaves; ++i) {
        value *= 1-abs((inoise(coord*0.005) + offset)) * pow(lacunarity, -H*i);
        //value *= (inoise(coord) + offset) * pow(lacunarity, -H*i);
        coord *= lacunarity;
    }
    return value;
}

float multiridged(vec3 coord, float H, float lacunarity, float octaves, float offset, float gain) {
    float result, signal, weight;
    float pwHL = pow(lacunarity, -H);
    float pwr = pwHL;

    signal = offset - abs(inoise(coord));
    signal *= signal;
    result = signal;
    weight = 1.0f;

    for (int i = 1; i < octaves; i++) {
        coord *= lacunarity;
        weight = clamp(signal*gain, 0, 1);
        signal = offset - abs(inoise(coord));
        signal *= signal;
        signal *= weight;
        result += signal * pwr;
        pwr *= pwHL;
    }

    return result;
}

float heteroTerrain(vec3 point, float H, float lacunarity, float octaves, float offset) {
    float value, increment, rmd;
    float pwHL = pow(lacunarity, -H);
    float pwr = pwHL;

    value = offset + inoise(point);
    point *= lacunarity;

    for (int i = 1; i < octaves; i++) {
        increment = (inoise(point) + offset) * pwr * value;
        value += increment;
        pwr *= pwHL;
        point *= lacunarity;
    }

    rmd = octaves - floor(octaves);
    if (rmd != 0.0) {
        increment = (inoise(point) + offset) * pwr * value;
        value += rmd * increment;
    }

    return value;
}

float hybridMultifractal(vec3 point, float H, float lacunarity, float octaves, float offset, float gain) {
        float result, signal, weight, rmd;
        float pwHL = pow(lacunarity, -H);
        float pwr = pwHL;

        result = inoise(point) + offset;
        weight = gain * result;
        point *= lacunarity;

        for(int i = 1; (weight > 0.001f) && (i < octaves); i++) {
                if (weight > 1.0f)
                        weight = 1.0f;

                signal = (inoise(point) + offset) * pwr;
                pwr *= pwHL;
                result += weight * signal;
                weight *= gain * signal;
                point *= lacunarity;
        }

        rmd = octaves - floor(octaves);
        if(rmd != 0.0f)
                result += rmd * ((inoise(point) + offset) * pwr);

        return result;
}

void main() {
    //fColor = 15*vec3(hybridMultifractal(vec3(gl_FragCoord.xy, 0) / 250, 0.9, 3.6, 7, 0.7, 1.7), 0, 0);
    //fColor = 10*vec3(heteroTerrain(vec3(gl_FragCoord.xy, 0) / 200, 0.9, 1.6, 5, 0.5), 0, 0);
    fColor = 11.5*(vec3(multiridged(vec3(gl_FragCoord.xy, 0) / (float(size) / 1.8), 1.0, 3, 9, 0.78, 2.5), 0, 0));
    //fColor = 10*(vec3(multiridged(vec3(gl_FragCoord.xy, 0) / 250, 0.98, 2.0, 7, 0.8, 1.7), 0, 0));
    //fColor = 5*vec3(fbm2(vec3(gl_FragCoord.xy/256, 0), 0.8, 2.0, 4), 0, 0);
    //fColor = 5*vec3(multifractal(gl_FragCoord.xyz, 0.8, 2.0, 7, 0.8), 0, 0);
    //fColor = 5*vec3(multifractal(gl_FragCoord.xyz, 0.8, 2.0, 2, 0.8), 0, 0);
    //fColor = vec3(fbm(false), 0, 0);
}



