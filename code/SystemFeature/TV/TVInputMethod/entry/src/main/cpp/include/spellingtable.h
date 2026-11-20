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

#ifndef PINYINIME_INCLUDE_SPELLINGTABLE_H_
#define PINYINIME_INCLUDE_SPELLINGTABLE_H_

#include "./dictdef.h"
#include <cstdlib>

namespace ime_pinyin {

#ifdef BUILD_MODEL

const size_t kMaxSpellingSize = K_MAX_PINYIN_SIZE;

typedef struct {
    char str[kMaxSpellingSize + 1];
    double freq;
} RawSpelling, *PRawSpelling;

// This class is used to store the spelling strings
// The length of the input spelling string should be less or equal to the
// spellingSize_ (set by init_table). If the input string is too long,
// we only keep its first spellingSize_ chars.
class SpellingTable {
private:
    static const size_t kNotSupportNum = 3;
    static const char kNotSupportList[kNotSupportNum][kMaxSpellingSize + 1];

    bool need_score_;

    size_t spelling_max_num_;

    RawSpelling *raw_spellings_;

    // Used to store spelling strings. If the spelling table needs to calculate
    // score, an extra char after each spelling string is the score.
    // An item with a lower score has a higher probability.
    char *spellingBuf_;
    size_t spellingSize_;

    double total_freq_;

    size_t spellingNum_;

    double scoreAmplifier_;

    unsigned char averageScore_;

    // If frozen is true, put_spelling() and contain() are not allowed to call.
    bool frozen_;

    size_t get_hash_pos(const char *spelling_str);
    size_t hash_pos_next(size_t hash_pos);
    void FreeResource();

public:
    SpellingTable();
    ~SpellingTable();

    // pure_spl_size is the pure maximum spelling string size. For example,
    // "zhuang" is the longgest item in Pinyin, so pure_spl_size should be 6.
    // spl_max_num is the maximum number of spelling strings to store.
    // need_score is used to indicate whether the caller needs to calculate a
    // score for each spelling.
    bool init_table(size_t pure_spl_size, size_t spl_max_num, bool need_score);

    // Put a spelling string to the table.
    // It always returns false if called after arrange() withtout a new
    // init_table() operation.
    // freq is the spelling's occuring count.
    // If the spelling has been in the table, occuring count will accumulated.
    bool put_spelling(const char *spelling_str, double spl_count);

    // Test whether a spelling string is in the table.
    // It always returns false, when being called after arrange() withtout a new
    // init_table() operation.
    bool contain(const char *spelling_str);

    // Sort the spelling strings and put them from the Begin of the buffer.
    // Return the pointer of the sorted spelling strings.
    // itemSize and spl_num return the item size and number of spelling.
    // Because each spelling uses a '\0' as terminator, the returned itemSize is
    // at least one char longer than the spl_size parameter specified by
    // init_table(). If the table is initialized to calculate score, itemSize
    // will be increased by 1, and current_spl_str[itemSize - 1] stores an
    // unsinged char score.
    // An item with a lower score has a higher probability.
    // Do not call put_spelling() and contains() after arrange().
    const char *arrange(size_t *itemSize, size_t *spl_num);
    void arrange_scores();

    float get_score_amplifier();

    unsigned char get_average_score();
};
#endif // BUILD_MODEL
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_SPELLINGTABLE_H_
