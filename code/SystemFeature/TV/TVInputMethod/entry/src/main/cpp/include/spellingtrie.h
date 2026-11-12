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

#ifndef PINYINIME_INCLUDE_SPELLINGTRIE_H_
#define PINYINIME_INCLUDE_SPELLINGTRIE_H_

#include "./dictdef.h"
#include <cstdio>
#include <cstdlib>

namespace ime_pinyin {

constexpr unsigned short K_FULL_SPL_ID_START = K_HALF_SPELLING_ID_NUM + 1;

// Node used for the trie of spellings
struct SpellingNode {
    SpellingNode *firstSon;
    // The spelling id for each node. If you need more bits to store
    // spelling id, please adjust this structure.
    uint16 spellingIdx : 11;
    uint16 numOfSon : 5;
    char charThisNode;
    unsigned char score;
};

struct SonNodeCtx {
    size_t level;
    char charForNode;
    const char *spellingLastStart;
    size_t itemStartNext;
    size_t endIdx;
    bool spellingEndable;
    bool szmEnabled;
};

class SpellingTrie {
private:
    static const int kMaxYmNum = 64;
    static const size_t kValidSplCharNum = 26;

    static const uint16 kHalfIdShengmuMask = 0x01;
    static const uint16 kHalfIdYunmuMask = 0x02;
    static const uint16 kHalfIdSzmMask = 0x04;

    // Map from half spelling id to single char.
    // For half ids of Zh/Ch/Sh, map to z/c/s (low case) respectively.
    // For example, 1 to 'A', 2 to 'B', 3 to 'C', 4 to 'c', 5 to 'D', ...,
    // 28 to 'Z', 29 to 'z'.
    // [0] is not used to achieve better efficiency.
    static const char kHalfId2Sc_[K_FULL_SPL_ID_START + 1];

    static unsigned char charFlags_[];
    static SpellingTrie *instance_;

    // The spelling table
    char *spellingBuf_;

    // The size of longest spelling string, includes '\0' and an extra char to
    // store score. For example, "zhuang" is the longgest item in Pinyin list,
    // so spellingSize_ is 8.
    // Structure: The string ended with '\0' + score char.
    // An item with a lower score has a higher probability.
    size_t spellingSize_;

    // Number of full spelling ids.
    size_t spellingNum_;

    float scoreAmplifier_;
    unsigned char averageScore_;

    // The Yunmu id list for the spelling ids (for half ids of Shengmu,
    // the Yunmu id is 0).
    // The length of the list is spellingNum_ + K_FULL_SPL_ID_START,
    // so that splYmIds_[splid] is the Yunmu id of the splid.
    uint8 *splYmIds_;

    // The Yunmu table.
    // Each Yunmu will be assigned with Yunmu id from 1.
    char *ymBuf_;
    size_t ymSize_; // The size of longest Yunmu string, '\0'included.
    size_t ymNum_;

    // The spelling string just queried
    char *splstrQueried_;

    // The spelling string just queried
    char16 *splstr16Queried_;

    // The root node of the spelling tree
    SpellingNode *root_;

    // If a none qwerty key such as a fnction key like ENTER is given, this node
    // will be used to indicate that this is not a QWERTY node.
    SpellingNode *dumbNode_;

    // If a splitter key is pressed, this node will be used to indicate that this
    // is a splitter key.
    SpellingNode *splitterNode_;

    // Used to get the first level sons.
    SpellingNode *level1Sons_[kValidSplCharNum];

    // The full splId range for specific half id.
    // h2f means half to full.
    // A half id can be a ShouZiMu id (id to represent the first char of a full
    // spelling, including Shengmu and Yunmu), or id of zh/ch/sh.
    // [1..K_FULL_SPL_ID_START-1] is the arrange of half id.
    uint16 h2fStart_[K_FULL_SPL_ID_START];
    uint16 h2fNum_[K_FULL_SPL_ID_START];

    // Map from full id to half id.
    uint16 *f2h_;

#ifdef BUILD_MODEL
    // How many node used to build the trie.
    size_t node_num_;
#endif

    SpellingTrie();

    void FreeSonTrie(SpellingNode *node);

    // Construct a subtree using a subset of the spelling array (from
    // item_star to itemEnd).
    // Member spelliing_buf_ and spellingSize_ should be valid.
    // parent is used to update its numOfSon and score.
    SpellingNode *ConstructSpellingsSubset(size_t itemStart, size_t itemEnd, size_t level, SpellingNode *parent);
    // 为当前层构造子节点数组，返回数组首地址，并回传最小子节点评分
    SpellingNode *BuildSonNodes(size_t itemStart, size_t itemEnd, size_t level, char charForNode,
                                uint16 numOfSon, unsigned char &minSonScore);
    bool BuildF2h();

    void InitNodes(unsigned char averageScore);
    bool StoreSpellingBuf(const char *spellingArr, size_t itemSize, size_t itemNum);
    bool AllocQueryBuffers();
    uint16 CountSons(size_t itemStart, size_t itemEnd, size_t level, char charForNode);
    void SetSon(SpellingNode *node, const char *spellingLastStart, size_t itemStartNext, size_t endIdx, size_t level);
    bool AssignHalfId(SpellingNode *node, const SonNodeCtx &c);
    void UpdateH2fStart(const SpellingNode *node, size_t itemStartNext);
    void ConfigureSonNode(SpellingNode *node, const SonNodeCtx &c, unsigned char &minSonScore);

    // The caller should guarantee ch >= 'A' && ch <= 'Z'
    bool IsShengmuChar(char ch) const;

    // The caller should guarantee ch >= 'A' && ch <= 'Z'
    bool IsYunmuChar(char ch) const;

#ifdef BUILD_MODEL
    // Given a spelling string, return its Yunmu string.
    // The caller guaratees spl_str is valid.
    const char *get_ym_str(const char *spl_str);

    // Build the Yunmu list, and the mapping relation between the full ids and the
    // Yunmu ids. This functin is called after the spelling trie is built.
    bool build_ym_info();
#endif

    friend class SpellingParser;
    friend class SmartSplParser;
    friend class SmartSplParser2;

public:
    ~SpellingTrie();

    inline static bool IsValidSplChar(char ch) { return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'); }

    // The caller guarantees that the two chars are valid spelling chars.
    inline static bool IsSameSplChar(char ch1, char ch2)
    {
        return ch1 == ch2 || ch1 - ch2 == 'a' - 'A' || ch2 - ch1 == 'a' - 'A';
    }

    // Construct the tree from the input pinyin array
    // The given string list should have been sorted.
    // scoreAmplifier is used to convert a possibility value into score.
    // averageScore is the averageScore of all spellings. The dumb node is
    // assigned with this score.
    bool Construct(const char *spellingArr, size_t itemSize, size_t itemNum, float scoreAmplifier,
                   unsigned char averageScore);

    // Test if the given id is a valid spelling id.
    // If function returns true, the given splid may be updated like this:
    // When 'A' is not enabled in ShouZiMu mode, the parsing result for 'A' is
    // first given as a half id 1, but because 'A' is a one-char Yunmu and
    // it is a valid id, it needs to updated to its corresponding full id.
    bool IfValidIdUpdate(uint16 *splid) const;

    // Test if the given id is a half id.
    bool IsHalfId(uint16 splid) const;

    bool IsFullId(uint16 splid) const;

    // Test if the given id is a one-char Yunmu id (obviously, it is also a half
    // id), such as 'A', 'E' and 'O'.
    bool IsHalfIdYunmu(uint16 splid) const;

    // Test if this char is a ShouZiMu char. This ShouZiMu char may be not enabled.
    // For Pinyin, only i/u/v is not a ShouZiMu char.
    // The caller should guarantee that ch >= 'A' && ch <= 'Z'
    bool IsSzmChar(char ch) const;

    // Test If this char is enabled in ShouZiMu mode.
    // The caller should guarantee that ch >= 'A' && ch <= 'Z'
    bool SzmIsEnabled(char ch) const;

    // Enable/disable Shengmus in ShouZiMu mode(using the first char of a spelling
    // to input).
    void SzmEnableShm(bool enable);

    // Enable/disable Yunmus in ShouZiMu mode.
    void SzmEnableYm(bool enable);

    // Test if this char is enabled in ShouZiMu mode.
    // The caller should guarantee ch >= 'A' && ch <= 'Z'
    bool IsSzmEnabled(char ch) const;

    // Return the number of full ids for the given half id.
    uint16 Half2fullNum(uint16 halfId) const;

    // Return the number of full ids for the given half id, and fill splIdStart
    // to return the first full id.
    uint16 HalfToFull(uint16 halfId, uint16 *splIdStart) const;

    // Return the corresponding half id for the given full id.
    // Not frequently used, low efficient.
    // Return 0 if fails.
    uint16 FullToHalf(uint16 fullId) const;

    // To test whether a half id is compatible with a full id.
    // Generally, when halfId == FullToHalf(fullId), return true.
    // But for "Zh, Ch, Sh", if fussy mode is on, half id for 'Z' is compatible
    // with a full id like "Zhe". (Fussy mode is not ready).
    bool HalfFullCompatible(uint16 halfId, uint16 fullId) const;

    static const SpellingTrie *GetCpinstance();

    static SpellingTrie &GetInstance();

    // Save to the file stream
    bool SaveSplTrie(FILE *fp);

    // Load from the file stream
    bool LoadSplTrie(FILE *fp);

    // Get the number of spellings
    size_t GetSpellingNum() const;

    // Return the Yunmu id for the given Yunmu string.
    // If the string is not valid, return 0;
    uint8 GetYmId(const char *ymStr) const;

    // Get the readonly Pinyin string for a given spelling id
    const char *GetSpellingStr(uint16 splid) const;

    // Get the readonly Pinyin string for a given spelling id
    const char16 *GetSpellingStr16(uint16 splid);

    // Get Pinyin string for a given spelling id. Return the length of the
    // string, and fill-in '\0' at the end.
    size_t GetSpellingStr16(uint16 splid, char16 *splstr16, size_t splstr16Len);
};
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_SPELLINGTRIE_H_
