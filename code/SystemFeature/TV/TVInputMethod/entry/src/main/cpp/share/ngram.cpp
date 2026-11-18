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

#include "../include/ngram.h"
#include "../include/mystdlib.h"
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <ctime>

#include "ime_assert.h"
#include "ime_secure.h"
constexpr double K_MAGIC_0_000000001 = 0.000000001;
constexpr double K_MAGIC_0_3 = 0.3;

namespace ime_pinyin {

#define ADD_COUNT 0.3

int CompDouble(const void *p1, const void *p2)
{
    if (*static_cast<const double *>(p1) < *static_cast<const double *>(p2)) {
        return -1;
    }
    if (*static_cast<const double *>(p1) > *static_cast<const double *>(p2)) {
        return 1;
    }
    return 0;
}

inline double Distance(double freq, double code) { return freq * fabs(log(freq) - log(code)); }

// Find the index of the code value which is nearest to the given freq
int QsearchNearest(double codeBook[], double freq, int start, int end)
{
    if (start == end) {
        return start;
    }

    if (start + end == 1) {
        if (Distance(freq, codeBook[end]) > Distance(freq, codeBook[start])) {
            return start;
        }
        return end;
    }

    int mid = (start + end) / 2;

    if (codeBook[mid] > freq) {
        return QsearchNearest(codeBook, freq, start, mid);
    } else {
        return QsearchNearest(codeBook, freq, mid, end);
    }
}

size_t UpdateCodeIdx(double freqs[], size_t num, double codeBook[], CODEBOOK_TYPE *codeIdx)
{
    size_t changed = 0;
    for (size_t pos = 0; pos < num; pos++) {
        CODEBOOK_TYPE idx = QsearchNearest(codeBook, freqs[pos], 0, K_CODE_BOOK_SIZE - 1);
        if (idx != codeIdx[pos]) {
            changed++;
        }
        codeIdx[pos] = idx;
    }
    return changed;
}

double RecalculateKernel(double freqs[], size_t num, double codeBook[], const CODEBOOK_TYPE *codeIdx)
{
    double ret = 0;

    size_t *itemNum = new size_t[K_CODE_BOOK_SIZE];
    ASSERT(itemNum);
    ImeMemset(itemNum, sizeof(size_t) * K_CODE_BOOK_SIZE, 0, sizeof(size_t) * K_CODE_BOOK_SIZE);

    double *cbNew = new double[K_CODE_BOOK_SIZE];
    ASSERT(cbNew);
    ImeMemset(cbNew, sizeof(double) * K_CODE_BOOK_SIZE, 0, sizeof(double) * K_CODE_BOOK_SIZE);

    for (size_t pos = 0; pos < num; pos++) {
        ret += Distance(freqs[pos], codeBook[codeIdx[pos]]);

        cbNew[codeIdx[pos]] += freqs[pos];
        itemNum[codeIdx[pos]] += 1;
    }

    for (size_t code = 0; code < K_CODE_BOOK_SIZE; code++) {
        ASSERT(itemNum[code] > 0);
        codeBook[code] = cbNew[code] / itemNum[code];
    }

    delete[] itemNum;
    delete[] cbNew;

    return ret;
}

void IterateCodes(double freqs[], size_t num, double codeBook[], CODEBOOK_TYPE *codeIdx)
{
    size_t iterNum = 0;
    double deltaLast = 0;
    bool finished = false;
    while (!finished) {
        size_t changed = UpdateCodeIdx(freqs, num, codeBook, codeIdx);

        double delta = RecalculateKernel(freqs, num, codeBook, codeIdx);

        if (K_PRINT_DEBUG0) {
            printf("---Unigram codebook iteration: %d : %d, %.9f\n", iterNum, changed, delta);
        }
        iterNum++;

        finished = (iterNum > 1 && (delta == 0 || fabs(deltaLast - delta) / fabs(delta) < K_MAGIC_0_000000001));
        if (!finished) {
            deltaLast = delta;
        }
    }
}

NGram *NGram::instance_ = nullptr;

NGram::NGram()
{
    initialized_ = false;
    idxNum_ = 0;
    lmaFreqIdx_ = nullptr;
    sysScoreCompensation_ = 0;

#ifdef BUILD_MODEL
    freq_codes_df_ = nullptr;
#endif
    freqCodes_ = nullptr;
}

NGram::~NGram()
{
    if (lmaFreqIdx_ != nullptr) {
        free(lmaFreqIdx_);
    }

#ifdef BUILD_MODEL
    if (freq_codes_df_ != nullptr) {
        free(freq_codes_df_);
    }
#endif

    if (freqCodes_ != nullptr) {
        free(freqCodes_);
    }
}

NGram &NGram::GetInstance()
{
    if (instance_ == nullptr) {
        instance_ = new NGram();
    }
    return *instance_;
}

bool NGram::SaveNgram(FILE *fp)
{
    if (!initialized_ || fp == nullptr) {
        return false;
    }

    if (idxNum_ == 0 || freqCodes_ == nullptr || lmaFreqIdx_ == nullptr) {
        return false;
    }

    if (fwrite(&idxNum_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (fwrite(freqCodes_, sizeof(LmaScoreType), K_CODE_BOOK_SIZE, fp) != K_CODE_BOOK_SIZE) {
        return false;
    }

    if (fwrite(lmaFreqIdx_, sizeof(CODEBOOK_TYPE), idxNum_, fp) != idxNum_) {
        return false;
    }

    return true;
}

bool NGram::LoadNgram(FILE *fp)
{
    if (fp == nullptr) {
        return false;
    }

    initialized_ = false;

    if (fread(&idxNum_, sizeof(uint32), 1, fp) != 1) {
        return false;
    }

    if (lmaFreqIdx_ != nullptr) {
        free(lmaFreqIdx_);
    }

    if (freqCodes_ != nullptr) {
        free(freqCodes_);
    }

    if (idxNum_ == 0 || idxNum_ > (static_cast<size_t>(-1) / sizeof(CODEBOOK_TYPE))) {
        return false;
    }
    lmaFreqIdx_ = static_cast<CODEBOOK_TYPE *>(malloc(idxNum_ * sizeof(CODEBOOK_TYPE)));
    freqCodes_ = static_cast<LmaScoreType *>(malloc(K_CODE_BOOK_SIZE * sizeof(LmaScoreType)));
    if (lmaFreqIdx_ == nullptr || freqCodes_ == nullptr) {
        return false;
    }

    if (fread(freqCodes_, sizeof(LmaScoreType), K_CODE_BOOK_SIZE, fp) != K_CODE_BOOK_SIZE) {
        return false;
    }

    if (fread(lmaFreqIdx_, sizeof(CODEBOOK_TYPE), idxNum_, fp) != idxNum_) {
        return false;
    }

    initialized_ = true;

    totalFreqNoneSys_ = 0;
    return true;
}

void NGram::SetTotalFreqNoneSys(size_t freqNoneSys)
{
    totalFreqNoneSys_ = freqNoneSys;
    if (totalFreqNoneSys_ == 0) {
        sysScoreCompensation_ = 0;
    } else {
        double factor = static_cast<double>(kSysDictTotalFreq) / (kSysDictTotalFreq + totalFreqNoneSys_);
        sysScoreCompensation_ = static_cast<float>(log(factor) * kLogValueAmplifier);
    }
}

// The caller makes sure this oject is initialized.
float NGram::GetUniPsb(LemmaIdType lmaId)
{
    return static_cast<float>(freqCodes_[lmaFreqIdx_[lmaId]]) + sysScoreCompensation_;
}

float NGram::ConvertPsbToScore(double psb)
{
    float score = static_cast<float>(log(psb) * static_cast<double>(kLogValueAmplifier));
    if (score > static_cast<float>(kMaxScore)) {
        score = static_cast<float>(kMaxScore);
    }
    return score;
}

#ifdef BUILD_MODEL
bool NGram::build_unigram(LemmaEntry *lemma_arr, size_t lemma_num, LemmaIdType next_idx_unused)
{
    if (lemma_arr == nullptr || lemma_num == 0 || next_idx_unused <= 1) {
        return false;
    }

    double totalFreq = 0;
    double *freqs = new double[next_idx_unused];
    if (freqs == nullptr) {
        return false;
    }

    fill_frequencies(freqs, totalFreq, lemma_arr, lemma_num, next_idx_unused);
    normalize_frequencies(freqs, totalFreq);

    // calculate the code book
    if (freq_codes_df_ == nullptr) {
        freq_codes_df_ = new double[K_CODE_BOOK_SIZE];
    }
    ASSERT(freq_codes_df_);
    ImeMemset(freq_codes_df_, sizeof(double) * K_CODE_BOOK_SIZE, 0, sizeof(double) * K_CODE_BOOK_SIZE);

    if (freqCodes_ == nullptr) {
        freqCodes_ = new LmaScoreType[K_CODE_BOOK_SIZE];
    }
    ASSERT(freqCodes_);
    ImeMemset(freqCodes_, sizeof(LmaScoreType) * K_CODE_BOOK_SIZE, 0, sizeof(LmaScoreType) * K_CODE_BOOK_SIZE);

    build_code_book(freqs);

    Myqsort(freq_codes_df_, K_CODE_BOOK_SIZE, sizeof(double), CompDouble);

    if (lmaFreqIdx_ == nullptr) {
        lmaFreqIdx_ = new CODEBOOK_TYPE[idxNum_];
    }
    ASSERT(lmaFreqIdx_);

    IterateCodes(freqs, idxNum_, freq_codes_df_, lmaFreqIdx_);

    delete[] freqs;

    if (K_PRINT_DEBUG0) {
        printf("\n------Language Model Unigram Codebook------\n");
    }

    fill_code_scores();

    initialized_ = true;
    return true;
}

void NGram::fill_frequencies(double freqs[], double &totalFreq, LemmaEntry *lemma_arr, size_t lemma_num,
                             LemmaIdType next_idx_unused)
{
    freqs[0] = ADD_COUNT;
    totalFreq += freqs[0];
    LemmaIdType idx_now = 0;
    for (size_t pos = 0; pos < lemma_num; pos++) {
        if (lemma_arr[pos].idx_by_hz == idx_now) {
            continue;
        }
        idx_now++;
        ASSERT(lemma_arr[pos].idx_by_hz == idx_now);
        freqs[idx_now] = lemma_arr[pos].freq;
        if (freqs[idx_now] <= 0) {
            freqs[idx_now] = K_MAGIC_0_3;
        }
        totalFreq += freqs[idx_now];
    }
    idxNum_ = idx_now + 1;
    ASSERT(idx_now + next_idx_unused == 1);
}

void NGram::normalize_frequencies(double freqs[], double totalFreq)
{
    for (size_t pos = 0; pos < idxNum_; pos++) {
        freqs[pos] = freqs[pos] / totalFreq;
        ASSERT(freqs[pos] > 0);
    }
}

size_t NGram::SkipDuplicateFreq(const double freqs[], size_t freqPos, size_t codePos)
{
    bool found = true;
    while (found) {
        found = false;
        double cand = freqs[freqPos];
        for (size_t i = 0; i < codePos; i++) {
            if (freq_codes_df_[i] == cand) {
                found = true;
                break;
            }
        }
        if (found) {
            freqPos++;
        }
    }
    return freqPos;
}

void NGram::build_code_book(double freqs[])
{
    size_t freq_pos = 0;
    for (size_t code_pos = 0; code_pos < K_CODE_BOOK_SIZE; code_pos++) {
        freq_pos = SkipDuplicateFreq(freqs, freq_pos, code_pos);
        freq_codes_df_[code_pos] = freqs[freq_pos];
        freq_pos++;
    }
}

void NGram::fill_code_scores()
{
    for (size_t code_pos = 0; code_pos < K_CODE_BOOK_SIZE; code_pos++) {
        double log_score = log(freq_codes_df_[code_pos]);
        float final_score = ConvertPsbToScore(freq_codes_df_[code_pos]);
        if (K_PRINT_DEBUG0) {
            printf("code:%d, probability:%.9f, log score:%.3f, final score: %.3f\n", code_pos, freq_codes_df_[code_pos],
                   log_score, final_score);
        }
        freqCodes_[code_pos] = static_cast<LmaScoreType>(final_score);
    }
}
#endif

} // namespace ime_pinyin
