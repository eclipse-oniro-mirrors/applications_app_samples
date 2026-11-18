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

#ifndef PINYINIME_ANDPY_INCLUDE_MATRIXSEARCH_H_
#define PINYINIME_ANDPY_INCLUDE_MATRIXSEARCH_H_

#include "./atomdictbase.h"
#include "./dicttrie.h"
#include "./searchutility.h"
#include "./spellingtrie.h"
#include "./splparser.h"
#include <cstdlib>

namespace ime_pinyin {

constexpr size_t K_MAX_ROW_NUM = K_MAX_SEARCH_STEPS;

typedef struct {
    // MileStoneHandle objects for the system and user dictionaries.
    MileStoneHandle dictHandles[2];
    // From which DMI node. -1 means it's from root.
    PoolPosType dmiFr;
    // The spelling id for the Pinyin string from the previous DMI to this node.
    // If it is a half id like Shengmu, the node pointed by dict_node is the first
    // node with this Shengmu,
    uint16 splId;
    // What's the level of the dict node. Level of root is 0, but root is never
    // recorded by dict_node.
    unsigned char dictLevel : 7;
    // If this node is for composing phrase, this bit is 1.
    unsigned char cPhrase : 1;
    // Whether the splId is parsed with a split character at the end.
    unsigned char splidEndSplit : 1;
    // What's the length of the spelling string for this match, for the whole
    // word.
    unsigned char splstrLen : 7;
    // Used to indicate whether all spelling ids from the root are full spelling
    // ids. This information is useful for keymapping mode(not finished). Because
    // in this mode, there is no clear boundaries, we prefer those results which
    // have full spelling ids.
    unsigned char allFullId : 1;
} DictMatchInfo, *PDictMatchInfo;

typedef struct MatrixNode {
    LemmaIdType id;
    float score;
    MatrixNode *from;
    // From which DMI node. Used to trace the spelling segmentation.
    PoolPosType dmiFr;
    uint16 step;
} MatrixNode, *PMatrixNode;

typedef struct {
    // The MatrixNode position in the matrix pool
    PoolPosType mtrxNdPos;
    // The DictMatchInfo position in the DictMatchInfo pool.
    PoolPosType dmiPos;
    uint16 mtrxNdNum;
    uint16 dmiNum : 15;
    // Used to indicate whether there are dmi nodes in this step with full
    // spelling id. This information is used to decide whether a substring of a
    // valid Pinyin should be extended.
    // Example1: shoudao
    // When the last char 'o' is added, the parser will find "dao" is a valid
    // Pinyin, and because all dmi nodes at location 'd' (including those for
    // "shoud", and those for "d") have Shengmu id only, so it is not necessary
    // to extend "ao", otherwise the result may be "shoud ao", that is not
    // reasonable.
    // Example2: hengao
    // When the last 'o' is added, the parser finds "gao" is a valid Pinyin.
    // Because some dmi nodes at 'g' has Shengmu ids (hen'g and g), but some dmi
    // nodes at 'g' has full ids ('heng'), so it is necessary to extend "ao", thus
    // "heng ao" can also be the result.
    // Similarly, "ganga" is expanded to "gang a".
    // For Pinyin string "xian", because "xian" is a valid Pinyin, because all dmi
    // nodes at 'x' only have Shengmu ids, the parser will not try "x ian" (and it
    // is not valid either). If the parser uses break in the loop, the result
    // always be "xian"; but if the parser uses continue in the loop, "xi an" will
    // also be tried. This behaviour can be set via the function
    // SetXiAnSwitch().
    uint16 dmiHasFullId : 1;
    // Points to a MatrixNode of the current step to indicate which choice the
    // user selects.
    MatrixNode *mtrxNdFixed;
} MatrixRow, *PMatrixRow;

// When user inputs and selects candidates, the fixed lemma ids are stored in
// lmaId_ of class MatrixSearch, and fixedLmas_ is used to indicate how many
// lemmas from the beginning are fixed. If user deletes Pinyin characters one
// by one from the end, these fixed lemmas can be unlocked one by one when
// necessary. Whenever user deletes a Chinese character and its spelling string
// in these fixed lemmas, all fixed lemmas will be merged together into a unit
// named ComposingPhrase with a lemma id K_LEMMA_ID_COMPOSING, and this composing
// phrase will be the first lemma in the sentence. Because it contains some
// modified lemmas (by deleting a character), these merged lemmas are called
// sub lemmas (sublma), and each of them are represented individually, so that
// when user deletes Pinyin characters from the end, these sub lemmas can also
// be unlocked one by one.
typedef struct {
    uint16 splIds[K_MAX_ROW_NUM];
    uint16 splStart[K_MAX_ROW_NUM];
    char16 chnStr[K_MAX_ROW_NUM];      // Chinese string.
    uint16 sublmaStart[K_MAX_ROW_NUM]; // Counted in Chinese characters.
    size_t sublmaNum;
    uint16 length; // Counted in Chinese characters.
} ComposingPhrase, *TComposingPhrase;

class LpiCache;

struct SplIdStrLen {
    const uint16 *str;
    size_t len;
};

struct FillDmiParam {
    PoolPosType dmiFr;
    uint16 splId;
    uint16 nodeNum;
    unsigned char dictLevel;
    bool splidEndSplit;
    unsigned char splstrLen;
    unsigned char allFullId;
};

struct RowExtendParam {
    uint16 oldrow;
    uint16 extLen;
    uint16 splIdx;
    bool splidEndSplit;
};

struct CandStrBuf {
    char16 *candStr;
    size_t maxLen;
};

class MatrixSearch {
private:
    // If it is true, prediction list by string whose length is greater than 1
    // will be limited to a reasonable number.
    static const bool kPredictLimitGt1 = false;

    // If it is true, the engine will prefer long history based prediction,
    // for example, when user inputs "BeiJing", we prefer "DaXue", etc., which are
    // based on the two-character history.
    static const bool kPreferLongHistoryPredict = true;

    // If it is true, prediction will only be based on user dictionary. this flag
    // is for debug purpose.
    static const bool kOnlyUserDictPredict = false;

    // The maximum buffer to store LmaPsbItems.
    static const size_t kMaxLmaPsbItems = 1450;

    // How many rows for each step.
    static const size_t kMaxNodeARow = 5;

    // The maximum length of the sentence candidates counted in chinese
    // characters
    static const size_t kMaxSentenceLength = 16;

    // The size of the matrix node pool.
    static const size_t kMtrxNdPoolSize = 200;

    // The size of the DMI node pool.
    static const size_t kDmiPoolSize = 800;

    // Used to indicate whether this object has been initialized.
    bool inited_;

    // Spelling trie.
    const SpellingTrie *splTrie_;

    // Used to indicate this switcher status: when "xian" is parseed, should
    // "xi an" also be extended. Default is false.
    // These cases include: xia, xian, xiang, zhuan, jiang..., etc. The string
    // should be valid for a FULL spelling, or a combination of two spellings,
    // first of which is a FULL id too. So even it is true, "da" will never be
    // split into "d a", because "d" is not a full spelling id.
    bool xiAnEnabled_;

    // System dictionary.
    DictTrie *dictTrie_;

    // User dictionary.
    AtomDictBase *userDict_;

    // Spelling parser.
    SpellingParser *splParser_;

    // The maximum allowed length of spelling string (such as a Pinyin string).
    size_t maxSpsLen_;

    // The maximum allowed length of a result Chinese string.
    size_t maxHzsLen_;

    // Pinyin string. Max length: K_MAX_ROW_NUM - 1
    char pys_[K_MAX_ROW_NUM];

    // The length of the string that has been decoded successfully.
    size_t pysDecodedLen_;

    // Shared buffer for multiple purposes.
    size_t *shareBuf_;

    MatrixNode *mtrxNdPool_;
    PoolPosType mtrxNdPoolUsed_; // How many nodes used in the pool
    DictMatchInfo *dmiPool_;
    PoolPosType dmiPoolUsed_; // How many items used in the pool

    MatrixRow *matrix_; // The first row is for starting

    DictExtPara *dep_; // Parameter used to extend DMI nodes.

    NPredictItem *npreItems_; // Used to do prediction
    size_t npreItemsLen_;

    // The starting positions and lemma ids for the full sentence candidate.
    size_t lmaIdNum_;
    uint16 lmaStart_[K_MAX_ROW_NUM]; // Counted in spelling ids.
    LemmaIdType lmaId_[K_MAX_ROW_NUM];
    size_t fixedLmas_;

    // If fixedLmas_ is bigger than i,  Element i is used to indicate whether
    // the i'th lemma id in lmaId_ is the first candidate for that step.
    // If all candidates are the first one for that step, the whole string can be
    // decoded by the engine automatically, so no need to add it to user
    // dictionary. (We are considering to add it to user dictionary in the
    // future).
    uint8 fixedLmasNo1_[K_MAX_ROW_NUM];

    // Composing phrase
    ComposingPhrase cPhrase_;

    // If dmiCPhrase_ is true, the decoder will try to match the
    // composing phrase (And definitely it will match successfully). If it
    // is false, the decoder will try to match lemmas items in dictionaries.
    bool dmiCPhrase_;

    // The starting positions and spelling ids for the first full sentence
    // candidate.
    size_t splIdNum_;                // Number of splling ids
    uint16 splStart_[K_MAX_ROW_NUM]; // Starting positions
    uint16 splId_[K_MAX_ROW_NUM];    // Spelling ids
    // Used to remember the last fixed position, counted in Hanzi.
    size_t fixedHzs_;

    // Lemma Items with possibility score, two purposes:
    // 1. In Viterbi decoding, this buffer is used to get all possible candidates
    // for current step;
    // 2. When the Search is done, this buffer is used to get candiates from the
    // first un-fixed step and show them to the user.
    LmaPsbItem lpiItems_[kMaxLmaPsbItems];
    size_t lpiTotal_;

    // Assign the pointers with nullptr. The caller makes sure that all pointers are
    // not valid before calling it. This function only will be called in the
    // construction function and FreeResource().
    void ResetPointersToNull();

    bool AllocResource();

    void FreeResource();

    // Reset the Search space totally.
    bool ResetSearch0();

    // Reset the Search space from chPos step. For example, if the original
    // input Pinyin is "an", ResetSearch(1) will Reset the Search space to the
    // result of "a". If the given position is out of range, return false.
    // if clearFixedThisStep is true, and the chPos step is a fixed step,
    // clear its fixed status. if clear_dmi_his_step is true, clear the DMI nodes.
    // If clear_mtrx_this_sTep is true, clear the mtrx nodes of this step.
    // The DMI nodes will be kept.
    // Note: this function should not destroy content of pys_.
    bool ResetSearch(size_t chPos, bool clearFixedThisStep, bool clearDmiThisStep, bool clearMtrxThisStep);

    // Delete a part of the content in pys_.
    void DelInPys(size_t start, size_t len);

    // Delete a spelling id and its corresponding Chinese character, and merge
    // the fixed lemmas into the composing phrase.
    // delSplPos indicates which spelling id needs to be delete.
    // This function will update the lemma and spelling segmentation information.
    // The caller guarantees that fixedLmas_ > 0 and delSplPos is within
    // the fixed lemmas.
    void MergeFixedLmas(size_t delSplPos);

    // Get spelling start posistions and ids. The result will be stored in
    // splIdNum_, splStart_[], splId_[].
    // fixedHzs_ will be also assigned.
    void GetSplStartId();

    void CollectSplAndLma();
    void ReverseSplInfo();
    void ReverseLmaInfo();
    void AdjustLmaStart();
    void FindLastFixedSplId();
    void MergeFixedLmasExisting(size_t delSplPos, uint16 &phraseLen);
    void MergeFixedLmasFirst(size_t delSplPos, uint16 &phraseLen);

    void ProcessOldRow(uint16 oldrow, uint16 extLen, uint16 splIdx, bool splidEndSplit, uint16 &longestExt);
    void ProcessOneDmi(const RowExtendParam &p, PoolPosType dmiPos, uint16 &longestExt);
    void ExtendFromMatrixRow(uint16 frRow, size_t newDmiNum, uint16 extLen, uint16 &longestExt);
    uint16 ExtendDmiAndCount(DictMatchInfo *dmi, uint16 splIdx);
    bool FillDepSplidsFromDmi(DictMatchInfo *dmi);

    MileStoneHandle *FindMilestonesToClear(size_t chPos, bool clearDmiThisStep);
    void ResetStepTo(size_t chPos, bool clearDmiThisStep, bool clearMtrxThisStep);
    void ResetFixedSubSearch(size_t chPos, bool clearFixedThisStep, bool clearDmiThisStep, bool clearMtrxThisStep);
    void TruncateComposingPhrase(size_t chPos);
    size_t FindFixedChPos(size_t chPos, bool clearFixedThisStep);
    void ResetFixedCounters(size_t fixedChPos);
    void ResetFixedPools(size_t fixedChPos, size_t chPos, bool clearDmiThisStep, bool clearMtrxThisStep);
    bool TruncateSubLemma(uint16 subpos, uint16 splposBegin, uint16 splposEnd, size_t chPos);

    void DecodeFrom(size_t startPos);
    void DelsearchExtendComposing(size_t cPyLen);
    bool ComputeDelPyLen(size_t pos, bool isPosInSplid, bool clearFixedThisStep, size_t &resetPos, size_t &cPyLen);
    float ComputeSegmentScore(uint16 lmaIdFrom, uint16 pos, float scoreFrom, bool modified);

    size_t ChooseFirstCandidate();
    size_t FixChosenCandidate(LemmaIdType idChosen, LmaScoreType scoreChosen, size_t candLen);

    void ExtendDmiSystemDict(DictExtPara *dep, DictMatchInfo *dmiS, const MileStoneHandle *fromH,
                             MileStoneHandle *handles);
    void ExtendDmiUserDict(DictExtPara *dep, DictMatchInfo *dmiS, const MileStoneHandle *fromH,
                           MileStoneHandle *handles);
    int AddDmiForHandles(DictExtPara *dep, DictMatchInfo *dmiS, const MileStoneHandle *handles, uint16 splid);
    size_t FinalizeLpiCache(LpiCache &lpiCache, uint16 splid, bool cached, DictMatchInfo *dmiS, size_t retVal);

    size_t DedupByString(LmaPsbItem *lmaBuf, size_t num, size_t maxLmaBuf, const char16 *pfullsent);
    size_t DedupSingleChar(LmaPsbItem *lmaBuf, size_t num, const char16 *pfullsent);

    bool HasNearestNWord(const char16 *fixedBuf, uint16 fixedLen);
    size_t LimitPredictNum(size_t resThis, size_t len);
    size_t PredictForLen(const char16 *fixedBuf, uint16 fixedLen, size_t len, size_t resTotal, size_t thisMax);

    void CollectSentenceIdxs(MatrixNode *mtrxNd, LemmaIdType *idxs, size_t &idNum);
    bool BuildCandidateStr(LemmaIdType *idxs, size_t idNum, const CandStrBuf &buf, size_t &retPos, bool onlyUnfixed);

    // Get all lemma ids with match the given spelling id stream(shorter than the
    // maximum length of a word).
    // If pfullsent is not nullptr, means the full sentence candidate may be the
    // same with the coming lemma string, if so, remove that lemma.
    // The result is sorted in descendant order by the frequency score.
    size_t GetLpis(const SplIdStrLen &splid, LmaPsbItem *lmaBuf, size_t maxLmaBuf, const char16 *pfullsent,
                   bool sortByPsb);

    uint16 GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax);

    uint16 GetLemmaSplids(LemmaIdType idLemma, uint16 *splids, uint16 splidsMax, bool argValid);

    // Extend a DMI node with a spelling id. extLen is the length of the rows
    // to extend, actually, it is the size of the spelling string of splid.
    // return value can be 1 or 0.
    // 1 means a new DMI is filled in (dmiPoolUsed_ is the next blank DMI in
    // the pool).
    // 0 means either the dmi node can not be extended with splid, or the splid
    // is a Shengmu id, which is only used to get lpiItems, or the result node
    // in DictTrie has no son, it is not nccessary to keep the new DMI.
    // This function modifies the content of lpiItems_ and lpiTotal_.
    // lpiItems_ is used to get the LmaPsbItem list, lpiTotal_ returns the size.
    // The function's returned value has no relation with the value of lpiNum.
    // If dmi == nullptr, this function will extend the root node of DictTrie
    // This function will not change dmi_nd_pool_used_. Please change it after
    // calling this function if necessary.
    // The caller should guarantees that dep. != nullptr
    size_t ExtendDmi(DictExtPara *dep, DictMatchInfo *dmiS);

    // Extend dmi for the composing phrase.
    size_t ExtendDmiC(DictExtPara *dep, DictMatchInfo *dmiS);

    // Extend a MatrixNode with the give LmaPsbItem list.
    // resRow is the destination row number.
    // This function does not change mtrxNdPoolUsed_. Please change it after
    // calling this function if necessary.
    // return 0 always.
    size_t ExtendMtrxNd(MatrixNode *mtrxNd, LmaPsbItem lpiItems[], size_t lpiNum, PoolPosType dmiFr, size_t resRow);

    // Try to find a dmi node at stepTo position, and the found dmi node should
    // match the given spelling id strings.
    PoolPosType MatchDmi(size_t stepTo, const uint16 splIds[], uint16 splIdNum);

    bool AddChar(char ch);
    bool PrepareAddChar(char ch);

    // Called after PrepareAddChar, so the input char has been saved.
    bool AddCharQwerty();

    // Prepare candidates from the last fixed hanzi position.
    void PrepareCandidates();

    // Is the character in step pos a splitter character?
    // The caller guarantees that the position is valid.
    bool IsSplitAt(uint16 pos);

    void FillDmi(DictMatchInfo *dmi, const MileStoneHandle *handles, const FillDmiParam &p);

    size_t InnerPredict(const char16 fixedBuf[], uint16 fixedLen, char16 predictBuf[][K_MAX_PREDICT_SIZE + 1],
                        size_t bufLen);

    // Add the first candidate to the user dictionary.
    bool TryAddCand0ToUserdict();

    // Add a user lemma to the user dictionary. This lemma is a subset of
    // candidate 0. lma_from is from which lemma in lma_ids_, lmaNum is the
    // number of lemmas to be combined together as a new lemma. The caller
    // gurantees that the combined new lemma's length is less or equal to
    // K_MAX_LEMMA_SIZE.
    bool AddLmaToUserdict(uint16 lmaFr, uint16 lmaNum, float score);

    // Update dictionary frequencies.
    void UpdateDictFreq();

    void DebugPrintDmi(PoolPosType dmiPos, uint16 nestLevel);

public:
    MatrixSearch();
    ~MatrixSearch();

    bool Init(const char *fnSysDict, const char *fnUsrDict);

    bool InitFd(int sysFd, long startOffset, long length, const char *fnUsrDict);

    void SetMaxLens(size_t maxSpsLen, size_t maxHzsLen);

    void Close();

    void FlushCache();

    void SetXiAnSwitch(bool xiAnEnabled);

    bool GetXiAnSwitch() const;

    // Reset the Search space. Equivalent to ResetSearch(0).
    // If inited, always return true;
    bool ResetSearch();

    // Search a Pinyin string.
    // Return value is the position successfully parsed.
    size_t Search(const char *py, size_t pyLen);

    // Used to delete something in the Pinyin string kept by the engine, and do
    // a re-Search.
    // Return value is the new length of Pinyin string kept by the engine which
    // is parsed successfully.
    // If isPosInSplid is false, pos is used to indicate that pos-th Pinyin
    // character needs to be deleted. If isPosInSplid is true, all Pinyin
    // characters for pos-th spelling id needs to be deleted.
    // If the deleted character(s) is just after a fixed lemma or sub lemma in
    // composing phrase, clearFixedThisStep indicates whether we needs to
    // unlock the last fixed lemma or sub lemma.
    // If isPosInSplid is false, and pos-th character is in the range for the
    // fixed lemmas or composing string, this function will do nothing and just
    // return the result of the previous Search.
    size_t Delsearch(size_t pos, bool isPosInSplid, bool clearFixedThisStep);

    // Get the number of candiates, called after Search().
    size_t GetCandidateNum();

    // Get the Pinyin string stored by the engine.
    // *decodedLen returns the length of the successfully decoded string.
    const char *GetPystr(size_t *decodedLen);

    // Get the spelling boundaries for the first sentence candidate.
    // Number of spellings will be returned. The number of valid elements in
    // splStart is one more than the return value because the last one is used
    // to indicate the beginning of the next un-input speling.
    // For a Pinyin "women", the returned value is 2, splStart is [0, 2, 5] .
    size_t GetSplStart(const uint16 *&splStart);

    // Get one candiate string. If full sentence candidate is available, it will
    // be the first one.
    char16 *GetCandidate(size_t candId, char16 *candStr, size_t maxLen);

    // Get the first candiate, which is a "full sentence".
    // retstrLen is not nullptr, it will be used to return the string length.
    // If onlyUnfixed is true, only unfixed part will be fetched.
    char16 *GetCandidate0(char16 *candStr, size_t maxLen, uint16 *retstrLen, bool onlyUnfixed);

    // Choose a candidate. The decoder will do a Search after the fixed position.
    size_t Choose(size_t candId);

    // Cancel the last choosing operation, and return the new number of choices.
    size_t CancelLastChoice();

    // Get the length of fixed Hanzis.
    size_t GetFixedlen() const;

    size_t GetPredicts(const char16 fixedBuf[], char16 predictBuf[][K_MAX_PREDICT_SIZE + 1], size_t bufLen);
};
} // namespace ime_pinyin

#endif // PINYINIME_ANDPY_INCLUDE_MATRIXSEARCH_H_
