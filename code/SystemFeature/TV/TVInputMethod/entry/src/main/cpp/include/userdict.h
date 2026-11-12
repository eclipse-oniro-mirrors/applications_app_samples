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

#ifndef PINYINIME_INCLUDE_USERDICT_H_
#define PINYINIME_INCLUDE_USERDICT_H_

#define CACHE_ENABLED
#define SYNC_ENABLED
#define PREDICT_ENABLED

// Debug performance for operations

#ifdef _WIN32
#include <ctime>
#include <winsock.h> // timeval
#else
#include <pthread.h>
#include <sys/time.h>
#endif
#include "atomdictbase.h"

namespace ime_pinyin {
constexpr int K_MAGIC_1970 = 1970;
constexpr int K_MAGIC_60 = 60;
constexpr int K_MAGIC_365 = 365;
constexpr int K_MAGIC_24 = 24;
constexpr int K_MAGIC_30 = 30;

class SpellingParser;

struct NoSyncRecordCtx {
    char16 *ptr;
    int len;
    char16 *p;
    char16 *hz16;
    uint16 *splid;
    int splidLen;
    uint32 intf;
    uint64 lastMod;
};

class UserDict : public AtomDictBase {
public:
    UserDict();
    ~UserDict() override;

    bool LoadDict(const char *fileName, LemmaIdType startId, LemmaIdType endId) override;

    bool CloseDict() override;

    size_t NumberOfLemmas() override;

    void ResetMilestones(uint16 fromStep, MileStoneHandle fromHandle) override;

    MileStoneHandle ExtendDict(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems, size_t lpiMax,
                               size_t *lpiNum) override;

    size_t GetLpis(const uint16 *splidStr, uint16 splidStrLen, LmaPsbItem *lpiItems, size_t lpiMax) override;

    uint16 GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax) override;

    uint16 GetLemmaSplids(LemmaIdType idLemma, uint16 *splids, uint16 splidsMax, bool argValid) override;

    size_t Predict(const char16 lastHzs[], uint16 hzsLen, NPredictItem *npreItems, size_t npreMax,
                   size_t b4Used) override;

    // Full spelling ids are required
    LemmaIdType PutLemma(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen, uint16 count) override;

    LemmaIdType UpdateLemma(LemmaIdType lemmaId, int16 deltaCount, bool selected) override;

    LemmaIdType GetLemmaId(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen) override;

    LmaScoreType GetLemmaScore(LemmaIdType lemmaId) override;

    LmaScoreType GetLemmaScore(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen) override;

    bool RemoveLemma(LemmaIdType lemmaId) override;

    size_t GetTotalLemmaCount() override;
    void SetTotalLemmaCountOfOthers(size_t count) override;

    void FlushCache() override;

    void SetLimit(uint32 maxLemmaCount, uint32 maxLemmaSize, uint32 reclaimRatio);

    void Reclaim();

    void Defragment();

#ifdef SYNC_ENABLED
    void ClearSyncLemmas(unsigned int start, unsigned int end);

    int GetSyncCount();

    LemmaIdType PutLemmaNoSync(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen, uint16 count, uint64 lmt);
    /**
     * Add lemmas encoded in UTF-16LE into dictionary without adding sync flag.
     *
     * @param lemmas in format of 'wo men,WM,0.32;da jia,DJ,0.12'
     * @param len length of lemmas string in UTF-16LE
     * @return newly added lemma count
     */
    int PutLemmasNoSyncFromUtf16leString(char16 *lemmas, int len);

    /**
     * Get lemmas need sync to a UTF-16LE string of above format.
     * Note: input buffer (str) must not be too small. If str is too small to
     *       contain single one lemma, there might be a dead loop.
     *
     * @param str buffer to write lemmas
     * @param size buffer size in UTF-16LE
     * @param count output value of lemma returned
     * @return UTF-16LE string length
     */
    int GetSyncLemmasInUtf16leStringFromBeginning(char16 *str, int size, int *count);

#endif

    struct UserDictStat {
        uint32 version;
        const char *fileName;
        struct timeval loadTime;
        struct timeval lastUpdate;
        uint32 diskSize;
        uint32 lemmaCount;
        uint32 lemmaSize;
        uint32 deleteCount;
        uint32 deleteSize;
#ifdef SYNC_ENABLED
        uint32 syncCount;
#endif
        uint32 reclaimRatio;
        uint32 limitLemmaCount;
        uint32 limitLemmaSize;
    };

    bool State(UserDictStat *stat);

private:
    uint32 totalOtherNfreq_;
    struct timeval loadTime_;
    LemmaIdType startId_;
    uint32 version_;
    uint8 *lemmas_;

    // In-Memory-Only flag for each lemma
    static const uint8 kUserDictLemmaFlagRemove = 1;
    // Inuse lemmas' offset
    uint32 *offsets_;
    // Highest bit in offset tells whether corresponding lemma is removed
    static const uint32 kUserDictOffsetFlagRemove = (1 << 31);
    // Maximum possible for the offset
    static const uint32 kUserDictOffsetMask = ~(kUserDictOffsetFlagRemove);
    // Bit width for last modified time, from 1 to 16
    static const uint32 kUserDictLMTBitWidth = 16;
    // Granularity for last modified time in second
    static const uint32 kUserDictLMTGranularity = 60 * 60 * 24 * 7;
    // Maximum frequency count
    static const uint16 kUserDictMaxFrequency = 0xFFFF;

    static const uint64 kUserDictLMTSince = 1229904000ULL;

    // Correspond to offsets_
    uint32 *scores_;
    // Following two fields are only valid in memory
    uint32 *ids_;
#ifdef PREDICT_ENABLED
    uint32 *predicts_;
#endif
#ifdef SYNC_ENABLED
    uint32 *syncs_;
    size_t syncCountSize_;
#endif
    uint32 *offsetsById_;

    size_t lemmaCountLeft_;
    size_t lemmaSizeLeft_;

    const char *dictFile_;

    // Be sure size is 4xN
    struct UserDictInfo {
        // When limitation reached, how much percentage will be reclaimed (1 ~ 100)
        uint32 reclaimRatio;
        // maximum lemma count, 0 means no limitation
        uint32 limitLemmaCount;
        // Maximum lemma size, it's different from
        // whole disk file size or in-mem dict size
        // 0 means no limitation
        uint32 limitLemmaSize;
        // Total lemma count including deleted and inuse
        // Also indicate offsets_ size
        uint32 lemmaCount;
        // Total size of lemmas including used and freed
        uint32 lemmaSize;
        // Freed lemma count
        uint32 freeCount;
        // Freed lemma size in byte
        uint32 freeSize;
#ifdef SYNC_ENABLED
        uint32 syncCount;
#endif
        int32 totalNfreq;
    } dictInfo_;

    static const uint32 kUserDictVersion = 0x0ABCDEF0;

    static const uint32 kUserDictPreAlloc = 32;
    static const uint32 kUserDictAverageNchar = 8;

    enum UserDictState {
        // Keep in order
        USER_DICT_NONE = 0,
        USER_DICT_SYNC,
#ifdef SYNC_ENABLED
        USER_DICT_SYNC_DIRTY,
#endif
        USER_DICT_SCORE_DIRTY,
        USER_DICT_OFFSET_DIRTY,
        USER_DICT_LEMMA_DIRTY,

        USER_DICT_DEFRAGMENTED,
    } state_;

    struct UserDictSearchable {
        uint16 splidsLen;
        uint16 splidStart[K_MAX_LEMMA_SIZE];
        uint16 splidCount[K_MAX_LEMMA_SIZE];
        // Compact inital letters for both FuzzyCompareSpellId and cache system
        uint32 signature[K_MAX_LEMMA_SIZE / 4];
    };

#ifdef CACHE_ENABLED
    enum UserDictCacheType {
        USER_DICT_CACHE,
        USER_DICT_MISS_CACHE,
    };

    static const int kUserDictCacheSize = 4;
    static const int kUserDictMissCacheSize = K_MAX_LEMMA_SIZE - 1;

    struct UserDictMissCache {
        uint32 signatures[kUserDictMissCacheSize][K_MAX_LEMMA_SIZE / 4];
        uint16 head, tail;
    } missCaches_[K_MAX_LEMMA_SIZE];

    struct UserDictCache {
        uint32 signatures[kUserDictCacheSize][K_MAX_LEMMA_SIZE / 4];
        uint32 offsets[kUserDictCacheSize];
        uint32 lengths[kUserDictCacheSize];
        // Ring buffer
        uint16 head, tail;
    } caches_[K_MAX_LEMMA_SIZE];

    void CacheInit();

    void CachePush(UserDictCacheType type, UserDictSearchable *searchable, uint32 offset, uint32 length);

    bool CacheHit(UserDictSearchable *searchable, uint32 *offset, uint32 *length);

    bool LoadCache(UserDictSearchable *searchable, uint32 *offset, uint32 *length);

    void SaveCache(UserDictSearchable *searchable, uint32 offset, uint32 length);

    void ResetCache();

    bool LoadMissCache(UserDictSearchable *searchable);

    void SaveMissCache(UserDictSearchable *searchable);

    void ResetMissCache();
#endif

    LmaScoreType TranslateScore(int rawScore);

    int ExtractScoreFreq(int rawScore);

    uint64 ExtractScoreLmt(int rawScore);

    int BuildScore(uint64 lmt, int freq);

    int64 Utf16leAtoll(uint16 *s, int len);

    int Utf16leLltoa(int64 v, uint16 *s, int size);

    LemmaIdType PutLemmaInternal(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen, uint16 count, uint64 lmt);

    size_t GetLpisInternal(const uint16 *splidStr, uint16 splidStrLen, LmaPsbItem *lpiItems, size_t lpiMax,
                           bool *needExtend);

    struct LpisSearchCtx {
        UserDictSearchable searchable;
        int32 middle;
        uint32 maxOff;
        uint32 start;
        bool cached;
    };

    bool PrepareLpisSearch(const uint16 *splidStr, uint16 splidStrLen, LpisSearchCtx &ctx);

    void ReloadFromDiskIfUpdated();
    bool LocateMiddle(UserDictSearchable *searchable, int32 &middle, uint32 &maxOff, uint32 &start, bool &cached);
    bool IsFuzzyBreak(uint16 *splids, uint8 nchar, UserDictSearchable *searchable, bool cached);
    void UpdatePrefixBreak(uint16 *splids, uint8 nchar, UserDictSearchable *searchable, bool &prefixBreak,
                           bool *needExtend);
    void PushSearchCache(UserDictSearchable *searchable, int32 middle, uint32 start, bool cached);

    bool LemmaWordMatches(uint32 offset, const char16 lemmaStr[], uint16 lemmaLen);

    bool InsertLemmaSorted(uint32 off, const uint16 *splids, uint16 lemmaLen);

    bool ParseNoSyncRecord(SpellingParser *splParser, NoSyncRecordCtx &ctx);
    bool ParsePinyinField(SpellingParser *splParser, NoSyncRecordCtx &ctx, char16 *&p);

    int BuildSyncRecord(SpellingTrie *splTrie, int offset, char16 *temp, char16 *tempEnd);
    bool AppendSyncPinyin(SpellingTrie *splTrie, const uint16 *spl, uint32 nchar, char16 *&ptemp, char16 *tempEnd);

    size_t CompactOffsetsAndScores();
#ifdef PREDICT_ENABLED
    void CompactPredicts();
#endif
    void CompactLemmas();
    bool CompactLemmaRange(size_t realSize, size_t &dst);
    bool SkipInUseLemmas(size_t realSize, size_t &dst);
    void AdjustMovedOffsets(size_t begin, size_t end, size_t dst);

    struct UserDictLoadBuffer {
        uint8 *lemmas = nullptr;
        uint32 *offsets = nullptr;
        uint32 *scores = nullptr;
        uint32 *ids = nullptr;
        uint32 *offsetsById = nullptr;
#ifdef SYNC_ENABLED
        uint32 *syncs = nullptr;
#endif
#ifdef PREDICT_ENABLED
        uint32 *predicts = nullptr;
#endif
    };

    static bool LoadReadExact(FILE *fp, uint8 *dst, size_t bytes);
    static bool LoadAllocBuffers(const UserDictInfo &dictInfo, UserDictLoadBuffer &buf);
    static void FreeLoadBuffers(UserDictLoadBuffer &buf);
    static bool LoadReadArrays(FILE *fp, const UserDictInfo &dictInfo, const UserDictLoadBuffer &buf);
    static bool LoadPrepare(FILE *fp, UserDictInfo &dictInfo, UserDictLoadBuffer &buf);

    int GetLemmaScoreInternal(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen);

    int GetLemmaScoreInternal(LemmaIdType lemmaId);

    int IsFuzzyPrefixSpellId(const uint16 *id1, uint16 len1, const UserDictSearchable *searchable);

    bool IsPrefixSpellId(const uint16 *fullids, uint16 fulllen, const UserDictSearchable *searchable);

    uint32 GetDictFileSize(UserDictInfo *info);

    bool Reset(const char *file);

    bool Validate(const char *file);

    bool Load(const char *file, LemmaIdType startId);

    bool IsValidState();

    bool IsValidLemmaId(LemmaIdType id);

    LemmaIdType GetMaxLemmaId() const;

    void SetLemmaFlag(uint32 offset, uint8 flag);

    char GetLemmaFlag(uint32 offset);

    char GetLemmaNchar(uint32 offset);

    uint16 *GetLemmaSpellIds(uint32 offset);

    uint16 *GetLemmaWord(uint32 offset);

    // Prepare searchable to fasten locate process
    void PrepareLocate(UserDictSearchable *searchable, const uint16 *splidStr, uint16 splidStrLen);

    // Compare initial letters only
    int32 FuzzyCompareSpellId(const uint16 *id1, uint16 len1, const UserDictSearchable *searchable);

    // Compare exactly two spell ids
    // First argument must be a full id spell id
    bool EqualSpellId(const uint16 *fullids, uint16 fulllen, const UserDictSearchable *searchable);

    // Find first item by initial letters
    int32 LocateFirstInOffsets(const UserDictSearchable *searchable);

    LemmaIdType AppendALemma(const char16 lemmaStr[], uint16 splids[], uint16 lemmaLen, uint16 count, uint64 lmt);

    // Check if a lemma is in dictionary
    int32 LocateInOffsets(const char16 lemmaStr[], uint16 splidStr[], uint16 lemmaLen);

    bool RemoveLemmaByOffsetIndex(int offsetIndex);
#ifdef PREDICT_ENABLED
    uint32 LocateWhereToInsertInPredicts(const uint16 *words, int lemmaLen);

    int32 LocateFirstInPredicts(const uint16 *words, int lemmaLen);

    void RemoveLemmaFromPredictList(uint32 offset);
#endif
#ifdef SYNC_ENABLED
    void QueueLemmaForSync(LemmaIdType id);

    void RemoveLemmaFromSyncList(uint32 offset);

    void WriteBackSync(int fd);
#endif
    void WriteBackScore(int fd);
    void WriteBackOffset(int fd);
    void WriteBackLemma(int fd);
    void WriteBackAll(int fd);
    void WriteBack();

    struct UserDictScoreOffsetPair {
        int score;
        uint32 offsetIndex;
    };

    void Swap(UserDictScoreOffsetPair *sop, int i, int j);

    void ShiftDown(UserDictScoreOffsetPair *sop, int i, int n);

    // On-disk format for each lemma
    // +-------------+
    // | Version (4) |
    // +-------------+
    // +-----------+-----------+--------------------+-------------------+
    // | Spare (1) | Nchar (1) | Splids (2 x Nchar) | Lemma (2 x Nchar) |
    // +-----------+-----------+--------------------+-------------------+
    // ...
    // +-----------------------+     +-------------+      <---Offset of offset
    // | Offset1 by_splids (4) | ... | OffsetN (4) |
    // +-----------------------+     +-------------+
#ifdef PREDICT_ENABLED
    // +----------------------+     +-------------+
    // | Offset1 by_lemma (4) | ... | OffsetN (4) |
    // +----------------------+     +-------------+
#endif
    // +------------+     +------------+
    // | Score1 (4) | ... | ScoreN (4) |
    // +------------+     +------------+
#ifdef SYNC_ENABLED
    // +-------------+     +-------------+
    // | NewAdd1 (4) | ... | NewAddN (4) |
    // +-------------+     +-------------+
#endif
    // +----------------+
    // | Dict Info (4x) |
    // +----------------+
};
} // namespace ime_pinyin

#endif
