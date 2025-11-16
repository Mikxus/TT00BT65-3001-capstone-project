# https://www.scivision.dev/cmake-find-curses-include/
# CMake FindCurses may not find all needed include directories and may need definitions

find_package(Curses REQUIRED)

if(NOT CURSES_HAVE_CURSES_H)
  foreach(d IN LISTS CURSES_INCLUDE_DIRS)
    find_path(curses_inc
    NAMES curses.h
    HINTS ${d}/ncurses ${d}/pdcurses
    NO_DEFAULT_PATH
    )
    if(curses_inc)
      list(APPEND CURSES_INCLUDE_DIRS ${curses_inc})
      break()
    endif()
  endforeach()
endif()

if(NOT TARGET Curses::Curses)
  add_library(Curses::Curses INTERFACE IMPORTED)
  target_link_libraries(Curses::Curses INTERFACE ${CURSES_LIBRARIES})
  target_include_directories(Curses::Curses INTERFACE ${CURSES_INCLUDE_DIRS})
  if(CURSES_HAVE_NCURSES_H OR CURSES_HAVE_NCURSES_NCURSES_H)
    # https://stackoverflow.com/a/67964252/4236751
    # avoids MinGW link failure
    target_compile_definitions(Curses::Curses INTERFACE $<$<BOOL:${MINGW}>:NCURSES_STATIC>)
  endif()
endif()