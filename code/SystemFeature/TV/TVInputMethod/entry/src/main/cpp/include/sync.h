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

#ifndef PINYINIME_INCLUDE_SYNC_H_
#define PINYINIME_INCLUDE_SYNC_H_

#define SYNC_ENABLED

#ifdef SYNC_ENABLED

#include "userdict.h"

namespace ime_pinyin {

// Class for user dictionary synchronization
// This class is not thread safe
// Normal invoking flow will be
//   Begin() ->
//   PutLemmas() x N ->
//   {
//     GetLemmas() ->
//     [ GetLastGotCount() ] ->
//     ClearLastGot() ->
//   } x N ->
//   Finish()
class Sync {
public:
    Sync();
    ~Sync();

    static const int kUserDictMaxLemmaCount = 5000;
    static const int kUserDictMaxLemmaSize = 200000;
    static const int kUserDictRatio = 20;

    bool Begin(const char *filename);

    // Merge lemmas downloaded from sync server into local dictionary
    // lemmas, lemmas string encoded in UTF16LE
    // len, length of lemmas string
    // Return how many lemmas merged successfully
    int PutLemmas(char16 *lemmas, int len) const;

    // Get local new user lemmas into UTF16LE string
    // str, buffer ptr to store new user lemmas
    // size, size of buffer
    // Return length of returned buffer in measure of UTF16LE
    int GetLemmas(char16 *str, int size);

    // Return lemmas count in last GetLemmas()
    int GetLastGotCount() const;

    // Return total lemmas count need GetLemmas()
    int GetTotalCount() const;

    // Clear lemmas got by recent GetLemmas()
    void ClearLastGot();

    void Finish();

    int GetCapacity() const;

private:
    UserDict *userdict_;
    char *dictfile_;
    int lastCount_;
};

} // namespace ime_pinyin

#endif

#endif // PINYINIME_INCLUDE_SYNC_H_
