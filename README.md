# ZSYUI是一个基于Dear imgui创建的快速傻瓜式的cmake项目。

### 通过使用cmake来定制自己的imgui，可以脱离visual studio的掌控，方便的移植到各个不同的平台：linux、Windows、MacOS、Android等。使用cmake来管理你的项目和引入第三方库，可以获得更高的自由度和更多的定制化。
### 目前该项目仅实现了Windows平台，但通过阅读各个模块的README和代码中的注释，任何人都可以很容易的扩展到其他平台。未来ZSYUI也会实现并支持其他平台。

****以下是目前支持的Dear Imgui的后端组合****：
Windows：
- GLFW + OpenGL2
- GLFW + OpenGL3
- GLFW + Vulkan
- SDL2 + DirectX11
- SDL2 + OpenGL2
- SDL2 + OpenGL3
- SDL2 + Vulkan
- SDL2 + SDLRenderer2
- WIN32 + OpenGL3
- WIN32 + DirectX9
- WIN32 + DirectX10
- WIN32 + DirectX11

当前Windows平台暂时不支持GLUT + OpenGL2组合，GLUT不知道为什么总是报未找到dll，当源代码中已包含对应dll，各位开发者感兴趣可自行尝试。

MacOS：
无设备未测试。

Linux：
未测试。

Android：
未测试。

## 使用入门指南
本项目自带SDL2和Vulkan等一系列库，无需开发者重新下载，如果有需要可自行更新库。

1. 进入cmake目录下的****ZSKY_global.cmake****文件中，修改需要的后端组合，注意图形库和渲染后端每种只能启用一个。启用方法为把需要的option修改为ON。如果使用Win32作为图像库，需要到**ZSKY_3rdparty_manager.cmake**中修改DirectX库的Windows Kits的路径！
2. 进入out/build目录下，使用cmake进行编译和install，然后在out/install中可获得安装的程序。如果使用visual studio打开，可使用visual studio进行编译。

修改项目名或具体cmake编译指令，以及定制化根CMakeLists.txt请参阅该目录下的CMakeLists.txt中的注释。

#### 项目其他部分的说明，请参阅对应目录下的README文件以及代码注释。