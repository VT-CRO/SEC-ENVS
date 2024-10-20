# VTCRO Development Environment

This is the development used by the VTCRO team for developing embedded code.
This environment attempts to simplify the development setup process and ensures that all members have a working copy of the work environment without having to install additional dependencies locally.

# Requirements

- Docker (Docker Desktop also works for Windows and Mac users)
- VSCode

# Installation

1. Clone this repository to your working directory.
2. After cloning, open the directory in VSCode and run the command (using the shortcut 'Ctrl+Shift+P') `Dev Containers: Rebuild and Reopen in Container`.
   Alternatively, VSCode may give you a popup with the option to 'Reopen in Container' at the bottom of the editor.
3. After building the dev environment, you can now clone your projects into your working directory. Your working directory should look like:

```md
[YOUR_WORKING_DIRECTORY]
├── .devcontainer
│ ├── devcontainer.json
├── DockerFile
├── [YOUR_PROJECTS]
```

---

## Features

This development environment provides a few quality of life extensions to make development easier.

### Automatic Class/Function Definition Generation

With the VSCode C/C++ extension, you can now automatically generate class and function definitions from your header files.

### Automatic Doxygen Documentation Generation

This environment includes the Doxygen Documentation Generator, which allows you to automatically generate documentation for your header files.

### ROSSerial

If your project requires ROSSerial, you can quickly set it up by following these steps:

1. Ensure ros-serial-arduino is installed for your ROS distribution. You can run:
   `apt install ros-${ROS_DISTRO}-serial-arduino`
   to install it.
2. Navigate to your project's `lib` directory and run:
   `rosrun rosserial_arduino make_libraries.py .` (Remember to source ROS!).

## Tips

- Use `ALT+O` to quickly switch between header and source files.
- Pressing `CTRL+K` then `Z` toggles zen mode, which hides the file browser, terminal, and toolbar, allowing you to focus on your code.
- `CTRL+SHIFT+` allows you to quickly open a terminal in the current directory.

---

Feel free to add any additional notes/documentation on your environment setup!
