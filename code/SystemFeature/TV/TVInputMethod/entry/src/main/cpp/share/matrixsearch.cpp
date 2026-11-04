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
