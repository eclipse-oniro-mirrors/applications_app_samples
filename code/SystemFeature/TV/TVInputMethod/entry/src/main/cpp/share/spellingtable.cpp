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

#include "../include/spellingtable.h"
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "ime_assert.h"
#include "ime_secure.h"
constexpr int K_MAGIC_123 = 123;
constexpr int K_MAGIC_255 = 255;

namespace ime_pinyin {

#ifdef BUILD_MODEL

const char SpellingTable::kNotSupportList[kNotSupportNum][kMaxSpellingSize + 1] = {"HM", "HNG", "NG"};

// "" is the biggest, so that all empty strings will be moved to the end
// _eb mean empty is biggest
int compare_raw_spl_eb(const void *p1, const void *p2)
{
    if ((static_cast<const RawSpelling *>(p1))->str[0] == '\0') {
        return 1;
    }

    if ((static_cast<const RawSpelling *>(p2))->str[0] == '\0') {
        return -1;
    }

    return strcmp((static_cast<const RawSpelling *>(p1))->str, (static_cast<const RawSpelling *>(p2))->str);
}

size_t get_odd_next(size_t value)
{
    size_t v_next = value;
    while (true) {
        size_t v_next_sqrt = (size_t)sqrt(v_next);

        bool is_odd = true;
        for (size_t v_dv = 2; v_dv < v_next_sqrt + 1; v_dv++) {
            if (v_next % v_dv == 0) {
                is_odd = false;
                break;
            }
        }

        if (is_odd) {
            return v_next;
        }

        v_next++;
    }

    // never reach here
    return 0;
}

SpellingTable::SpellingTable()
{
    need_score_ = false;
    raw_spellings_ = nullptr;
    spellingBuf_ = nullptr;
    spellingNum_ = 0;
    total_freq_ = 0;
    frozen_ = true;
}

SpellingTable::~SpellingTable() { FreeResource(); }

size_t SpellingTable::get_hash_pos(const char *spelling_str)
{
    size_t sum = 0;
    for (size_t idx = 0; idx < spellingSize_ && spelling_str[idx] != '\0'; ++idx) {
        sum += static_cast<size_t>(spelling_str[idx]);
    }
    return sum % spelling_max_num_;
}

size_t SpellingTable::hash_pos_next(size_t hash_pos) { return (hash_pos + K_MAGIC_123) % spelling_max_num_; }

void SpellingTable::FreeResource()
{
    if (raw_spellings_ != nullptr) {
        delete[] raw_spellings_;
    }
    raw_spellings_ = nullptr;

    if (spellingBuf_ != nullptr) {
        delete[] spellingBuf_;
    }
    spellingBuf_ = nullptr;
}

bool SpellingTable::init_table(size_t pure_spl_size, size_t spl_max_num, bool need_score)
{
    if (pure_spl_size == 0 || spl_max_num == 0) {
        return false;
    }

    need_score_ = need_score;

    FreeResource();

    spellingSize_ = pure_spl_size + 1;
    if (need_score) {
        spellingSize_ += 1;
    }
    spelling_max_num_ = get_odd_next(spl_max_num);
    spellingNum_ = 0;

    raw_spellings_ = new RawSpelling[spelling_max_num_];
    spellingBuf_ = new char[spelling_max_num_ * (spellingSize_)];
    if (raw_spellings_ == nullptr || spellingBuf_ == nullptr) {
        FreeResource();
        return false;
    }

    ImeMemset(raw_spellings_, spelling_max_num_ * sizeof(RawSpelling), 0, spelling_max_num_ * sizeof(RawSpelling));
    ImeMemset(spellingBuf_, spelling_max_num_ * (spellingSize_), 0, spelling_max_num_ * (spellingSize_));
    frozen_ = false;
    total_freq_ = 0;
    return true;
}

bool SpellingTable::put_spelling(const char *spelling_str, double freq)
{
    if (frozen_ || spelling_str == nullptr) {
        return false;
    }

    // 过滤引擎不支持的拼音串
    for (size_t idx = 0; idx < kNotSupportNum; ++idx) {
        if (strcmp(spelling_str, kNotSupportList[idx]) == 0) {
            return false;
        }
    }

    total_freq_ += freq;

    const size_t key_len = spellingSize_ - 1;
    size_t slot = get_hash_pos(spelling_str);
    const size_t slot_begin = slot;

    // 开放寻址：命中同名项则累加频率，遇到空槽则写入新项
    while (true) {
        RawSpelling &item = raw_spellings_[slot];
        if (strncmp(item.str, spelling_str, key_len) == 0) {
            item.freq += freq;
            return true;
        }
        if (item.str[0] == '\0') {
            item.freq += freq;
            ImeStrncpy(item.str, key_len + 1, spelling_str, key_len);
            item.str[key_len] = '\0';
            spellingNum_++;
            return true;
        }
        slot = hash_pos_next(slot);
        if (slot == slot_begin) {
            return false;
        }
    }
}

bool SpellingTable::contain(const char *spelling_str)
{
    if (spelling_str == nullptr || spellingBuf_ == nullptr || frozen_) {
        return false;
    }

    const size_t key_len = spellingSize_ - 1;
    const size_t slot_begin = get_hash_pos(spelling_str);
    size_t slot = slot_begin;

    // 沿开放寻址链查找：遇到空槽或绕回起点即判定不存在
    do {
        const RawSpelling &item = raw_spellings_[slot];
        if (item.str[0] == '\0') {
            return false;
        }
        if (strncmp(item.str, spelling_str, key_len) == 0) {
            return true;
        }
        slot = hash_pos_next(slot);
    } while (slot != slot_begin);

    return false;
}

const char *SpellingTable::arrange(size_t *itemSize, size_t *spl_num)
{
    if (raw_spellings_ == nullptr || spellingBuf_ == nullptr || itemSize == nullptr || spl_num == nullptr) {
        return nullptr;
    }

    qsort(raw_spellings_, spelling_max_num_, sizeof(RawSpelling), compare_raw_spl_eb);

    // 排序后仅前 spellingNum_ 项有效，逐项拷贝到连续缓冲区
    for (size_t idx = 0; idx < spellingNum_; ++idx) {
        char *dest = spellingBuf_ + idx * spellingSize_;
        ImeStrncpy(dest, spellingSize_ + 1, raw_spellings_[idx].str, spellingSize_);
    }

    if (need_score_) {
        arrange_scores();
    }

    *itemSize = spellingSize_;
    *spl_num = spellingNum_;
    frozen_ = true;
    return spellingBuf_;
}

void SpellingTable::arrange_scores()
{
    if (spellingNum_ == 0) {
        return;
    }

    // 归一化频率并统计最大、最小概率
    double maxScore = 0.0;
    double minScore = 0.0;
    for (size_t idx = 0; idx < spellingNum_; ++idx) {
        RawSpelling &cur = raw_spellings_[idx];
        cur.freq /= total_freq_;
        if (idx == 0) {
            maxScore = cur.freq;
            minScore = cur.freq;
            continue;
        }
        if (cur.freq > maxScore) {
            maxScore = cur.freq;
        }
        if (cur.freq < minScore) {
            minScore = cur.freq;
        }
    }

    scoreAmplifier_ = 1.0 * K_MAGIC_255 / log(minScore);

    // 对数得分量化为单字节，并统计平均分
    double scoreSum = 0.0;
    for (size_t idx = 0; idx < spellingNum_; ++idx) {
        double score = log(raw_spellings_[idx].freq) * scoreAmplifier_;
        ASSERT(score >= 0);
        scoreSum += score;
        if (score > K_MAGIC_255) {
            score = K_MAGIC_255;
        }
        char *splBuf = spellingBuf_ + idx * spellingSize_;
        splBuf[spellingSize_ - 1] = static_cast<char>(static_cast<unsigned char>(score));
    }
    double averageScore = scoreSum / spellingNum_;
    ASSERT(averageScore <= K_MAGIC_255);
    averageScore_ = static_cast<uint8>(averageScore);
}

float SpellingTable::get_score_amplifier() { return static_cast<float>(scoreAmplifier_); }

unsigned char SpellingTable::get_average_score() { return averageScore_; }

#endif // BUILD_MODEL
} // namespace ime_pinyin
