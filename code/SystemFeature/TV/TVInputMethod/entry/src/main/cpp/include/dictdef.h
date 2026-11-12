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

#ifndef PINYINIME_INCLUDE_DICTDEF_H_
#define PINYINIME_INCLUDE_DICTDEF_H_

#include "./utf16char.h"
#include <cstdlib>

namespace ime_pinyin {

// Enable the following line when building the binary dictionary model.

typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;

typedef signed char int8;
typedef short int16;
typedef int int32;
typedef long long int64;
typedef unsigned long long uint64;

const bool K_PRINT_DEBUG0 = false;
const bool K_PRINT_DEBUG1 = false;
const bool K_PRINT_DEBUG2 = false;

// The max length of a lemma.
const size_t K_MAX_LEMMA_SIZE = 8;

// The max length of a Pinyin (spelling).
const size_t K_MAX_PINYIN_SIZE = 6;

// The number of half spelling ids. For Chinese Pinyin, there 30 half ids.
// See SpellingTrie.h for details.
const size_t K_HALF_SPELLING_ID_NUM = 29;

// The maximum number of full spellings. For Chinese Pinyin, there are only
// about 410 spellings.
// If change this value is bigger(needs more bits), please also update
// other structures like SpellingNode, to make sure than a spelling id can be
// stored.
// -1 is because that 0 is never used.
const size_t K_MAX_SPELLING_NUM = 512 - K_HALF_SPELLING_ID_NUM - 1;
const size_t K_MAX_SEARCH_STEPS = 40;

// One character predicts its following characters.
const size_t K_MAX_PREDICT_SIZE = (K_MAX_LEMMA_SIZE - 1);

// LemmaIdType must always be size_t.
typedef size_t LemmaIdType;
const size_t K_LEMMA_ID_SIZE = 3; // Actually, a Id occupies 3 bytes in storage.
const size_t K_LEMMA_ID_COMPOSING = 0xffffff;

typedef uint16 LmaScoreType;
typedef uint16 KeyScoreType;

// Number of items with highest score are kept for prediction purpose.
const size_t K_TOP_SCORE_LEMMA_NUM = 10;

const size_t K_MAX_PREDICT_NUM_BY_GT3 = 1;
const size_t K_MAX_PREDICT_NUM_BY3 = 2;
const size_t K_MAX_PREDICT_NUM_BY2 = 2;

// The last lemma id (included) for the system dictionary. The system
// dictionary's ids always start from 1.
const LemmaIdType K_SYS_DICT_ID_END = 500000;

// The first lemma id for the user dictionary.
const LemmaIdType K_USER_DICT_ID_START = 500001;

// The last lemma id (included) for the user dictionary.
const LemmaIdType K_USER_DICT_ID_END = 600000;

typedef struct {
    uint16 halfSplid : 5;
    uint16 fullSplid : 11;
} SpellingId, *PSpellingId;

/**
 * We use different node types for different layers
 * Statistical data of the building result for a testing dictionary:
 *                              root,   level 0,   level 1,   level 2,   level 3
 * max son num of one node:     406        280         41          2          -
 * max homo num of one node:      0         90         23          2          2
 * total node num of a layer:     1        406      31766      13516        993
 * total homo num of a layer:     9       5674      44609      12667        995
 *
 * The node number for root and level 0 won't be larger than 500
 * According to the information above, two kinds of nodes can be used; one for
 * root and level 0, the other for these layers deeper than 0.
 *
 * LE = less and equal,
 * A node occupies 16 bytes. so, totallly less than 16 * 500 = 8K
 */
struct LmaNodeLE0 {
    uint32 son1stOff;
    uint32 homoIdxBufOff;
    uint16 splIdx;
    uint16 numOfSon;
    uint16 numOfHomo;
};

/**
 * GE = great and equal
 * A node occupies 8 bytes.
 */
struct LmaNodeGE1 {
    uint16 son1stOffL;     // Low bits of the son1stOff
    uint16 homoIdxBufOffL; // Low bits of the homo_idx_buf_off_1
    uint16 splIdx;
    unsigned char numOfSon;       // number of son nodes
    unsigned char numOfHomo;      // number of homo words
    unsigned char son1stOffH;     // high bits of the son1stOff
    unsigned char homoIdxBufOffH; // high bits of the homoIdxBufOff
};

#ifdef BUILD_MODEL
struct SingleCharItem {
    float freq;
    char16 hz;
    SpellingId splid;
};

struct LemmaEntry {
    LemmaIdType idx_by_py;
    LemmaIdType idx_by_hz;
    char16 hanzi_str[K_MAX_LEMMA_SIZE + 1];

    // The SingleCharItem id for each Hanzi.
    uint16 hanzi_scis_ids[K_MAX_LEMMA_SIZE];

    uint16 spl_idx_arr[K_MAX_LEMMA_SIZE + 1];
    char pinyin_str[K_MAX_LEMMA_SIZE][K_MAX_PINYIN_SIZE + 1];
    unsigned char hz_str_len;
    float freq;
};
#endif // BUILD_MODEL

} //  namespace ime_pinyin

#endif // PINYINIME_INCLUDE_DICTDEF_H_
