## 该目录用于管理整个ZSYUI项目
### ZSKYUI项目的cmake管理流程分为第三方管理和全局管理，第三方库的管理在cmake/3rdparty目录下，全局管理在cmake目录下。

## 第三方库管理
请参考****cmake/3rdparty/Vulkan.cmake****文件，里面有详细的说明教导如何引入第三方库。

## 全局管理
- ZSKY.cmake：该cmake文件为全局管理cmake文件，一般情况下不需要动，也不需要修改。
- ZSKY_global.cmake：该cmake文件用于设置全局的cmake变量，可自定义，具体请参阅该文件。
- ZSKY_utils.cmake：该cmake文件用于创建cmake函数或cmake宏，可自定义。
- ZSKY_3rdparty_manager.cmake：该cmake文件用于管理第三方库的编译链接，很重要，如果引入了新的第三方库，请务必要到该文件中添加对应的第三方库的内容，具体添加方法请参阅该文件。