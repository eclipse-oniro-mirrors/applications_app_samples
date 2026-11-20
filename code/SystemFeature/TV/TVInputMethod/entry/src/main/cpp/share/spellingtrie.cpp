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

#include "../include/dictdef.h"
#include <cassert>
#include <cstdio>
#include <cstring>

#ifdef BUILD_MODEL
#include "../include/spellingtable.h"
#endif

#include "../include/spellingtrie.h"

#include "ime_assert.h"
#include "ime_secure.h"
constexpr int K_MAGIC_2 = 2;
constexpr int K_MAGIC_3 = 3;

namespace ime_pinyin {

SpellingTrie *SpellingTrie::instance_ = nullptr;

// z/c/s is for Zh/Ch/Sh
const char SpellingTrie::kHalfId2Sc_[K_FULL_SPL_ID_START + 1] = "0ABCcDEFGHIJKLMNOPQRSsTUVWXYZz";

// Bit 0 : is it a Shengmu char?
// Bit 1 : is it a Yunmu char? (one char is a Yunmu)
// Bit 2 : is it enabled in ShouZiMu(first char) mode?
unsigned char SpellingTrie::charFlags_[] = {
    // a    b      c     d     e     f     g
    0x02, 0x01, 0x01, 0x01, 0x02, 0x01, 0x01,
    // h    i     j      k     l     m    n
    0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01,
    // o    p     q      r     s     t
    0x02, 0x01, 0x01, 0x01, 0x01, 0x01,
    // u    v     w      x     y     z
    0x00, 0x00, 0x01, 0x01, 0x01, 0x01};

int CompareSpl(const void *p1, const void *p2)
{
    return strcmp(reinterpret_cast<const char *>((p1)), reinterpret_cast<const char *>((p2)));
}

SpellingTrie::SpellingTrie()
{
    spellingBuf_ = nullptr;
    spellingSize_ = 0;
    spellingNum_ = 0;
    splYmIds_ = nullptr;
    splstrQueried_ = nullptr;
    splstr16Queried_ = nullptr;
    root_ = nullptr;
    dumbNode_ = nullptr;
    splitterNode_ = nullptr;
    instance_ = nullptr;
    ymBuf_ = nullptr;
    f2h_ = nullptr;

    SzmEnableShm(true);
    SzmEnableYm(true);

#ifdef BUILD_MODEL
    node_num_ = 0;
#endif
}

SpellingTrie::~SpellingTrie()
{
    if (spellingBuf_ != nullptr) {
        delete[] spellingBuf_;
    }

    if (splstrQueried_ != nullptr) {
        delete[] splstrQueried_;
    }

    if (splstr16Queried_ != nullptr) {
        delete[] splstr16Queried_;
    }

    if (splYmIds_ != nullptr) {
        delete[] splYmIds_;
    }

    if (root_ != nullptr) {
        FreeSonTrie(root_);
        delete root_;
    }

    if (dumbNode_ != nullptr) {
        delete[] dumbNode_;
    }

    if (splitterNode_ != nullptr) {
        delete[] splitterNode_;
    }

    if (instance_ != nullptr) {
        delete instance_;
        instance_ = nullptr;
    }

    if (ymBuf_ != nullptr) {
        delete[] ymBuf_;
    }

    if (f2h_ != nullptr) {
        delete[] f2h_;
    }
}

bool SpellingTrie::IfValidIdUpdate(uint16 *splid) const
{
    if (splid == nullptr || *splid == 0) {
        return false;
    }

    if (*splid >= K_FULL_SPL_ID_START) {
        return true;
    }
    if (*splid < K_FULL_SPL_ID_START) {
        char ch = kHalfId2Sc_[*splid];
        if (ch > 'Z') {
            return true;
        } else {
            if (SzmIsEnabled(ch)) {
                return true;
            } else if (IsYunmuChar(ch)) {
                ASSERT(h2fNum_[*splid] > 0);
                *splid = h2fStart_[*splid];
                return true;
            }
        }
    }
    return false;
}

bool SpellingTrie::IsHalfId(uint16 splid) const
{
    if (splid == 0 || splid >= K_FULL_SPL_ID_START) {
        return false;
    }

    return true;
}

bool SpellingTrie::IsFullId(uint16 splid) const
{
    if (splid < K_FULL_SPL_ID_START || splid >= K_FULL_SPL_ID_START + spellingNum_) {
        return false;
    }
    return true;
}

bool SpellingTrie::HalfFullCompatible(uint16 halfId, uint16 fullId) const
{
    uint16 halfFrFull = FullToHalf(fullId);
    if (halfFrFull == halfId) {
        return true;
    }

    // &~0x20 is used to conver the char to upper case.
    // So that Zh/Ch/Sh(whose char is z/c/s) can be matched with Z/C/S.
    char chF = (kHalfId2Sc_[halfFrFull] & (~0x20));
    char chH = kHalfId2Sc_[halfId];
    if (chF == chH) {
        return true;
    }

    return false;
}

bool SpellingTrie::IsHalfIdYunmu(uint16 splid) const
{
    if (splid == 0 || splid >= K_FULL_SPL_ID_START) {
        return false;
    }

    char ch = kHalfId2Sc_[splid];
    // If ch >= 'a', that means the half id is one of Zh/Ch/Sh
    if (ch >= 'a') {
        return false;
    }

    return charFlags_[ch - 'A'] & kHalfIdYunmuMask;
}

bool SpellingTrie::IsShengmuChar(char ch) const { return charFlags_[ch - 'A'] & kHalfIdShengmuMask; }

bool SpellingTrie::IsYunmuChar(char ch) const { return charFlags_[ch - 'A'] & kHalfIdYunmuMask; }

bool SpellingTrie::IsSzmChar(char ch) const { return IsShengmuChar(ch) || IsYunmuChar(ch); }

bool SpellingTrie::SzmIsEnabled(char ch) const { return charFlags_[ch - 'A'] & kHalfIdSzmMask; }

void SpellingTrie::SzmEnableShm(bool enable)
{
    if (enable) {
        for (char ch = 'A'; ch <= 'Z'; ch++) {
            if (IsShengmuChar(ch)) {
                charFlags_[ch - 'A'] = charFlags_[ch - 'A'] | kHalfIdSzmMask;
            }
        }
    } else {
        for (char ch = 'A'; ch <= 'Z'; ch++) {
            if (IsShengmuChar(ch)) {
                charFlags_[ch - 'A'] = charFlags_[ch - 'A'] & (kHalfIdSzmMask ^ 0xff);
            }
        }
    }
}

void SpellingTrie::SzmEnableYm(bool enable)
{
    if (enable) {
        for (char ch = 'A'; ch <= 'Z'; ch++) {
            if (IsYunmuChar(ch)) {
                charFlags_[ch - 'A'] = charFlags_[ch - 'A'] | kHalfIdSzmMask;
            }
        }
    } else {
        for (char ch = 'A'; ch <= 'Z'; ch++) {
            if (IsYunmuChar(ch)) {
                charFlags_[ch - 'A'] = charFlags_[ch - 'A'] & (kHalfIdSzmMask ^ 0xff);
            }
        }
    }
}

bool SpellingTrie::IsSzmEnabled(char ch) const { return charFlags_[ch - 'A'] & kHalfIdSzmMask; }

const SpellingTrie *SpellingTrie::GetCpinstance() { return &GetInstance(); }

SpellingTrie &SpellingTrie::GetInstance()
{
    if (instance_ == nullptr) {
        instance_ = new SpellingTrie();
    }

    return *instance_;
}

uint16 SpellingTrie::Half2fullNum(uint16 halfId) const
{
    if (root_ == nullptr || halfId >= K_FULL_SPL_ID_START) {
        return 0;
    }
    return h2fNum_[halfId];
}

uint16 SpellingTrie::HalfToFull(uint16 halfId, uint16 *splIdStart) const
{
    if (splIdStart == nullptr || root_ == nullptr || halfId >= K_FULL_SPL_ID_START) {
        return 0;
    }

    *splIdStart = h2fStart_[halfId];
    return h2fNum_[halfId];
}

uint16 SpellingTrie::FullToHalf(uint16 fullId) const
{
    if (root_ == nullptr || fullId < K_FULL_SPL_ID_START || fullId > spellingNum_ + K_FULL_SPL_ID_START) {
        return 0;
    }

    return f2h_[fullId - K_FULL_SPL_ID_START];
}

void SpellingTrie::FreeSonTrie(SpellingNode *node)
{
    if (node == nullptr) {
        return;
    }

    for (size_t pos = 0; pos < node->numOfSon; pos++) {
        FreeSonTrie(node->firstSon + pos);
    }

    if (node->firstSon != nullptr) {
        delete[] node->firstSon;
    }
}

void SpellingTrie::InitNodes(unsigned char averageScore)
{
    root_ = new SpellingNode();
    ImeMemset(root_, sizeof(SpellingNode), 0, sizeof(SpellingNode));

    dumbNode_ = new SpellingNode();
    ImeMemset(dumbNode_, sizeof(SpellingNode), 0, sizeof(SpellingNode));
    dumbNode_->score = averageScore;

    splitterNode_ = new SpellingNode();
    ImeMemset(splitterNode_, sizeof(SpellingNode), 0, sizeof(SpellingNode));
    splitterNode_->score = averageScore;

    ImeMemset(level1Sons_, sizeof(SpellingNode *) * kValidSplCharNum, 0, sizeof(SpellingNode *) * kValidSplCharNum);
}

bool SpellingTrie::StoreSpellingBuf(const char *spellingArr, size_t itemSize, size_t itemNum)
{
    if (spellingArr == spellingBuf_) {
        return true;
    }
    if (spellingBuf_ != nullptr) {
        delete[] spellingBuf_;
    }
    spellingBuf_ = new char[itemSize * itemNum];
    if (spellingBuf_ == nullptr) {
        return false;
    }
    return ImeMemcpy(spellingBuf_, sizeof(char) * itemSize * itemNum, spellingArr, sizeof(char) * itemSize * itemNum) ==
           0;
}

bool SpellingTrie::AllocQueryBuffers()
{
    if (splstrQueried_ != nullptr) {
        delete[] splstrQueried_;
    }
    splstrQueried_ = new char[spellingSize_];
    if (splstrQueried_ == nullptr) {
        return false;
    }

    if (splstr16Queried_ != nullptr) {
        delete[] splstr16Queried_;
    }
    splstr16Queried_ = new char16[spellingSize_];
    return splstr16Queried_ != nullptr;
}

bool SpellingTrie::Construct(const char *spellingArr, size_t itemSize, size_t itemNum, float scoreAmplifier,
                             unsigned char averageScore)
{
    if (spellingArr == nullptr) {
        return false;
    }

    ImeMemset(h2fStart_, sizeof(uint16) * K_FULL_SPL_ID_START, 0, sizeof(uint16) * K_FULL_SPL_ID_START);
    ImeMemset(h2fNum_, sizeof(uint16) * K_FULL_SPL_ID_START, 0, sizeof(uint16) * K_FULL_SPL_ID_START);

    if (!StoreSpellingBuf(spellingArr, itemSize, itemNum)) {
        return false;
    }

    spellingSize_ = itemSize;
    spellingNum_ = itemNum;

    scoreAmplifier_ = scoreAmplifier;
    averageScore_ = averageScore;

    if (!AllocQueryBuffers()) {
        return false;
    }

    qsort(spellingBuf_, spellingNum_, spellingSize_, CompareSpl);

#ifdef BUILD_MODEL
    node_num_ = 1;
#endif

    InitNodes(averageScore);
    root_->firstSon = ConstructSpellingsSubset(0, spellingNum_, 0, root_);

    // Root's score should be cleared.
    root_->score = 0;

    if (root_->firstSon == nullptr) {
        return false;
    }

    h2fStart_[0] = h2fNum_[0] = 0;

    if (!BuildF2h()) {
        return false;
    }

#ifdef BUILD_MODEL
    if (K_PRINT_DEBUG0) {
        printf("---SpellingTrie Nodes: %d\n", node_num_);
    }
    return build_ym_info();
#else
    return true;
#endif
}

#ifdef BUILD_MODEL
const char *SpellingTrie::get_ym_str(const char *spl_str)
{
    bool start_ZCS = false;
    if (IsShengmuChar(*spl_str)) {
        if (*spl_str == 'Z' || *spl_str == 'C' || *spl_str == 'S') {
            start_ZCS = true;
        }
        spl_str += 1;
        if (start_ZCS && *spl_str == 'h') {
            spl_str += 1;
        }
    }
    return spl_str;
}

bool SpellingTrie::build_ym_info()
{
    bool sucess;
    SpellingTable *spl_table = new SpellingTable();

    sucess = spl_table->init_table(K_MAX_PINYIN_SIZE - 1, K_MAGIC_2 * kMaxYmNum, false);
    ASSERT(sucess);

    for (uint16 pos = 0; pos < spellingNum_; pos++) {
        const char *spl_str = spellingBuf_ + spellingSize_ * pos;
        spl_str = get_ym_str(spl_str);
        if (spl_str[0] != '\0') {
            sucess = spl_table->put_spelling(spl_str, 0);
            ASSERT(sucess);
        }
    }

    size_t ym_item_size; // '\0' is included
    size_t ym_num;
    const char *ym_buf = spl_table->arrange(&ym_item_size, &ym_num);

    if (ymBuf_ != nullptr) {
        delete[] ymBuf_;
    }
    ymBuf_ = new char[ym_item_size * ym_num];
    if (ymBuf_ == nullptr) {
        delete spl_table;
        return false;
    }

    ImeMemcpy(ymBuf_, sizeof(char) * ym_item_size * ym_num, ym_buf, sizeof(char) * ym_item_size * ym_num);
    ymSize_ = ym_item_size;
    ymNum_ = ym_num;

    delete spl_table;

    // Generate the maping from the spelling ids to the Yunmu ids.
    if (splYmIds_) {
        delete splYmIds_;
    }
    splYmIds_ = new uint8[spellingNum_ + K_FULL_SPL_ID_START];
    if (splYmIds_ == nullptr) {
        return false;
    }

    ImeMemset(splYmIds_, sizeof(uint8) * (spellingNum_ + K_FULL_SPL_ID_START), 0,
              sizeof(uint8) * (spellingNum_ + K_FULL_SPL_ID_START));

    for (uint16 id = 1; id < spellingNum_ + K_FULL_SPL_ID_START; id++) {
        const char *str = GetSpellingStr(id);

        str = get_ym_str(str);
        if (str[0] != '\0') {
            uint8 ym_id = GetYmId(str);
            splYmIds_[id] = ym_id;
            ASSERT(ym_id > 0);
        } else {
            splYmIds_[id] = 0;
        }
    }
    return true;
}
#endif

uint16 SpellingTrie::CountSons(size_t itemStart, size_t itemEnd, size_t level, char charForNode)
{
    uint16 numOfSon = 1;
    char prevChar = charForNode;
    for (size_t i = itemStart + 1; i < itemEnd; i++) {
        char charCurrent = spellingBuf_[spellingSize_ * i + level];
        if (charCurrent != prevChar) {
            numOfSon++;
            prevChar = charCurrent;
        }
    }
    return numOfSon;
}

void SpellingTrie::SetSon(SpellingNode *node, const char *spellingLastStart, size_t itemStartNext, size_t endIdx,
                          size_t level)
{
    if (spellingLastStart[level + 1] != '\0' || endIdx - itemStartNext > 1) {
        size_t realStart = itemStartNext;
        if (spellingLastStart[level + 1] == '\0') {
            realStart++;
        }
        node->firstSon = ConstructSpellingsSubset(realStart, endIdx, level + 1, node);
        if (realStart == itemStartNext + 1) {
            uint16 scoreThis = static_cast<unsigned char>(spellingLastStart[spellingSize_ - 1]);
            if (scoreThis < node->score) {
                node->score = scoreThis;
            }
        }
    } else {
        node->firstSon = nullptr;
        node->score = static_cast<unsigned char>(spellingLastStart[spellingSize_ - 1]);
    }
}

bool SpellingTrie::AssignHalfId(SpellingNode *node, const SonNodeCtx &c)
{
    if (c.level == 0 && c.szmEnabled) {
        node->spellingIdx = static_cast<uint16>(c.charForNode - 'A' + 1);
        if (c.charForNode > 'C') {
            node->spellingIdx++;
        }
        if (c.charForNode > 'S') {
            node->spellingIdx++;
        }
        h2fNum_[node->spellingIdx] = static_cast<uint16>(c.endIdx - c.itemStartNext);
        return true;
    }
    if (c.level != 1 || c.charForNode != 'h') {
        return false;
    }
    char chLevel0 = c.spellingLastStart[0];
    uint16 partId = 0;
    if (chLevel0 == 'C') {
        partId = 'C' - 'A' + 1 + 1;
    } else if (chLevel0 == 'S') {
        partId = 'S' - 'A' + 1 + K_MAGIC_2;
    } else if (chLevel0 == 'Z') {
        partId = 'Z' - 'A' + 1 + K_MAGIC_3;
    }
    if (partId == 0) {
        return false;
    }
    node->spellingIdx = partId;
    h2fNum_[node->spellingIdx] = static_cast<uint16>(c.endIdx - c.itemStartNext);
    return true;
}

void SpellingTrie::UpdateH2fStart(const SpellingNode *node, size_t itemStartNext)
{
    if (h2fNum_[node->spellingIdx] > 0) {
        h2fStart_[node->spellingIdx] = itemStartNext + K_FULL_SPL_ID_START;
    } else {
        h2fStart_[node->spellingIdx] = 0;
    }
}

void SpellingTrie::ConfigureSonNode(SpellingNode *node, const SonNodeCtx &c, unsigned char &minSonScore)
{
    node->charThisNode = c.charForNode;
    if (c.level == 0) {
        level1Sons_[c.charForNode - 'A'] = node;
    }
    if (c.spellingEndable) {
        node->spellingIdx = K_FULL_SPL_ID_START + c.itemStartNext;
    }
    SetSon(node, c.spellingLastStart, c.itemStartNext, c.endIdx, c.level);
    if (node->score < minSonScore) {
        minSonScore = node->score;
    }
    if (AssignHalfId(node, c)) {
        UpdateH2fStart(node, c.itemStartNext);
    }
}

SpellingNode *SpellingTrie::ConstructSpellingsSubset(size_t itemStart, size_t itemEnd, size_t level,
                                                     SpellingNode *parent)
{
    if (level >= spellingSize_ || itemEnd <= itemStart || parent == nullptr) {
        return nullptr;
    }

    const char *spellingLastStart = spellingBuf_ + spellingSize_ * itemStart;
    char charForNode = spellingLastStart[level];
    ASSERT(charForNode >= 'A' && charForNode <= 'Z' || charForNode == 'h');

    uint16 numOfSon = CountSons(itemStart, itemEnd, level, charForNode);
    if (numOfSon == 0 || numOfSon > (static_cast<size_t>(-1) / sizeof(SpellingNode))) {
        return nullptr;
    }

#ifdef BUILD_MODEL
    node_num_ += numOfSon;
#endif

    unsigned char minSonScore = 255;
    SpellingNode *firstSon = BuildSonNodes(itemStart, itemEnd, level, charForNode, numOfSon, minSonScore);
    if (firstSon == nullptr) {
        return nullptr;
    }
    parent->numOfSon = numOfSon;
    parent->score = minSonScore;
    return firstSon;
}

SpellingNode *SpellingTrie::BuildSonNodes(size_t itemStart, size_t itemEnd, size_t level, char charForNode,
                                          uint16 numOfSon, unsigned char &minSonScore)
{
    if (numOfSon == 0 || numOfSon > (static_cast<size_t>(-1) / sizeof(SpellingNode))) {
        return nullptr;
    }

    SpellingNode *firstSon = new SpellingNode[numOfSon];
    ImeMemset(firstSon, sizeof(SpellingNode) * numOfSon, 0, sizeof(SpellingNode) * numOfSon);

    size_t sonPos = 0;
    size_t itemStartNext = itemStart;
    const char *spellingLastStart = spellingBuf_ + spellingSize_ * itemStart;
    bool spellingEndable = spellingLastStart[level + 1] == '\0';

    for (size_t i = itemStart + 1; i < itemEnd; i++) {
        const char *spellingCurrent = spellingBuf_ + spellingSize_ * i;
        char charCurrent = spellingCurrent[level];
        ASSERT(IsValidSplChar(charCurrent));
        if (charCurrent == charForNode) {
            continue;
        }

        SonNodeCtx ctx = {level,
                          charForNode,
                          spellingLastStart,
                          itemStartNext,
                          i,
                          spellingEndable,
                          level == 0 && IsSzmChar(charForNode)};
        ConfigureSonNode(firstSon + sonPos, ctx, minSonScore);

        spellingLastStart = spellingCurrent;
        charForNode = charCurrent;
        itemStartNext = i;
        spellingEndable = spellingCurrent[level + 1] == '\0';
        sonPos++;
    }

    SonNodeCtx lastCtx = {level,
                          charForNode,
                          spellingLastStart,
                          itemStartNext,
                          itemEnd,
                          spellingEndable,
                          level == 0 && SzmIsEnabled(charForNode)};
    ConfigureSonNode(firstSon + sonPos, lastCtx, minSonScore);

    ASSERT(sonPos + 1 == numOfSon);
    return firstSon;
}

bool SpellingTrie::SaveSplTrie(FILE *fp)
{
    if (fp == nullptr || spellingBuf_ == nullptr) {
        return false;
    }

    if (fwrite(&spellingSize_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fwrite(&spellingNum_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fwrite(&scoreAmplifier_, sizeof(float), 1, fp) != 1) {
        return false;
    }

    if (fwrite(&averageScore_, sizeof(unsigned char), 1, fp) != 1) {
        return false;
    }

    if (fwrite(spellingBuf_, sizeof(char) * spellingSize_, spellingNum_, fp) != spellingNum_) {
        return false;
    }

    return true;
}

bool SpellingTrie::LoadSplTrie(FILE *fp)
{
    if (fp == nullptr) {
        return false;
    }

    if (fread(&spellingSize_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fread(&spellingNum_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fread(&scoreAmplifier_, sizeof(float), 1, fp) != 1) {
        return false;
    }

    if (fread(&averageScore_, sizeof(unsigned char), 1, fp) != 1) {
        return false;
    }

    if (spellingBuf_ != nullptr) {
        delete[] spellingBuf_;
    }

    spellingBuf_ = new char[spellingSize_ * spellingNum_];
    if (spellingBuf_ == nullptr) {
        return false;
    }

    if (fread(spellingBuf_, sizeof(char) * spellingSize_, spellingNum_, fp) != spellingNum_) {
        return false;
    }

    return Construct(spellingBuf_, spellingSize_, spellingNum_, scoreAmplifier_, averageScore_);
}

bool SpellingTrie::BuildF2h()
{
    if (f2h_ != nullptr) {
        delete[] f2h_;
    }
    f2h_ = new uint16[spellingNum_];
    if (f2h_ == nullptr) {
        return false;
    }

    for (uint16 hid = 0; hid < K_FULL_SPL_ID_START; hid++) {
        for (uint16 fid = h2fStart_[hid]; fid < h2fStart_[hid] + h2fNum_[hid]; fid++) {
            f2h_[fid - K_FULL_SPL_ID_START] = hid;
        }
    }

    return true;
}

size_t SpellingTrie::GetSpellingNum() const { return spellingNum_; }

uint8 SpellingTrie::GetYmId(const char *ymStr) const
{
    if (ymStr == nullptr || ymBuf_ == nullptr) {
        return 0;
    }

    for (uint8 pos = 0; pos < ymNum_; pos++) {
        if (strcmp(ymBuf_ + ymSize_ * pos, ymStr) == 0) {
            return pos + 1;
        }
    }

    return 0;
}

const char *SpellingTrie::GetSpellingStr(uint16 splid) const
{
    splstrQueried_[0] = '\0';

    if (splid >= K_FULL_SPL_ID_START) {
        splid -= K_FULL_SPL_ID_START;
        if (ImeStrncpy(splstrQueried_, spellingSize_, spellingBuf_ + splid * spellingSize_, spellingSize_) != 0) {
            return nullptr;
        }
    } else {
        if (splid == 'C' - 'A' + 1 + 1) {
            ImeStrncpy(splstrQueried_, spellingSize_, "Ch", spellingSize_);
        } else if (splid == 'S' - 'A' + 1 + K_MAGIC_2) {
            ImeStrncpy(splstrQueried_, spellingSize_, "Sh", spellingSize_);
        } else if (splid == 'Z' - 'A' + 1 + K_MAGIC_3) {
            ImeStrncpy(splstrQueried_, spellingSize_, "Zh", spellingSize_);
        } else {
            if (splid > 'C' - 'A' + 1) {
                splid--;
            }
            if (splid > 'S' - 'A' + 1) {
                splid--;
            }
            splstrQueried_[0] = 'A' + splid - 1;
            splstrQueried_[1] = '\0';
        }
    }
    return splstrQueried_;
}

const char16 *SpellingTrie::GetSpellingStr16(uint16 splid)
{
    splstr16Queried_[0] = '\0';

    if (splid >= K_FULL_SPL_ID_START) {
        splid -= K_FULL_SPL_ID_START;
        for (size_t pos = 0; pos < spellingSize_; pos++) {
            splstr16Queried_[pos] = static_cast<char16>(spellingBuf_[splid * spellingSize_ + pos]);
        }
    } else {
        if (splid == 'C' - 'A' + 1 + 1) {
            splstr16Queried_[0] = static_cast<char16>('C');
            splstr16Queried_[1] = static_cast<char16>('h');
            splstr16Queried_[K_MAGIC_2] = static_cast<char16>('\0');
        } else if (splid == 'S' - 'A' + 1 + K_MAGIC_2) {
            splstr16Queried_[0] = static_cast<char16>('S');
            splstr16Queried_[1] = static_cast<char16>('h');
            splstr16Queried_[K_MAGIC_2] = static_cast<char16>('\0');
        } else if (splid == 'Z' - 'A' + 1 + K_MAGIC_3) {
            splstr16Queried_[0] = static_cast<char16>('Z');
            splstr16Queried_[1] = static_cast<char16>('h');
            splstr16Queried_[K_MAGIC_2] = static_cast<char16>('\0');
        } else {
            if (splid > 'C' - 'A' + 1) {
                splid--;
            }
            if (splid > 'S' - 'A' + 1) {
                splid--;
            }
            splstr16Queried_[0] = 'A' + splid - 1;
            splstr16Queried_[1] = '\0';
        }
    }
    return splstr16Queried_;
}

size_t SpellingTrie::GetSpellingStr16(uint16 splid, char16 *splstr16, size_t splstr16Len)
{
    if (splstr16 == nullptr || splstr16Len < K_MAX_PINYIN_SIZE + 1) {
        return 0;
    }

    if (splid >= K_FULL_SPL_ID_START) {
        splid -= K_FULL_SPL_ID_START;
        for (size_t pos = 0; pos <= K_MAX_PINYIN_SIZE; pos++) {
            splstr16[pos] = static_cast<char16>(spellingBuf_[splid * spellingSize_ + pos]);
            if (splstr16[pos] == static_cast<char16>('\0')) {
                return pos;
            }
        }
    } else {
        if (splid == 'C' - 'A' + 1 + 1) {
            splstr16[0] = static_cast<char16>('C');
            splstr16[1] = static_cast<char16>('h');
            splstr16[K_MAGIC_2] = static_cast<char16>('\0');
            return K_MAGIC_2;
        } else if (splid == 'S' - 'A' + 1 + K_MAGIC_2) {
            splstr16[0] = static_cast<char16>('S');
            splstr16[1] = static_cast<char16>('h');
            splstr16[K_MAGIC_2] = static_cast<char16>('\0');
            return K_MAGIC_2;
        } else if (splid == 'Z' - 'A' + 1 + K_MAGIC_3) {
            splstr16[0] = static_cast<char16>('Z');
            splstr16[1] = static_cast<char16>('h');
            splstr16[K_MAGIC_2] = static_cast<char16>('\0');
            return K_MAGIC_2;
        } else {
            if (splid > 'C' - 'A' + 1) {
                splid--;
            }
            if (splid > 'S' - 'A' + 1) {
                splid--;
            }
            splstr16[0] = 'A' + splid - 1;
            splstr16[1] = '\0';
            return 1;
        }
    }

    // Not reachable.
    return 0;
}

} // namespace ime_pinyin
