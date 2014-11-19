#ifndef CONFIG_H
#define CONFIG_H

static const unsigned int TEXTURE_SIZE = 1024; // Texture size in pixels
static const unsigned int GRID_SIZE = 1024; // Number of vertices per side
static const float GRID_RANGE = 50.0f;
static const float GRID_STARTING_POS = -25.0f; // The grid need to be centered at (0,0,0) !
static const unsigned int WINDOW_WIDTH = 1000;
static const unsigned int WINDOW_HEIGHT = 750;
static const bool WIREFRAME_RENDERING = false;
static const float SEA_LEVEL = -0.4; // Should be between -1 and 1 when using fBm
// Our testing seed is 1399303914
static const unsigned int SEED = 1399303914; // Seed for the terrain generation, use 0 for pseudo-random

#endif // CONFIG_H
