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

#ifndef PINYINIME_INCLUDE_DICTLIST_H_
#define PINYINIME_INCLUDE_DICTLIST_H_

#include "./dictdef.h"
#include "./searchutility.h"
#include "./spellingtrie.h"
#include "./utf16char.h"
#include <cstdio>
#include <cstdlib>

namespace ime_pinyin {

class DictList {
private:
    bool initialized_;

    const SpellingTrie *splTrie_;

    // Number of SingCharItem. The first is blank, because id 0 is invalid.
    size_t scisNum_;
    char16 *scisHz_;
    SpellingId *scisSplid_;

    // The large memory block to store the word list.
    char16 *buf_;

    // Starting position of those words whose lengths are i+1, counted in
    // char16
    uint32 startPos_[K_MAX_LEMMA_SIZE + 1];

    uint32 startId_[K_MAX_LEMMA_SIZE + 1];

    int (*cmpFunc_[K_MAX_LEMMA_SIZE])(const void *, const void *);

    bool AllocResource(size_t bufSize, size_t scisNum);

    void FreeResource();

#ifdef BUILD_MODEL
    // Calculate the requsted memory, including the startPos[] buffer.
    size_t calculate_size(const LemmaEntry *lemma_arr, size_t lemma_num);
    void calculate_size_step(const LemmaEntry *lemma_arr, size_t i, size_t &last_hz_len, size_t &list_size,
                             size_t &idNum);

    void fill_scis(const SingleCharItem *scis, size_t scisNum);

    // Copy the related content to the inner buffer
    // It should be called after calculate_size()
    void fill_list(const LemmaEntry *lemma_arr, size_t lemma_num);

    // Find the starting position for the buffer of those 2-character Chinese word
    // whose first character is the given Chinese character.
    char16 *find_pos2_startedbyhz(char16 hz_char);
#endif

    // Find the starting position for the buffer of those words whose lengths are
    // wordLen. The given parameter cmpFunc decides how many characters from
    // beginning will be used to compare.
    char16 *FindPosStartedbyhzs(const char16 lastHzs[], size_t wordLen, int (*cmpFunc)(const void *, const void *));

public:
    DictList();
    ~DictList();

    bool SaveList(FILE *fp);
    bool LoadList(FILE *fp);

#ifdef BUILD_MODEL
    // Init the list from the LemmaEntry array.
    // lemma_arr should have been sorted by the hanzi_str, and have been given
    // ids from 1
    bool init_list(const SingleCharItem *scis, size_t scisNum, const LemmaEntry *lemma_arr, size_t lemma_num);
#endif

    // Get the hanzi string for the given id
    uint16 GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax);

    void ConvertToHanzis(char16 *str, uint16 strLen);

    void ConvertToScisIds(char16 *str, uint16 strLen);

    // lastHzs stores the last n Chinese characters history, its length should be
    // less or equal than K_MAX_PREDICT_SIZE.
    // hzsLen specifies the length(<= K_MAX_PREDICT_SIZE).
    // predict_buf is used to store the result.
    // bufLen specifies the buffer length.
    // b4Used specifies how many items before predict_buf have been used.
    // Returned value is the number of newly added items.
    size_t Predict(const char16 lastHzs[], uint16 hzsLen, NPredictItem *npreItems, size_t npreMax, size_t b4Used);

    // If halfSplid is a valid half spelling id, return those full spelling
    // ids which share this half id.
    uint16 GetSplidsForHanzi(char16 hanzi, uint16 halfSplid, uint16 *splids, uint16 maxSplids) const;

    LemmaIdType GetLemmaId(const char16 *str, uint16 strLen);
};
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_DICTLIST_H_
