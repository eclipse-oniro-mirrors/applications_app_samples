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

#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "../include/dictbuilder.h"
#include "../include/dicttrie.h"
#include "../include/mystdlib.h"
#include "../include/ngram.h"
#include "../include/searchutility.h"
#include "../include/spellingtable.h"
#include "../include/spellingtrie.h"
#include "../include/splparser.h"
#include "../include/utf16reader.h"

#include "ime_assert.h"
#include "ime_secure.h"
constexpr double K_MAGIC_0_000001 = 0.000001;
constexpr int K_MAGIC_10 = 10;
constexpr int K_MAGIC_16 = 16;
constexpr int K_MAGIC_2 = 2;
constexpr int K_MAGIC_240000 = 240000;
constexpr int K_MAGIC_255 = 255;
constexpr int K_MAGIC_4 = 4;
constexpr int K_MAGIC_60 = 60;
constexpr int K_MAGIC_65535 = 65535;
constexpr int K_MAGIC_8 = 8;

namespace ime_pinyin {

#ifdef BUILD_MODEL

static const size_t kReadBufLen = 512;
static const size_t kSplTableHashLen = 2000;

// Compare a SingleCharItem, first by Hanzis, then by spelling ids, then by
// frequencies.
int cmp_scis_hz_splid_freq(const void *p1, const void *p2)
{
    const SingleCharItem *s1;
    const SingleCharItem *s2;
    s1 = static_cast<const SingleCharItem *>(p1);
    s2 = static_cast<const SingleCharItem *>(p2);

    if (s1->hz < s2->hz) {
        return -1;
    }
    if (s1->hz > s2->hz) {
        return 1;
    }

    if (s1->splid.halfSplid < s2->splid.halfSplid) {
        return -1;
    }
    if (s1->splid.halfSplid > s2->splid.halfSplid) {
        return 1;
    }

    if (s1->splid.fullSplid < s2->splid.fullSplid) {
        return -1;
    }
    if (s1->splid.fullSplid > s2->splid.fullSplid) {
        return 1;
    }

    if (s1->freq > s2->freq) {
        return -1;
    }
    if (s1->freq < s2->freq) {
        return 1;
    }
    return 0;
}

int cmp_scis_hz_splid(const void *p1, const void *p2)
{
    const SingleCharItem *s1;
    const SingleCharItem *s2;
    s1 = static_cast<const SingleCharItem *>(p1);
    s2 = static_cast<const SingleCharItem *>(p2);

    if (s1->hz < s2->hz) {
        return -1;
    }
    if (s1->hz > s2->hz) {
        return 1;
    }

    if (s1->splid.halfSplid < s2->splid.halfSplid) {
        return -1;
    }
    if (s1->splid.halfSplid > s2->splid.halfSplid) {
        return 1;
    }

    if (s1->splid.fullSplid < s2->splid.fullSplid) {
        return -1;
    }
    if (s1->splid.fullSplid > s2->splid.fullSplid) {
        return 1;
    }

    return 0;
}

int cmp_lemma_entry_hzs(const void *p1, const void *p2)
{
    size_t size1 = Utf16Strlen(((const LemmaEntry *)p1)->hanzi_str);
    size_t size2 = Utf16Strlen(((const LemmaEntry *)p2)->hanzi_str);
    if (size1 < size2) {
        return -1;
    } else if (size1 > size2) {
        return 1;
    }

    return Utf16Strcmp(((const LemmaEntry *)p1)->hanzi_str, ((const LemmaEntry *)p2)->hanzi_str);
}

int compare_char16(const void *p1, const void *p2)
{
    if (*((const char16 *)p1) < *((const char16 *)p2)) {
        return -1;
    }
    if (*((const char16 *)p1) > *((const char16 *)p2)) {
        return 1;
    }
    return 0;
}

int compare_py(const void *p1, const void *p2)
{
    int ret = Utf16Strcmp(((const LemmaEntry *)p1)->spl_idx_arr, ((const LemmaEntry *)p2)->spl_idx_arr);
    if (ret != 0) {
        return ret;
    }

    return static_cast<int>(((const LemmaEntry *)p2)->freq) - static_cast<int>(((const LemmaEntry *)p1)->freq);
}

// First hanzi, if the same, then Pinyin
int cmp_lemma_entry_hzspys(const void *p1, const void *p2)
{
    size_t size1 = Utf16Strlen(((const LemmaEntry *)p1)->hanzi_str);
    size_t size2 = Utf16Strlen(((const LemmaEntry *)p2)->hanzi_str);
    if (size1 < size2) {
        return -1;
    } else if (size1 > size2) {
        return 1;
    }
    int ret = Utf16Strcmp(((const LemmaEntry *)p1)->hanzi_str, ((const LemmaEntry *)p2)->hanzi_str);
    if (ret != 0) {
        return ret;
    }

    ret = Utf16Strcmp(((const LemmaEntry *)p1)->spl_idx_arr, ((const LemmaEntry *)p2)->spl_idx_arr);
    return ret;
}

int compare_splid2(const void *p1, const void *p2)
{
    int ret = Utf16Strcmp(((const LemmaEntry *)p1)->spl_idx_arr, ((const LemmaEntry *)p2)->spl_idx_arr);
    return ret;
}

DictBuilder::DictBuilder()
{
    lemma_arr_ = nullptr;
    lemma_num_ = 0;

    scis_ = nullptr;
    scisNum_ = 0;

    lma_nodes_le0_ = nullptr;
    lma_nodes_ge1_ = nullptr;

    lma_nds_used_num_le0_ = 0;
    lma_nds_used_num_ge1_ = 0;

    homo_idx_buf_ = nullptr;
    homo_idx_num_eq1_ = 0;
    homo_idx_num_gt1_ = 0;

    top_lmas_ = nullptr;
    topLmasNum_ = 0;

    spl_table_ = nullptr;
    splParser_ = nullptr;
}

DictBuilder::~DictBuilder() { FreeResource(); }

bool DictBuilder::AllocResource(size_t lmaNum)
{
    if (lmaNum == 0) {
        return false;
    }

    FreeResource();

    lemma_num_ = lmaNum;
    lemma_arr_ = new LemmaEntry[lemma_num_];

    topLmasNum_ = 0;
    top_lmas_ = new LemmaEntry[K_TOP_SCORE_LEMMA_NUM];

    // New the scis_ buffer to the possible maximum size.
    scisNum_ = lemma_num_ * K_MAX_LEMMA_SIZE;
    scis_ = new SingleCharItem[scisNum_];

    // The root and first level nodes is less than K_MAX_SPELLING_NUM + 1
    lma_nds_used_num_le0_ = 0;
    lma_nodes_le0_ = new LmaNodeLE0[K_MAX_SPELLING_NUM + 1];

    // Other nodes is less than lemma_num
    lma_nds_used_num_ge1_ = 0;
    lma_nodes_ge1_ = new LmaNodeGE1[lemma_num_];

    homo_idx_buf_ = new LemmaIdType[lemma_num_];
    spl_table_ = new SpellingTable();
    splParser_ = new SpellingParser();

    if (lemma_arr_ == nullptr || top_lmas_ == nullptr || scis_ == nullptr || spl_table_ == nullptr ||
        splParser_ == nullptr || lma_nodes_le0_ == nullptr || lma_nodes_ge1_ == nullptr || homo_idx_buf_ == nullptr) {
        FreeResource();
        return false;
    }

    ImeMemset(lemma_arr_, sizeof(LemmaEntry) * lemma_num_, 0, sizeof(LemmaEntry) * lemma_num_);
    ImeMemset(scis_, sizeof(SingleCharItem) * scisNum_, 0, sizeof(SingleCharItem) * scisNum_);
    ImeMemset(lma_nodes_le0_, sizeof(LmaNodeLE0) * (K_MAX_SPELLING_NUM + 1), 0,
              sizeof(LmaNodeLE0) * (K_MAX_SPELLING_NUM + 1));
    ImeMemset(lma_nodes_ge1_, sizeof(LmaNodeGE1) * lemma_num_, 0, sizeof(LmaNodeGE1) * lemma_num_);
    ImeMemset(homo_idx_buf_, sizeof(LemmaIdType) * lemma_num_, 0, sizeof(LemmaIdType) * lemma_num_);
    spl_table_->init_table(K_MAX_PINYIN_SIZE, kSplTableHashLen, true);

    return true;
}

char16 *DictBuilder::read_valid_hanzis(const char *fn_validhzs, size_t *num)
{
    if (fn_validhzs == nullptr || num == nullptr) {
        return nullptr;
    }

    *num = 0;
    FILE *fp = fopen(fn_validhzs, "rb");
    if (fp == nullptr) {
        return nullptr;
    }

    char16 utf16header;
    if (fread(&utf16header, sizeof(char16), 1, fp) != 1 || 0xfeff != utf16header) {
        (void)fclose(fp);
        return nullptr;
    }

    (void)fseek(fp, 0, SEEK_END);
    *num = ftell(fp) / sizeof(char16);
    ASSERT(*num >= 1);
    *num -= 1;

    char16 *hzs = new char16[*num];
    if (hzs == nullptr) {
        (void)fclose(fp);
        return nullptr;
    }

    (void)fseek(fp, K_MAGIC_2, SEEK_SET);

    if (fread(hzs, sizeof(char16), *num, fp) != *num) {
        (void)fclose(fp);
        delete[] hzs;
        return nullptr;
    }
    (void)fclose(fp);

    Myqsort(hzs, *num, sizeof(char16), compare_char16);
    return hzs;
}

bool DictBuilder::hz_in_hanzis_list(const char16 *hzs, size_t hzsLen, char16 hz)
{
    if (hzs == nullptr) {
        return false;
    }

    char16 *found = static_cast<char16 *>(Mybsearch(&hz, hzs, hzsLen, sizeof(char16), compare_char16));
    if (found == nullptr) {
        return false;
    }

    ASSERT(*found == hz);
    return true;
}

// The caller makes sure that the parameters are valid.
bool DictBuilder::str_in_hanzis_list(const char16 *hzs, size_t hzsLen, const char16 *str, size_t strLen)
{
    if (hzs == nullptr || str == nullptr) {
        return false;
    }

    for (size_t pos = 0; pos < strLen; pos++) {
        if (!hz_in_hanzis_list(hzs, hzsLen, str[pos])) {
            return false;
        }
    }
    return true;
}

void DictBuilder::InsertTopLemma(const LemmaEntry &newLemma)
{
    if (topLmasNum_ > K_TOP_SCORE_LEMMA_NUM) {
        topLmasNum_ += 1;
    }

    size_t move_pos = topLmasNum_ - 1;
    for (; move_pos > 0; move_pos--) {
        top_lmas_[move_pos] = top_lmas_[move_pos - 1];
        if (move_pos - 1 == 0 || (move_pos - 0 > 1 && top_lmas_[move_pos - K_MAGIC_2].freq > newLemma.freq)) {
            break;
        }
    }
    ASSERT(move_pos > 0);
    top_lmas_[move_pos - 1] = newLemma;
}

void DictBuilder::get_top_lemmas()
{
    topLmasNum_ = 0;
    if (lemma_arr_ == nullptr) {
        return;
    }

    for (size_t pos = 0; pos < lemma_num_; pos++) {
        if (topLmasNum_ == 0) {
            top_lmas_[0] = lemma_arr_[pos];
            topLmasNum_ = 1;
        } else if (lemma_arr_[pos].freq > top_lmas_[topLmasNum_ - 1].freq) {
            InsertTopLemma(lemma_arr_[pos]);
        } else if (topLmasNum_ > K_TOP_SCORE_LEMMA_NUM) {
            top_lmas_[topLmasNum_] = lemma_arr_[pos];
            topLmasNum_ += 1;
        }
    }

    if (K_PRINT_DEBUG0) {
        printf("\n------Top Lemmas------------------\n");
        for (size_t pos = 0; pos < topLmasNum_; pos++) {
            printf("--%d, idx:%06d, score:%.5f\n", pos, top_lmas_[pos].idx_by_hz, top_lmas_[pos].freq);
        }
    }
}

void DictBuilder::FreeResource()
{
    if (lemma_arr_ != nullptr) {
        delete[] lemma_arr_;
    }

    if (scis_ != nullptr) {
        delete[] scis_;
    }

    if (lma_nodes_le0_ != nullptr) {
        delete[] lma_nodes_le0_;
    }

    if (lma_nodes_ge1_ != nullptr) {
        delete[] lma_nodes_ge1_;
    }

    if (homo_idx_buf_ != nullptr) {
        delete[] homo_idx_buf_;
    }

    if (spl_table_ != nullptr) {
        delete spl_table_;
    }

    if (splParser_ != nullptr) {
        delete splParser_;
    }

    lemma_arr_ = nullptr;
    scis_ = nullptr;
    lma_nodes_le0_ = nullptr;
    lma_nodes_ge1_ = nullptr;
    homo_idx_buf_ = nullptr;
    spl_table_ = nullptr;
    splParser_ = nullptr;

    lemma_num_ = 0;
    lma_nds_used_num_le0_ = 0;
    lma_nds_used_num_ge1_ = 0;
    homo_idx_num_eq1_ = 0;
    homo_idx_num_gt1_ = 0;
}

constexpr int K_RAW_KEEP = 1;
constexpr int K_RAW_DISCARD = 0;
constexpr int K_RAW_EOF = -1;
constexpr int K_RAW_ERROR = -2;

bool DictBuilder::CheckValidHanzi(const char16 *valid_hzs, size_t valid_hzs_num, size_t idx, int gbk_flag)
{
    if (valid_hzs == nullptr || valid_hzs_num == 0) {
        return gbk_flag == 0;
    }
    return str_in_hanzis_list(valid_hzs, valid_hzs_num, lemma_arr_[idx].hanzi_str, lemma_arr_[idx].hz_str_len);
}

int DictBuilder::ParseSpellings(size_t idx, char16 *to_tokenize)
{
    bool spelling_not_support = false;
    size_t hz_len = static_cast<size_t>(lemma_arr_[idx].hz_str_len);
    for (size_t hz_pos = 0; hz_pos < hz_len; hz_pos++) {
        size_t tokenSize;
        char16 *token = Utf16Strtok(to_tokenize, &tokenSize, &to_tokenize);
        if (token == nullptr) {
            return -1;
        }

        ASSERT(Utf16Strlen(token) <= K_MAX_PINYIN_SIZE);

        Utf16StrcpyTochar(lemma_arr_[idx].pinyin_str[hz_pos], token);

        format_spelling_str(lemma_arr_[idx].pinyin_str[hz_pos]);

        // Put the pinyin to the spelling table
        if (!spl_table_->put_spelling(lemma_arr_[idx].pinyin_str[hz_pos], lemma_arr_[idx].freq)) {
            spelling_not_support = true;
            break;
        }
    }
    return spelling_not_support ? 0 : 1;
}

int DictBuilder::ParseRawLemma(Utf16Reader &reader, char16 *readBuf, const char16 *valid_hzs, size_t valid_hzs_num,
                               size_t idx)
{
    if (!reader.Readline(readBuf, kReadBufLen)) {
        return K_RAW_EOF;
    }

    size_t tokenSize;
    char16 *to_tokenize = readBuf;

    // Get the Hanzi string
    char16 *token = Utf16Strtok(to_tokenize, &tokenSize, &to_tokenize);
    if (token == nullptr) {
        return K_RAW_ERROR;
    }

    size_t lemmaSize = Utf16Strlen(token);
    if (lemmaSize > K_MAX_LEMMA_SIZE || lemmaSize > K_MAGIC_4) {
        return K_RAW_DISCARD;
    }

    // Copy to the lemma entry
    Utf16Strcpy(lemma_arr_[idx].hanzi_str, token);
    lemma_arr_[idx].hz_str_len = tokenSize;

    // Get the freq string
    token = Utf16Strtok(to_tokenize, &tokenSize, &to_tokenize);
    if (token == nullptr) {
        return K_RAW_ERROR;
    }
    lemma_arr_[idx].freq = Utf16Atof(token);

    if (lemmaSize > 1 && lemma_arr_[idx].freq < K_MAGIC_60) {
        return K_RAW_DISCARD;
    }

    // Get GBK mark
    token = Utf16Strtok(to_tokenize, &tokenSize, &to_tokenize);
    ASSERT(token != nullptr);
    if (!CheckValidHanzi(valid_hzs, valid_hzs_num, idx, Utf16Atoi(token))) {
        return K_RAW_DISCARD;
    }

    int spelling_result = ParseSpellings(idx, to_tokenize);
    if (spelling_result < 0) {
        return K_RAW_ERROR;
    }
    if (spelling_result == 0) {
        return K_RAW_DISCARD;
    }

    // The whole line must have been parsed fully, otherwise discard this one.
    token = Utf16Strtok(to_tokenize, &tokenSize, &to_tokenize);
    return token == nullptr ? K_RAW_KEEP : K_RAW_DISCARD;
}

size_t DictBuilder::read_raw_dict(const char *fn_raw, const char *fn_validhzs, size_t max_item)
{
    if (fn_raw == nullptr) {
        return 0;
    }

    Utf16Reader utf16_reader;
    if (!utf16_reader.Open(fn_raw, kReadBufLen * K_MAGIC_10)) {
        return false;
    }

    char16 readBuf[kReadBufLen];

    // Read the number of lemmas in the file
    size_t lemma_num = 240000;

    // allocate resource required
    if (!AllocResource(lemma_num)) {
        utf16_reader.Close();
    }

    // Read the valid Hanzi list.
    char16 *valid_hzs = nullptr;
    size_t valid_hzs_num = 0;
    valid_hzs = read_valid_hanzis(fn_validhzs, &valid_hzs_num);

    // Begin reading the lemma entries
    for (size_t i = 0; i < max_item;) {
        int result = ParseRawLemma(utf16_reader, readBuf, valid_hzs, valid_hzs_num, i);
        if (result == K_RAW_EOF) {
            lemma_num = i;
            break;
        }
        if (result == K_RAW_ERROR) {
            FreeResource();
            utf16_reader.Close();
            return false;
        }
        if (result == K_RAW_DISCARD) {
            continue;
        }
        i++;
    }

    delete[] valid_hzs;
    utf16_reader.Close();

    printf("read succesfully, lemma num: %d\n", lemma_num);

    return lemma_num;
}

bool DictBuilder::InitSpellingTree()
{
    // Arrange the spelling table, and build a spelling tree
    size_t spl_item_size;
    size_t spl_num;
    const char *spl_buf = spl_table_->arrange(&spl_item_size, &spl_num);
    if (spl_buf == nullptr) {
        FreeResource();
        return false;
    }

    SpellingTrie &splTrie = SpellingTrie::GetInstance();

    if (!splTrie.Construct(spl_buf, spl_item_size, spl_num, spl_table_->get_score_amplifier(),
                           spl_table_->get_average_score())) {
        FreeResource();
        return false;
    }

    printf("spelling tree Construct successfully.\n");
    return true;
}

void DictBuilder::MoveDataToTrie(DictTrie *dict_trie)
{
    // Move the node data and homo data to the DictTrie
    dict_trie->root_ = new LmaNodeLE0[lma_nds_used_num_le0_];
    dict_trie->nodesGe1_ = new LmaNodeGE1[lma_nds_used_num_ge1_];
    size_t lma_idx_num = homo_idx_num_eq1_ + homo_idx_num_gt1_ + topLmasNum_;
    dict_trie->lmaIdxBuf_ = new unsigned char[lma_idx_num * K_LEMMA_ID_SIZE];
    ASSERT(dict_trie->root_ != nullptr);
    ASSERT(dict_trie->lmaIdxBuf_ != nullptr);
    dict_trie->lmaNodeNumLe0_ = lma_nds_used_num_le0_;
    dict_trie->lmaNodeNumGe1_ = lma_nds_used_num_ge1_;
    dict_trie->lmaIdxBufLen_ = lma_idx_num * K_LEMMA_ID_SIZE;
    dict_trie->topLmasNum_ = topLmasNum_;

    ImeMemcpy(dict_trie->root_, sizeof(LmaNodeLE0) * lma_nds_used_num_le0_, lma_nodes_le0_,
              sizeof(LmaNodeLE0) * lma_nds_used_num_le0_);
    ImeMemcpy(dict_trie->nodesGe1_, sizeof(LmaNodeGE1) * lma_nds_used_num_ge1_, lma_nodes_ge1_,
              sizeof(LmaNodeGE1) * lma_nds_used_num_ge1_);

    for (size_t pos = 0; pos < homo_idx_num_eq1_ + homo_idx_num_gt1_; pos++) {
        id_to_charbuf(dict_trie->lmaIdxBuf_ + pos * K_LEMMA_ID_SIZE, homo_idx_buf_[pos]);
    }

    for (size_t pos = homo_idx_num_eq1_ + homo_idx_num_gt1_; pos < lma_idx_num; pos++) {
        LemmaIdType idx = top_lmas_[pos - homo_idx_num_eq1_ - homo_idx_num_gt1_].idx_by_hz;
        id_to_charbuf(dict_trie->lmaIdxBuf_ + pos * K_LEMMA_ID_SIZE, idx);
    }

    if (K_PRINT_DEBUG0) {
        printf("homo_idx_num_eq1_: %d\n", homo_idx_num_eq1_);
        printf("homo_idx_num_gt1_: %d\n", homo_idx_num_gt1_);
        printf("topLmasNum_: %d\n", topLmasNum_);
    }
}

void DictBuilder::ConvertSpellingsToIdxs()
{
    SpellingTrie &splTrie = SpellingTrie::GetInstance();

    for (size_t i = 0; i < lemma_num_; i++) {
        for (size_t hz_pos = 0; hz_pos < (size_t)lemma_arr_[i].hz_str_len; hz_pos++) {
            uint16 spl_idxs[2];
            uint16 spl_start_pos[3];
            bool isPre = true;
            SplStr splStr = {lemma_arr_[i].pinyin_str[hz_pos],
                             static_cast<uint16>(strlen(lemma_arr_[i].pinyin_str[hz_pos]))};
            SpellIdxBuf idxBuf = {spl_idxs, spl_start_pos};
            int spl_idx_num = splParser_->SplstrToIdxs(splStr, idxBuf, 2, isPre);
            ASSERT(spl_idx_num == 1);

            if (splTrie.IsHalfId(spl_idxs[0])) {
                uint16 num = splTrie.HalfToFull(spl_idxs[0], spl_idxs);
                ASSERT(num != 0);
            }
            lemma_arr_[i].spl_idx_arr[hz_pos] = spl_idxs[0];
        }
    }
}

bool DictBuilder::build_dict(const char *fn_raw, const char *fn_validhzs, DictTrie *dict_trie)
{
    if (fn_raw == nullptr || dict_trie == nullptr) {
        return false;
    }

    lemma_num_ = read_raw_dict(fn_raw, fn_validhzs, K_MAGIC_240000);
    if (lemma_num_ == 0) {
        return false;
    }

    if (!InitSpellingTree()) {
        return false;
    }

    // Convert the spelling string to idxs
    ConvertSpellingsToIdxs();

    // Sort the lemma items according to the hanzi, and give each unique item a
    // id
    sort_lemmas_by_hz();

    scisNum_ = build_scis();

    // Construct the dict list
    dict_trie->dictList_ = new DictList();
    bool dl_success = dict_trie->dictList_->init_list(scis_, scisNum_, lemma_arr_, lemma_num_);
    ASSERT(dl_success);

    // Construct the NGram information
    NGram &ngram = NGram::GetInstance();
    ngram.build_unigram(lemma_arr_, lemma_num_, lemma_arr_[lemma_num_ - 1].idx_by_hz + 1);

    // sort the lemma items according to the spelling idx string
    Myqsort(lemma_arr_, lemma_num_, sizeof(LemmaEntry), compare_py);

    get_top_lemmas();

#ifdef DO_STATISTICS
    stat_init();
#endif

    lma_nds_used_num_le0_ = 1; // The root node
    bool dt_success = construct_subset(static_cast<void *>(lma_nodes_le0_), lemma_arr_, 0, lemma_num_, 0);
    if (!dt_success) {
        FreeResource();
        return false;
    }

#ifdef DO_STATISTICS
    stat_print();
#endif

    MoveDataToTrie(dict_trie);

    FreeResource();

    if (K_PRINT_DEBUG0) {
        printf("Building dict succeds\n");
    }
    return dt_success;
}

void DictBuilder::id_to_charbuf(unsigned char *buf, LemmaIdType id)
{
    if (buf == nullptr) {
        return;
    }
    for (size_t pos = 0; pos < K_LEMMA_ID_SIZE; pos++) {
        (buf)[pos] = (unsigned char)(id >> (pos * K_MAGIC_8));
    }
}

void DictBuilder::set_son_offset(LmaNodeGE1 *node, size_t offset)
{
    node->son1stOffL = static_cast<uint16>(offset);
    node->son1stOffH = static_cast<unsigned char>(offset >> K_MAGIC_16);
}

void DictBuilder::set_homo_id_buf_offset(LmaNodeGE1 *node, size_t offset)
{
    node->homoIdxBufOffL = static_cast<uint16>(offset);
    node->homoIdxBufOffH = static_cast<unsigned char>(offset >> K_MAGIC_16);
}

// All spelling strings will be converted to upper case, except that
// spellings started with "ZH"/"CH"/"SH" will be converted to
// "Zh"/"Ch"/"Sh"
void DictBuilder::format_spelling_str(char *spl_str)
{
    if (spl_str == nullptr) {
        return;
    }

    uint16 pos = 0;
    while (spl_str[pos] != '\0') {
        if (spl_str[pos] >= 'a' && spl_str[pos] <= 'z') {
            spl_str[pos] = spl_str[pos] - 'a' + 'A';
        }

        if (pos == 1 && spl_str[pos] == 'H') {
            if (spl_str[0] == 'C' || spl_str[0] == 'S' || spl_str[0] == 'Z') {
                spl_str[pos] = 'h';
            }
        }
        pos++;
    }
}

LemmaIdType DictBuilder::sort_lemmas_by_hz()
{
    if (lemma_arr_ == nullptr || lemma_num_ == 0) {
        return 0;
    }

    Myqsort(lemma_arr_, lemma_num_, sizeof(LemmaEntry), cmp_lemma_entry_hzs);

    lemma_arr_[0].idx_by_hz = 1;
    LemmaIdType idx_max = 1;
    for (size_t i = 1; i < lemma_num_; i++) {
        if (Utf16Strcmp(lemma_arr_[i].hanzi_str, lemma_arr_[i - 1].hanzi_str)) {
            idx_max++;
            lemma_arr_[i].idx_by_hz = idx_max;
        } else {
            idx_max++;
            lemma_arr_[i].idx_by_hz = idx_max;
        }
    }
    return idx_max + 1;
}

void DictBuilder::CopyHanzisToScis()
{
    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    for (size_t pos = 0; pos < lemma_num_; pos++) {
        size_t hz_num = lemma_arr_[pos].hz_str_len;
        for (size_t hzpos = 0; hzpos < hz_num; hzpos++) {
            scis_[scisNum_].hz = lemma_arr_[pos].hanzi_str[hzpos];
            scis_[scisNum_].splid.fullSplid = lemma_arr_[pos].spl_idx_arr[hzpos];
            scis_[scisNum_].splid.halfSplid = splTrie.FullToHalf(scis_[scisNum_].splid.fullSplid);
            if (hz_num == 1) {
                scis_[scisNum_].freq = lemma_arr_[pos].freq;
            } else {
                scis_[scisNum_].freq = K_MAGIC_0_000001;
            }
            scisNum_++;
        }
    }
}

void DictBuilder::UpdateLemmaScisIds(size_t uniqueScisNum)
{
    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    for (size_t pos = 0; pos < lemma_num_; pos++) {
        size_t hz_num = lemma_arr_[pos].hz_str_len;
        for (size_t hzpos = 0; hzpos < hz_num; hzpos++) {
            SingleCharItem key;
            key.hz = lemma_arr_[pos].hanzi_str[hzpos];
            key.splid.fullSplid = lemma_arr_[pos].spl_idx_arr[hzpos];
            key.splid.halfSplid = splTrie.FullToHalf(key.splid.fullSplid);

            SingleCharItem *found = static_cast<SingleCharItem *>(
                Mybsearch(&key, scis_, uniqueScisNum, sizeof(SingleCharItem), cmp_scis_hz_splid));

            ASSERT(found);

            lemma_arr_[pos].hanzi_scis_ids[hzpos] = static_cast<uint16>(found - scis_);
            lemma_arr_[pos].spl_idx_arr[hzpos] = found->splid.fullSplid;
        }
    }
}

size_t DictBuilder::build_scis()
{
    if (scis_ == nullptr || lemma_num_ * scisNum_ > K_MAX_LEMMA_SIZE) {
        return 0;
    }

    SpellingTrie &splTrie = SpellingTrie::GetInstance();

    // This first one is blank, because id 0 is invalid.
    scis_[0].freq = 0;
    scis_[0].hz = 0;
    scis_[0].splid.fullSplid = 0;
    scis_[0].splid.halfSplid = 0;
    scisNum_ = 1;

    // Copy the hanzis to the buffer
    CopyHanzisToScis();

    Myqsort(scis_, scisNum_, sizeof(SingleCharItem), cmp_scis_hz_splid_freq);

    // Remove repeated items
    size_t unique_scis_num = 1;
    for (size_t pos = 1; pos < scisNum_; pos++) {
        if (scis_[pos].hz == scis_[pos - 1].hz && scis_[pos].splid.fullSplid == scis_[pos - 1].splid.fullSplid) {
            continue;
        }
        scis_[unique_scis_num] = scis_[pos];
        scis_[unique_scis_num].splid.halfSplid = splTrie.FullToHalf(scis_[pos].splid.fullSplid);
        unique_scis_num++;
    }

    scisNum_ = unique_scis_num;

    // Update the lemma list.
    UpdateLemmaScisIds(unique_scis_num);

    return scisNum_;
}

size_t DictBuilder::CountSubsetSons(LemmaEntry *lemma_arr, size_t itemStart, size_t itemEnd, size_t level)
{
    size_t parent_son_num = 1;
    LemmaEntry *lma_last_start = lemma_arr_ + itemStart;
    uint16 spl_idx_node = lma_last_start->spl_idx_arr[level];
    for (size_t i = itemStart + 1; i < itemEnd; i++) {
        LemmaEntry *lma_current = lemma_arr + i;
        uint16 spl_idx_current = lma_current->spl_idx_arr[level];
        if (spl_idx_current != spl_idx_node) {
            parent_son_num++;
            spl_idx_node = spl_idx_current;
        }
    }
    return parent_son_num;
}

void DictBuilder::SetupParentInfo(void *parent, size_t level, size_t parentSonNum, LmaNodeLE0 *&sonFirstLe0,
                                  LmaNodeGE1 *&sonFirstGe1)
{
    if (level == 0) {
        static_cast<LmaNodeLE0 *>(parent)->son1stOff = lma_nds_used_num_le0_;
        sonFirstLe0 = lma_nodes_le0_ + lma_nds_used_num_le0_;
        lma_nds_used_num_le0_ += parentSonNum;
        ASSERT(parentSonNum <= K_MAGIC_65535);
        static_cast<LmaNodeLE0 *>(parent)->numOfSon = static_cast<uint16>(parentSonNum);
    } else if (level == 1) {
        static_cast<LmaNodeLE0 *>(parent)->son1stOff = lma_nds_used_num_ge1_;
        sonFirstGe1 = lma_nodes_ge1_ + lma_nds_used_num_ge1_;
        lma_nds_used_num_ge1_ += parentSonNum;
        ASSERT(parentSonNum <= K_MAGIC_65535);
        static_cast<LmaNodeLE0 *>(parent)->numOfSon = static_cast<uint16>(parentSonNum);
    } else {
        set_son_offset(static_cast<LmaNodeGE1 *>(parent), lma_nds_used_num_ge1_);
        sonFirstGe1 = lma_nodes_ge1_ + lma_nds_used_num_ge1_;
        lma_nds_used_num_ge1_ += parentSonNum;
        ASSERT(parentSonNum <= K_MAGIC_255);
        static_cast<LmaNodeGE1 *>(parent)->numOfSon = (unsigned char)parentSonNum;
    }
}

void DictBuilder::FillHomophony(LmaNodeLE0 *nodeLe0, LmaNodeGE1 *nodeGe1, size_t level, size_t homoNum,
                                size_t itemStartNext, LemmaEntry *lemma_arr)
{
    if (homoNum == 0) {
        return;
    }
    LemmaIdType *idx_buf = homo_idx_buf_ + homo_idx_num_eq1_ + homo_idx_num_gt1_ - homoNum;
    if (level == 0) {
        ASSERT(homoNum <= K_MAGIC_65535);
        nodeLe0->numOfHomo = static_cast<uint16>(homoNum);
    } else {
        ASSERT(homoNum <= K_MAGIC_255);
        nodeGe1->numOfHomo = (unsigned char)homoNum;
    }

    for (size_t homoPos = 0; homoPos < homoNum; homoPos++) {
        idx_buf[homoPos] = lemma_arr[itemStartNext + homoPos].idx_by_hz;
    }

#ifdef DO_STATISTICS
    if (homoNum > max_homobuf_len_[level]) {
        max_homobuf_len_[level] = homoNum;
    }
    total_homo_num_[level] += homoNum;
#endif
}

bool DictBuilder::ConstructSonNode(size_t level, size_t sonPos, uint16 splIdxNode, size_t homoNum, size_t itemStartNext,
                                   size_t itemEnd, LemmaEntry *lemma_arr, LmaNodeLE0 *sonFirstLe0,
                                   LmaNodeGE1 *sonFirstGe1)
{
    void *node;
    if (level == 0) {
        LmaNodeLE0 *nodeLe0 = sonFirstLe0 + sonPos;
        nodeLe0->splIdx = splIdxNode;
        nodeLe0->homoIdxBufOff = homo_idx_num_eq1_ + homo_idx_num_gt1_;
        nodeLe0->son1stOff = 0;
        homo_idx_num_eq1_ += homoNum;
        FillHomophony(nodeLe0, nullptr, level, homoNum, itemStartNext, lemma_arr);
        node = static_cast<void *>(nodeLe0);
    } else {
        LmaNodeGE1 *nodeGe1 = sonFirstGe1 + sonPos;
        nodeGe1->splIdx = splIdxNode;
        set_homo_id_buf_offset(nodeGe1, (homo_idx_num_eq1_ + homo_idx_num_gt1_));
        set_son_offset(nodeGe1, 0);
        homo_idx_num_gt1_ += homoNum;
        FillHomophony(nullptr, nodeGe1, level, homoNum, itemStartNext, lemma_arr);
        node = static_cast<void *>(nodeGe1);
    }

    if (itemEnd - itemStartNext <= homoNum) {
        return false;
    }
    construct_subset(node, lemma_arr, itemStartNext + homoNum, itemEnd, level + 1);
    return true;
}

bool DictBuilder::RecordSubsetStats(size_t level, size_t parentSonNum)
{
#ifdef DO_STATISTICS
    ASSERT(level < K_MAX_LEMMA_SIZE);
    if (parentSonNum > max_sonbuf_len_[level]) {
        max_sonbuf_len_[level] = parentSonNum;
    }
    total_son_num_[level] += parentSonNum;
    total_sonbuf_num_[level] += 1;
    if (parentSonNum == 1) {
        sonbufs_num1_++;
    } else {
        sonbufs_numgt1_++;
    }
    total_lma_node_num_ += parentSonNum;
#else
    (void)level;
    (void)parentSonNum;
#endif
    return true;
}

void DictBuilder::ProcessSubsetItem(SubsetContext &ctx, size_t i)
{
    LemmaEntry *lma_current = ctx.lemmaArr + i;
    uint16 spl_idx_current = lma_current->spl_idx_arr[ctx.level];
    if (spl_idx_current == ctx.splIdxNode) {
        if (lma_current->spl_idx_arr[ctx.level + 1] == 0) {
            ctx.homoNum++;
        }
        return;
    }

    bool hadSon = ConstructSonNode(ctx.level, ctx.sonPos, ctx.splIdxNode, ctx.homoNum, ctx.itemStartNext, i,
                                   ctx.lemmaArr, ctx.sonLe0, ctx.sonGe1);
#ifdef DO_STATISTICS
    if (hadSon) {
        total_node_hasson_[ctx.level] += 1;
        ctx.allsonNoson = false;
    }
#else
    (void)hadSon;
#endif

    ctx.splIdxNode = spl_idx_current;
    ctx.itemStartNext = i;
    ctx.homoNum = (lma_current->spl_idx_arr[ctx.level + 1] == 0) ? 1 : 0;
    ctx.sonPos++;
}

void DictBuilder::HandleLastSon(SubsetContext &ctx, size_t parentSonNum)
{
    bool hadSon = ConstructSonNode(ctx.level, ctx.sonPos, ctx.splIdxNode, ctx.homoNum, ctx.itemStartNext, ctx.itemEnd,
                                   ctx.lemmaArr, ctx.sonLe0, ctx.sonGe1);
#ifdef DO_STATISTICS
    if (hadSon) {
        total_node_hasson_[ctx.level] += 1;
        ctx.allsonNoson = false;
    }
    if (ctx.allsonNoson) {
        total_sonbuf_allnoson_[ctx.level] += 1;
        total_node_in_sonbuf_allnoson_[ctx.level] += parentSonNum;
    }
#else
    (void)hadSon;
    (void)parentSonNum;
#endif
    ASSERT(ctx.sonPos + parentSonNum == 1);
}

bool DictBuilder::construct_subset(void *parent, LemmaEntry *lemma_arr, size_t itemStart, size_t itemEnd,
                                   size_t level)
{
    if (level >= K_MAX_LEMMA_SIZE || itemEnd <= itemStart) {
        return false;
    }

    // 1. Scan for how many sons
    size_t parent_son_num = CountSubsetSons(lemma_arr, itemStart, itemEnd, level);

    SubsetContext ctx;
    ctx.level = level;
    ctx.lemmaArr = lemma_arr;
    ctx.itemEnd = itemEnd;
    ctx.sonLe0 = nullptr;
    ctx.sonGe1 = nullptr;
    ctx.sonPos = 0;
    ctx.itemStartNext = itemStart;
    ctx.allsonNoson = RecordSubsetStats(level, parent_son_num);
    LemmaEntry *lma_last_start = lemma_arr_ + itemStart;
    ctx.splIdxNode = lma_last_start->spl_idx_arr[level];
    ctx.homoNum = (lma_last_start->spl_idx_arr[level + 1] == 0) ? 1 : 0;

    // 2. Update the parent's information
    SetupParentInfo(parent, level, parent_son_num, ctx.sonLe0, ctx.sonGe1);

    // 3. Now Begin to Construct the son one by one
    for (size_t i = itemStart + 1; i < itemEnd; i++) {
        ProcessSubsetItem(ctx, i);
    }

    // 4. The last one to Construct
    HandleLastSon(ctx, parent_son_num);
    return true;
}

#ifdef DO_STATISTICS
void DictBuilder::stat_init()
{
    ImeMemset(max_sonbuf_len_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);
    ImeMemset(max_homobuf_len_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);
    ImeMemset(total_son_num_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);
    ImeMemset(total_node_hasson_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);
    ImeMemset(total_sonbuf_num_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);
    ImeMemset(total_sonbuf_allnoson_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);
    ImeMemset(total_node_in_sonbuf_allnoson_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);
    ImeMemset(total_homo_num_, sizeof(size_t) * K_MAX_LEMMA_SIZE, 0, sizeof(size_t) * K_MAX_LEMMA_SIZE);

    sonbufs_num1_ = 0;
    sonbufs_numgt1_ = 0;
    total_lma_node_num_ = 0;
}

void DictBuilder::stat_print()
{
    printf("\n------------STAT INFO-------------\n");
    printf("[root is layer -1]\n");
    printf(".. max_sonbuf_len per layer(from layer 0):\n   ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", max_sonbuf_len_[i]);
    }
    printf("-, \n");

    printf(".. max_homobuf_len per layer:\n   -, ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", max_homobuf_len_[i]);
    }
    printf("\n");

    printf(".. total_son_num per layer:\n   ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", total_son_num_[i]);
    }
    printf("-, \n");

    printf(".. total_node_hasson per layer:\n   1, ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", total_node_hasson_[i]);
    }
    printf("\n");

    printf(".. total_sonbuf_num per layer:\n   ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", total_sonbuf_num_[i]);
    }
    printf("-, \n");

    printf(".. total_sonbuf_allnoson per layer:\n   ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", total_sonbuf_allnoson_[i]);
    }
    printf("-, \n");

    printf(".. total_node_in_sonbuf_allnoson per layer:\n   ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", total_node_in_sonbuf_allnoson_[i]);
    }
    printf("-, \n");

    printf(".. total_homo_num per layer:\n   0, ");
    for (size_t i = 0; i < K_MAX_LEMMA_SIZE; i++) {
        printf("%d, ", total_homo_num_[i]);
    }
    printf("\n");

    printf(".. son buf allocation number with only 1 son: %d\n", sonbufs_num1_);
    printf(".. son buf allocation number with more than 1 son: %d\n", sonbufs_numgt1_);
    printf(".. total lemma node number: %d\n", total_lma_node_num_ + 1);
}
#endif // DO_STATISTICS

#endif // BUILD_MODEL
} // namespace ime_pinyin
