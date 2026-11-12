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

#ifndef PINYINIME_INCLUDE_UT_F16_READER_H_
#define PINYINIME_INCLUDE_UT_F16_READER_H_

#include "./utf16char.h"
#include <cstdio>

namespace ime_pinyin {

class Utf16Reader {
private:
    FILE *fp_;
    char16 *buffer_;
    size_t bufferTotalLen_;
    size_t bufferNextPos_;

    // Always less than bufferTotalLen_ - bufferNextPos_
    size_t bufferValidLen_;

    size_t ScanBuffer(char16 *readBuf, size_t retLen, size_t maxLen);

public:
    Utf16Reader();
    ~Utf16Reader();

    // filename is the name of the file to open.
    // bufferLen specifies how long buffer should be allocated to speed up the
    // future reading
    bool Open(const char *filename, size_t bufferLen);
    char16 *Readline(char16 *readBuf, size_t maxLen);
    bool ReadMore();
    bool Close();
};
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_UT_F16_READER_H_
