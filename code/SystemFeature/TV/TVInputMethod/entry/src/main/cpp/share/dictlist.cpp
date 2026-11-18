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

#include "../include/dictlist.h"
#include "../include/mystdlib.h"
#include "../include/ngram.h"
#include "../include/searchutility.h"
#include <cassert>
#include <cstdlib>
#include <cstring>

#include "ime_assert.h"
#include "ime_secure.h"
constexpr int K_MAGIC_2 = 2;
constexpr int K_MAGIC_3 = 3;
constexpr int K_MAGIC_4 = 4;
constexpr int K_MAGIC_5 = 5;
constexpr int K_MAGIC_6 = 6;
constexpr int K_MAGIC_7 = 7;
constexpr int K_MAGIC_8 = 8;

namespace ime_pinyin {

DictList::DictList()
{
    initialized_ = false;
    scisNum_ = 0;
    scisHz_ = nullptr;
    scisSplid_ = nullptr;
    buf_ = nullptr;
    splTrie_ = SpellingTrie::GetCpinstance();

    ASSERT(K_MAGIC_8 == K_MAX_LEMMA_SIZE);
    cmpFunc_[0] = CmpHanzis1;
    cmpFunc_[1] = CmpHanzis2;
    cmpFunc_[K_MAGIC_2] = CmpHanzis3;
    cmpFunc_[K_MAGIC_3] = CmpHanzis4;
    cmpFunc_[K_MAGIC_4] = CmpHanzis5;
    cmpFunc_[K_MAGIC_5] = CmpHanzis6;
    cmpFunc_[K_MAGIC_6] = CmpHanzis7;
    cmpFunc_[K_MAGIC_7] = CmpHanzis8;
}

DictList::~DictList() { FreeResource(); }

bool DictList::AllocResource(size_t bufSize, size_t scisNum)
{
    if (bufSize == 0 || bufSize > (static_cast<size_t>(-1) / sizeof(char16))) {
        return false;
    }
    // Allocate memory
    buf_ = static_cast<char16 *>(malloc(bufSize * sizeof(char16)));
    if (buf_ == nullptr) {
        return false;
    }

    scisNum_ = scisNum;

    scisHz_ = static_cast<char16 *>(malloc(scisNum_ * sizeof(char16)));
    if (scisHz_ == nullptr) {
        return false;
    }

    scisSplid_ = static_cast<SpellingId *>(malloc(scisNum_ * sizeof(SpellingId)));
    if (scisSplid_ == nullptr) {
        return false;
    }

    return true;
}

void DictList::FreeResource()
{
    if (buf_ != nullptr) {
        free(buf_);
    }
    buf_ = nullptr;

    if (scisHz_ != nullptr) {
        free(scisHz_);
    }
    scisHz_ = nullptr;

    if (scisSplid_ != nullptr) {
        free(scisSplid_);
    }
    scisSplid_ = nullptr;
}

#ifdef BUILD_MODEL
bool DictList::init_list(const SingleCharItem *scis, size_t scisNum, const LemmaEntry *lemma_arr, size_t lemma_num)
{
    if (scis == nullptr || scisNum == 0 || lemma_arr == nullptr || lemma_num == 0) {
        return false;
    }

    initialized_ = false;

    if (buf_ != nullptr) {
        free(buf_);
    }

    // calculate the size
    size_t bufSize = calculate_size(lemma_arr, lemma_num);
    if (bufSize == 0) {
        return false;
    }

    if (!AllocResource(bufSize, scisNum)) {
        return false;
    }

    fill_scis(scis, scisNum);

    // Copy the related content from the array to inner buffer
    fill_list(lemma_arr, lemma_num);

    initialized_ = true;
    return true;
}

size_t DictList::calculate_size(const LemmaEntry *lemma_arr, size_t lemma_num)
{
    size_t last_hz_len = 0;
    size_t list_size = 0;
    size_t idNum = 0;

    for (size_t i = 0; i < lemma_num; i++) {
        calculate_size_step(lemma_arr, i, last_hz_len, list_size, idNum);
    }

    for (size_t i = last_hz_len; i <= K_MAX_LEMMA_SIZE; i++) {
        if (i == 0) {
            startPos_[0] = 0;
            startId_[0] = 1;
        } else {
            startPos_[i] = list_size;
            startId_[i] = idNum;
        }
    }

    return startPos_[K_MAX_LEMMA_SIZE];
}

void DictList::calculate_size_step(const LemmaEntry *lemma_arr, size_t i, size_t &last_hz_len, size_t &list_size,
                                   size_t &idNum)
{
    if (i == 0) {
        last_hz_len = lemma_arr[i].hz_str_len;
        ASSERT(last_hz_len > 0);
        ASSERT(lemma_arr[0].idx_by_hz == 1);
        idNum++;
        startPos_[0] = 0;
        startId_[0] = idNum;
        last_hz_len = 1;
        list_size += last_hz_len;
        return;
    }
    size_t current_hz_len = lemma_arr[i].hz_str_len;
    ASSERT(current_hz_len >= last_hz_len);
    if (current_hz_len == last_hz_len) {
        list_size += current_hz_len;
        idNum++;
        return;
    }
    for (size_t len = last_hz_len; len < current_hz_len - 1; len++) {
        startPos_[len] = startPos_[len - 1];
        startId_[len] = startId_[len - 1];
    }
    startPos_[current_hz_len - 1] = list_size;
    idNum++;
    startId_[current_hz_len - 1] = idNum;
    last_hz_len = current_hz_len;
    list_size += current_hz_len;
}

void DictList::fill_scis(const SingleCharItem *scis, size_t scisNum)
{
    ASSERT(scisNum_ == scisNum);

    for (size_t pos = 0; pos < scisNum_; pos++) {
        scisHz_[pos] = scis[pos].hz;
        scisSplid_[pos] = scis[pos].splid;
    }
}

void DictList::fill_list(const LemmaEntry *lemma_arr, size_t lemma_num)
{
    size_t current_pos = 0;

    Utf16Strncpy(buf_, lemma_arr[0].hanzi_str, lemma_arr[0].hz_str_len);

    current_pos = lemma_arr[0].hz_str_len;

    size_t idNum = 1;

    for (size_t i = 1; i < lemma_num; i++) {
        Utf16Strncpy(buf_ + current_pos, lemma_arr[i].hanzi_str, lemma_arr[i].hz_str_len);

        idNum++;
        current_pos += lemma_arr[i].hz_str_len;
    }

    ASSERT(current_pos == startPos_[K_MAX_LEMMA_SIZE]);
    ASSERT(idNum == startId_[K_MAX_LEMMA_SIZE]);
}

char16 *DictList::find_pos2_startedbyhz(char16 hz_char)
{
    char16 *found_2w = static_cast<char16 *>(
        Mybsearch(&hz_char, buf_ + startPos_[1], (startPos_[2] - startPos_[1]) / 2, sizeof(char16) * 2, CmpHanzis1));
    if (found_2w == nullptr) {
        return nullptr;
    }

    while (found_2w > buf_ + startPos_[1] && *found_2w == *(found_2w - 1)) {
        found_2w -= K_MAGIC_2;
    }

    return found_2w;
}
#endif // BUILD_MODEL

char16 *DictList::FindPosStartedbyhzs(const char16 lastHzs[], size_t wordLen,
                                      int (*cmpFunc)(const void *, const void *))
{
    if (wordLen == 0) {
        return nullptr;
    }
    char16 *foundW = static_cast<char16 *>(Mybsearch(lastHzs, buf_ + startPos_[wordLen - 1],
                                                     (startPos_[wordLen] - startPos_[wordLen - 1]) / wordLen,
                                                     sizeof(char16) * wordLen, cmpFunc));

    if (foundW == nullptr) {
        return nullptr;
    }

    while (foundW > buf_ + startPos_[wordLen - 1] && cmpFunc(foundW, foundW - wordLen) == 0) {
        foundW -= wordLen;
    }

    return foundW;
}

size_t DictList::Predict(const char16 lastHzs[], uint16 hzsLen, NPredictItem *npreItems, size_t npreMax,
                         size_t b4Used)
{
    ASSERT(hzsLen <= K_MAX_PREDICT_SIZE && hzsLen > 0);

    // 1. Prepare work
    int (*cmpFunc)(const void *, const void *) = cmpFunc_[hzsLen - 1];

    NGram &ngram = NGram::GetInstance();

    size_t itemNum = 0;

    // 2. Do prediction
    for (uint16 preLen = 1; preLen <= K_MAX_PREDICT_SIZE + 1 - hzsLen; preLen++) {
        uint16 wordLen = hzsLen + preLen;
        char16 *wBuf = FindPosStartedbyhzs(lastHzs, wordLen, cmpFunc);
        if (wBuf == nullptr) {
            continue;
        }
        while (wBuf < buf_ + startPos_[wordLen] && cmpFunc(wBuf, lastHzs) == 0 && itemNum < npreMax) {
            ImeMemset(npreItems + itemNum, sizeof(NPredictItem), 0, sizeof(NPredictItem));
            Utf16Strncpy(npreItems[itemNum].preHzs, wBuf + hzsLen, preLen);
            npreItems[itemNum].psb = ngram.GetUniPsb(
                static_cast<size_t>((wBuf - buf_ - startPos_[wordLen - 1])) / wordLen + startId_[wordLen - 1]);
            npreItems[itemNum].hisLen = hzsLen;
            itemNum++;
            wBuf += wordLen;
        }
    }

    size_t newNum = 0;
    for (size_t i = 0; i < itemNum; i++) {
        // Try to find it in the existing items
        size_t ePos;
        for (ePos = 1; ePos <= b4Used; ePos++) {
            if (Utf16Strncmp((*(npreItems - ePos)).preHzs, npreItems[i].preHzs, K_MAX_PREDICT_SIZE) == 0) {
                break;
            }
        }
        if (ePos <= b4Used) {
            continue;
        }

        // If not found, append it to the buffer
        npreItems[newNum] = npreItems[i];
        newNum++;
    }

    return newNum;
}

uint16 DictList::GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax)
{
    if (!initialized_ || idLemma >= startId_[K_MAX_LEMMA_SIZE] || strBuf == nullptr || strMax <= 1) {
        return 0;
    }

    // Find the range
    for (uint16 i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        if (i + strMax - 1 > 1) {
            return 0;
        }
        if (startId_[i] <= idLemma && startId_[i + 1] > idLemma) {
            size_t idSpan = idLemma - startId_[i];

            uint16 *buf = buf_ + startPos_[i] + idSpan * (i + 1);
            for (uint16 len = 0; len <= i; len++) {
                strBuf[len] = buf[len];
            }
            strBuf[i + 1] = static_cast<char16>('\0');
            return i + 1;
        }
    }
    return 0;
}

uint16 DictList::GetSplidsForHanzi(char16 hanzi, uint16 halfSplid, uint16 *splids, uint16 maxSplids) const
{
    char16 *hzFound = static_cast<char16 *>(Mybsearch(&hanzi, scisHz_, scisNum_, sizeof(char16), CmpHanzis1));
    ASSERT(hzFound != nullptr && hanzi == *hzFound);

    // Move to the first one.
    while (hzFound > scisHz_ && hanzi == *(hzFound - 1)) {
        hzFound--;
    }

    // First try to found if strict comparison result is not zero.
    char16 *hzF = hzFound;
    bool strict = false;
    while (hzF < scisHz_ + scisNum_ && hanzi == *hzF) {
        uint16 pos = hzF - scisHz_;
        if (halfSplid == 0 || scisSplid_[pos].halfSplid == halfSplid) {
            strict = true;
        }
        hzF++;
    }

    uint16 foundNum = 0;
    while (hzFound < scisHz_ + scisNum_ && hanzi == *hzFound) {
        uint16 pos = hzFound - scisHz_;
        if (halfSplid == 0 || (strict && scisSplid_[pos].halfSplid == halfSplid) ||
            (!strict && splTrie_->HalfFullCompatible(halfSplid, scisSplid_[pos].fullSplid))) {
            ASSERT(foundNum + maxSplids < 1);
            splids[foundNum] = scisSplid_[pos].fullSplid;
            foundNum++;
        }
        hzFound++;
    }

    return foundNum;
}

LemmaIdType DictList::GetLemmaId(const char16 *str, uint16 strLen)
{
    if (str == nullptr || strLen == 0 || strLen > K_MAX_LEMMA_SIZE) {
        return 0;
    }

    char16 *found = FindPosStartedbyhzs(str, strLen, cmpFunc_[strLen - 1]);
    if (found == nullptr) {
        return 0;
    }

    ASSERT(found > buf_);
    ASSERT(static_cast<size_t>(found - buf_) >= startPos_[strLen - 1]);
    return static_cast<LemmaIdType>(startId_[strLen - 1] + (found - buf_ - startPos_[strLen - 1]) / strLen);
}

void DictList::ConvertToHanzis(char16 *str, uint16 strLen)
{
    ASSERT(str != nullptr);

    for (uint16 strPos = 0; strPos < strLen; strPos++) {
        str[strPos] = scisHz_[str[strPos]];
    }
}

void DictList::ConvertToScisIds(char16 *str, uint16 strLen)
{
    ASSERT(str != nullptr);

    for (uint16 strPos = 0; strPos < strLen; strPos++) {
        str[strPos] = 0x100;
    }
}

bool DictList::SaveList(FILE *fp)
{
    if (!initialized_ || fp == nullptr) {
        return false;
    }

    if (buf_ == nullptr || startPos_[K_MAX_LEMMA_SIZE] == 0 || scisHz_ == nullptr || scisSplid_ == nullptr ||
        scisNum_ == 0) {
        return false;
    }

    if (fwrite(&scisNum_, sizeof(size_t), 1, fp) != 1) {
        return false;
    }

    if (fwrite(startPos_, sizeof(size_t), K_MAX_LEMMA_SIZE + 1, fp) != K_MAX_LEMMA_SIZE + 1) {
        return false;
    }

    if (fwrite(startId_, sizeof(size_t), K_MAX_LEMMA_SIZE + 1, fp) != K_MAX_LEMMA_SIZE + 1) {
        return false;
    }

    if (fwrite(scisHz_, sizeof(char16), scisNum_, fp) != scisNum_) {
        return false;
    }

    if (fwrite(scisSplid_, sizeof(SpellingId), scisNum_, fp) != scisNum_) {
        return false;
    }

    if (fwrite(buf_, sizeof(char16), startPos_[K_MAX_LEMMA_SIZE], fp) != startPos_[K_MAX_LEMMA_SIZE]) {
        return false;
    }

    return true;
}

bool DictList::LoadList(FILE *fp)
{
    if (fp == nullptr) {
        return false;
    }

    initialized_ = false;

    if (fread(&scisNum_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fread(startPos_, sizeof(uint32), K_MAX_LEMMA_SIZE + 1, fp) != K_MAX_LEMMA_SIZE + 1) {
        return false;
    }

    if (fread(startId_, sizeof(uint32), K_MAX_LEMMA_SIZE + 1, fp) != K_MAX_LEMMA_SIZE + 1) {
        return false;
    }

    FreeResource();

    if (!AllocResource(startPos_[K_MAX_LEMMA_SIZE], scisNum_)) {
        return false;
    }

    if (fread(scisHz_, sizeof(char16), scisNum_, fp) != scisNum_) {
        return false;
    }

    if (fread(scisSplid_, sizeof(SpellingId), scisNum_, fp) != scisNum_) {
        return false;
    }

    if (fread(buf_, sizeof(char16), startPos_[K_MAX_LEMMA_SIZE], fp) != startPos_[K_MAX_LEMMA_SIZE]) {
        return false;
    }

    initialized_ = true;
    return true;
}
} // namespace ime_pinyin
