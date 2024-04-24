// 用于管理跨平台字符串转换

#pragma once
#include "helper.h"
#include <string>


namespace zsky::helper
{
    std::string String_TO_UTF8(std::string str);
}