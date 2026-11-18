/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef IME_SECURE_H
#define IME_SECURE_H

#include <cstddef>

typedef int errno_t;

inline errno_t ImeMemset(void *dest, size_t destMax, int ch, size_t count)
{
    if (dest == nullptr || count > destMax) {
        return -1;
    }
    char *d = static_cast<char *>(dest);
    for (size_t i = 0; i < count; i++) {
        d[i] = static_cast<char>(ch);
    }
    return 0;
}

inline errno_t ImeMemcpy(void *dest, size_t destMax, const void *src, size_t count)
{
    if (dest == nullptr || src == nullptr || count > destMax) {
        return -1;
    }
    char *d = static_cast<char *>(dest);
    const char *s = static_cast<const char *>(src);
    for (size_t i = 0; i < count; i++) {
        d[i] = s[i];
    }
    return 0;
}

inline void MemCopyBackward(char *d, const char *s, size_t count)
{
    while (count > 0) {
        count--;
        d[count] = s[count];
    }
}

inline errno_t MemMoveForward(char *d, const char *s, size_t destMax, size_t count)
{
    if (d < s) {
        return ImeMemcpy(d, destMax, s, count);
    }
    if (count > destMax) {
        return -1;
    }
    MemCopyBackward(d, s, count);
    return 0;
}

inline errno_t ImeMemmove(void *dest, size_t destMax, const void *src, size_t count)
{
    if (dest == nullptr || src == nullptr) {
        return -1;
    }
    char *d = static_cast<char *>(dest);
    const char *s = static_cast<const char *>(src);
    if (d == s || count == 0) {
        return 0;
    }
    return MemMoveForward(d, s, destMax, count);
}

inline size_t CopyCharsBounded(char *dest, size_t destMax, const char *src, size_t count)
{
    size_t i = 0;
    for (; i < count && src[i] != '\0' && i + 1 < destMax; i++) {
        dest[i] = src[i];
    }
    return i;
}

inline errno_t ImeStrncpy(char *dest, size_t destMax, const char *src, size_t count)
{
    if (dest == nullptr || src == nullptr || destMax == 0) {
        return -1;
    }
    size_t i = CopyCharsBounded(dest, destMax, src, count);
    if (i == count && src[i] != '\0') {
        return -1;
    }
    dest[i] = '\0';
    return 0;
}

#endif
