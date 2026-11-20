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

#include "../include/matrixsearch.h"
#include "../include/lpicache.h"
#include "../include/mystdlib.h"
#include "../include/ngram.h"
#include "../include/userdict.h"
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>

#include "ime_assert.h"
#include "ime_secure.h"
constexpr int K_MAGIC_6 = 6;
constexpr int K_MAGIC_2 = 2;
constexpr int K_MAGIC_3 = 3;
constexpr int K_MAGIC_9 = 9;

namespace ime_pinyin {

#define PRUMING_SCORE 8000.0

MatrixSearch::MatrixSearch()
{
    inited_ = false;
    splTrie_ = SpellingTrie::GetCpinstance();

    ResetPointersToNull();

    pysDecodedLen_ = 0;
    mtrxNdPoolUsed_ = 0;
    dmiPoolUsed_ = 0;
    xiAnEnabled_ = false;
    dmiCPhrase_ = false;

    ASSERT(K_MAX_SEARCH_STEPS > 0);
    maxSpsLen_ = K_MAX_SEARCH_STEPS - 1;
    maxHzsLen_ = K_MAX_SEARCH_STEPS;
}

MatrixSearch::~MatrixSearch() { FreeResource(); }

void MatrixSearch::ResetPointersToNull()
{
    dictTrie_ = nullptr;
    userDict_ = nullptr;
    splParser_ = nullptr;

    shareBuf_ = nullptr;

    // The following four buffers are used for decoding, and they are based on
    // shareBuf_, no need to delete them.
    mtrxNdPool_ = nullptr;
    dmiPool_ = nullptr;
    matrix_ = nullptr;
    dep_ = nullptr;

    // Based on shareBuf_, no need to delete them.
    npreItems_ = nullptr;
}

bool MatrixSearch::AllocResource()
{
    FreeResource();

    dictTrie_ = new DictTrie();
    userDict_ = static_cast<AtomDictBase *>(new UserDict());
    splParser_ = new SpellingParser();

    size_t mtrxNdSize = sizeof(MatrixNode) * kMtrxNdPoolSize;
    mtrxNdSize = AlignToSizeT(mtrxNdSize) / sizeof(size_t);
    size_t dmiSize = sizeof(DictMatchInfo) * kDmiPoolSize;
    dmiSize = AlignToSizeT(dmiSize) / sizeof(size_t);
    size_t matrixSize = sizeof(MatrixRow) * K_MAX_ROW_NUM;
    matrixSize = AlignToSizeT(matrixSize) / sizeof(size_t);
    size_t depSize = sizeof(DictExtPara);
    depSize = AlignToSizeT(depSize) / sizeof(size_t);

    // share_buf's size is determined by the buffers for Search.
    shareBuf_ = new size_t[mtrxNdSize + dmiSize + matrixSize + depSize];

    if (dictTrie_ == nullptr || userDict_ == nullptr || splParser_ == nullptr || shareBuf_ == nullptr) {
        return false;
    }

    // The buffers for Search are based on the share buffer
    mtrxNdPool_ = reinterpret_cast<MatrixNode *>(shareBuf_);
    dmiPool_ = reinterpret_cast<DictMatchInfo *>(shareBuf_ + mtrxNdSize);
    matrix_ = reinterpret_cast<MatrixRow *>(shareBuf_ + mtrxNdSize + dmiSize);
    dep_ = reinterpret_cast<DictExtPara *>(shareBuf_ + mtrxNdSize + dmiSize + matrixSize);

    // The prediction buffer is also based on the share buffer.
    npreItems_ = reinterpret_cast<NPredictItem *>(shareBuf_);
    npreItemsLen_ = (mtrxNdSize + dmiSize + matrixSize + depSize) * sizeof(size_t) / sizeof(NPredictItem);
    return true;
}

void MatrixSearch::FreeResource()
{
    if (dictTrie_ != nullptr) {
        delete dictTrie_;
        dictTrie_ = nullptr;
    }

    if (userDict_ != nullptr) {
        delete userDict_;
        userDict_ = nullptr;
    }

    if (splParser_ != nullptr) {
        delete splParser_;
        splParser_ = nullptr;
    }

    if (shareBuf_ != nullptr) {
        delete[] shareBuf_;
        shareBuf_ = nullptr;
    }

    ResetPointersToNull();
}

bool MatrixSearch::Init(const char *fnSysDict, const char *fnUsrDict)
{
    if (fnSysDict == nullptr || fnUsrDict == nullptr) {
        return false;
    }

    if (!AllocResource()) {
        return false;
    }

    if (!dictTrie_->LoadDict(fnSysDict, 1, K_SYS_DICT_ID_END)) {
        return false;
    }

    // If engine fails to Load the user dictionary, Reset the user dictionary
    // to nullptr.
    if (!userDict_->LoadDict(fnUsrDict, K_USER_DICT_ID_START, K_USER_DICT_ID_END)) {
        delete userDict_;
        userDict_ = nullptr;
    } else {
        userDict_->SetTotalLemmaCountOfOthers(NGram::kSysDictTotalFreq);
    }

    ResetSearch0();

    inited_ = true;
    return true;
}

bool MatrixSearch::InitFd(int sysFd, long startOffset, long length, const char *fnUsrDict)
{
    if (fnUsrDict == nullptr) {
        return false;
    }

    if (!AllocResource()) {
        return false;
    }

    if (!dictTrie_->LoadDictFd(sysFd, startOffset, length, 1, K_SYS_DICT_ID_END)) {
        return false;
    }

    if (!userDict_->LoadDict(fnUsrDict, K_USER_DICT_ID_START, K_USER_DICT_ID_END)) {
        delete userDict_;
        userDict_ = nullptr;
    } else {
        userDict_->SetTotalLemmaCountOfOthers(NGram::kSysDictTotalFreq);
    }

    ResetSearch0();

    inited_ = true;
    return true;
}

void MatrixSearch::SetMaxLens(size_t maxSpsLen, size_t maxHzsLen)
{
    if (maxSpsLen != 0) {
        maxSpsLen_ = maxSpsLen;
    }
    if (maxHzsLen != 0) {
        maxHzsLen_ = maxHzsLen;
    }
}

void MatrixSearch::Close()
{
    FlushCache();
    FreeResource();
    inited_ = false;
}

void MatrixSearch::FlushCache()
{
    if (userDict_ != nullptr) {
        userDict_->FlushCache();
    }
}

void MatrixSearch::SetXiAnSwitch(bool xiAnEnabled) { xiAnEnabled_ = xiAnEnabled; }

bool MatrixSearch::GetXiAnSwitch() const { return xiAnEnabled_; }

bool MatrixSearch::ResetSearch()
{
    if (!inited_) {
        return false;
    }
    return ResetSearch0();
}

bool MatrixSearch::ResetSearch0()
{
    if (!inited_) {
        return false;
    }

    pysDecodedLen_ = 0;
    mtrxNdPoolUsed_ = 0;
    dmiPoolUsed_ = 0;

    // Get a MatrixNode from the pool
    matrix_[0].mtrxNdPos = mtrxNdPoolUsed_;
    matrix_[0].mtrxNdNum = 1;
    mtrxNdPoolUsed_ += 1;

    // Update the node, and make it to be a starting node
    MatrixNode *node = mtrxNdPool_ + matrix_[0].mtrxNdPos;
    node->id = 0;
    node->score = 0;
    node->from = nullptr;
    node->step = 0;
    node->dmiFr = static_cast<PoolPosType>(-1);

    matrix_[0].dmiPos = 0;
    matrix_[0].dmiNum = 0;
    matrix_[0].dmiHasFullId = 1;
    matrix_[0].mtrxNdFixed = node;

    lmaStart_[0] = 0;
    fixedLmas_ = 0;
    splStart_[0] = 0;
    fixedHzs_ = 0;

    dictTrie_->ResetMilestones(0, 0);
    if (userDict_ != nullptr) {
        userDict_->ResetMilestones(0, 0);
    }

    return true;
}

MileStoneHandle *MatrixSearch::FindMilestonesToClear(size_t chPos, bool clearDmiThisStep)
{
    MileStoneHandle *dictHandlesToClear = nullptr;
    if (clearDmiThisStep && matrix_[chPos].dmiNum > 0) {
        dictHandlesToClear = dmiPool_[matrix_[chPos].dmiPos].dictHandles;
    }

    if (pysDecodedLen_ > chPos && !clearDmiThisStep) {
        dictHandlesToClear = nullptr;
        if (matrix_[chPos + 1].dmiNum > 0) {
            dictHandlesToClear = dmiPool_[matrix_[chPos + 1].dmiPos].dictHandles;
        }
    }
    return dictHandlesToClear;
}

void MatrixSearch::ResetStepTo(size_t chPos, bool clearDmiThisStep, bool clearMtrxThisStep)
{
    MileStoneHandle *dictHandlesToClear = FindMilestonesToClear(chPos, clearDmiThisStep);
    if (dictHandlesToClear != nullptr) {
        dictTrie_->ResetMilestones(chPos, dictHandlesToClear[0]);
        if (userDict_ != nullptr) {
            userDict_->ResetMilestones(chPos, dictHandlesToClear[1]);
        }
    }

    pysDecodedLen_ = chPos;

    if (clearDmiThisStep) {
        dmiPoolUsed_ = matrix_[chPos - 1].dmiPos + matrix_[chPos - 1].dmiNum;
        matrix_[chPos].dmiNum = 0;
    } else {
        dmiPoolUsed_ = matrix_[chPos].dmiPos + matrix_[chPos].dmiNum;
    }

    if (clearMtrxThisStep) {
        mtrxNdPoolUsed_ = matrix_[chPos - 1].mtrxNdPos + matrix_[chPos - 1].mtrxNdNum;
        matrix_[chPos].mtrxNdNum = 0;
    } else {
        mtrxNdPoolUsed_ = matrix_[chPos].mtrxNdPos + matrix_[chPos].mtrxNdNum;
    }
}

size_t MatrixSearch::FindFixedChPos(size_t chPos, bool clearFixedThisStep)
{
    size_t fixedChPos = chPos;
    if (clearFixedThisStep) {
        fixedChPos = fixedChPos > 0 ? fixedChPos - 1 : 0;
    }
    while (matrix_[fixedChPos].mtrxNdFixed == nullptr && fixedChPos > 0) {
        fixedChPos--;
    }
    return fixedChPos;
}

void MatrixSearch::ResetFixedCounters(size_t fixedChPos)
{
    fixedLmas_ = 0;
    fixedHzs_ = 0;
    if (fixedChPos > 0) {
        while (splStart_[fixedHzs_] < fixedChPos) {
            fixedHzs_++;
        }
        ASSERT(splStart_[fixedHzs_] == fixedChPos);

        while (lmaStart_[fixedLmas_] < fixedHzs_) {
            fixedLmas_++;
        }
        ASSERT(lmaStart_[fixedLmas_] == fixedHzs_);
    }
}

void MatrixSearch::ResetFixedPools(size_t fixedChPos, size_t chPos, bool clearDmiThisStep, bool clearMtrxThisStep)
{
    MileStoneHandle *dictHandlesToClearFixed = nullptr;
    if (clearDmiThisStep && chPos == fixedChPos && matrix_[fixedChPos].dmiNum > 0) {
        dictHandlesToClearFixed = dmiPool_[matrix_[fixedChPos].dmiPos].dictHandles;
    }
    if (pysDecodedLen_ > fixedChPos && !clearDmiThisStep) {
        dictHandlesToClearFixed = nullptr;
        if (matrix_[fixedChPos + 1].dmiNum > 0) {
            dictHandlesToClearFixed = dmiPool_[matrix_[fixedChPos + 1].dmiPos].dictHandles;
        }
    }
    if (dictHandlesToClearFixed != nullptr) {
        dictTrie_->ResetMilestones(fixedChPos, dictHandlesToClearFixed[0]);
        if (userDict_ != nullptr) {
            userDict_->ResetMilestones(fixedChPos, dictHandlesToClearFixed[1]);
        }
    }

    pysDecodedLen_ = fixedChPos;

    if (clearDmiThisStep && chPos == fixedChPos) {
        dmiPoolUsed_ = matrix_[fixedChPos - 1].dmiPos + matrix_[fixedChPos - 1].dmiNum;
        matrix_[fixedChPos].dmiNum = 0;
    } else {
        dmiPoolUsed_ = matrix_[fixedChPos].dmiPos + matrix_[fixedChPos].dmiNum;
    }

    if (clearMtrxThisStep && chPos == fixedChPos) {
        mtrxNdPoolUsed_ = matrix_[fixedChPos - 1].mtrxNdPos + matrix_[fixedChPos - 1].mtrxNdNum;
        matrix_[fixedChPos].mtrxNdNum = 0;
    } else {
        mtrxNdPoolUsed_ = matrix_[fixedChPos].mtrxNdPos + matrix_[fixedChPos].mtrxNdNum;
    }
}

void MatrixSearch::ResetFixedSubSearch(size_t chPos, bool clearFixedThisStep, bool clearDmiThisStep,
                                       bool clearMtrxThisStep)
{
    size_t fixedChPos = FindFixedChPos(chPos, clearFixedThisStep);
    ResetFixedCounters(fixedChPos);
    ResetFixedPools(fixedChPos, chPos, clearDmiThisStep, clearMtrxThisStep);

    for (uint16 rePos = static_cast<uint16>(fixedChPos); rePos < chPos; rePos++) {
        AddChar(pys_[rePos]);
    }
}

bool MatrixSearch::TruncateSubLemma(uint16 subpos, uint16 splposBegin, uint16 splposEnd, size_t chPos)
{
    for (uint16 splpos = splposBegin; splpos < splposEnd; splpos++) {
        // If chPos is in this spelling
        uint16 splStart = cPhrase_.splStart[splpos];
        uint16 splEnd = cPhrase_.splStart[splpos + 1];
        if (chPos >= splStart && chPos < splEnd) {
            // Clear everything after this position
            cPhrase_.chnStr[splpos] = static_cast<char16>('\0');
            cPhrase_.sublmaStart[subpos + 1] = splpos;
            cPhrase_.sublmaNum = subpos + 1;
            cPhrase_.length = splpos;

            if (splpos == splposBegin) {
                cPhrase_.sublmaNum = subpos;
            }
            return true;
        }
    }
    return false;
}

void MatrixSearch::TruncateComposingPhrase(size_t chPos)
{
    for (uint16 subpos = 0; subpos < cPhrase_.sublmaNum; subpos++) {
        uint16 splposBegin = cPhrase_.sublmaStart[subpos];
        uint16 splposEnd = cPhrase_.sublmaStart[subpos + 1];
        TruncateSubLemma(subpos, splposBegin, splposEnd, chPos);
    }

    // Extend the composing phrase.
    ResetSearch0();
    dmiCPhrase_ = true;
    uint16 cPyPos = 0;
    while (cPyPos < splStart_[cPhrase_.length]) {
        bool bAcTmp = AddChar(pys_[cPyPos]);
        ASSERT(bAcTmp);
        cPyPos++;
    }
    dmiCPhrase_ = false;

    lmaIdNum_ = 1;
    fixedLmas_ = 1;
    fixedLmasNo1_[0] = 0; // A composing string is always modified.
    fixedHzs_ = cPhrase_.length;
    lmaStart_[1] = fixedHzs_;
    lmaId_[0] = K_LEMMA_ID_COMPOSING;
    matrix_[splStart_[fixedHzs_]].mtrxNdFixed = mtrxNdPool_ + matrix_[splStart_[fixedHzs_]].mtrxNdPos;
}

bool MatrixSearch::ResetSearch(size_t chPos, bool clearFixedThisStep, bool clearDmiThisStep, bool clearMtrxThisStep)
{
    if (!inited_ || chPos > pysDecodedLen_ || chPos >= K_MAX_ROW_NUM) {
        return false;
    }

    if (chPos == 0) {
        ResetSearch0();
    } else {
        ResetStepTo(chPos, clearDmiThisStep, clearMtrxThisStep);

        // Modify fixedHzs_
        if (fixedHzs_ > 0 && ((lmaId_[0] != K_LEMMA_ID_COMPOSING) ||
                              (lmaId_[0] == K_LEMMA_ID_COMPOSING && splStart_[cPhrase_.length] <= chPos))) {
            ResetFixedSubSearch(chPos, clearFixedThisStep, clearDmiThisStep, clearMtrxThisStep);
        } else if (fixedHzs_ > 0 && lmaId_[0] == K_LEMMA_ID_COMPOSING) {
            TruncateComposingPhrase(chPos);
        }
    }

    return true;
}

void MatrixSearch::DelInPys(size_t start, size_t len)
{
    while (start < K_MAX_ROW_NUM - len && pys_[start] != '\0') {
        pys_[start] = pys_[start + len];
        start++;
    }
}

size_t MatrixSearch::Search(const char *py, size_t pyLen)
{
    if (!inited_ || py == nullptr) {
        return 0;
    }

    // If the Search Pinyin string is too long, it will be truncated.
    if (pyLen > K_MAX_ROW_NUM - 1) {
        pyLen = K_MAX_ROW_NUM - 1;
    }

    // Compare the new string with the previous one. Find their prefix to
    // increase Search efficiency.
    size_t chPos = 0;
    for (chPos = 0; chPos < pysDecodedLen_; chPos++) {
        if (py[chPos] == '\0' || py[chPos] != pys_[chPos]) {
            break;
        }
    }

    bool clearFix = true;
    if (chPos == pysDecodedLen_) {
        clearFix = false;
    }
    ResetSearch(chPos, clearFix, false, false);
    if (ImeMemcpy(pys_ + chPos, pyLen - chPos, py + chPos, pyLen - chPos) != 0) {
        return 0;
    }
    pys_[pyLen] = '\0';

    while (pys_[chPos] != '\0') {
        if (!AddChar(py[chPos])) {
            pysDecodedLen_ = chPos;
            break;
        }
        chPos++;
    }

    // Get spelling ids and starting positions.
    GetSplStartId();

    // If there are too many spellings, remove the last letter until the spelling
    // number is acceptable.
    while (splIdNum_ > K_MAGIC_9) {
        pyLen--;
        ResetSearch(pyLen, false, false, false);
        pys_[pyLen] = '\0';
        GetSplStartId();
    }

    PrepareCandidates();

    if (K_PRINT_DEBUG0) {
        printf("--Matrix Node Pool Used: %u\n", mtrxNdPoolUsed_);
        printf("--DMI Pool Used: %u\n", dmiPoolUsed_);

        if (K_PRINT_DEBUG1) {
            for (PoolPosType pos = 0; pos < dmiPoolUsed_; pos++) {
                DebugPrintDmi(pos, 1);
            }
        }
    }

    return chPos;
}

void MatrixSearch::DecodeFrom(size_t startPos)
{
    while (pys_[startPos] != '\0') {
        if (!AddChar(pys_[startPos])) {
            pysDecodedLen_ = startPos;
            break;
        }
        startPos++;
    }
}

void MatrixSearch::DelsearchExtendComposing(size_t cPyLen)
{
    ASSERT(cPhrase_.length > 0 && cPyLen == cPhrase_.splStart[cPhrase_.sublmaStart[cPhrase_.sublmaNum]]);
    ResetSearch0();

    dmiCPhrase_ = true;
    // Extend the composing phrase.
    uint16 cPyPos = 0;
    while (cPyPos < cPyLen) {
        bool bAcTmp = AddChar(pys_[cPyPos]);
        ASSERT(bAcTmp);
        cPyPos++;
    }
    dmiCPhrase_ = false;

    // Fixd the composing phrase as the first choice.
    lmaIdNum_ = 1;
    fixedLmas_ = 1;
    fixedLmasNo1_[0] = 0; // A composing string is always modified.
    fixedHzs_ = cPhrase_.length;
    lmaStart_[1] = fixedHzs_;
    lmaId_[0] = K_LEMMA_ID_COMPOSING;
    matrix_[splStart_[fixedHzs_]].mtrxNdFixed = mtrxNdPool_ + matrix_[splStart_[fixedHzs_]].mtrxNdPos;
}

bool MatrixSearch::ComputeDelPyLen(size_t pos, bool isPosInSplid, bool clearFixedThisStep, size_t &resetPos,
                                   size_t &cPyLen)
{
    cPyLen = 0;
    size_t delPyLen = 1;
    if (!isPosInSplid) {
        // Pinyin mode is only allowed to delete beyond the fixed lemmas.
        if (fixedLmas_ > 0 && pos < splStart_[lmaStart_[fixedLmas_]]) {
            return false;
        }

        DelInPys(pos, 1);

        // If the deleted character is just the one after the last fixed lemma
        if (pos == splStart_[lmaStart_[fixedLmas_]]) {
            // If all fixed lemmas have been merged, and the caller of the function
            // request to unlock the last fixed lemma.
            if (lmaId_[0] == K_LEMMA_ID_COMPOSING && clearFixedThisStep) {
                // Unlock the last sub lemma in the composing phrase.
                cPhrase_.sublmaNum--;
                cPhrase_.length = cPhrase_.sublmaStart[cPhrase_.sublmaNum];
                resetPos = splStart_[cPhrase_.length];
                cPyLen = resetPos;
            }
        }
    } else {
        delPyLen = splStart_[pos + 1] - splStart_[pos];

        DelInPys(splStart_[pos], delPyLen);

        if (pos >= lmaStart_[fixedLmas_]) {
            cPyLen = 0;
            resetPos = splStart_[pos + 1] - delPyLen;
        } else {
            cPyLen = splStart_[lmaStart_[fixedLmas_]] - delPyLen;
            resetPos = cPyLen;
            if (cPyLen > 0) {
                MergeFixedLmas(pos);
            }
        }
    }
    return true;
}

size_t MatrixSearch::Delsearch(size_t pos, bool isPosInSplid, bool clearFixedThisStep)
{
    if (!inited_) {
        return 0;
    }

    size_t resetPos = pos;

    // Out of range for both Pinyin mode and Spelling id mode.
    if (pysDecodedLen_ <= pos) {
        DelInPys(pos, 1);

        resetPos = pysDecodedLen_;
        // Decode the string after the un-decoded position
        DecodeFrom(resetPos);
        GetSplStartId();
        PrepareCandidates();
        return pysDecodedLen_;
    }

    // Spelling id mode, but out of range.
    if (isPosInSplid && splIdNum_ <= pos) {
        return pysDecodedLen_;
    }

    // Begin to handle two modes respectively.
    size_t cPyLen = 0;
    if (!ComputeDelPyLen(pos, isPosInSplid, clearFixedThisStep, resetPos, cPyLen)) {
        return pysDecodedLen_;
    }

    if (cPyLen > 0) {
        // The composing phrase is valid, Reset all Search space, and begin a new
        // Search which will only extend the composing phrase.
        DelsearchExtendComposing(cPyLen);
    } else {
        // Reseting Search only clear pysDecodedLen_, but the string is kept.
        ResetSearch(resetPos, clearFixedThisStep, false, false);
    }

    // Decode the string after the delete position.
    DecodeFrom(resetPos);

    GetSplStartId();
    PrepareCandidates();
    return pysDecodedLen_;
}

size_t MatrixSearch::GetCandidateNum()
{
    if (!inited_ || pysDecodedLen_ == 0 || matrix_[pysDecodedLen_].mtrxNdNum == 0) {
        return 0;
    }

    return 1 + lpiTotal_;
}

char16 *MatrixSearch::GetCandidate(size_t candId, char16 *candStr, size_t maxLen)
{
    if (!inited_ || pysDecodedLen_ == 0 || candStr == nullptr) {
        return nullptr;
    }

    if (candId == 0) {
        return GetCandidate0(candStr, maxLen, nullptr, false);
    } else {
        candId--;
    }

    // For this case: the current sentence is a word only, and the user fixed it,
    // so the result will be fixed to the sentence space, and
    // lpiTotal_ will be set to 0.
    if (lpiTotal_ == 0) {
        return GetCandidate0(candStr, maxLen, nullptr, false);
    }

    LemmaIdType id = lpiItems_[candId].id;
    char16 s[K_MAX_LEMMA_SIZE + 1];

    uint16 sLen = lpiItems_[candId].lmaLen;
    if (sLen > 1) {
        sLen = GetLemmaStr(id, s, K_MAX_LEMMA_SIZE + 1);
    } else {
        // For a single character, Hanzi is ready.
        s[0] = lpiItems_[candId].hanzi;
        s[1] = static_cast<char16>(0);
    }

    if (sLen > 0 && maxLen > sLen) {
        Utf16Strncpy(candStr, s, sLen);
        candStr[sLen] = static_cast<char16>('\0');
        return candStr;
    }

    return nullptr;
}

void MatrixSearch::UpdateDictFreq()
{
    if (userDict_ != nullptr) {
        // Update the total frequency of all lemmas, including system lemmas and
        // user dictionary lemmas.
        size_t totalFreq = userDict_->GetTotalLemmaCount();
        dictTrie_->SetTotalLemmaCountOfOthers(totalFreq);
    }
}

bool MatrixSearch::AddLmaToUserdict(uint16 lmaFr, uint16 lmaNum, float score)
{
    if (lmaNum - lmaFr <= 1 || userDict_ == nullptr) {
        return false;
    }

    char16 wordStr[K_MAX_LEMMA_SIZE + 1];
    uint16 splIds[K_MAX_LEMMA_SIZE];

    uint16 splIdFr = 0;

    for (uint16 pos = lmaFr; pos < lmaNum; pos++) {
        LemmaIdType lmaId = lmaId_[pos];
        if (IsUserLemma(lmaId)) {
            userDict_->UpdateLemma(lmaId, 1, true);
        }
        uint16 lmaLen = lmaStart_[pos + 1] - lmaStart_[pos];
        Utf16Strncpy(splIds + splIdFr, splId_ + lmaStart_[pos], lmaLen);

        uint16 tmp = GetLemmaStr(lmaId, wordStr + splIdFr, K_MAX_LEMMA_SIZE + 1 - splIdFr);
        ASSERT(tmp == lmaLen);

        tmp = GetLemmaSplids(lmaId, splIds + splIdFr, lmaLen, true);
        if (tmp != lmaLen) {
            return false;
        }

        splIdFr += lmaLen;
    }

    ASSERT(splIdFr <= K_MAX_LEMMA_SIZE);

    return userDict_->PutLemma(static_cast<char16 *>(wordStr), splIds, splIdFr, 1);
}

void MatrixSearch::DebugPrintDmi(PoolPosType dmiPos, uint16 nestLevel)
{
    if (dmiPos >= dmiPoolUsed_) {
        return;
    }

    DictMatchInfo *dmi = dmiPool_ + dmiPos;

    if (nestLevel == 1) {
        printf("-----------------%d\'th DMI node Begin----------->\n", dmiPos);
    }
    if (dmi->dictLevel > 1) {
        DebugPrintDmi(dmi->dmiFr, nestLevel + 1);
    }
    printf("---%d\n", dmi->dictLevel);
    printf(" MileStone: %x, %x\n", dmi->dictHandles[0], dmi->dictHandles[1]);
    printf(" Spelling : %s, %d\n", SpellingTrie::GetInstance().GetSpellingStr(dmi->splId), dmi->splId);
    printf(" Total Pinyin Len: %d\n", dmi->splstrLen);
    if (nestLevel == 1) {
        printf("<----------------%d\'th DMI node end--------------\n\n", dmiPos);
    }
}

float MatrixSearch::ComputeSegmentScore(uint16 lmaIdFrom, uint16 pos, float scoreFrom, bool modified)
{
    float scoreToAdd = mtrxNdPool_[matrix_[splStart_[lmaStart_[pos]]].mtrxNdPos].score - scoreFrom;
    if (modified) {
        scoreToAdd += 1.0;
        if (scoreToAdd > NGram::kMaxScore) {
            scoreToAdd = NGram::kMaxScore;
        }
        AddLmaToUserdict(lmaIdFrom, pos, scoreToAdd);
    }
    return scoreToAdd;
}

bool MatrixSearch::TryAddCand0ToUserdict()
{
    size_t newCandNum = GetCandidateNum();
    if (fixedHzs_ > 0 && newCandNum == 1) {
        float scoreFrom = 0;
        uint16 lmaIdFrom = 0;
        uint16 pos = 0;
        bool modified = false;
        while (pos < fixedLmas_) {
            if (lmaStart_[pos + 1] - lmaStart_[lmaIdFrom] > static_cast<uint16>(K_MAX_LEMMA_SIZE)) {
                float scoreToAdd = ComputeSegmentScore(lmaIdFrom, pos, scoreFrom, modified);
                lmaIdFrom = pos;
                scoreFrom += scoreToAdd;

                // Clear the flag for next user lemma.
                modified = false;
            }

            if (fixedLmasNo1_[pos] == 0) {
                modified = true;
            }
            pos++;
        }

        // Single-char word is not allowed to add to userdict.
        if (lmaStart_[pos] - lmaStart_[lmaIdFrom] > 1) {
            ComputeSegmentScore(lmaIdFrom, pos, scoreFrom, modified);
        }
    }
    return true;
}

// Choose a candidate, and give new candidates for next step.
// If user finishes selection, we will try to communicate with user dictionary
// to add new items or update score of some existing items.
// The basic rules for choosing a candidate are as follows:
// 1. If user selects the first choice:
//    1.1. If the first choice is not a sentence, instead, it is a lemma:
//         1.1.1. If the first choice is a user lemma, notify the user
//                dictionary that a user lemma is hit, and add occuring count
//                by 1.
//         1.1.2. If the first choice is a system lemma, do nothing.
//    1.2. If the first choice is a sentence containing more than one lemma:
//         1.2.1. The whole sentence will be added as a user lemma. If the
//                sentence contains user lemmas, -> hit, and add occuring count
//                by 1.
size_t MatrixSearch::ChooseFirstCandidate()
{
    fixedHzs_ = splIdNum_;
    matrix_[splStart_[fixedHzs_]].mtrxNdFixed = mtrxNdPool_ + matrix_[splStart_[fixedHzs_]].mtrxNdPos;
    for (size_t pos = fixedLmas_; pos < lmaIdNum_; pos++) {
        fixedLmasNo1_[pos] = 1;
    }
    fixedLmas_ = lmaIdNum_;
    lpiTotal_ = 0; // Clean all other candidates.

    // 1. It is the first choice
    if (lmaIdNum_ == 1) {
        // 1.1. The first choice is not a sentence but a lemma
        if (IsUserLemma(lmaId_[0])) {
            // 1.1.1. The first choice is a user lemma, notify the user dictionary that it is hit.
            if (userDict_ != nullptr) {
                userDict_->UpdateLemma(lmaId_[0], 1, true);
            }
        }
    } else {
        // 1.2. The first choice is a sentence. Try to add the whole sentence to
        // user dictionary, the whole sentence may be splitted into many items.
        if (userDict_ != nullptr) {
            TryAddCand0ToUserdict();
        }
    }
    UpdateDictFreq();
    return 1;
}

size_t MatrixSearch::FixChosenCandidate(LemmaIdType idChosen, LmaScoreType scoreChosen, size_t candLen)
{
    // 3.1 Get the steps number.
    size_t stepFr = splStart_[fixedHzs_];
    size_t stepTo = splStart_[fixedHzs_ + candLen];

    // 3.2 Save the length of the original string.
    size_t pysDecodedLen = pysDecodedLen_;

    // 3.3 Reset the space of the fixed part.
    ResetSearch(stepTo, false, false, true);

    matrix_[stepTo].mtrxNdNum = 0;

    LmaPsbItem lpiItem;
    lpiItem.psb = scoreChosen;
    lpiItem.id = idChosen;

    PoolPosType stepToDmiFr = MatchDmi(stepTo, splId_ + fixedHzs_, candLen);
    ASSERT(stepToDmiFr != static_cast<PoolPosType>(-1));

    ExtendMtrxNd(matrix_[stepFr].mtrxNdFixed, &lpiItem, 1, stepToDmiFr, stepTo);

    matrix_[stepTo].mtrxNdFixed = mtrxNdPool_ + matrix_[stepTo].mtrxNdPos;
    mtrxNdPoolUsed_ = matrix_[stepTo].mtrxNdPos + matrix_[stepTo].mtrxNdNum;

    if (idChosen == lmaId_[fixedLmas_]) {
        fixedLmasNo1_[fixedLmas_] = 1;
    } else {
        fixedLmasNo1_[fixedLmas_] = 0;
    }
    lmaId_[fixedLmas_] = idChosen;
    lmaStart_[fixedLmas_ + 1] = lmaStart_[fixedLmas_] + candLen;
    fixedLmas_++;
    fixedHzs_ = fixedHzs_ + candLen;

    while (stepTo != pysDecodedLen) {
        bool b = AddChar(pys_[stepTo]);
        ASSERT(b);
        stepTo++;
    }

    if (fixedHzs_ < splIdNum_) {
        PrepareCandidates();
    } else {
        lpiTotal_ = 0;
        if (userDict_ != nullptr) {
            TryAddCand0ToUserdict();
        }
    }

    return GetCandidateNum();
}

size_t MatrixSearch::Choose(size_t candId)
{
    if (!inited_ || pysDecodedLen_ == 0) {
        return 0;
    }

    if (candId == 0) {
        return ChooseFirstCandidate();
    } else {
        candId--;
    }

    // 2. It is not the full sentence candidate.
    // Find the length of the candidate.
    LemmaIdType idChosen = lpiItems_[candId].id;
    LmaScoreType scoreChosen = lpiItems_[candId].psb;
    size_t candLen = lpiItems_[candId].lmaLen;

    ASSERT(candLen > 0);

    // Notify the atom dictionary that this item is hit.
    if (IsUserLemma(idChosen)) {
        if (userDict_ != nullptr) {
            userDict_->UpdateLemma(idChosen, 1, true);
        }
        UpdateDictFreq();
    }

    // 3. Fixed the chosen item.
    return FixChosenCandidate(idChosen, scoreChosen, candLen);
}

size_t MatrixSearch::CancelLastChoice()
{
    if (!inited_ || pysDecodedLen_ == 0) {
        return 0;
    }

    size_t stepStart = 0;
    if (fixedHzs_ > 0) {
        size_t stepEnd = splStart_[fixedHzs_];
        MatrixNode *endNode = matrix_[stepEnd].mtrxNdFixed;
        ASSERT(endNode != nullptr);

        stepStart = endNode->from->step;

        if (stepStart > 0) {
            DictMatchInfo *dmi = dmiPool_ + endNode->dmiFr;
            fixedHzs_ -= dmi->dictLevel;
        } else {
            fixedHzs_ = 0;
        }

        ResetSearch(stepStart, false, false, false);

        while (pys_[stepStart] != '\0') {
            bool b = AddChar(pys_[stepStart]);
            ASSERT(b);
            stepStart++;
        }

        PrepareCandidates();
    }
    return GetCandidateNum();
}

size_t MatrixSearch::GetFixedlen() const
{
    if (!inited_ || pysDecodedLen_ == 0) {
        return 0;
    }
    return fixedHzs_;
}

bool MatrixSearch::PrepareAddChar(char ch)
{
    if (pysDecodedLen_ >= K_MAX_ROW_NUM - 1 || (!splParser_->IsValidToParse(ch) && ch != '\'')) {
        return false;
    }

    if (dmiPoolUsed_ >= kDmiPoolSize) {
        return false;
    }

    pys_[pysDecodedLen_] = ch;
    pysDecodedLen_++;

    MatrixRow *mtrxThisRow = matrix_ + pysDecodedLen_;
    mtrxThisRow->mtrxNdPos = mtrxNdPoolUsed_;
    mtrxThisRow->mtrxNdNum = 0;
    mtrxThisRow->dmiPos = dmiPoolUsed_;
    mtrxThisRow->dmiNum = 0;
    mtrxThisRow->dmiHasFullId = 0;

    return true;
}

bool MatrixSearch::IsSplitAt(uint16 pos) { return !splParser_->IsValidToParse(pys_[pos - 1]); }

void MatrixSearch::FillDmi(DictMatchInfo *dmi, const MileStoneHandle *handles, const FillDmiParam &p)
{
    dmi->dictHandles[0] = handles[0];
    dmi->dictHandles[1] = handles[1];
    dmi->dmiFr = p.dmiFr;
    dmi->splId = p.splId;
    dmi->dictLevel = p.dictLevel;
    dmi->splidEndSplit = p.splidEndSplit ? 1 : 0;
    dmi->splstrLen = p.splstrLen;
    dmi->allFullId = p.allFullId;
    dmi->cPhrase = 0;
}

bool MatrixSearch::AddChar(char ch)
{
    if (!PrepareAddChar(ch)) {
        return false;
    }
    return AddCharQwerty();
}

uint16 MatrixSearch::ExtendDmiAndCount(DictMatchInfo *dmi, uint16 splIdx)
{
    uint16 newDmiNum = ExtendDmi(dep_, dmi);
    if (newDmiNum > 0) {
        if (dmiCPhrase_) {
            dmiPool_[dmiPoolUsed_].cPhrase = 1;
        }
        matrix_[pysDecodedLen_].dmiNum += newDmiNum;
        dmiPoolUsed_ += newDmiNum;

        if (!splTrie_->IsHalfId(splIdx)) {
            matrix_[pysDecodedLen_].dmiHasFullId = 1;
        }
    }
    return newDmiNum;
}

void MatrixSearch::ProcessOneDmi(const RowExtendParam &p, PoolPosType dmiPos, uint16 &longestExt)
{
    DictMatchInfo *dmi = dmiPool_ + dmiPos;
    if (dmiPos == matrix_[p.oldrow].dmiPos + matrix_[p.oldrow].dmiNum) {
        dmi = nullptr; // The last one, nullptr means extending from the root.
    } else {
        // If the dmi is covered by the fixed arrange, ignore it.
        if (fixedHzs_ > 0 && pysDecodedLen_ - p.extLen - dmi->splstrLen < splStart_[fixedHzs_]) {
            return;
        }
        // If it is not in mode for composing phrase, and the source DMI node
        // is marked for composing phrase, ignore this node.
        if (dmi->cPhrase != 0 && !dmiCPhrase_) {
            return;
        }
    }

    // For example, if "gao" is extended, "g ao" is not allowed.
    // or "zh" has been passed, "z h" is not allowed.
    if (longestExt > p.extLen) {
        if (dmi == nullptr && matrix_[p.oldrow].dmiHasFullId == 0) {
            return;
        }
        if (dmi != nullptr && splTrie_->IsHalfId(dmi->splId)) {
            return;
        }
    }

    dep_->splidsExtended = 0;
    if (dmi != nullptr) {
        if (!FillDepSplidsFromDmi(dmi)) {
            return;
        }
    }
    dep_->splids[dep_->splidsExtended] = p.splIdx;
    dep_->extLen = p.extLen;
    dep_->splidEndSplit = p.splidEndSplit;

    dep_->idNum = 1;
    dep_->idStart = p.splIdx;
    if (splTrie_->IsHalfId(p.splIdx)) {
        // Get the full id list
        dep_->idNum = splTrie_->HalfToFull(p.splIdx, &(dep_->idStart));
        ASSERT(dep_->idNum > 0);
    }

    uint16 newDmiNum = ExtendDmiAndCount(dmi, p.splIdx);

    // If get candiate lemmas, try to extend the path
    if (lpiTotal_ > 0) {
        uint16 frRow;
        if (dmi == nullptr) {
            frRow = p.oldrow;
        } else {
            ASSERT(p.oldrow >= dmi->splstrLen);
            frRow = p.oldrow - dmi->splstrLen;
        }
        ExtendFromMatrixRow(frRow, newDmiNum, p.extLen, longestExt);
    }
}

void MatrixSearch::ProcessOldRow(uint16 oldrow, uint16 extLen, uint16 splIdx, bool splidEndSplit, uint16 &longestExt)
{
    RowExtendParam p = {oldrow, extLen, splIdx, splidEndSplit};
    // + 1 is to extend an extra node from the root
    PoolPosType dmiEnd = matrix_[oldrow].dmiPos + matrix_[oldrow].dmiNum + 1;
    for (PoolPosType dmiPos = matrix_[oldrow].dmiPos; dmiPos < dmiEnd; dmiPos++) {
        ProcessOneDmi(p, dmiPos, longestExt);
    }
}

void MatrixSearch::ExtendFromMatrixRow(uint16 frRow, size_t newDmiNum, uint16 extLen, uint16 &longestExt)
{
    for (PoolPosType mtrxNdPos = matrix_[frRow].mtrxNdPos;
         mtrxNdPos < matrix_[frRow].mtrxNdPos + matrix_[frRow].mtrxNdNum; mtrxNdPos++) {
        MatrixNode *mtrxNd = mtrxNdPool_ + mtrxNdPos;
        ExtendMtrxNd(mtrxNd, lpiItems_, lpiTotal_, dmiPoolUsed_ - newDmiNum, pysDecodedLen_);
        if (longestExt == 0) {
            longestExt = extLen;
        }
    }
}

bool MatrixSearch::FillDepSplidsFromDmi(DictMatchInfo *dmi)
{
    uint16 prevIdsNum = dmi->dictLevel;
    if ((!dmiCPhrase_ && prevIdsNum >= K_MAX_LEMMA_SIZE) || (dmiCPhrase_ && prevIdsNum >= K_MAX_ROW_NUM)) {
        return false;
    }

    DictMatchInfo *d = dmi;
    while (d) {
        dep_->splids[--prevIdsNum] = d->splId;
        if (d->dmiFr == static_cast<PoolPosType>(-1)) {
            break;
        }
        d = dmiPool_ + d->dmiFr;
    }
    ASSERT(prevIdsNum == 0);
    dep_->splidsExtended = dmi->dictLevel;
    return true;
}

bool MatrixSearch::AddCharQwerty()
{
    matrix_[pysDecodedLen_].mtrxNdNum = 0;

    bool splMatched = false;
    uint16 longestExt = 0;
    // Extend the Search matrix, from the oldest unfixed row. extLen means
    // extending length.
    for (uint16 extLen = K_MAX_PINYIN_SIZE + 1; extLen > 0; extLen--) {
        if (extLen > pysDecodedLen_ - splStart_[fixedHzs_]) {
            continue;
        }

        // Refer to the declaration of the variable dmiHasFullId for the
        // explanation of this piece of code. In one word, it is used to prevent
        // from the unwise extending of "shoud ou" but allow the reasonable
        // extending of "heng ao", "lang a", etc.
        if (extLen > 1 && longestExt != 0 && matrix_[pysDecodedLen_ - extLen].dmiHasFullId == 0) {
            if (xiAnEnabled_) {
                continue;
            } else {
                break;
            }
        }

        uint16 oldrow = pysDecodedLen_ - extLen;

        // 0. If that row is before the last fixed step, ignore.
        if (splStart_[fixedHzs_] > oldrow) {
            continue;
        }

        // 1. Check if that old row has valid MatrixNode. If no, means that row is
        // not a boundary, either a word boundary or a spelling boundary.
        // If it is for extending composing phrase, it's OK to ignore the 0.
        if (matrix_[oldrow].mtrxNdNum == 0 && !dmiCPhrase_) {
            continue;
        }

        // 2. Get spelling id(s) for the last extLen chars.
        uint16 splIdx;
        bool isPre = false;
        splIdx = splParser_->GetSplidByStr(pys_ + oldrow, extLen, &isPre);
        if (isPre) {
            splMatched = true;
        }

        if (splIdx == 0) {
            continue;
        }

        bool splidEndSplit = IsSplitAt(oldrow + extLen);
        ProcessOldRow(oldrow, extLen, splIdx, splidEndSplit, longestExt);
    } // for extLen
    mtrxNdPoolUsed_ += matrix_[pysDecodedLen_].mtrxNdNum;

    if (dmiCPhrase_) {
        return true;
    }

    return (matrix_[pysDecodedLen_].mtrxNdNum != 0 || splMatched);
}

void MatrixSearch::PrepareCandidates()
{
    // Get candiates from the first un-fixed step.
    uint16 lmaSizeMax = K_MAX_LEMMA_SIZE;
    if (lmaSizeMax > splIdNum_ - fixedHzs_) {
        lmaSizeMax = splIdNum_ - fixedHzs_;
    }

    uint16 lmaSize = lmaSizeMax;

    // If the full sentense candidate's unfixed part may be the same with a normal
    // lemma. Remove the lemma candidate in this case.
    char16 fullsent[K_MAX_LEMMA_SIZE + 1];
    char16 *pfullsent = nullptr;
    uint16 sentLen;
    pfullsent = GetCandidate0(fullsent, K_MAX_LEMMA_SIZE + 1, &sentLen, true);

    // If the unfixed part contains more than one ids, it is not necessary to
    // check whether a lemma's string is the same to the unfixed part of the full
    // sentence candidate, so, set it to nullptr;
    if (sentLen > K_MAX_LEMMA_SIZE) {
        pfullsent = nullptr;
    }

    lpiTotal_ = 0;
    size_t lpiNumFullMatch = 0; // Number of items which are fully-matched.
    while (lmaSize > 0) {
        SplIdStrLen splid = {splId_ + fixedHzs_, lmaSize};
        size_t lmaNum = GetLpis(splid, lpiItems_ + lpiTotal_, size_t(kMaxLmaPsbItems - lpiTotal_), pfullsent,
                                lmaSize == lmaSizeMax);
        if (lmaNum > 0) {
            lpiTotal_ += lmaNum;
            // For next lemma candidates which are not the longest, it is not
            // necessary to compare with the full sentence candiate.
            pfullsent = nullptr;
        }
        if (lmaSize == lmaSizeMax) {
            lpiNumFullMatch = lpiTotal_;
        }
        lmaSize--;
    }

    // Sort those partially-matched items by their unified scores.
    Myqsort(lpiItems_ + lpiNumFullMatch, lpiTotal_ - lpiNumFullMatch, sizeof(LmaPsbItem), CmpLpiWithUnifiedPsb);

    if (K_PRINT_DEBUG0) {
        printf("-----Prepare candidates, score:\n");
        for (size_t a = 0; a < lpiTotal_; a++) {
            printf("[%03d]%d    ", a, lpiItems_[a].psb);
            if ((a + 1) % 0 == K_MAGIC_6) {
                printf("\n");
            }
        }
        printf("\n");
    }

    if (K_PRINT_DEBUG0) {
        printf("--- lpiTotal_ = %d\n", lpiTotal_);
    }
}

const char *MatrixSearch::GetPystr(size_t *decodedLen)
{
    if (!inited_ || decodedLen == nullptr) {
        return nullptr;
    }

    *decodedLen = pysDecodedLen_;
    return pys_;
}

void MatrixSearch::MergeFixedLmasFirst(size_t delSplPos, uint16 &phraseLen)
{
    uint16 bp = 1; // Begin position of real fixed lemmas.
    // There is no existing composing phrase.
    if (lmaId_[0] != K_LEMMA_ID_COMPOSING) {
        cPhrase_.sublmaNum = 0;
        bp = 0;
    }

    uint16 subNum = cPhrase_.sublmaNum;
    for (uint16 pos = bp; pos <= fixedLmas_; pos++) {
        cPhrase_.sublmaStart[subNum + pos - bp] = lmaStart_[pos];
        if (lmaStart_[pos] > delSplPos) {
            cPhrase_.sublmaStart[subNum + pos - bp] -= 1;
        }

        if (pos == fixedLmas_) {
            break;
        }

        uint16 lmaLen;
        char16 *lmaStr = cPhrase_.chnStr + cPhrase_.sublmaStart[subNum] + phraseLen;

        lmaLen = GetLemmaStr(lmaId_[pos], lmaStr, K_MAX_ROW_NUM - phraseLen);
        ASSERT(lmaLen == lmaStart_[pos + 1] - lmaStart_[pos]);
        phraseLen += lmaLen;
    }
    ASSERT(phraseLen == lmaStart_[fixedLmas_]);
    cPhrase_.length = phraseLen; // will be deleted by 1
    cPhrase_.sublmaNum += fixedLmas_ - bp;
}

void MatrixSearch::MergeFixedLmasExisting(size_t delSplPos, uint16 &phraseLen)
{
    for (uint16 pos = 0; pos <= cPhrase_.sublmaNum; pos++) {
        if (cPhrase_.sublmaStart[pos] > delSplPos) {
            cPhrase_.sublmaStart[pos] -= 1;
        }
    }
    phraseLen = cPhrase_.length;
}

void MatrixSearch::MergeFixedLmas(size_t delSplPos)
{
    if (fixedLmas_ == 0) {
        return;
    }
    // Update spelling segmentation information first.
    splIdNum_ -= 1;
    uint16 delPyLen = splStart_[delSplPos + 1] - splStart_[delSplPos];
    for (size_t pos = delSplPos; pos <= splIdNum_; pos++) {
        splStart_[pos] = splStart_[pos + 1] - delPyLen;
        if (pos == splIdNum_) {
            break;
        }
        splId_[pos] = splId_[pos + 1];
    }

    uint16 phraseLen = 0;

    // Update the spelling ids to the composing phrase.
    // We need to convert these ids into full id in the future.
    ImeMemcpy(cPhrase_.splIds, splIdNum_ * sizeof(uint16), splId_, splIdNum_ * sizeof(uint16));
    ImeMemcpy(cPhrase_.splStart, (splIdNum_ + 1) * sizeof(uint16), splStart_, (splIdNum_ + 1) * sizeof(uint16));

    // If composing phrase has not been created, first merge all fixed
    //  lemmas into a composing phrase without deletion.
    if (fixedLmas_ > 1 || lmaId_[0] != K_LEMMA_ID_COMPOSING) {
        MergeFixedLmasFirst(delSplPos, phraseLen);
    } else {
        MergeFixedLmasExisting(delSplPos, phraseLen);
    }

    ASSERT(phraseLen > 0);
    if (phraseLen == 1) {
        // After the only one is deleted, nothing will be left.
        fixedLmas_ = 0;
        return;
    }

    // Delete the Chinese character in the merged phrase.
    // The corresponding elements in splIds and splStart of the
    // phrase have been deleted.
    char16 *chnStr = cPhrase_.chnStr + delSplPos;
    for (uint16 pos = 0; pos < cPhrase_.sublmaStart[cPhrase_.sublmaNum] - delSplPos; pos++) {
        chnStr[pos] = chnStr[pos + 1];
    }
    cPhrase_.length -= 1;

    // If the deleted spelling id is in a sub lemma which contains more than
    // one id, delASub will be false; but if the deleted id is in a sub lemma
    // which only contains 1 id, the whole sub lemma needs to be deleted, so
    // delASub will be true.
    bool delASub = false;
    for (uint16 pos = 1; pos <= cPhrase_.sublmaNum; pos++) {
        if (cPhrase_.sublmaStart[pos - 1] == cPhrase_.sublmaStart[pos]) {
            delASub = true;
        }
        if (delASub) {
            cPhrase_.sublmaStart[pos - 1] = cPhrase_.sublmaStart[pos];
        }
    }
    if (delASub) {
        cPhrase_.sublmaNum -= 1;
    }

    return;
}

void MatrixSearch::CollectSplAndLma()
{
    MatrixNode *mtrxNd = mtrxNdPool_ + matrix_[pysDecodedLen_].mtrxNdPos;
    while (mtrxNd != mtrxNdPool_) {
        if (fixedHzs_ > 0) {
            if (mtrxNd->step <= splStart_[fixedHzs_]) {
                break;
            }
        }

        // Update the spelling segamentation information
        unsigned char wordSplstrLen = 0;
        PoolPosType dmiFr = mtrxNd->dmiFr;
        if (dmiFr != static_cast<PoolPosType>(-1)) {
            wordSplstrLen = dmiPool_[dmiFr].splstrLen;
        }

        while (dmiFr != static_cast<PoolPosType>(-1)) {
            splStart_[splIdNum_ + 1] = mtrxNd->step - (wordSplstrLen - dmiPool_[dmiFr].splstrLen);
            splId_[splIdNum_] = dmiPool_[dmiFr].splId;
            splIdNum_++;
            dmiFr = dmiPool_[dmiFr].dmiFr;
        }

        // Update the lemma segmentation information
        lmaStart_[lmaIdNum_ + 1] = splIdNum_;
        lmaId_[lmaIdNum_] = mtrxNd->id;
        lmaIdNum_++;

        mtrxNd = mtrxNd->from;
    }
}

void MatrixSearch::ReverseSplInfo()
{
    for (size_t pos = fixedHzs_; pos < fixedHzs_ + (splIdNum_ - fixedHzs_ + 1) / K_MAGIC_2; pos++) {
        if (splIdNum_ + fixedHzs_ - pos != pos + 1) {
            splStart_[pos + 1] ^= splStart_[splIdNum_ - pos + fixedHzs_];
            splStart_[splIdNum_ - pos + fixedHzs_] ^= splStart_[pos + 1];
            splStart_[pos + 1] ^= splStart_[splIdNum_ - pos + fixedHzs_];

            splId_[pos] ^= splId_[splIdNum_ + fixedHzs_ - pos - 1];
            splId_[splIdNum_ + fixedHzs_ - pos - 1] ^= splId_[pos];
            splId_[pos] ^= splId_[splIdNum_ + fixedHzs_ - pos - 1];
        }
    }
}

void MatrixSearch::ReverseLmaInfo()
{
    for (size_t pos = fixedLmas_; pos < fixedLmas_ + (lmaIdNum_ - fixedLmas_ + 1) / K_MAGIC_2; pos++) {
        ASSERT(lmaIdNum_ + fixedLmas_ - pos - pos >= 1);

        if (lmaIdNum_ + fixedLmas_ - pos > pos + 1) {
            lmaStart_[pos + 1] ^= lmaStart_[lmaIdNum_ - pos + fixedLmas_];
            lmaStart_[lmaIdNum_ - pos + fixedLmas_] ^= lmaStart_[pos + 1];
            lmaStart_[pos + 1] ^= lmaStart_[lmaIdNum_ - pos + fixedLmas_];

            lmaId_[pos] ^= lmaId_[lmaIdNum_ - 1 - pos + fixedLmas_];
            lmaId_[lmaIdNum_ - 1 - pos + fixedLmas_] ^= lmaId_[pos];
            lmaId_[pos] ^= lmaId_[lmaIdNum_ - 1 - pos + fixedLmas_];
        }
    }
}

void MatrixSearch::AdjustLmaStart()
{
    for (size_t pos = fixedLmas_ + 1; pos <= lmaIdNum_; pos++) {
        if (pos < lmaIdNum_) {
            lmaStart_[pos] = lmaStart_[pos - 1] + (lmaStart_[pos] - lmaStart_[pos + 1]);
        } else {
            lmaStart_[pos] = lmaStart_[pos - 1] + lmaStart_[pos] - lmaStart_[fixedLmas_];
        }
    }
}

void MatrixSearch::FindLastFixedSplId()
{
    fixedHzs_ = 0;
    for (size_t pos = splIdNum_; pos > 0; pos--) {
        if (matrix_[splStart_[pos]].mtrxNdFixed != nullptr) {
            fixedHzs_ = pos;
            break;
        }
    }
}

void MatrixSearch::GetSplStartId()
{
    lmaIdNum_ = 0;
    lmaStart_[0] = 0;

    splIdNum_ = 0;
    splStart_[0] = 0;
    if (!inited_ || pysDecodedLen_ == 0 || matrix_[pysDecodedLen_].mtrxNdNum == 0) {
        return;
    }

    // Calculate number of lemmas and spellings
    // Only scan those part which is not fixed.
    lmaIdNum_ = fixedLmas_;
    splIdNum_ = fixedHzs_;

    CollectSplAndLma();
    ReverseSplInfo();
    ReverseLmaInfo();
    AdjustLmaStart();
    FindLastFixedSplId();
}

size_t MatrixSearch::GetSplStart(const uint16 *&splStart)
{
    GetSplStartId();
    splStart = splStart_;
    return splIdNum_;
}

void MatrixSearch::ExtendDmiSystemDict(DictExtPara *dep, DictMatchInfo *dmiS, const MileStoneHandle *fromH,
                                       MileStoneHandle *handles)
{
    size_t lpiNum = 0;
    if (fromH[0] > 0 || dmiS == nullptr) {
        handles[0] = dictTrie_->ExtendDict(fromH[0], dep, lpiItems_, kMaxLmaPsbItems, &lpiNum);
    }
    if (handles[0] > 0) {
        lpiTotal_ = lpiNum;
    }
    if (dmiS == nullptr) { // from root
        ASSERT(handles[0] != 0);
    }
}

void MatrixSearch::ExtendDmiUserDict(DictExtPara *dep, DictMatchInfo *dmiS, const MileStoneHandle *fromH,
                                     MileStoneHandle *handles)
{
    if (userDict_ == nullptr || (fromH[1] == 0 && dmiS != nullptr)) {
        return;
    }
    size_t lpiNum = 0;
    handles[1] = userDict_->ExtendDict(fromH[1], dep, lpiItems_ + lpiTotal_, kMaxLmaPsbItems - lpiTotal_, &lpiNum);
    if (handles[1] > 0) {
        if (K_PRINT_DEBUG0) {
            for (size_t t = 0; t < lpiNum; t++) {
                printf("--Extend in user dict: uid:%d uscore:%d\n", lpiItems_[lpiTotal_ + t].id,
                       lpiItems_[lpiTotal_ + t].psb);
            }
        }
        lpiTotal_ += lpiNum;
    }
}

int MatrixSearch::AddDmiForHandles(DictExtPara *dep, DictMatchInfo *dmiS, const MileStoneHandle *handles,
                                   uint16 splid)
{
    if (handles[0] == 0 && handles[1] == 0) {
        return 0;
    }
    if (dmiPoolUsed_ >= kDmiPoolSize) {
        return -1;
    }

    DictMatchInfo *dmiAdd = dmiPool_ + dmiPoolUsed_;
    if (dmiS == nullptr) {
        FillDmiParam p = {static_cast<PoolPosType>(-1),
                          splid,
                          1,
                          1,
                          dep->splidEndSplit,
                          static_cast<unsigned char>(dep->extLen),
                          static_cast<unsigned char>(splTrie_->IsHalfId(splid) ? 0 : 1)};
        FillDmi(dmiAdd, handles, p);
    } else {
        FillDmiParam p = {static_cast<PoolPosType>(dmiS - dmiPool_),
                          splid,
                          1,
                          static_cast<unsigned char>(dmiS->dictLevel + 1),
                          dep->splidEndSplit,
                          static_cast<unsigned char>(dmiS->splstrLen + dep->extLen),
                          static_cast<unsigned char>(splTrie_->IsHalfId(splid) ? 0 : dmiS->allFullId)};
        FillDmi(dmiAdd, handles, p);
    }
    return 1;
}

size_t MatrixSearch::FinalizeLpiCache(LpiCache &lpiCache, uint16 splid, bool cached, DictMatchInfo *dmiS,
                                      size_t retVal)
{
    if (cached) {
        ASSERT(splTrie_->IsHalfId(splid));
        lpiTotal_ = lpiCache.GetCache(splid, lpiItems_, kMaxLmaPsbItems);
        return retVal;
    }

    if (lpiTotal_ == 0) {
        return retVal;
    }

    if (K_PRINT_DEBUG0) {
        printf("--- lpiTotal_ = %d\n", lpiTotal_);
    }

    Myqsort(lpiItems_, lpiTotal_, sizeof(LmaPsbItem), CmpLpiWithPsb);
    if (dmiS == nullptr && splTrie_->IsHalfId(splid)) {
        lpiTotal_ = lpiCache.PutCache(splid, lpiItems_, lpiTotal_);
    }
    return retVal;
}

size_t MatrixSearch::ExtendDmi(DictExtPara *dep, DictMatchInfo *dmiS)
{
    if (dmiPoolUsed_ >= kDmiPoolSize) {
        return 0;
    }

    if (dmiCPhrase_) {
        return ExtendDmiC(dep, dmiS);
    }

    LpiCache &lpiCache = LpiCache::GetInstance();
    uint16 splid = dep->splids[dep->splidsExtended];

    bool cached = false;
    if (dep->splidsExtended == 0) {
        cached = lpiCache.IsCached(splid);
    }

    lpiTotal_ = 0;

    MileStoneHandle fromH[3];
    fromH[0] = 0;
    fromH[1] = 0;
    if (dep->splidsExtended != 0) {
        fromH[0] = dmiS->dictHandles[0];
        fromH[1] = dmiS->dictHandles[1];
    }

    MileStoneHandle handles[2];
    handles[0] = handles[1] = 0;

    // 2. Begin exgtending in the system dictionary
    ExtendDmiSystemDict(dep, dmiS, fromH, handles);

    // 3. Begin extending in the user dictionary
    ExtendDmiUserDict(dep, dmiS, fromH, handles);

    int dmiResult = AddDmiForHandles(dep, dmiS, handles, splid);
    if (dmiResult < 0) {
        return 0;
    }
    size_t retVal = dmiResult > 0 ? 1 : 0;

    return FinalizeLpiCache(lpiCache, splid, cached, dmiS, retVal);
}

size_t MatrixSearch::ExtendDmiC(DictExtPara *dep, DictMatchInfo *dmiS)
{
    lpiTotal_ = 0;

    uint16 pos = dep->splidsExtended;
    ASSERT(dmiCPhrase_);
    if (pos >= cPhrase_.length) {
        return 0;
    }

    uint16 splid = dep->splids[pos];
    if (splid == cPhrase_.splIds[pos]) {
        DictMatchInfo *dmiAdd = dmiPool_ + dmiPoolUsed_;
        MileStoneHandle handles[2]; // Actually never used.
        if (dmiS == nullptr) {
            FillDmiParam p = {static_cast<PoolPosType>(-1),
                              splid,
                              1,
                              1,
                              dep->splidEndSplit,
                              static_cast<unsigned char>(dep->extLen),
                              static_cast<unsigned char>(splTrie_->IsHalfId(splid) ? 0 : 1)};
            FillDmi(dmiAdd, handles, p);
        } else {
            FillDmiParam p = {static_cast<PoolPosType>(dmiS - dmiPool_),
                              splid,
                              1,
                              static_cast<unsigned char>(dmiS->dictLevel + 1),
                              dep->splidEndSplit,
                              static_cast<unsigned char>(dmiS->splstrLen + dep->extLen),
                              static_cast<unsigned char>(splTrie_->IsHalfId(splid) ? 0 : dmiS->allFullId)};
            FillDmi(dmiAdd, handles, p);
        }

        if (pos == cPhrase_.length - 1) {
            lpiItems_[0].id = K_LEMMA_ID_COMPOSING;
            lpiItems_[0].psb = 0; // 0 is bigger than normal lemma score.
            lpiTotal_ = 1;
        }
        return 1;
    }
    return 0;
}

size_t MatrixSearch::ExtendMtrxNd(MatrixNode *mtrxNd, LmaPsbItem lpiItems[], size_t lpiNum, PoolPosType dmiFr,
                                  size_t resRow)
{
    ASSERT(mtrxNd != nullptr);
    matrix_[resRow].mtrxNdFixed = nullptr;

    if (mtrxNdPoolUsed_ >= kMtrxNdPoolSize - kMaxNodeARow) {
        return 0;
    }

    if (mtrxNd->step == 0) {
        // Because the list is sorted, if the source step is 0, it is only
        // necessary to pick up the first kMaxNodeARow items.
        if (lpiNum > kMaxNodeARow) {
            lpiNum = kMaxNodeARow;
        }
    }

    MatrixNode *mtrxNdResMin = mtrxNdPool_ + matrix_[resRow].mtrxNdPos;
    for (size_t pos = 0; pos < lpiNum; pos++) {
        float score = mtrxNd->score + lpiItems[pos].psb;
        if (pos > 0 && score - mtrxNdResMin->score > PRUMING_SCORE) {
            break;
        }

        // Try to add a new node
        size_t mtrxNdNum = matrix_[resRow].mtrxNdNum;
        MatrixNode *mtrxNdRes = mtrxNdResMin + mtrxNdNum;
        bool replace = false;
        // Find its position
        while (mtrxNdRes > mtrxNdResMin && score < (mtrxNdRes - 1)->score) {
            if (static_cast<size_t>(mtrxNdRes - mtrxNdResMin) < kMaxNodeARow) {
                *mtrxNdRes = *(mtrxNdRes - 1);
            }
            mtrxNdRes--;
            replace = true;
        }
        if (replace || (mtrxNdNum < kMaxNodeARow && matrix_[resRow].mtrxNdPos + mtrxNdNum < kMtrxNdPoolSize)) {
            mtrxNdRes->id = lpiItems[pos].id;
            mtrxNdRes->score = score;
            mtrxNdRes->from = mtrxNd;
            mtrxNdRes->dmiFr = dmiFr;
            mtrxNdRes->step = resRow;
            if (matrix_[resRow].mtrxNdNum < kMaxNodeARow) {
                matrix_[resRow].mtrxNdNum++;
            }
        }
    }
    return matrix_[resRow].mtrxNdNum;
}

PoolPosType MatrixSearch::MatchDmi(size_t stepTo, const uint16 splIds[], uint16 splIdNum)
{
    if (pysDecodedLen_ < stepTo || matrix_[stepTo].dmiNum == 0) {
        return static_cast<PoolPosType>(-1);
    }

    for (PoolPosType dmiPos = 0; dmiPos < matrix_[stepTo].dmiNum; dmiPos++) {
        DictMatchInfo *dmi = dmiPool_ + matrix_[stepTo].dmiPos + dmiPos;

        if (dmi->dictLevel != splIdNum) {
            continue;
        }

        bool matched = true;
        for (uint16 splPos = 0; splPos < splIdNum; splPos++) {
            if (splIds[splIdNum - splPos - 1] != dmi->splId) {
                matched = false;
                break;
            }

            dmi = dmiPool_ + dmi->dmiFr;
        }
        if (matched) {
            return matrix_[stepTo].dmiPos + dmiPos;
        }
    }

    return static_cast<PoolPosType>(-1);
}

void MatrixSearch::CollectSentenceIdxs(MatrixNode *mtrxNd, LemmaIdType *idxs, size_t &idNum)
{
    while (mtrxNd != nullptr) {
        idxs[idNum] = mtrxNd->id;
        idNum++;

        if (K_PRINT_DEBUG1) {
            printf("---MatrixNode [step: %d, lma_idx: %d, total score:%.5f]\n", mtrxNd->step, mtrxNd->id,
                   mtrxNd->score);
            DebugPrintDmi(mtrxNd->dmiFr, 1);
        }

        mtrxNd = mtrxNd->from;
    }
}

bool MatrixSearch::BuildCandidateStr(LemmaIdType *idxs, size_t idNum, const CandStrBuf &buf, size_t &retPos,
                                     bool onlyUnfixed)
{
    do {
        idNum--;
        if (idxs[idNum] == 0) {
            continue;
        }

        char16 str[K_MAX_LEMMA_SIZE + 1];
        uint16 strLen = GetLemmaStr(idxs[idNum], str, K_MAX_LEMMA_SIZE + 1);
        if (strLen > 0 && ((!onlyUnfixed && buf.maxLen - retPos > strLen) ||
                           (onlyUnfixed && buf.maxLen - retPos + fixedHzs_ > strLen))) {
            if (!onlyUnfixed) {
                Utf16Strncpy(buf.candStr + retPos, str, strLen);
            } else if (retPos >= fixedHzs_) {
                Utf16Strncpy(buf.candStr + retPos - fixedHzs_, str, strLen);
            }

            retPos += strLen;
        } else {
            return false;
        }
    } while (idNum != 0);
    return true;
}

char16 *MatrixSearch::GetCandidate0(char16 *candStr, size_t maxLen, uint16 *retstrLen, bool onlyUnfixed)
{
    if (pysDecodedLen_ == 0 || matrix_[pysDecodedLen_].mtrxNdNum == 0) {
        return nullptr;
    }

    LemmaIdType idxs[K_MAX_ROW_NUM];
    size_t idNum = 0;

    MatrixNode *mtrxNd = mtrxNdPool_ + matrix_[pysDecodedLen_].mtrxNdPos;

    if (K_PRINT_DEBUG0) {
        printf("--- sentence score: %f\n", mtrxNd->score);
    }

    if (K_PRINT_DEBUG1) {
        printf("==============Sentence DMI (reverse order) Begin===========>>\n");
    }

    CollectSentenceIdxs(mtrxNd, idxs, idNum);

    if (K_PRINT_DEBUG1) {
        printf("<<==============Sentence DMI (reverse order) end=============\n");
    }

    size_t retPos = 0;
    if (!BuildCandidateStr(idxs, idNum, {candStr, maxLen}, retPos, onlyUnfixed)) {
        return nullptr;
    }

    if (!onlyUnfixed) {
        if (retstrLen != nullptr) {
            *retstrLen = retPos;
        }
        candStr[retPos] = static_cast<char16>('\0');
    } else {
        if (retstrLen != nullptr) {
            *retstrLen = retPos - fixedHzs_;
        }
        candStr[retPos - fixedHzs_] = static_cast<char16>('\0');
    }
    return candStr;
}

size_t MatrixSearch::DedupByString(LmaPsbItem *lmaBuf, size_t num, size_t maxLmaBuf, const char16 *pfullsent)
{
    LmaPsbStrItem *lpsis = reinterpret_cast<LmaPsbStrItem *>(lmaBuf + num);
    size_t lpsiNum = (maxLmaBuf - num) * sizeof(LmaPsbItem) / sizeof(LmaPsbStrItem);

    if (num > lpsiNum) {
        num = lpsiNum;
    }
    lpsiNum = num;

    for (size_t pos = 0; pos < lpsiNum; pos++) {
        lpsis[pos].lpi = lmaBuf[pos];
        GetLemmaStr(lmaBuf[pos].id, lpsis[pos].str, K_MAX_LEMMA_SIZE + 1);
    }

    Myqsort(lpsis, lpsiNum, sizeof(LmaPsbStrItem), CmpLpsiWithStr);

    size_t remainNum = 0;
    for (size_t pos = 0; pos < lpsiNum; pos++) {
        if (pfullsent != nullptr && Utf16Strcmp(lpsis[pos].str, pfullsent) == 0) {
            continue;
        }

        lmaBuf[remainNum] = lpsis[pos].lpi;
        remainNum++;
    }
    return remainNum;
}

size_t MatrixSearch::DedupSingleChar(LmaPsbItem *lmaBuf, size_t num, const char16 *pfullsent)
{
    // For single character lemmas, Hanzis will be gotten
    for (size_t pos = 0; pos < num; pos++) {
        char16 hanzis[2];
        GetLemmaStr(lmaBuf[pos].id, hanzis, K_MAGIC_2);
        lmaBuf[pos].hanzi = hanzis[0];
    }

    Myqsort(lmaBuf, num, sizeof(LmaPsbItem), CmpLpiWithHanzi);

    size_t remainNum = 0;
    for (size_t pos = 0; pos < num; pos++) {
        if (pos > 0 && lmaBuf[pos].hanzi == lmaBuf[pos - 1].hanzi) {
            if (pfullsent != nullptr && pfullsent[1] == static_cast<char16>(0) && lmaBuf[pos].hanzi == pfullsent[0]) {
                continue;
            }

            if (lmaBuf[pos].psb < lmaBuf[pos - 1].psb) {
                ASSERT(remainNum > 0);
                ASSERT(lmaBuf[remainNum - 1].hanzi == lmaBuf[pos].hanzi);
                lmaBuf[remainNum - 1] = lmaBuf[pos];
            }
            continue;
        }
        if (pfullsent != nullptr && pfullsent[1] == static_cast<char16>(0) && lmaBuf[pos].hanzi == pfullsent[0]) {
            continue;
        }

        lmaBuf[remainNum] = lmaBuf[pos];
        remainNum++;
    }
    return remainNum;
}

size_t MatrixSearch::GetLpis(const SplIdStrLen &splid, LmaPsbItem *lmaBuf, size_t maxLmaBuf, const char16 *pfullsent,
                             bool sortByPsb)
{
    if (splid.len > K_MAX_LEMMA_SIZE) {
        return 0;
    }

    size_t num1 = dictTrie_->GetLpis(splid.str, static_cast<uint16>(splid.len), lmaBuf, maxLmaBuf);
    size_t num2 = 0;
    if (userDict_ != nullptr) {
        num2 = userDict_->GetLpis(splid.str, static_cast<uint16>(splid.len), lmaBuf + num1, maxLmaBuf - num1);
    }

    size_t num = num1 + num2;

    if (num == 0) {
        return 0;
    }

    // Remove repeated items.
    if (splid.len > 1) {
        num = DedupByString(lmaBuf, num, maxLmaBuf, pfullsent);
    } else {
        // For single character, some characters have more than one spelling, for
        // example, "de" and "di" are all valid for a Chinese character, so when
        // the user input  "d", repeated items are generated.
        num = DedupSingleChar(lmaBuf, num, pfullsent);
    }

    if (sortByPsb) {
        Myqsort(lmaBuf, num, sizeof(LmaPsbItem), CmpLpiWithPsb);
    }
    return num;
}

uint16 MatrixSearch::GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax)
{
    uint16 strLen = 0;

    if (IsSystemLemma(idLemma)) {
        strLen = dictTrie_->GetLemmaStr(idLemma, strBuf, strMax);
    } else if (IsUserLemma(idLemma)) {
        if (userDict_ != nullptr) {
            strLen = userDict_->GetLemmaStr(idLemma, strBuf, strMax);
        } else {
            strLen = 0;
            strBuf[0] = static_cast<char16>('\0');
        }
    } else if (IsComposingLemma(idLemma)) {
        if (strMax <= 1) {
            return 0;
        }
        strLen = cPhrase_.sublmaStart[cPhrase_.sublmaNum];
        if (strLen > strMax - 1) {
            strLen = strMax - 1;
        }
        Utf16Strncpy(strBuf, cPhrase_.chnStr, strLen);
        strBuf[strLen] = static_cast<char16>('\0');
        return strLen;
    }

    return strLen;
}

uint16 MatrixSearch::GetLemmaSplids(LemmaIdType idLemma, uint16 *splids, uint16 splidsMax, bool argValid)
{
    uint16 splidNum = 0;

    if (argValid) {
        for (splidNum = 0; splidNum < splidsMax; splidNum++) {
            if (splTrie_->IsHalfId(splids[splidNum])) {
                break;
            }
        }
        if (splidNum == splidsMax) {
            return splidNum;
        }
    }

    if (IsSystemLemma(idLemma)) {
        splidNum = dictTrie_->GetLemmaSplids(idLemma, splids, splidsMax, argValid);
    } else if (IsUserLemma(idLemma)) {
        if (userDict_ != nullptr) {
            splidNum = userDict_->GetLemmaSplids(idLemma, splids, splidsMax, argValid);
        } else {
            splidNum = 0;
        }
    } else if (IsComposingLemma(idLemma)) {
        if (cPhrase_.length > splidsMax) {
            return 0;
        }
        for (uint16 pos = 0; pos < cPhrase_.length; pos++) {
            splids[pos] = cPhrase_.splIds[pos];
            if (splTrie_->IsHalfId(splids[pos])) {
                return 0;
            }
        }
    }
    return splidNum;
}

bool MatrixSearch::HasNearestNWord(const char16 *fixedBuf, uint16 fixedLen)
{
    for (size_t nlen = 2; nlen <= fixedLen; nlen++) {
        if (dictTrie_->GetLemmaId(fixedBuf + fixedLen - nlen, nlen) > 0) {
            return true;
        }
    }
    return false;
}

size_t MatrixSearch::LimitPredictNum(size_t resThis, size_t len)
{
    if (len > K_MAGIC_3) {
        if (resThis > K_MAX_PREDICT_NUM_BY_GT3) {
            return K_MAX_PREDICT_NUM_BY_GT3;
        }
    } else if (len == K_MAGIC_3) {
        if (resThis > K_MAX_PREDICT_NUM_BY3) {
            return K_MAX_PREDICT_NUM_BY3;
        }
    } else if (len == K_MAGIC_2) {
        if (resThis > K_MAX_PREDICT_NUM_BY2) {
            return K_MAX_PREDICT_NUM_BY2;
        }
    }
    return resThis;
}

size_t MatrixSearch::PredictForLen(const char16 *fixedBuf, uint16 fixedLen, size_t len, size_t resTotal,
                                   size_t thisMax)
{
    size_t resThis = 0;
    if (!kOnlyUserDictPredict) {
        resThis = dictTrie_->Predict(fixedBuf + fixedLen - len, len, npreItems_ + resTotal, thisMax, resTotal);
    }

    if (userDict_ != nullptr) {
        resThis = resThis + userDict_->Predict(fixedBuf + fixedLen - len, len, npreItems_ + resTotal + resThis,
                                               thisMax - resThis, resTotal + resThis);
    }

    if (kPredictLimitGt1) {
        Myqsort(npreItems_ + resTotal, resThis, sizeof(NPredictItem), CmpNpreByScore);
        resThis = LimitPredictNum(resThis, len);
    }
    return resThis;
}

size_t MatrixSearch::InnerPredict(const char16 *fixedBuf, uint16 fixedLen, char16 predictBuf[][K_MAX_PREDICT_SIZE + 1],
                                  size_t bufLen)
{
    size_t resTotal = 0;
    ImeMemset(npreItems_, sizeof(NPredictItem) * npreItemsLen_, 0, sizeof(NPredictItem) * npreItemsLen_);
    // In order to shorten the comments, j-character candidates predicted by
    // i-character prefix are called P(i,j). All candiates predicted by
    // i-character prefix are called P(i,*)
    // Step 1. Get P(K_MAX_PREDICT_SIZE, *) and sort them, here
    // P(K_MAX_PREDICT_SIZE, *) == P(K_MAX_PREDICT_SIZE, 1)
    for (size_t len = fixedLen; len > 0; len--) {
        // How many blank items are available
        size_t thisMax = npreItemsLen_ - resTotal;
        size_t resThis;
        // If the history is longer than 1, and we can not get prediction from
        // lemmas longer than 2, in this case, we will add lemmas with
        // highest scores as the prediction result.
        if (fixedLen > 1 && len == 1 && resTotal == 0) {
            // Try to find if recent n (n>1) characters can be a valid lemma in system
            // dictionary.
            bool nearestNWord = HasNearestNWord(fixedBuf, fixedLen);
            resThis = dictTrie_->PredictTopLmas(nearestNWord ? len : 0, npreItems_ + resTotal, thisMax, resTotal);
            resTotal += resThis;
        }

        // How many blank items are available
        thisMax = npreItemsLen_ - resTotal;
        resThis = PredictForLen(fixedBuf, fixedLen, len, resTotal, thisMax);

        resTotal += resThis;
    }

    resTotal = RemoveDuplicateNpre(npreItems_, resTotal);

    if (kPreferLongHistoryPredict) {
        Myqsort(npreItems_, resTotal, sizeof(NPredictItem), CmpNpreByHislenScore);
    } else {
        Myqsort(npreItems_, resTotal, sizeof(NPredictItem), CmpNpreByScore);
    }

    if (bufLen < resTotal) {
        resTotal = bufLen;
    }

    if (K_PRINT_DEBUG2) {
        printf("/////////////////Predicted Items Begin////////////////////>>\n");
        for (size_t i = 0; i < resTotal; i++) {
            printf("---");
            for (size_t j = 0; j < K_MAX_PREDICT_SIZE; j++) {
                printf("%d  ", npreItems_[i].preHzs[j]);
            }
            printf("\n");
        }
        printf("<<///////////////Predicted Items End////////////////////////\n");
    }

    for (size_t i = 0; i < resTotal; i++) {
        Utf16Strncpy(predictBuf[i], npreItems_[i].preHzs, K_MAX_PREDICT_SIZE);
        predictBuf[i][K_MAX_PREDICT_SIZE] = '\0';
    }

    return resTotal;
}

size_t MatrixSearch::GetPredicts(const char16 fixedBuf[], char16 predictBuf[][K_MAX_PREDICT_SIZE + 1], size_t bufLen)
{
    size_t fixedLen = Utf16Strlen(fixedBuf);
    if (fixedLen == 0 || fixedLen > K_MAX_PREDICT_SIZE || bufLen == 0) {
        return 0;
    }

    return InnerPredict(fixedBuf, fixedLen, predictBuf, bufLen);
}

} // namespace ime_pinyin
