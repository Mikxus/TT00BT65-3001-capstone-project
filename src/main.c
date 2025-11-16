#include <curses.h>

int main(void)
{
    initscr();

    printw("Hello from Curses. Press any key to continue...");

    refresh();

    // pause the screen output
    getch();

    endwin();
    return 0;
}