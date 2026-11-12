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

#ifndef PINYINIME_INCLUDE_DICTBUILDER_H_
#define PINYINIME_INCLUDE_DICTBUILDER_H_

#include "./dictdef.h"
#include "./dictlist.h"
#include "./spellingtable.h"
#include "./spellingtrie.h"
#include "./splparser.h"
#include "./utf16char.h"
#include "./utf16reader.h"
#include <cstdlib>

namespace ime_pinyin {

#ifdef BUILD_MODEL

#define DO_STATISTICS

class DictTrie;

struct SubsetContext {
    size_t level;
    LemmaEntry *lemmaArr;
    size_t itemEnd;
    LmaNodeLE0 *sonLe0;
    LmaNodeGE1 *sonGe1;
    size_t sonPos;
    size_t itemStartNext;
    uint16 splIdxNode;
    size_t homoNum;
    bool allsonNoson;
};

class DictBuilder {
private:
    // The raw lemma array buffer.
    LemmaEntry *lemma_arr_;
    size_t lemma_num_;

    // Used to store all possible single char items.
    // Two items may have the same Hanzi while their spelling ids are different.
    SingleCharItem *scis_;
    size_t scisNum_;

    // In the tree, root's level is -1.
    // Lemma nodes for root, and level 0
    LmaNodeLE0 *lma_nodes_le0_;

    // Lemma nodes for layers whose levels are deeper than 0
    LmaNodeGE1 *lma_nodes_ge1_;

    // Number of used lemma nodes
    size_t lma_nds_used_num_le0_;
    size_t lma_nds_used_num_ge1_;

    // Used to store homophonies' ids.
    LemmaIdType *homo_idx_buf_;
    // Number of homophonies each of which only contains one Chinese character.
    size_t homo_idx_num_eq1_;
    // Number of homophonies each of which contains more than one character.
    size_t homo_idx_num_gt1_;

    // The items with highest scores.
    LemmaEntry *top_lmas_;
    size_t topLmasNum_;

    SpellingTable *spl_table_;
    SpellingParser *splParser_;

#ifdef DO_STATISTICS
    size_t max_sonbuf_len_[K_MAX_LEMMA_SIZE];
    size_t max_homobuf_len_[K_MAX_LEMMA_SIZE];

    size_t total_son_num_[K_MAX_LEMMA_SIZE];
    size_t total_node_hasson_[K_MAX_LEMMA_SIZE];
    size_t total_sonbuf_num_[K_MAX_LEMMA_SIZE];
    size_t total_sonbuf_allnoson_[K_MAX_LEMMA_SIZE];
    size_t total_node_in_sonbuf_allnoson_[K_MAX_LEMMA_SIZE];
    size_t total_homo_num_[K_MAX_LEMMA_SIZE];

    size_t sonbufs_num1_;   // Number of son buffer with only 1 son
    size_t sonbufs_numgt1_; // Number of son buffer with more 1 son;

    size_t total_lma_node_num_;

    void stat_init();
    void stat_print();
#endif

public:
    DictBuilder();
    ~DictBuilder();

    // Build dictionary trie from the file fn_raw. File fn_validhzs provides
    // valid chars. If fn_validhzs is nullptr, only chars in GB2312 will be
    // included.
    bool build_dict(const char *fn_raw, const char *fn_validhzs, DictTrie *dict_trie);

private:
    // Fill in the buffer with id. The caller guarantees that the paramters are
    // vaild.
    void id_to_charbuf(unsigned char *buf, LemmaIdType id);

    // Update the offset of sons for a node.
    void set_son_offset(LmaNodeGE1 *node, size_t offset);

    // Update the offset of homophonies' ids for a node.
    void set_homo_id_buf_offset(LmaNodeGE1 *node, size_t offset);

    // Format a speling string.
    void format_spelling_str(char *spl_str);

    // Sort the lemma_arr by the hanzi string, and give each of unique items
    // a id. Why we need to sort the lemma list according to their Hanzi string
    // is to find items started by a given prefix string to do prediction.
    // Actually, the single char items are be in other order, for example,
    // in spelling id order, etc.
    // Return value is next un-allocated idx available.
    LemmaIdType sort_lemmas_by_hz();

    // Build the SingleCharItem list, and fill the hanzi_scis_ids in the
    // lemma buffer lemma_arr_.
    // This function should be called after the lemma array is ready.
    // Return the number of unique SingleCharItem elements.
    size_t build_scis();

    // Construct a subtree using a subset of the spelling array (from
    // item_star to itemEnd)
    // parent is the parent node to update the necessary information
    // parent can be a member of LmaNodeLE0 or LmaNodeGE1
    bool construct_subset(void *parent, LemmaEntry *lemma_arr, size_t itemStart, size_t itemEnd, size_t level);

    // Read valid Chinese Hanzis from the given file.
    // num is used to return number of chars.
    // The return buffer is sorted and caller needs to free the returned buffer.
    char16 *read_valid_hanzis(const char *fn_validhzs, size_t *num);

    // Read a raw dictionary. max_item is the maximum number of items. If there
    // are more items in the ditionary, only the first max_item will be read.
    // Returned value is the number of items successfully read from the file.
    size_t read_raw_dict(const char *fn_raw, const char *fn_validhzs, size_t max_item);

    // Try to find if a character is in hzs buffer.
    bool hz_in_hanzis_list(const char16 *hzs, size_t hzsLen, char16 hz);

    // Try to find if all characters in str are in hzs buffer.
    bool str_in_hanzis_list(const char16 *hzs, size_t hzsLen, const char16 *str, size_t strLen);

    // Get these lemmas with toppest scores.
    void get_top_lemmas();

    // Insert a lemma into the top lemmas list keeping it sorted by frequency.
    void InsertTopLemma(const LemmaEntry &newLemma);

    // Parse one raw dictionary line into lemma_arr_[idx]. Return 1 for keep,
    // 0 for discard, -1 for end of file and -2 for error.
    int ParseRawLemma(Utf16Reader &reader, char16 *readBuf, const char16 *valid_hzs, size_t valid_hzs_num, size_t idx);
    int ParseSpellings(size_t idx, char16 *to_tokenize);
    bool CheckValidHanzi(const char16 *valid_hzs, size_t valid_hzs_num, size_t idx, int gbk_flag);

    bool InitSpellingTree();
    void ConvertSpellingsToIdxs();
    void MoveDataToTrie(DictTrie *dict_trie);

    void CopyHanzisToScis();
    void UpdateLemmaScisIds(size_t uniqueScisNum);

    size_t CountSubsetSons(LemmaEntry *lemma_arr, size_t itemStart, size_t itemEnd, size_t level);
    bool RecordSubsetStats(size_t level, size_t parentSonNum);
    void ProcessSubsetItem(SubsetContext &ctx, size_t i);
    void HandleLastSon(SubsetContext &ctx, size_t parentSonNum);
    void SetupParentInfo(void *parent, size_t level, size_t parentSonNum, LmaNodeLE0 *&sonFirstLe0,
                         LmaNodeGE1 *&sonFirstGe1);
    void FillHomophony(LmaNodeLE0 *nodeLe0, LmaNodeGE1 *nodeGe1, size_t level, size_t homoNum, size_t itemStartNext,
                       LemmaEntry *lemma_arr);
    bool ConstructSonNode(size_t level, size_t sonPos, uint16 splIdxNode, size_t homoNum, size_t itemStartNext,
                          size_t itemEnd, LemmaEntry *lemma_arr, LmaNodeLE0 *sonFirstLe0, LmaNodeGE1 *sonFirstGe1);

    // Allocate resource to build dictionary.
    // lmaNum is the number of items to be loaded
    bool AllocResource(size_t lmaNum);

    // Free resource.
    void FreeResource();
};
#endif // BUILD_MODEL
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_DICTBUILDER_H_
