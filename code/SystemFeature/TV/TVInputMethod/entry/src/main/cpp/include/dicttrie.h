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

#ifndef PINYINIME_INCLUDE_DICTTRIE_H_
#define PINYINIME_INCLUDE_DICTTRIE_H_

#include "./atomdictbase.h"
#include "./dictdef.h"
#include "./dictlist.h"
#include "./searchutility.h"
#include <cstdlib>

namespace ime_pinyin {

struct SplIdRange {
    uint16 start;
    uint16 num;
};

struct DictExtendCtx {
    SplIdRange range;
    LmaPsbItem *lpiItems;
    size_t lpiMax;
    size_t *lpiNum;
};

struct LpisExtendState {
    LmaNodeLE0 **nodeFrLe0;
    LmaNodeLE0 **nodeToLe0;
    LmaNodeGE1 **nodeFrGe1;
    LmaNodeGE1 **nodeToGe1;
    size_t nodeFrNum;
    size_t nodeToNum;
    size_t splPos;
    const uint16 *splidStr;
    uint16 splidStrLen;
};

class DictTrie : AtomDictBase {
private:
    struct ParsingMark {
        size_t nodeOffset : 24;
        size_t nodeNum : 8; // Number of nodes with this spelling id given
                            // by splId. If splId is a Shengmu, for nodes
                            // in the first layer of DictTrie, it equals to
                            // SpellingTrie::shm2full_num(); but for those
                            // nodes which are not in the first layer,
                            // nodeNum < SpellingTrie::shm2full_num().
                            // For a full spelling id, nodeNum = 1;
    };

    // Used to indicate an extended mile stone.
    // An extended mile stone is used to mark a partial match in the dictionary
    // trie to speed up further potential extending.
    // For example, when the user inputs "w", a mile stone is created to mark the
    // partial match status, so that when user inputs another char 'm', it will be
    // faster to extend Search space based on this mile stone.
    //
    // For partial match status of "wm", there can be more than one sub mile
    // stone, for example, "wm" can be matched to "wanm", "wom", ..., etc, so
    // there may be more one parsing mark used to mark these partial matchings.
    // A mile stone records the starting position in the mark list and number of
    // marks.
    struct MileStone {
        uint16 markStart;
        uint16 markNum;
    };

    DictList *dictList_;

    const SpellingTrie *splTrie_;

    LmaNodeLE0 *root_;     // Nodes for root and the first layer.
    LmaNodeGE1 *nodesGe1_; // Nodes for other layers.

    // An quick index from spelling id to the LmaNodeLE0 node buffer, or
    // to the root_ buffer.
    // Index length:
    // SpellingTrie::GetInstance().GetSpellingNum() + 1. The last one is used
    // to get the end.
    // All Shengmu ids are not indexed because they will be converted into
    // corresponding full ids.
    // So, given an id splid, the son is:
    // root_[splidLe0Index_[splid - K_FULL_SPL_ID_START]]
    uint16 *splidLe0Index_;

    size_t lmaNodeNumLe0_;
    size_t lmaNodeNumGe1_;

    // The first part is for homophnies, and the last  top_lma_num_ items are
    // lemmas with highest scores.
    unsigned char *lmaIdxBuf_;
    size_t lmaIdxBufLen_; // The total size of lmaIdxBuf_ in byte.
    size_t totalLmaNum_;  // Total number of lemmas in this dictionary.
    size_t topLmasNum_;   // Number of lemma with highest scores.

    // Parsing mark list used to mark the detailed extended statuses.
    ParsingMark *parsingMarks_;
    // The position for next available mark.
    uint16 parsingMarksPos_;

    // Mile stone list used to mark the extended status.
    MileStone *mileStones_;
    // The position for the next available mile stone. We use positions (except 0)
    // as handles.
    MileStoneHandle mileStonesPos_;

    // Get the offset of sons for a node.
    inline size_t GetSonOffset(const LmaNodeGE1 *node) const;

    // Get the offset of homonious ids for a node.
    inline size_t GetHomoIdxBufOffset(const LmaNodeGE1 *node) const;

    // Get the lemma id by the offset.
    inline LemmaIdType GetLemmaId(size_t idOffset) const;

    void FreeResource(bool freeDictList);

    bool LoadDict(FILE *fp);

    bool LoadDictHeader(FILE *fp);
    bool AllocNodeBuffers(size_t bufSize);
    void BuildSplidLe0Index(size_t bufSize);

    // Given a LmaNodeLE0 node, extract the lemmas specified by it, and fill
    // them into the lpiItems buffer.
    // This function is called by the Search engine.
    size_t FillLpiBuffer(LmaPsbItem lpiItems[], size_t lpiMax, LmaNodeLE0 *node);

    // Given a LmaNodeGE1 node, extract the lemmas specified by it, and fill
    // them into the lpiItems buffer.
    // This function is called by inner functions ExtendDict0(), ExtendDict1()
    // and ExtendDict2().
    size_t FillLpiBuffer(LmaPsbItem lpiItems[], size_t lpiMax, size_t homoBufOff, const LmaNodeGE1 *node,
                         uint16 lmaLen);

    // Extend in the trie from level 0.
    MileStoneHandle ExtendDict0(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems, size_t lpiMax,
                                size_t *lpiNum);

    // Extend in the trie from level 1.
    MileStoneHandle ExtendDict1(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems, size_t lpiMax,
                                size_t *lpiNum);

    // Extend in the trie from level 2.
    MileStoneHandle ExtendDict2(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems, size_t lpiMax,
                                size_t *lpiNum);

    // Try to extend the given spelling id buffer, and if the given idLemma can
    // be successfully gotten, return true;
    // The given spelling ids are all valid full ids.
    bool TryExtend(const uint16 *splids, uint16 splidNum, LemmaIdType idLemma);

    void ExtendLe0Node(LmaNodeLE0 *node, const DictExtendCtx &ctx, size_t &retVal);
    void ExtendGe1Node(LmaNodeGE1 *node, const DictExtendCtx &ctx, size_t &retVal, uint16 lmaLen);
    bool ExtendByPos(void *&node, uint16 pos, uint16 splid);
    bool CheckLemmaHomo(void *node, uint16 splidNum, LemmaIdType idLemma);
    void RecordParsingMark(size_t nodeOffset, size_t foundNum, size_t &retVal);

    static const size_t kMaxExtendBufLen = 200;

    void AppendExtendNode(LmaNodeLE0 **nodeTo, size_t &nodeToNum, LmaNodeLE0 *nodeSon);
    void AppendExtendNode(LmaNodeGE1 **nodeTo, size_t &nodeToNum, LmaNodeGE1 *nodeSon);
    void ExtendFromRoot(LmaNodeLE0 **nodeFr, LmaNodeLE0 **nodeTo, size_t nodeFrNum, size_t &nodeToNum,
                        const SplIdRange &range);
    void ExtendLe0ToGe1(LmaNodeLE0 **nodeFr, LmaNodeGE1 **nodeTo, size_t nodeFrNum, size_t &nodeToNum,
                        const SplIdRange &range);
    void ExtendGe1ToGe1(LmaNodeGE1 **nodeFr, LmaNodeGE1 **nodeTo, size_t nodeFrNum, size_t &nodeToNum,
                        const SplIdRange &range);
    void ExtendLpisNodes(LpisExtendState &st);
    size_t FillLpisFromLe0(LmaNodeLE0 **nodeTo, size_t nodeToNum, size_t lpiMax, LmaPsbItem *lpiItems);
    size_t FillLpisFromGe1(LmaNodeGE1 **nodeTo, size_t nodeToNum, uint16 splidStrLen, LmaPsbItem *lpiItems,
                           size_t lpiMax);

#ifdef BUILD_MODEL
    bool save_dict(FILE *fp);
#endif // BUILD_MODEL

    static const int kMaxMileStone = 100;
    static const int kMaxParsingMark = 600;
    static const MileStoneHandle kFirstValidMileStoneHandle = 1;

    friend class DictParser;
    friend class DictBuilder;

public:
    DictTrie();
    ~DictTrie() override;

#ifdef BUILD_MODEL
    // Construct the tree from the file fn_raw.
    // fn_validhzs provide the valid hanzi list. If fn_validhzs is
    // nullptr, only chars in GB2312 will be included.
    bool build_dict(const char *fn_raw, const char *fn_validhzs);

    // Save the binary dictionary
    // Actually, the SpellingTrie/DictList instance will be also saved.
    bool save_dict(const char *filename);
#endif // BUILD_MODEL

    void ConvertToHanzis(char16 *str, uint16 strLen);

    void ConvertToScisIds(char16 *str, uint16 strLen);

    // Load a binary dictionary
    // The SpellingTrie instance/DictList will be also loaded
    bool LoadDict(const char *filename, LemmaIdType startId, LemmaIdType endId) override;
    bool LoadDictFd(int sysFd, long startOffset, long length, LemmaIdType startId, LemmaIdType endId);
    bool CloseDict() override { return true; }
    size_t NumberOfLemmas() override { return 0; }

    void ResetMilestones(uint16 fromStep, MileStoneHandle fromHandle) override;

    MileStoneHandle ExtendDict(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems, size_t lpiMax,
                               size_t *lpiNum) override;

    size_t GetLpis(const uint16 *splidStr, uint16 splidStrLen, LmaPsbItem *lpiItems, size_t lpiMax) override;

    uint16 GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax) override;

    uint16 GetLemmaSplids(LemmaIdType idLemma, uint16 *splids, uint16 splidsMax, bool argValid) override;

    size_t Predict(const char16 *lastHzs, uint16 hzsLen, NPredictItem *npreItems, size_t npreMax,
                   size_t b4Used) override;

    LemmaIdType PutLemma(char16[], uint16[], uint16 /*lemmaLen*/, uint16 /*count*/) override { return 0; }

    LemmaIdType UpdateLemma(LemmaIdType /*lemmaId*/, int16 /*deltaCount*/, bool /*selected*/) override { return 0; }

    LemmaIdType GetLemmaId(char16[], uint16[], uint16 /*lemmaLen*/) override { return 0; }

    LmaScoreType GetLemmaScore(LemmaIdType /*lemmaId*/) override { return 0; }

    LmaScoreType GetLemmaScore(char16[], uint16[], uint16 /*lemmaLen*/) override { return 0; }

    bool RemoveLemma(LemmaIdType /*lemmaId*/) override { return false; }

    size_t GetTotalLemmaCount() override { return 0; }
    void SetTotalLemmaCountOfOthers(size_t count) override;

    void FlushCache() override {}

    LemmaIdType GetLemmaId(const char16 lemmaStr[], uint16 lemmaLen);

    // Fill the lemmas with highest scores to the prediction buffer.
    // hisLen is the history length to fill in the prediction buffer.
    size_t PredictTopLmas(size_t hisLen, NPredictItem *npreItems, size_t npreMax, size_t b4Used);
};
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_DICTTRIE_H_
