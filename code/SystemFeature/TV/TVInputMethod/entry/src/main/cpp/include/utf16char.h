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

#ifndef PINYINIME_INCLUDE_UT_F16_CHAR_H_
#define PINYINIME_INCLUDE_UT_F16_CHAR_H_

#include <cstdlib>

namespace ime_pinyin {

#ifdef __cplusplus
extern "C" {
#endif

typedef unsigned short char16;

// Get a token from utf16Str,
// Returned pointer is a '\0'-terminated utf16 string, or nullptr
// *utf16StrNext returns the next part of the string for further tokenizing
char16 *Utf16Strtok(char16 *utf16Str, size_t *tokenSize, char16 **utf16StrNext);

int Utf16Atoi(const char16 *utf16Str);

float Utf16Atof(const char16 *utf16Str);

size_t Utf16Strlen(const char16 *utf16Str);

int Utf16Strcmp(const char16 *str1, const char16 *str2);
int Utf16Strncmp(const char16 *str1, const char16 *str2, size_t size);

char16 *Utf16Strcpy(char16 *dst, const char16 *src);
char16 *Utf16Strncpy(char16 *dst, const char16 *src, size_t size);

char *Utf16StrcpyTochar(char *dst, const char16 *src);

#ifdef __cplusplus
}
#endif
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_UT_F16_CHAR_H_
