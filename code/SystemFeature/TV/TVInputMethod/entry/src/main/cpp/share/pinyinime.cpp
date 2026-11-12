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

#include "../include/pinyinime.h"
#include "../include/dicttrie.h"
#include "../include/matrixsearch.h"
#include "../include/spellingtrie.h"
#include <cstdlib>

#ifdef __cplusplus
extern "C" {
#endif

using namespace ime_pinyin;

// The maximum number of the prediction items.
static const size_t K_MAX_PREDICT_NUM = 500;

// Used to Search Pinyin string and give the best candidate.
MatrixSearch *g_matrixSearch = nullptr;

char16 g_predictBuf[K_MAX_PREDICT_NUM][K_MAX_PREDICT_SIZE + 1];

bool ImOpenDecoder(const char *fnSysDict, const char *fnUsrDict)
{
    if (g_matrixSearch != nullptr) {
        delete g_matrixSearch;
    }

    g_matrixSearch = new MatrixSearch();
    if (g_matrixSearch == nullptr) {
        return false;
    }

    return g_matrixSearch->Init(fnSysDict, fnUsrDict);
}

bool ImOpenDecoderFd(int sysFd, long startOffset, long length, const char *fnUsrDict)
{
    if (g_matrixSearch != nullptr) {
        delete g_matrixSearch;
    }

    g_matrixSearch = new MatrixSearch();
    if (g_matrixSearch == nullptr) {
        return false;
    }

    return g_matrixSearch->InitFd(sysFd, startOffset, length, fnUsrDict);
}

void ImCloseDecoder()
{
    if (g_matrixSearch != nullptr) {
        g_matrixSearch->Close();
        delete g_matrixSearch;
    }
    g_matrixSearch = nullptr;
}

void ImSetMaxLens(size_t maxSpsLen, size_t maxHzsLen)
{
    if (g_matrixSearch != nullptr) {
        g_matrixSearch->SetMaxLens(maxSpsLen, maxHzsLen);
    }
}

void ImFlushCache()
{
    if (g_matrixSearch != nullptr) {
        g_matrixSearch->FlushCache();
    }
}

// To be updated.
size_t ImSearch(const char *pybuf, size_t spsLen)
{
    if (g_matrixSearch == nullptr) {
        return 0;
    }
    g_matrixSearch->Search(pybuf, spsLen);
    return g_matrixSearch->GetCandidateNum();
}

size_t ImDelsearch(size_t pos, bool isPosInSplid, bool clearFixedThisStep)
{
    if (g_matrixSearch == nullptr) {
        return 0;
    }
    g_matrixSearch->Delsearch(pos, isPosInSplid, clearFixedThisStep);
    return g_matrixSearch->GetCandidateNum();
}

void ImResetSearch()
{
    if (g_matrixSearch == nullptr) {
        return;
    }

    g_matrixSearch->ResetSearch();
}

// To be removed
size_t ImAddLetter(char ch)
{
    (void)ch;
    return 0;
}

const char *ImGetSpsStr(size_t *decodedLen)
{
    if (g_matrixSearch == nullptr) {
        return nullptr;
    }

    return g_matrixSearch->GetPystr(decodedLen);
}

char16 *ImGetCandidate(size_t candId, char16 *candStr, size_t maxLen)
{
    if (g_matrixSearch == nullptr) {
        return nullptr;
    }

    return g_matrixSearch->GetCandidate(candId, candStr, maxLen);
}

size_t ImGetSplStartPos(const uint16 *&splStart)
{
    if (g_matrixSearch == nullptr) {
        return 0;
    }

    return g_matrixSearch->GetSplStart(splStart);
}

size_t ImChoose(size_t choiceId)
{
    if (g_matrixSearch == nullptr) {
        return 0;
    }

    return g_matrixSearch->Choose(choiceId);
}

size_t ImCancelLastChoice()
{
    if (g_matrixSearch == nullptr) {
        return 0;
    }

    return g_matrixSearch->CancelLastChoice();
}

size_t ImGetFixedLen()
{
    if (g_matrixSearch == nullptr) {
        return 0;
    }

    return g_matrixSearch->GetFixedlen();
}

// To be removed
bool ImCancelInput() { return true; }

size_t ImGetPredicts(const char16 *hisBuf, char16 (*&preBuf)[K_MAX_PREDICT_SIZE + 1])
{
    if (hisBuf == nullptr) {
        return 0;
    }

    size_t fixedLen = Utf16Strlen(hisBuf);
    const char16 *fixedPtr = hisBuf;
    if (fixedLen > K_MAX_PREDICT_SIZE) {
        fixedPtr += fixedLen - K_MAX_PREDICT_SIZE;
        fixedLen = K_MAX_PREDICT_SIZE;
    }

    preBuf = g_predictBuf;
    return g_matrixSearch->GetPredicts(hisBuf, preBuf, K_MAX_PREDICT_NUM);
}

void ImEnableShmAsSzm(bool enable)
{
    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    splTrie.SzmEnableShm(enable);
}

void ImEnableYmAsSzm(bool enable)
{
    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    splTrie.SzmEnableYm(enable);
}

#ifdef __cplusplus
}
#endif
