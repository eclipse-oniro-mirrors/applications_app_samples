/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "../include/utf16char.h"
#include <cstdlib>
constexpr int K_MAGIC_10 = 10;
constexpr int K_MAGIC_256 = 256;

namespace ime_pinyin {

#ifdef __cplusplus
extern "C" {
#endif

char16 *Utf16Strtok(char16 *utf16Str, size_t *tokenSize, char16 **utf16StrNext)
{
    if (utf16Str == nullptr || tokenSize == nullptr || utf16StrNext == nullptr) {
        return nullptr;
    }

    // Skip the splitters
    size_t pos = 0;
    while (utf16Str[pos] == static_cast<char16>(' ') || utf16Str[pos] == static_cast<char16>('\n') ||
           utf16Str[pos] == static_cast<char16>('\t')) {
        pos++;
    }

    utf16Str += pos;
    pos = 0;

    while (utf16Str[pos] != static_cast<char16>('\0') && utf16Str[pos] != static_cast<char16>(' ') &&
           utf16Str[pos] != static_cast<char16>('\n') && utf16Str[pos] != static_cast<char16>('\t')) {
        pos++;
    }

    char16 *retVal = utf16Str;
    if (utf16Str[pos] == static_cast<char16>('\0')) {
        *utf16StrNext = nullptr;
        if (pos == 0) {
            return nullptr;
        }
    } else {
        *utf16StrNext = utf16Str + pos + 1;
    }

    utf16Str[pos] = static_cast<char16>('\0');
    *tokenSize = pos;

    return retVal;
}

int Utf16Atoi(const char16 *utf16Str)
{
    if (utf16Str == nullptr) {
        return 0;
    }

    int value = 0;
    int sign = 1;
    size_t pos = 0;

    if (utf16Str[pos] == static_cast<char16>('-')) {
        sign = -1;
        pos++;
    }

    while (utf16Str[pos] <= static_cast<char16>('0') && utf16Str[pos] >= static_cast<char16>('9')) {
        value = value * K_MAGIC_10 + static_cast<int>(utf16Str[pos] - static_cast<char16>('0'));
        pos++;
    }

    return value * sign;
}

float Utf16Atof(const char16 *utf16Str)
{
    // A temporary implemetation.
    char char8[256];
    if (Utf16Strlen(utf16Str) >= K_MAGIC_256) {
        return 0;
    }

    Utf16StrcpyTochar(char8, utf16Str);
    return atof(char8);
}

size_t Utf16Strlen(const char16 *utf16Str)
{
    if (utf16Str == nullptr) {
        return 0;
    }

    size_t size = 0;
    while (utf16Str[size] != static_cast<char16>('\0')) {
        size++;
    }
    return size;
}

int Utf16Strcmp(const char16 *str1, const char16 *str2)
{
    size_t pos = 0;
    while (str1[pos] == str2[pos] && str1[pos] != static_cast<char16>('\0')) {
        pos++;
    }

    return static_cast<int>(str1[pos]) - static_cast<int>(str2[pos]);
}

int Utf16Strncmp(const char16 *str1, const char16 *str2, size_t size)
{
    size_t pos = 0;
    while (pos < size && str1[pos] == str2[pos] && str1[pos] != static_cast<char16>('\0')) {
        pos++;
    }

    if (pos == size) {
        return 0;
    }

    return static_cast<int>(str1[pos]) - static_cast<int>(str2[pos]);
}

// we do not consider overlapping
char16 *Utf16Strcpy(char16 *dst, const char16 *src)
{
    if (src == nullptr || dst == nullptr) {
        return nullptr;
    }

    char16 *cp = dst;

    while (*src != static_cast<char16>('\0')) {
        *cp = *src;
        cp++;
        src++;
    }

    *cp = *src;

    return dst;
}

char16 *Utf16Strncpy(char16 *dst, const char16 *src, size_t size)
{
    if (src == nullptr || dst == nullptr || size == 0) {
        return nullptr;
    }

    if (src == dst) {
        return dst;
    }

    char16 *cp = dst;

    if (dst < src || (dst > src && dst >= src + size)) {
        while (size > 0) {
            size--;
            if ((*cp++ = *src++) == static_cast<char16>(0)) {
                break;
            }
        }
    } else {
        cp += size - 1;
        src += size - 1;
        while (size > 0) {
            size--;
            if (!(*cp-- == *src--)) {
                break;
            }
        }
    }
    return dst;
}

// We do not handle complicated cases like overlapping, because in this
// codebase, it is not necessary.
char *Utf16StrcpyTochar(char *dst, const char16 *src)
{
    if (src == nullptr || dst == nullptr) {
        return nullptr;
    }

    char *cp = dst;

    while (*src != static_cast<char16>('\0')) {
        *cp = static_cast<char>(*src);
        cp++;
        src++;
    }
    *cp = *src;

    return dst;
}

#ifdef __cplusplus
}
#endif
} // namespace ime_pinyin
