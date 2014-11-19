#include "common.h"
#include "Window.h"
#include "Grid.h"
#include "Config.h"
#include "Skybox.h"

using namespace std;

// PARAMETERS ARE LOCATED IN CONFIG.H

static Grid* grid;
static Skybox* skybox;
static mat4 projection;
static mat4 modelview;
static int sunPosition = 6;

/**
 * Update the model_view matrix when the virtual trackball is used
 */
void updateMatrixStack(const mat4& model)
{
    // Set the projection matrix, we may need to tweak the frustum later
    projection = Eigen::perspective(60.0f, 4.0f/3.0f, 0.1f, 550.0f);
    //projection = Eigen::ortho(-90.0f, 90.0f, -90.0f, 90.0f, -90.0f, 90.0f);

    // Set up the view matrix
    vec3 cam_pos(0.0f, 0.0f, 50.0f);
    vec3 cam_look(0.0f, 0.0f, 0.0f);
    vec3 cam_up(0.0f, 1.0f, 0.0f);
    static mat4 view = Eigen::lookAt(cam_pos, cam_look, cam_up);

    // Compute the model-view matrix
    modelview = view * model;
}

/**
 * Program initialization
 */
void init() {
    // Set some OpenGL states
    if (WIREFRAME_RENDERING) {
        glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
    }

    glClearColor(1, 1, 1, 1);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_MULTISAMPLE);

    updateMatrixStack(Eigen::Matrix4f::Identity());

    grid = new Grid(GRID_SIZE, GRID_RANGE, GRID_STARTING_POS);
    skybox = new Skybox;
}

/**
 * Free allocated memory
 */
void cleanup() {
    delete grid;
    delete skybox;
}

/**
 * Display function, just clear the buffer and draw the grid
 */
void display() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    skybox->render(projection, modelview);
    grid->render(projection, modelview, sunPosition);
}

void keyboardFunc(int key, int action) {
    if (action == GLFW_PRESS) {
        switch(key) {
            case GLFW_KEY_ESC:
                glfwCloseWindow();
                break;
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                sunPosition = key - 49;
                break;
        }
    }
}

int main(int argc, char** argv) {
    Window window("Project Matterhorn", WINDOW_WIDTH, WINDOW_HEIGHT);
    init();
    glfwTrackball(updateMatrixStack);
    glfwSetKeyCallback(keyboardFunc);
    window.mainLoop(display);
    cleanup();
    return EXIT_SUCCESS;
}
