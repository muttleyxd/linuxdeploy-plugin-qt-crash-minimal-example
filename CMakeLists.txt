cmake_minimum_required(VERSION 3.5)

project(simple_qt_widgets_test LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Widgets REQUIRED)

if(ANDROID)
  add_library(simple_qt_widgets_test SHARED
    main.cpp
    mainwindow.cpp
    mainwindow.h
    mainwindow.ui
  )
else()
  add_executable(simple_qt_widgets_test
    main.cpp
    mainwindow.cpp
    mainwindow.h
    mainwindow.ui
  )
endif()

target_link_libraries(simple_qt_widgets_test PRIVATE Qt5::Widgets)

install(TARGETS simple_qt_widgets_test DESTINATION bin)
install(FILES simple_qt_widgets_test.desktop DESTINATION share/applications)
