# Add our source files to be compiled
add_executable(capstone-project
    main.c
)

# Link our executable with curses
target_link_libraries(capstone-project PRIVATE Curses::Curses)