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

#include "../include/dicttrie.h"
#include "../include/dictbuilder.h"
#include "../include/lpicache.h"
#include "../include/mystdlib.h"
#include "../include/ngram.h"
#include <cassert>
#include <cstdio>
#include <cstring>

#include "ime_assert.h"
#include "ime_secure.h"
constexpr int K_MAGIC_16 = 16;
constexpr int K_MAGIC_2 = 2;
constexpr int K_MAGIC_5 = 5;
constexpr int K_MAGIC_8 = 8;

namespace ime_pinyin {

DictTrie::DictTrie()
{
    splTrie_ = SpellingTrie::GetCpinstance();

    root_ = nullptr;
    splidLe0Index_ = nullptr;
    lmaNodeNumLe0_ = 0;
    nodesGe1_ = nullptr;
    lmaNodeNumGe1_ = 0;
    lmaIdxBuf_ = nullptr;
    lmaIdxBufLen_ = 0;
    totalLmaNum_ = 0;
    topLmasNum_ = 0;
    dictList_ = nullptr;

    parsingMarks_ = nullptr;
    mileStones_ = nullptr;
    parsingMarksPos_ = 0;
    mileStonesPos_ = kFirstValidMileStoneHandle;
}

DictTrie::~DictTrie() { FreeResource(true); }

void DictTrie::FreeResource(bool freeDictList)
{
    if (root_ != nullptr) {
        free(root_);
    }
    root_ = nullptr;

    if (splidLe0Index_ != nullptr) {
        free(splidLe0Index_);
    }
    splidLe0Index_ = nullptr;

    if (nodesGe1_ != nullptr) {
        free(nodesGe1_);
    }
    nodesGe1_ = nullptr;

    if (nodesGe1_ != nullptr) {
        free(nodesGe1_);
    }
    nodesGe1_ = nullptr;

    if (freeDictList) {
        if (dictList_ != nullptr) {
            delete dictList_;
        }
        dictList_ = nullptr;
    }

    if (parsingMarks_) {
        delete[] parsingMarks_;
    }
    parsingMarks_ = nullptr;

    if (mileStones_) {
        delete[] mileStones_;
    }
    mileStones_ = nullptr;

    ResetMilestones(0, kFirstValidMileStoneHandle);
}

inline size_t DictTrie::GetSonOffset(const LmaNodeGE1 *node) const
{
    return (static_cast<size_t>(node->son1stOffL) + (static_cast<size_t>(node->son1stOffH) << K_MAGIC_16));
}

inline size_t DictTrie::GetHomoIdxBufOffset(const LmaNodeGE1 *node) const
{
    return (static_cast<size_t>(node->homoIdxBufOffL) + (static_cast<size_t>(node->homoIdxBufOffH) << K_MAGIC_16));
}

inline LemmaIdType DictTrie::GetLemmaId(size_t idOffset) const
{
    LemmaIdType id = 0;
    for (uint16 pos = K_LEMMA_ID_SIZE - 1; pos > 0; pos--) {
        id = (id << K_MAGIC_8) + lmaIdxBuf_[idOffset * K_LEMMA_ID_SIZE + pos];
    }
    id = (id << K_MAGIC_8) + lmaIdxBuf_[idOffset * K_LEMMA_ID_SIZE];
    return id;
}

#ifdef BUILD_MODEL
bool DictTrie::build_dict(const char *fn_raw, const char *fn_validhzs)
{
    DictBuilder *dict_builder = new DictBuilder();

    FreeResource(true);

    return dict_builder->build_dict(fn_raw, fn_validhzs, this);
}

bool DictTrie::save_dict(FILE *fp)
{
    if (fp == nullptr) {
        return false;
    }

    if (fwrite(&lmaNodeNumLe0_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fwrite(&lmaNodeNumGe1_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fwrite(&lmaIdxBufLen_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fwrite(&topLmasNum_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fwrite(root_, sizeof(LmaNodeLE0), lmaNodeNumLe0_, fp) != lmaNodeNumLe0_) {
        return false;
    }

    if (fwrite(nodesGe1_, sizeof(LmaNodeGE1), lmaNodeNumGe1_, fp) != lmaNodeNumGe1_) {
        return false;
    }

    if (fwrite(lmaIdxBuf_, sizeof(unsigned char), lmaIdxBufLen_, fp) != lmaIdxBufLen_) {
        return false;
    }

    return true;
}

bool DictTrie::save_dict(const char *filename)
{
    if (filename == nullptr) {
        return false;
    }

    if (root_ == nullptr || dictList_ == nullptr) {
        return false;
    }

    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    NGram &ngram = NGram::GetInstance();

    FILE *fp = fopen(filename, "wb");
    if (fp == nullptr) {
        return false;
    }

    if (!splTrie.SaveSplTrie(fp) || !dictList_->SaveList(fp) || !save_dict(fp) || !ngram.SaveNgram(fp)) {
        (void)fclose(fp);
        return false;
    }

    (void)fclose(fp);
    return true;
}
#endif // BUILD_MODEL

bool DictTrie::LoadDictHeader(FILE *fp)
{
    if (fread(&lmaNodeNumLe0_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }
    if (fread(&lmaNodeNumGe1_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }
    if (fread(&lmaIdxBufLen_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }
    return fread(&topLmasNum_, sizeof(uint32), 1, fp) == 1 && topLmasNum_ < lmaIdxBufLen_;
}

bool DictTrie::AllocNodeBuffers(size_t bufSize)
{
    if (bufSize > (static_cast<size_t>(-1) / sizeof(uint16))) {
        return false;
    }
    root_ = static_cast<LmaNodeLE0 *>(malloc(lmaNodeNumLe0_ * sizeof(LmaNodeLE0)));
    nodesGe1_ = static_cast<LmaNodeGE1 *>(malloc(lmaNodeNumGe1_ * sizeof(LmaNodeGE1)));
    lmaIdxBuf_ = (unsigned char *)malloc(lmaIdxBufLen_);
    totalLmaNum_ = lmaIdxBufLen_ / K_LEMMA_ID_SIZE;

    splidLe0Index_ = static_cast<uint16 *>(malloc(bufSize * sizeof(uint16)));

    // Init the space for parsing.
    parsingMarks_ = new ParsingMark[kMaxParsingMark];
    mileStones_ = new MileStone[kMaxMileStone];
    ResetMilestones(0, kFirstValidMileStoneHandle);

    if (root_ == nullptr || nodesGe1_ == nullptr || lmaIdxBuf_ == nullptr || splidLe0Index_ == nullptr ||
        parsingMarks_ == nullptr || mileStones_ == nullptr) {
        FreeResource(false);
        return false;
    }
    return true;
}

void DictTrie::BuildSplidLe0Index(size_t bufSize)
{
    // The quick index for the first level sons
    uint16 lastSplid = K_FULL_SPL_ID_START;
    size_t lastPos = 0;
    for (size_t i = 1; i < lmaNodeNumLe0_; i++) {
        for (uint16 splid = lastSplid; splid < root_[i].splIdx; splid++) {
            splidLe0Index_[splid - K_FULL_SPL_ID_START] = lastPos;
        }

        splidLe0Index_[root_[i].splIdx - K_FULL_SPL_ID_START] = static_cast<uint16>(i);
        lastSplid = root_[i].splIdx;
        lastPos = i;
    }

    for (uint16 splid = lastSplid + 1; splid < bufSize + K_FULL_SPL_ID_START; splid++) {
        ASSERT(static_cast<size_t>(splid - K_FULL_SPL_ID_START) < bufSize);
        splidLe0Index_[splid - K_FULL_SPL_ID_START] = lastPos + 1;
    }
}

bool DictTrie::LoadDict(FILE *fp)
{
    if (fp == nullptr) {
        return false;
    }
    if (!LoadDictHeader(fp)) {
        return false;
    }

    FreeResource(false);

    if (lmaNodeNumLe0_ == 0 || lmaNodeNumGe1_ == 0) {
        return false;
    }
    if (lmaNodeNumLe0_ > (static_cast<size_t>(-1) / sizeof(LmaNodeLE0)) ||
        lmaNodeNumGe1_ > (static_cast<size_t>(-1) / sizeof(LmaNodeGE1))) {
        return false;
    }

    size_t bufSize = SpellingTrie::GetInstance().GetSpellingNum() + 1;
    ASSERT(lmaNodeNumLe0_ <= bufSize);
    if (!AllocNodeBuffers(bufSize)) {
        return false;
    }

    if (fread(root_, sizeof(LmaNodeLE0), lmaNodeNumLe0_, fp) != lmaNodeNumLe0_) {
        return false;
    }

    if (fread(nodesGe1_, sizeof(LmaNodeGE1), lmaNodeNumGe1_, fp) != lmaNodeNumGe1_) {
        return false;
    }

    if (fread(lmaIdxBuf_, sizeof(unsigned char), lmaIdxBufLen_, fp) != lmaIdxBufLen_) {
        return false;
    }

    BuildSplidLe0Index(bufSize);
    return true;
}

bool DictTrie::LoadDict(const char *filename, LemmaIdType startId, LemmaIdType endId)
{
    if (filename == nullptr || endId <= startId) {
        return false;
    }

    FILE *fp = fopen(filename, "rb");
    if (fp == nullptr) {
        return false;
    }

    FreeResource(true);

    dictList_ = new DictList();
    if (dictList_ == nullptr) {
        (void)fclose(fp);
        return false;
    }

    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    NGram &ngram = NGram::GetInstance();

    if (!splTrie.LoadSplTrie(fp) || !dictList_->LoadList(fp) || !LoadDict(fp) || !ngram.LoadNgram(fp) ||
        totalLmaNum_ > endId - startId + 1) {
        FreeResource(true);
        (void)fclose(fp);
        return false;
    }

    (void)fclose(fp);
    return true;
}

bool DictTrie::LoadDictFd(int sysFd, long startOffset, long length, LemmaIdType startId, LemmaIdType endId)
{
    if (startOffset < 0 || length <= 0 || endId <= startId) {
        return false;
    }

    FILE *fp = fdopen(sysFd, "rb");
    if (fp == nullptr) {
        return false;
    }

    if (fseek(fp, startOffset, SEEK_SET) == -1) {
        (void)fclose(fp);
        return false;
    }

    FreeResource(true);

    dictList_ = new DictList();
    if (dictList_ == nullptr) {
        (void)fclose(fp);
        return false;
    }

    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    NGram &ngram = NGram::GetInstance();

    if (!splTrie.LoadSplTrie(fp) || !dictList_->LoadList(fp) || !LoadDict(fp) || !ngram.LoadNgram(fp) ||
        ftell(fp) < startOffset + length || totalLmaNum_ > endId - startId + 1) {
        FreeResource(true);
        (void)fclose(fp);
        return false;
    }

    (void)fclose(fp);
    return true;
}

size_t DictTrie::FillLpiBuffer(LmaPsbItem lpiItems[], size_t lpiMax, LmaNodeLE0 *node)
{
    size_t lpiNum = 0;
    NGram &ngram = NGram::GetInstance();
    for (size_t homo = 0; homo < static_cast<size_t>(node->numOfHomo); homo++) {
        lpiItems[lpiNum].id = GetLemmaId(node->homoIdxBufOff + homo);
        lpiItems[lpiNum].lmaLen = 1;
        lpiItems[lpiNum].psb = static_cast<LmaScoreType>(ngram.GetUniPsb(lpiItems[lpiNum].id));
        lpiNum++;
        if (lpiNum >= lpiMax) {
            break;
        }
    }

    return lpiNum;
}

size_t DictTrie::FillLpiBuffer(LmaPsbItem lpiItems[], size_t lpiMax, size_t homoBufOff, const LmaNodeGE1 *node,
                               uint16 lmaLen)
{
    size_t lpiNum = 0;
    NGram &ngram = NGram::GetInstance();
    for (size_t homo = 0; homo < static_cast<size_t>(node->numOfHomo); homo++) {
        lpiItems[lpiNum].id = GetLemmaId(homoBufOff + homo);
        lpiItems[lpiNum].lmaLen = lmaLen;
        lpiItems[lpiNum].psb = static_cast<LmaScoreType>(ngram.GetUniPsb(lpiItems[lpiNum].id));
        lpiNum++;
        if (lpiNum >= lpiMax) {
            break;
        }
    }

    return lpiNum;
}

void DictTrie::ResetMilestones(uint16 fromStep, MileStoneHandle fromHandle)
{
    if (fromStep == 0) {
        parsingMarksPos_ = 0;
        mileStonesPos_ = kFirstValidMileStoneHandle;
    } else {
        if (fromHandle > 0 && fromHandle < mileStonesPos_) {
            mileStonesPos_ = fromHandle;

            MileStone *mileStone = mileStones_ + fromHandle;
            parsingMarksPos_ = mileStone->markStart;
        }
    }
}

MileStoneHandle DictTrie::ExtendDict(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems,
                                     size_t lpiMax, size_t *lpiNum)
{
    if (dep == nullptr) {
        return 0;
    }

    // from LmaNodeLE0 (root) to LmaNodeLE0
    if (fromHandle == 0) {
        ASSERT(dep->splidsExtended == 0);
        return ExtendDict0(fromHandle, dep, lpiItems, lpiMax, lpiNum);
    }

    // from LmaNodeLE0 to LmaNodeGE1
    if (dep->splidsExtended == 1) {
        return ExtendDict1(fromHandle, dep, lpiItems, lpiMax, lpiNum);
    }

    // From LmaNodeGE1 to LmaNodeGE1
    return ExtendDict2(fromHandle, dep, lpiItems, lpiMax, lpiNum);
}

MileStoneHandle DictTrie::ExtendDict0(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems,
                                      size_t lpiMax, size_t *lpiNum)
{
    ASSERT(dep != nullptr && fromHandle == 0);
    *lpiNum = 0;
    MileStoneHandle retHandle = 0;

    uint16 splid = dep->splids[dep->splidsExtended];
    uint16 idStart = dep->idStart;
    uint16 idNum = dep->idNum;

    LpiCache &lpiCache = LpiCache::GetInstance();
    bool cached = lpiCache.IsCached(splid);

    // 2. Begin exgtending
    // 2.1 Get the LmaPsbItem list
    LmaNodeLE0 *node = root_;
    size_t sonStart = splidLe0Index_[idStart - K_FULL_SPL_ID_START];
    size_t sonEnd = splidLe0Index_[idStart + idNum - K_FULL_SPL_ID_START];
    for (size_t sonPos = sonStart; sonPos < sonEnd; sonPos++) {
        ASSERT(node->son1stOff == 1);
        LmaNodeLE0 *son = root_ + sonPos;
        ASSERT(son->splIdx >= idStart && son->splIdx < idStart + idNum);

        if (!cached && *lpiNum < lpiMax) {
            bool needLpi = true;
            if (splTrie_->IsHalfIdYunmu(splid) && sonPos != sonStart) {
                needLpi = false;
            }

            if (needLpi) {
                *lpiNum += FillLpiBuffer(lpiItems + (*lpiNum), lpiMax - *lpiNum, son);
            }
        }

        // If necessary, fill in a new mile stone.
        if (son->splIdx == idStart) {
            if (mileStonesPos_ < kMaxMileStone && parsingMarksPos_ < kMaxParsingMark) {
                parsingMarks_[parsingMarksPos_].nodeOffset = sonPos;
                parsingMarks_[parsingMarksPos_].nodeNum = idNum;
                mileStones_[mileStonesPos_].markStart = parsingMarksPos_;
                mileStones_[mileStonesPos_].markNum = 1;
                retHandle = mileStonesPos_;
                parsingMarksPos_++;
                mileStonesPos_++;
            }
        }

        if (son->splIdx >= idStart + idNum - 1) {
            break;
        }
    }

    //      mileStonesPos_);
    return retHandle;
}

void DictTrie::ExtendLe0Node(LmaNodeLE0 *node, const DictExtendCtx &ctx, size_t &retVal)
{
    size_t foundStart = 0;
    size_t foundNum = 0;
    for (size_t sonPos = 0; sonPos < static_cast<size_t>(node->numOfSon); sonPos++) {
        ASSERT(node->son1stOff <= lmaNodeNumGe1_);
        LmaNodeGE1 *son = nodesGe1_ + node->son1stOff + sonPos;
        if (son->splIdx >= ctx.range.start && son->splIdx < ctx.range.start + ctx.range.num) {
            if (*ctx.lpiNum < ctx.lpiMax) {
                size_t homoBufOff = GetHomoIdxBufOffset(son);
                *ctx.lpiNum +=
                    FillLpiBuffer(ctx.lpiItems + (*ctx.lpiNum), ctx.lpiMax - *ctx.lpiNum, homoBufOff, son, K_MAGIC_2);
            }
            if (foundNum == 0) {
                foundStart = sonPos;
            }
            foundNum++;
        }
        if (son->splIdx >= ctx.range.start + ctx.range.num - 1 || sonPos == static_cast<size_t>(node->numOfSon) - 1) {
            RecordParsingMark(node->son1stOff + foundStart, foundNum, retVal);
            break;
        }
    }
}

void DictTrie::RecordParsingMark(size_t nodeOffset, size_t foundNum, size_t &retVal)
{
    if (foundNum == 0) {
        return;
    }
    if (mileStonesPos_ < kMaxMileStone && parsingMarksPos_ < kMaxParsingMark) {
        parsingMarks_[parsingMarksPos_].nodeOffset = nodeOffset;
        parsingMarks_[parsingMarksPos_].nodeNum = foundNum;
        if (retVal == 0) {
            mileStones_[mileStonesPos_].markStart = parsingMarksPos_;
        }
        parsingMarksPos_++;
    }
    retVal++;
}

MileStoneHandle DictTrie::ExtendDict1(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems,
                                      size_t lpiMax, size_t *lpiNum)
{
    ASSERT(dep != nullptr && fromHandle > 0 && fromHandle < mileStonesPos_);

    MileStoneHandle retHandle = 0;

    // 1. If this is a half Id, get its corresponding full starting Id and
    // number of full Id.
    size_t retVal = 0;

    uint16 idStart = dep->idStart;
    uint16 idNum = dep->idNum;

    // 2. Begin extending.
    MileStone *mileStone = mileStones_ + fromHandle;

    for (uint16 hPos = 0; hPos < mileStone->markNum; hPos++) {
        ParsingMark pMark = parsingMarks_[mileStone->markStart + hPos];
        uint16 extNum = pMark.nodeNum;
        for (uint16 extPos = 0; extPos < extNum; extPos++) {
            ExtendLe0Node(root_ + pMark.nodeOffset + extPos, {{idStart, idNum}, lpiItems, lpiMax, lpiNum}, retVal);
        }
    }

    if (retVal > 0) {
        mileStones_[mileStonesPos_].markNum = retVal;
        retHandle = mileStonesPos_;
        mileStonesPos_++;
        retVal = 1;
    }

    //         mileStonesPos_);
    return retHandle;
}

void DictTrie::ExtendGe1Node(LmaNodeGE1 *node, const DictExtendCtx &ctx, size_t &retVal, uint16 lmaLen)
{
    size_t foundStart = 0;
    size_t foundNum = 0;
    for (size_t sonPos = 0; sonPos < static_cast<size_t>(node->numOfSon); sonPos++) {
        ASSERT(node->son1stOffL > 0 || node->son1stOffH > 0);
        LmaNodeGE1 *son = nodesGe1_ + GetSonOffset(node) + sonPos;
        if (son->splIdx >= ctx.range.start && son->splIdx < ctx.range.start + ctx.range.num) {
            if (*ctx.lpiNum < ctx.lpiMax) {
                size_t homoBufOff = GetHomoIdxBufOffset(son);
                *ctx.lpiNum +=
                    FillLpiBuffer(ctx.lpiItems + (*ctx.lpiNum), ctx.lpiMax - *ctx.lpiNum, homoBufOff, son, lmaLen);
            }
            if (foundNum == 0) {
                foundStart = sonPos;
            }
            foundNum++;
        }
        if (son->splIdx >= ctx.range.start + ctx.range.num - 1 || sonPos == static_cast<size_t>(node->numOfSon) - 1) {
            RecordParsingMark(GetSonOffset(node) + foundStart, foundNum, retVal);
            break;
        }
    }
}

MileStoneHandle DictTrie::ExtendDict2(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems,
                                      size_t lpiMax, size_t *lpiNum)
{
    ASSERT(dep != nullptr && fromHandle > 0 && fromHandle < mileStonesPos_);

    MileStoneHandle retHandle = 0;

    // 1. If this is a half Id, get its corresponding full starting Id and
    // number of full Id.
    size_t retVal = 0;

    uint16 idStart = dep->idStart;
    uint16 idNum = dep->idNum;

    // 2. Begin extending.
    MileStone *mileStone = mileStones_ + fromHandle;

    for (uint16 hPos = 0; hPos < mileStone->markNum; hPos++) {
        ParsingMark pMark = parsingMarks_[mileStone->markStart + hPos];
        uint16 extNum = pMark.nodeNum;
        for (uint16 extPos = 0; extPos < extNum; extPos++) {
            ExtendGe1Node(nodesGe1_ + pMark.nodeOffset + extPos, {{idStart, idNum}, lpiItems, lpiMax, lpiNum}, retVal,
                          dep->splidsExtended + 1);
        }
    }

    if (retVal > 0) {
        mileStones_[mileStonesPos_].markNum = retVal;
        retHandle = mileStonesPos_;
        mileStonesPos_++;
    }

    //        mileStonesPos_);
    return retHandle;
}

bool DictTrie::ExtendByPos(void *&node, uint16 pos, uint16 splid)
{
    if (pos == 1) {
        LmaNodeLE0 *nodeLe0 = reinterpret_cast<LmaNodeLE0 *>(node);
        LmaNodeGE1 *nodeSon = nullptr;
        uint16 sonPos;
        for (sonPos = 0; sonPos < static_cast<uint16>(nodeLe0->numOfSon); sonPos++) {
            ASSERT(nodeLe0->son1stOff <= lmaNodeNumGe1_);
            nodeSon = nodesGe1_ + nodeLe0->son1stOff + sonPos;
            if (nodeSon->splIdx == splid) {
                break;
            }
        }
        if (sonPos >= nodeLe0->numOfSon) {
            return false;
        }
        node = reinterpret_cast<void *>(nodeSon);
        return true;
    }

    LmaNodeGE1 *nodeGe1 = reinterpret_cast<LmaNodeGE1 *>(node);
    LmaNodeGE1 *nodeSon = nullptr;
    uint16 sonPos;
    for (sonPos = 0; sonPos < static_cast<uint16>(nodeGe1->numOfSon); sonPos++) {
        ASSERT(nodeGe1->son1stOffL > 0 || nodeGe1->son1stOffH > 0);
        nodeSon = nodesGe1_ + GetSonOffset(nodeGe1) + sonPos;
        if (nodeSon->splIdx == splid) {
            break;
        }
    }
    if (sonPos >= nodeGe1->numOfSon) {
        return false;
    }
    node = reinterpret_cast<void *>(nodeSon);
    return true;
}

bool DictTrie::CheckLemmaHomo(void *node, uint16 splidNum, LemmaIdType idLemma)
{
    if (splidNum == 1) {
        LmaNodeLE0 *nodeLe0 = reinterpret_cast<LmaNodeLE0 *>(node);
        size_t numOfHomo = static_cast<size_t>(nodeLe0->numOfHomo);
        for (size_t homoPos = 0; homoPos < numOfHomo; homoPos++) {
            LemmaIdType idThis = GetLemmaId(nodeLe0->homoIdxBufOff + homoPos);
            char16 str[2];
            GetLemmaStr(idThis, str, K_MAGIC_2);
            if (idThis == idLemma) {
                return true;
            }
        }
        return false;
    }

    LmaNodeGE1 *nodeGe1 = reinterpret_cast<LmaNodeGE1 *>(node);
    size_t numOfHomo = static_cast<size_t>(nodeGe1->numOfHomo);
    for (size_t homoPos = 0; homoPos < numOfHomo; homoPos++) {
        size_t nodeHomoOff = GetHomoIdxBufOffset(nodeGe1);
        if (GetLemmaId(nodeHomoOff + homoPos) == idLemma) {
            return true;
        }
    }
    return false;
}

bool DictTrie::TryExtend(const uint16 *splids, uint16 splidNum, LemmaIdType idLemma)
{
    if (splidNum == 0 || splids == nullptr) {
        return false;
    }

    void *node = root_ + splidLe0Index_[splids[0] - K_FULL_SPL_ID_START];

    for (uint16 pos = 1; pos < splidNum; pos++) {
        if (!ExtendByPos(node, pos, splids[pos])) {
            return false;
        }
    }

    return CheckLemmaHomo(node, splidNum, idLemma);
}

void DictTrie::AppendExtendNode(LmaNodeLE0 **nodeTo, size_t &nodeToNum, LmaNodeLE0 *nodeSon)
{
    if (nodeToNum < kMaxExtendBufLen) {
        nodeTo[nodeToNum] = nodeSon;
        nodeToNum++;
    }
}

void DictTrie::AppendExtendNode(LmaNodeGE1 **nodeTo, size_t &nodeToNum, LmaNodeGE1 *nodeSon)
{
    if (nodeToNum < kMaxExtendBufLen) {
        nodeTo[nodeToNum] = nodeSon;
        nodeToNum++;
    }
}

void DictTrie::ExtendFromRoot(LmaNodeLE0 **nodeFr, LmaNodeLE0 **nodeTo, size_t nodeFrNum, size_t &nodeToNum,
                              const SplIdRange &range)
{
    for (size_t nodeFrPos = 0; nodeFrPos < nodeFrNum; nodeFrPos++) {
        LmaNodeLE0 *node = nodeFr[nodeFrPos];
        ASSERT(node == root_ && nodeFrNum == 1);
        size_t sonStart = splidLe0Index_[range.start - K_FULL_SPL_ID_START];
        size_t sonEnd = splidLe0Index_[range.start + range.num - K_FULL_SPL_ID_START];
        for (size_t sonPos = sonStart; sonPos < sonEnd; sonPos++) {
            ASSERT(node->son1stOff == 1);
            LmaNodeLE0 *nodeSon = root_ + sonPos;
            ASSERT(nodeSon->splIdx >= range.start && nodeSon->splIdx < range.start + range.num);
            AppendExtendNode(nodeTo, nodeToNum, nodeSon);
            if (nodeSon->splIdx >= range.start + range.num - 1) {
                break;
            }
        }
    }
}

void DictTrie::ExtendLe0ToGe1(LmaNodeLE0 **nodeFr, LmaNodeGE1 **nodeTo, size_t nodeFrNum, size_t &nodeToNum,
                              const SplIdRange &range)
{
    for (size_t nodeFrPos = 0; nodeFrPos < nodeFrNum; nodeFrPos++) {
        LmaNodeLE0 *node = nodeFr[nodeFrPos];
        for (size_t sonPos = 0; sonPos < static_cast<size_t>(node->numOfSon); sonPos++) {
            ASSERT(node->son1stOff <= lmaNodeNumGe1_);
            LmaNodeGE1 *nodeSon = nodesGe1_ + node->son1stOff + sonPos;
            if (nodeSon->splIdx >= range.start && nodeSon->splIdx < range.start + range.num) {
                AppendExtendNode(nodeTo, nodeToNum, nodeSon);
            }
            if (nodeSon->splIdx >= range.start + range.num - 1) {
                break;
            }
        }
    }
}

void DictTrie::ExtendGe1ToGe1(LmaNodeGE1 **nodeFr, LmaNodeGE1 **nodeTo, size_t nodeFrNum, size_t &nodeToNum,
                              const SplIdRange &range)
{
    for (size_t nodeFrPos = 0; nodeFrPos < nodeFrNum; nodeFrPos++) {
        LmaNodeGE1 *node = nodeFr[nodeFrPos];
        for (size_t sonPos = 0; sonPos < static_cast<size_t>(node->numOfSon); sonPos++) {
            ASSERT(node->son1stOffL > 0 || node->son1stOffH > 0);
            LmaNodeGE1 *nodeSon = nodesGe1_ + GetSonOffset(node) + sonPos;
            if (nodeSon->splIdx >= range.start && nodeSon->splIdx < range.start + range.num) {
                AppendExtendNode(nodeTo, nodeToNum, nodeSon);
            }
            if (nodeSon->splIdx >= range.start + range.num - 1) {
                break;
            }
        }
    }
}

size_t DictTrie::FillLpisFromLe0(LmaNodeLE0 **nodeTo, size_t nodeToNum, size_t lpiMax, LmaPsbItem *lpiItems)
{
    NGram &ngram = NGram::GetInstance();
    size_t lmaNum = 0;
    for (size_t nodePos = 0; nodePos < nodeToNum; nodePos++) {
        LmaNodeLE0 *nodeLe0 = nodeTo[nodePos];
        size_t numOfHomo = static_cast<size_t>(nodeLe0->numOfHomo);
        for (size_t homoPos = 0; homoPos < numOfHomo; homoPos++) {
            size_t chPos = lmaNum + homoPos;
            lpiItems[chPos].id = GetLemmaId(nodeLe0->homoIdxBufOff + homoPos);
            lpiItems[chPos].lmaLen = 1;
            lpiItems[chPos].psb = static_cast<LmaScoreType>(ngram.GetUniPsb(lpiItems[chPos].id));

            if (lmaNum + homoPos >= lpiMax - 1) {
                break;
            }
        }

        lmaNum += numOfHomo;
        if (lmaNum >= lpiMax) {
            lmaNum = lpiMax;
            break;
        }
    }
    return lmaNum;
}

size_t DictTrie::FillLpisFromGe1(LmaNodeGE1 **nodeTo, size_t nodeToNum, uint16 splidStrLen, LmaPsbItem *lpiItems,
                                 size_t lpiMax)
{
    NGram &ngram = NGram::GetInstance();
    size_t lmaNum = 0;
    for (size_t nodePos = 0; nodePos < nodeToNum; nodePos++) {
        LmaNodeGE1 *nodeGe1 = nodeTo[nodePos];
        size_t numOfHomo = static_cast<size_t>(nodeGe1->numOfHomo);
        for (size_t homoPos = 0; homoPos < numOfHomo; homoPos++) {
            size_t chPos = lmaNum + homoPos;
            size_t nodeHomoOff = GetHomoIdxBufOffset(nodeGe1);
            lpiItems[chPos].id = GetLemmaId(nodeHomoOff + homoPos);
            lpiItems[chPos].lmaLen = splidStrLen;
            lpiItems[chPos].psb = static_cast<LmaScoreType>(ngram.GetUniPsb(lpiItems[chPos].id));

            if (lmaNum + homoPos >= lpiMax - 1) {
                break;
            }
        }

        lmaNum += numOfHomo;
        if (lmaNum >= lpiMax) {
            lmaNum = lpiMax;
            break;
        }
    }
    return lmaNum;
}

void DictTrie::ExtendLpisNodes(LpisExtendState &st)
{
    while (st.splPos < st.splidStrLen) {
        uint16 idNum = 1;
        uint16 idStart = st.splidStr[st.splPos];
        // If it is a half id
        if (splTrie_->IsHalfId(st.splidStr[st.splPos])) {
            idNum = splTrie_->HalfToFull(st.splidStr[st.splPos], &idStart);
            ASSERT(idNum > 0);
        }

        // Extend the nodes
        if (st.splPos == 0) { // From LmaNodeLE0 (root) to LmaNodeLE0 nodes
            ExtendFromRoot(st.nodeFrLe0, st.nodeToLe0, st.nodeFrNum, st.nodeToNum, {idStart, idNum});
            st.splPos++;
            if (st.splPos >= st.splidStrLen || st.nodeToNum == 0) {
                break;
            }
            LmaNodeLE0 **nodeTmp = st.nodeFrLe0;
            st.nodeFrLe0 = st.nodeToLe0;
            st.nodeToLe0 = nullptr;
            st.nodeToGe1 = reinterpret_cast<LmaNodeGE1 **>(nodeTmp);
        } else if (st.splPos == 1) { // From LmaNodeLE0 to LmaNodeGE1 nodes
            ExtendLe0ToGe1(st.nodeFrLe0, st.nodeToGe1, st.nodeFrNum, st.nodeToNum, {idStart, idNum});
            st.splPos++;
            if (st.splPos >= st.splidStrLen || st.nodeToNum == 0) {
                break;
            }
            st.nodeFrGe1 = st.nodeToGe1;
            st.nodeToGe1 = reinterpret_cast<LmaNodeGE1 **>(st.nodeFrLe0);
            st.nodeFrLe0 = nullptr;
            st.nodeToLe0 = nullptr;
        } else { // From LmaNodeGE1 to LmaNodeGE1 nodes
            ExtendGe1ToGe1(st.nodeFrGe1, st.nodeToGe1, st.nodeFrNum, st.nodeToNum, {idStart, idNum});
            st.splPos++;
            if (st.splPos >= st.splidStrLen || st.nodeToNum == 0) {
                break;
            }
            LmaNodeGE1 **nodeTmp = st.nodeFrGe1;
            st.nodeFrGe1 = st.nodeToGe1;
            st.nodeToGe1 = nodeTmp;
        }

        // The number of node for next extending
        st.nodeFrNum = st.nodeToNum;
        st.nodeToNum = 0;
    }
}

size_t DictTrie::GetLpis(const uint16 *splidStr, uint16 splidStrLen, LmaPsbItem *lpiItems, size_t lpiMax)
{
    if (splidStrLen > K_MAX_LEMMA_SIZE) {
        return 0;
    }

    size_t *nodeBuf1[kMaxExtendBufLen]; // use size_t for data alignment
    size_t *nodeBuf2[kMaxExtendBufLen];
    LpisExtendState st;
    st.nodeFrLe0 = reinterpret_cast<LmaNodeLE0 **>(nodeBuf1); // Nodes from.
    st.nodeToLe0 = reinterpret_cast<LmaNodeLE0 **>(nodeBuf2); // Nodes to.
    st.nodeFrGe1 = nullptr;
    st.nodeToGe1 = nullptr;
    st.nodeFrNum = 1;
    st.nodeToNum = 0;
    st.splPos = 0;
    st.splidStr = splidStr;
    st.splidStrLen = splidStrLen;
    st.nodeFrLe0[0] = root_;
    if (st.nodeFrLe0[0] == nullptr) {
        return 0;
    }

    ExtendLpisNodes(st);

    if (st.nodeToNum == 0) {
        return 0;
    }

    // If the length is 1, and the splid is a one-char Yunmu like 'a', 'o', 'e',
    // only those candidates for the full matched one-char id will be returned.
    if (splidStrLen == 1 && splTrie_->IsHalfIdYunmu(splidStr[0])) {
        st.nodeToNum = st.nodeToNum > 0 ? 1 : 0;
    }

    if (st.splPos <= 1) {
        return FillLpisFromLe0(st.nodeToLe0, st.nodeToNum, lpiMax, lpiItems);
    }
    return FillLpisFromGe1(st.nodeToGe1, st.nodeToNum, splidStrLen, lpiItems, lpiMax);
}

uint16 DictTrie::GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax)
{
    return dictList_->GetLemmaStr(idLemma, strBuf, strMax);
}

uint16 DictTrie::GetLemmaSplids(LemmaIdType idLemma, uint16 *splids, uint16 splidsMax, bool argValid)
{
    char16 lmaStr[K_MAX_LEMMA_SIZE + 1];
    uint16 lmaLen = GetLemmaStr(idLemma, lmaStr, K_MAX_LEMMA_SIZE + 1);
    ASSERT((!argValid && splidsMax >= lmaLen) || lmaLen == splidsMax);

    uint16 splMtrx[K_MAX_LEMMA_SIZE * 5];
    uint16 splStart[K_MAX_LEMMA_SIZE + 1];
    splStart[0] = 0;
    uint16 tryNum = 1;

    for (uint16 pos = 0; pos < lmaLen; pos++) {
        uint16 candSplidsThis = 0;
        if (argValid && splTrie_->IsFullId(splids[pos])) {
            splMtrx[splStart[pos]] = splids[pos];
            candSplidsThis = 1;
        } else {
            candSplidsThis =
                dictList_->GetSplidsForHanzi(lmaStr[pos], argValid ? splids[pos] : 0, splMtrx + splStart[pos],
                                             K_MAX_LEMMA_SIZE * K_MAGIC_5 - splStart[pos]);
            ASSERT(candSplidsThis > 0);
        }
        splStart[pos + 1] = splStart[pos] + candSplidsThis;
        tryNum *= candSplidsThis;
    }

    for (uint16 tryPos = 0; tryPos < tryNum; tryPos++) {
        uint16 mod = 1;
        for (uint16 pos = 0; pos < lmaLen; pos++) {
            uint16 radix = splStart[pos + 1] - splStart[pos];
            splids[pos] = splMtrx[splStart[pos] + tryPos / mod % radix];
            mod *= radix;
        }

        if (TryExtend(splids, lmaLen, idLemma)) {
            return lmaLen;
        }
    }

    return 0;
}

void DictTrie::SetTotalLemmaCountOfOthers(size_t count)
{
    NGram &ngram = NGram::GetInstance();
    ngram.SetTotalFreqNoneSys(count);
}

void DictTrie::ConvertToHanzis(char16 *str, uint16 strLen) { return dictList_->ConvertToHanzis(str, strLen); }

void DictTrie::ConvertToScisIds(char16 *str, uint16 strLen) { return dictList_->ConvertToScisIds(str, strLen); }

LemmaIdType DictTrie::GetLemmaId(const char16 lemmaStr[], uint16 lemmaLen)
{
    if (lemmaStr == nullptr || lemmaLen > K_MAX_LEMMA_SIZE) {
        return 0;
    }

    return dictList_->GetLemmaId(lemmaStr, lemmaLen);
}

size_t DictTrie::PredictTopLmas(size_t hisLen, NPredictItem *npreItems, size_t npreMax, size_t b4Used)
{
    (void)b4Used;
    NGram &ngram = NGram::GetInstance();

    size_t itemNum = 0;
    size_t topLmasIdOffset = lmaIdxBufLen_ / K_LEMMA_ID_SIZE - topLmasNum_;
    size_t topLmasPos = 0;
    while (itemNum < npreMax && topLmasPos < topLmasNum_) {
        ImeMemset(npreItems + itemNum, sizeof(NPredictItem), 0, sizeof(NPredictItem));
        LemmaIdType topLmaId = GetLemmaId(topLmasIdOffset + topLmasPos);
        topLmasPos += 1;
        if (dictList_->GetLemmaStr(topLmaId, npreItems[itemNum].preHzs, K_MAX_LEMMA_SIZE - 1) == 0) {
            continue;
        }
        npreItems[itemNum].psb = ngram.GetUniPsb(topLmaId);
        npreItems[itemNum].hisLen = hisLen;
        itemNum++;
    }
    return itemNum;
}

size_t DictTrie::Predict(const char16 *lastHzs, uint16 hzsLen, NPredictItem *npreItems, size_t npreMax, size_t b4Used)
{
    return dictList_->Predict(lastHzs, hzsLen, npreItems, npreMax, b4Used);
}
} // namespace ime_pinyin
