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

#include "../include/utf16reader.h"

namespace ime_pinyin {

#define MIN_BUF_LEN 128
#define MAX_BUF_LEN 65535

Utf16Reader::Utf16Reader()
{
    fp_ = nullptr;
    buffer_ = nullptr;
    bufferTotalLen_ = 0;
    bufferNextPos_ = 0;
    bufferValidLen_ = 0;
}

Utf16Reader::~Utf16Reader()
{
    if (fp_ != nullptr) {
        fclose(fp_);
    }

    if (buffer_ != nullptr) {
        delete[] buffer_;
    }
}

bool Utf16Reader::Open(const char *filename, size_t bufferLen)
{
    if (filename == nullptr) {
        return false;
    }

    if (bufferLen < MIN_BUF_LEN) {
        bufferLen = MIN_BUF_LEN;
    } else if (bufferLen > MAX_BUF_LEN) {
        bufferLen = MAX_BUF_LEN;
    }

    bufferTotalLen_ = bufferLen;

    if (buffer_ != nullptr) {
        delete[] buffer_;
    }
    buffer_ = new char16[bufferTotalLen_];
    if (buffer_ == nullptr) {
        return false;
    }

    if ((fp_ = fopen(filename, "rb")) == nullptr) {
        return false;
    }

    // the UTF16 file header, skip
    char16 header;
    if (fread(&header, sizeof(header), 1, fp_) != 1 || header != 0xfeff) {
        fclose(fp_);
        fp_ = nullptr;
        return false;
    }

    return true;
}

bool Utf16Reader::ReadMore()
{
    bufferNextPos_ = 0;
    bufferValidLen_ = fread(buffer_, sizeof(char16), bufferTotalLen_, fp_);
    return bufferValidLen_ > 0;
}

size_t Utf16Reader::ScanBuffer(char16 *readBuf, size_t retLen, size_t maxLen)
{
    for (size_t i = 0; i < bufferValidLen_; i++) {
        if (i == maxLen - 1 || buffer_[bufferNextPos_ + i] == static_cast<char16>('\n')) {
            if (retLen + i > 0 && readBuf[retLen + i - 1] == static_cast<char16>('\r')) {
                readBuf[retLen + i - 1] = static_cast<char16>('\0');
            } else {
                readBuf[retLen + i] = static_cast<char16>('\0');
            }
            return i + 1;
        }
        readBuf[retLen + i] = buffer_[bufferNextPos_ + i];
    }
    return 0;
}

char16 *Utf16Reader::Readline(char16 *readBuf, size_t maxLen)
{
    if (fp_ == nullptr || readBuf == nullptr || maxLen == 0) {
        return nullptr;
    }

    size_t retLen = 0;
    while (bufferValidLen_ != 0 || ReadMore()) {
        size_t consumed = ScanBuffer(readBuf, retLen, maxLen);
        if (consumed > 0) {
            bufferNextPos_ += consumed;
            bufferValidLen_ -= consumed;
            if (bufferNextPos_ == bufferTotalLen_) {
                bufferNextPos_ = 0;
                bufferValidLen_ = 0;
            }
            return readBuf;
        }
        retLen += bufferValidLen_;
        bufferValidLen_ = 0;
        if (retLen >= maxLen) {
            return nullptr;
        }
    }

    if (retLen > 0) {
        readBuf[retLen] = static_cast<char16>('\0');
        return readBuf;
    }
    return nullptr;
}

bool Utf16Reader::Close()
{
    if (fp_ != nullptr) {
        fclose(fp_);
    }
    fp_ = nullptr;

    if (buffer_ != nullptr) {
        delete[] buffer_;
    }
    buffer_ = nullptr;
    return true;
}
} // namespace ime_pinyin
