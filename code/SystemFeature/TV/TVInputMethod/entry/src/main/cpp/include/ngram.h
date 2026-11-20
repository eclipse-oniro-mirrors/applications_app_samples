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

#ifndef PINYINIME_INCLUDE_NGRAM_H_
#define PINYINIME_INCLUDE_NGRAM_H_

#include "./dictdef.h"
#include <cstdio>
#include <cstdlib>

namespace ime_pinyin {

typedef unsigned char CODEBOOK_TYPE;

constexpr size_t K_CODE_BOOK_SIZE = 256;

class NGram {
public:
    // The maximum score of a lemma item.
    static const LmaScoreType kMaxScore = 0x3fff;

    // In order to reduce the storage size, the original log value is amplified by
    // kScoreAmplifier, and we use LmaScoreType to store.
    // After this process, an item with a lower score has a higher frequency.
    static const int kLogValueAmplifier = -800;

    // System words' total frequency. It is not the real total frequency, instead,
    // It is only used to adjust system lemmas' scores when the user dictionary's
    // total frequency changes.
    // In this version, frequencies of system lemmas are fixed. We are considering
    // to make them changable in next version.
    static const size_t kSysDictTotalFreq = 100000000;

private:
    static NGram *instance_;

    bool initialized_;
    size_t idxNum_;

    size_t totalFreqNoneSys_;

    // Score compensation for system dictionary lemmas.
    // Because after user adds some user lemmas, the total frequency changes, and
    // we use this value to normalize the score.
    float sysScoreCompensation_;

#ifdef BUILD_MODEL
    double *freq_codes_df_;
    size_t SkipDuplicateFreq(const double freqs[], size_t freqPos, size_t codePos);
#endif
    LmaScoreType *freqCodes_;
    CODEBOOK_TYPE *lmaFreqIdx_;

public:
    NGram();
    ~NGram();

    static NGram &GetInstance();

    bool SaveNgram(FILE *fp);
    bool LoadNgram(FILE *fp);

    // Set the total frequency of all none system dictionaries.
    void SetTotalFreqNoneSys(size_t freqNoneSys);

    float GetUniPsb(LemmaIdType lmaId);

    // Convert a probability to score. Actually, the score will be limited to
    // kMaxScore, but at runtime, we also need float expression to get accurate
    // value of the score.
    // After the conversion, a lower score indicates a higher probability of the
    // item.
    static float ConvertPsbToScore(double psb);

#ifdef BUILD_MODEL
    // For constructing the unigram mode model.
    bool build_unigram(LemmaEntry *lemma_arr, size_t num, LemmaIdType next_idx_unused);
    void fill_frequencies(double freqs[], double &totalFreq, LemmaEntry *lemma_arr, size_t lemma_num,
                          LemmaIdType next_idx_unused);
    void normalize_frequencies(double freqs[], double totalFreq);
    void build_code_book(double freqs[]);
    void fill_code_scores();
#endif
};
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_NGRAM_H_
