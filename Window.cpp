#include "Window.h"

Window::Window(const string& title, int width, int height)
    : mTitle(title), mWidth(width), mHeight(height)
{
    if (!glfwInit()) {
        cerr << "Failed to initialize GLFW" << endl;
        exit(EXIT_FAILURE);
    }

    openWindow();
}

void Window::openWindow() const
{
    glfwOpenWindowHint(GLFW_OPENGL_VERSION_MAJOR, 3);
    glfwOpenWindowHint(GLFW_OPENGL_VERSION_MINOR, 2);
    glfwOpenWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    glfwOpenWindowHint(GLFW_FSAA_SAMPLES, 4);

    if (!glfwOpenWindow(mWidth, mHeight, 0, 0, 0, 0, 32, 0, GLFW_WINDOW)) {
        cerr << "Failed to open OpenGL 3 GLFW window" << endl;
        exit(EXIT_FAILURE);
    }

    glewExperimental = true;
    if (glewInit() != GLEW_NO_ERROR) {
        cerr << "Failed to initialize GLEW" << endl;
        exit(EXIT_FAILURE);
    }

    glfwSetWindowTitle(mTitle.c_str());
    glfwSwapInterval(1);
}

void Window::mainLoop(displayFunction display) const
{
    while (glfwGetKey(GLFW_KEY_ESC) != GLFW_PRESS && glfwGetWindowParam(GLFW_OPENED)) {
        display();
        glfwSwapBuffers();
    }
}

Window::~Window()
{
    glfwTerminate();
}
