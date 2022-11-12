# init_cpp
A very naive (and simple) bash script to initialize a fresh C++ project.

#Installation
You can either run it directly or `mv` it to `/bin/` and `chmod ugo+rw` to allow you to call it systemwide..

#Use
With no parameters it will simply create a default_project in the current directory alongside a `main.cpp` and `main.h` file.
Optional parameters allow for the naming of the initial `.cpp` and `.h` files (first argument) or toe specify a different directory
to create the project inside of (second argument).