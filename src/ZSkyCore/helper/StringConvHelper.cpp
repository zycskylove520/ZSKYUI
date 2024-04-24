#include "StringConvHelper.h"
#include "../core/corss_platform.h"

#if ZSKY_WIN
#include <Windows.h>
#elif ZSKY_LINUX
#include <iconv.h>
#include <vector>
#endif

std::string zsky::helper::String_TO_UTF8(std::string str)
{
#if ZSKY_WIN
    int nwLen = ::MultiByteToWideChar(CP_ACP, 0, str.c_str(), -1, NULL, 0);
    wchar_t* pwBuf = new wchar_t[nwLen + 1];
    ZeroMemory(pwBuf, nwLen * 2 + 2);

    ::MultiByteToWideChar(CP_ACP, 0, str.c_str(), str.length(), pwBuf, nwLen);

    int nLen = ::WideCharToMultiByte(CP_UTF8, 0, pwBuf, -1, NULL, NULL, NULL, NULL);

    char* pBuf = new char[nLen + 1];
    ZeroMemory(pBuf, nLen + 1);

    ::WideCharToMultiByte(CP_UTF8, 0, pwBuf, nwLen, pBuf, nLen, NULL, NULL);

    std::string retStr(pBuf);

    delete[]pwBuf;
    delete[]pBuf;

    pwBuf = NULL;
    pBuf = NULL;

    return retStr;
#endif

#if ZSKY_LINUX
    size_t inputSize = input.size();
    size_t outputSize = inputSize * 4; // UTF-8 may require up to 4 bytes per character  
    std::vector<char> outputBuffer(outputSize);

    char* inputBuffer = const_cast<char*>(input.data());
    char* outputBufferPtr = outputBuffer.data();

    iconv_t cd = iconv_open("UTF-8", "");
    if (cd == (iconv_t)-1) {
        perror("iconv_open");
        return "";
    }

    size_t inputBytesLeft = inputSize;
    size_t outputBytesLeft = outputSize;

    if (iconv(cd, &inputBuffer, &inputBytesLeft, &outputBufferPtr, &outputBytesLeft) == (size_t)-1) {
        perror("iconv");
        iconv_close(cd);
        return "";
    }

    iconv_close(cd);

    return std::string(outputBuffer.data(), outputBufferPtr - outputBuffer.data());
#endif
}