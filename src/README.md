## 该文件用于管理所有的项目相关的源代码，包括Dear imgui和项目开发者编写的源代码

- imgui-base目录：该目录存放专门来自Dear imgui的源代码，如果Dear imgui项目有更新，可以到该目录进行源文件替换来升级。

- main目录：该目录存放来自不同图形库和渲染后端组合的main文件，并通过修改成适配ZSKYUI项目，有些来自imgui的配置可回到该目录下进行修改。

- ZSkyCore目录：这是一个示例目录，展示如何添加自己的源文件代码到ZSKYUI项目中，开发者可通过查阅该目录结构以及目录下的CMakeLists.txt文件来学习。

# src目录下的ZSKYUI.h和ZSKYUI.cpp文件为程序的主编写入口文件。开发者可通过在该文件中编写代码来开发自己的应用程序。