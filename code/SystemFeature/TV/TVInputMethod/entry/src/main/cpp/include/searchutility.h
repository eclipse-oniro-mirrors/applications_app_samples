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

#ifndef PINYINIME_ANDPY_INCLUDE_SEARCHCOMMON_H_
#define PINYINIME_ANDPY_INCLUDE_SEARCHCOMMON_H_

#include "./spellingtrie.h"
#include <cstdlib>

namespace ime_pinyin {

// Type used to identify the size of a pool, such as id pool, etc.
typedef uint16 PoolPosType;

// Type used to identify a parsing mile stone in an atom dictionary.
typedef uint16 MileStoneHandle;

// Type used to express a lemma and its probability score.
typedef struct {
    size_t id : (K_LEMMA_ID_SIZE * 8);
    size_t lmaLen : 4;
    uint16 psb; // The score, the lower psb, the higher possibility.
    // For single character items, we may also need Hanzi.
    // For multiple characer items, ignore it.
    char16 hanzi;
} LmaPsbItem, *PLmaPsbItem;

// LmaPsbItem extended with string.
typedef struct {
    LmaPsbItem lpi;
    char16 str[K_MAX_LEMMA_SIZE + 1];
} LmaPsbStrItem, *PLmaPsbStrItem;

typedef struct {
    float psb;
    char16 preHzs[K_MAX_PREDICT_SIZE];
    uint16 hisLen; // The length of the history used to do the prediction.
} NPredictItem, *PNPredictItem;

// Parameter structure used to extend in a dictionary. All dictionaries
// receives the same DictExtPara and a dictionary specific MileStoneHandle for
// extending.
//
// When the user inputs a new character, AtomDictBase::ExtendDict() will be
// called at least once for each dictionary.
//
// For example, when the user inputs "wm", ExtendDict() will be called twice,
// and the DictExtPara parameter are as follows respectively:
//
typedef struct {
    // Spelling ids for extending, there are splidsExtended + 1 ids in the
    // buffer.
    // For a normal lemma, there can only be K_MAX_LEMMA_SIZE spelling ids in max,
    // but for a composing phrase, there can K_MAX_SEARCH_STEPS spelling ids.
    uint16 splids[K_MAX_SEARCH_STEPS];

    // Number of ids that have been used before. splids[splidsExtended] is the
    // newly added id for the current extension.
    uint16 splidsExtended;

    // The step span of the extension. It is also the size of the string for
    // the newly added spelling id.
    uint16 extLen;

    // The step number for the current extension. It is also the ending position
    // in the input Pinyin string for the substring of spelling ids in splids[].
    // For example, when the user inputs "women", stepNo = 4.
    // This parameter may useful to manage the MileStoneHandle list for each
    // step. When the user deletes a character from the string, MileStoneHandle
    // objects for the the steps after that character should be Reset; when the
    // user begins a new string, all MileStoneHandle objects should be Reset.
    uint16 stepNo;

    // Indicate whether the newly added spelling ends with a splitting character
    bool splidEndSplit;

    // If the newly added id is a half id, idStart is the first id of the
    // corresponding full ids; if the newly added id is a full id, idStart is
    // that id.
    uint16 idStart;

    // If the newly added id is a half id, idNum is the number of corresponding
    // ids; if it is a full id, idNum == 1.
    uint16 idNum;
} DictExtPara, *PDictExtPara;

bool IsSystemLemma(LemmaIdType lmaId);
bool IsUserLemma(LemmaIdType lmaId);
bool IsComposingLemma(LemmaIdType lmaId);

int CmpLpiWithPsb(const void *p1, const void *p2);
int CmpLpiWithUnifiedPsb(const void *p1, const void *p2);
int CmpLpiWithId(const void *p1, const void *p2);
int CmpLpiWithHanzi(const void *p1, const void *p2);

int CmpLpsiWithStr(const void *p1, const void *p2);

int CmpHanzis1(const void *p1, const void *p2);
int CmpHanzis2(const void *p1, const void *p2);
int CmpHanzis3(const void *p1, const void *p2);
int CmpHanzis4(const void *p1, const void *p2);
int CmpHanzis5(const void *p1, const void *p2);
int CmpHanzis6(const void *p1, const void *p2);
int CmpHanzis7(const void *p1, const void *p2);
int CmpHanzis8(const void *p1, const void *p2);

int CmpNpreByScore(const void *p1, const void *p2);
int CmpNpreByHislenScore(const void *p1, const void *p2);
int CmpNpreByHanziScore(const void *p1, const void *p2);

size_t RemoveDuplicateNpre(NPredictItem *npreItems, size_t npreNum);

size_t AlignToSizeT(size_t size);

} // namespace ime_pinyin

#endif // PINYINIME_ANDPY_INCLUDE_SEARCHCOMMON_H_
