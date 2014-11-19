#ifndef WINDOW_H
#define WINDOW_H

#include "common.h"

typedef void (*displayFunction)();

class Window
{
public:
    Window(const string& title, int width, int height);
    void mainLoop(displayFunction display) const;
    ~Window();
private:
    void openWindow() const;
    string mTitle;
    int mWidth;
    int mHeight;
};

#endif // WINDOW_H
