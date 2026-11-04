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

#include "../include/userdict.h"
#include "../include/ngram.h"
#include "../include/splparser.h"
#include <cassert>
#include <cctype>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <fcntl.h>
#include <pthread.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

#include "ime_assert.h"
#include "ime_secure.h"
constexpr int K_MAGIC_10 = 10;
constexpr int K_MAGIC_16 = 16;
constexpr int K_MAGIC_2 = 2;
constexpr int K_MAGIC_4 = 4;
constexpr int K_MAGIC_64 = 64;
constexpr int K_MAGIC_3 = 3;
constexpr int K_MAGIC_8 = 8;
constexpr int K_MAGIC_100 = 100;

namespace ime_pinyin {

#ifdef DEBUG_PERF
static uint64 _ellapse_ = 0;
static struct timeval _tv_start_, _tv_end_;
#define DEBUG_PERF_BEGIN                                                                                               \
    do {                                                                                                               \
        gettimeofday(&_tv_start_, nullptr);                                                                            \
    } while (0)
#define DEBUG_PERF_END                                                                                                 \
    do {                                                                                                               \
        gettimeofday(&_tv_end_, nullptr);                                                                              \
        _ellapse_ = (_tv_end_.tv_sec - _tv_start_.tv_sec) * 1000000 + (_tv_end_.tv_usec - _tv_start_.tv_usec);         \
    } while (0)
inline void LogdPerf(const char *message) { ALOGD("PERFORMANCE[%s] %llu usec.", message, _ellapse_); }
#else
#define DEBUG_PERF_BEGIN
#define DEBUG_PERF_END
inline void LogdPerf(const char *message) { (void)message; }
#endif

// XXX File Load and write are thread-safe by g_mutex
static pthread_mutex_t g_mutex = PTHREAD_MUTEX_INITIALIZER;
static struct timeval g_lastUpdate = {0, 0};

uint32 UserDict::GetDictFileSize(UserDictInfo *info)
{
    uint32 size = K_MAGIC_4 + info->lemmaSize + (info->lemmaCount << K_MAGIC_3);
#ifdef PREDICT_ENABLED
    size += (info->lemmaCount << K_MAGIC_2);
#endif
#ifdef SYNC_ENABLED
    size += (info->syncCount << K_MAGIC_2);
#endif
    return size + sizeof(*info);
}

LmaScoreType UserDict::TranslateScore(int rawScore)
{
    // 1) oriFreq: original user frequency
    uint32 oriFreq = ExtractScoreFreq(rawScore);
    // 2) lmtOff: lmt index (week offset for example)
    uint64 lmtOff = ((rawScore & 0xffff0000) >> 16);
    if (K_MAGIC_16 < kUserDictLMTBitWidth) {
        uint64 mask = ~(1 << kUserDictLMTBitWidth);
        lmtOff &= mask;
    }
    // 3) nowOff: current time index (current week offset for example)
    // assuming loadTime_ is around current time
    uint64 nowOff = loadTime_.tv_sec;
    nowOff = (nowOff - kUserDictLMTSince) / kUserDictLMTGranularity;
    nowOff = (nowOff << (K_MAGIC_64 - kUserDictLMTBitWidth));
    nowOff = (nowOff >> (K_MAGIC_64 - kUserDictLMTBitWidth));
    // 4) factor: decide expand-factor
    int delta = nowOff - lmtOff;
    if (delta > K_MAGIC_4) {
        delta = K_MAGIC_4;
    }
    int factor = 80 - (delta << 4);

    double tf = static_cast<double>((dictInfo_.totalNfreq + totalOtherNfreq_));
    return static_cast<LmaScoreType>(log(static_cast<double>(factor) * static_cast<double>(oriFreq) / tf) *
                                     NGram::kLogValueAmplifier);
}

int UserDict::ExtractScoreFreq(int rawScore)
{
    // Frequence stored in lowest 16 bits
    int freq = (rawScore & 0x0000ffff);
    return freq;
}

uint64 UserDict::ExtractScoreLmt(int rawScore)
{
    uint64 lmt = ((rawScore & 0xffff0000) >> 16);
    if (K_MAGIC_16 < kUserDictLMTBitWidth) {
        uint64 mask = ~(1 << kUserDictLMTBitWidth);
        lmt &= mask;
    }
    lmt = lmt * kUserDictLMTGranularity + kUserDictLMTSince;
    return lmt;
}

int UserDict::BuildScore(uint64 lmt, int freq)
{
    lmt = (lmt - kUserDictLMTSince) / kUserDictLMTGranularity;
    lmt = (lmt << (K_MAGIC_64 - kUserDictLMTBitWidth));
    lmt = (lmt >> (K_MAGIC_64 - kUserDictLMTBitWidth));
    uint16 lmt16 = static_cast<uint16>(lmt);
    int s = freq;
    s &= 0x0000ffff;
    s = (lmt16 << K_MAGIC_16) | s;
    return s;
}

int64 UserDict::Utf16leAtoll(uint16 *s, int len)
{
    int64 ret = 0;
    if (len <= 0) {
        return ret;
    }

    int flag = 1;
    const uint16 *endp = s + len;
    if (*s == '-') {
        flag = -1;
        s++;
    } else if (*s == '+') {
        s++;
    }

    while (*s >= '0' && *s <= '9' && s < endp) {
        ret += ret * K_MAGIC_10 + (*s) - '0';
        s++;
    }
    return ret * flag;
}

int UserDict::Utf16leLltoa(int64 v, uint16 *s, int size)
{
    if (!s || size <= 0) {
        return 0;
    }
    uint16 *endp = s + size;
    int retLen = 0;
    if (v < 0) {
        *(s++) = '-';
        ++retLen;
        v *= -1;
    }

    uint16 *b = s;
    while (s < endp && v != 0) {
        *(s++) = '0' + (v % K_MAGIC_10);
        v = v / K_MAGIC_10;
        ++retLen;
    }

    if (v != 0) {
        return 0;
    }

    --s;

    while (b < s) {
        *b = *s;
        ++b, --s;
    }

    return retLen;
}

void UserDict::SetLemmaFlag(uint32 offset, uint8 flag)
{
    offset &= kUserDictOffsetMask;
    lemmas_[offset] |= flag;
}

char UserDict::GetLemmaFlag(uint32 offset)
{
    offset &= kUserDictOffsetMask;
    return static_cast<char>((lemmas_[offset]));
}

char UserDict::GetLemmaNchar(uint32 offset)
{
    offset &= kUserDictOffsetMask;
    return static_cast<char>((lemmas_[offset + 1]));
}

uint16 *UserDict::GetLemmaSpellIds(uint32 offset)
{
    offset &= kUserDictOffsetMask;
    return reinterpret_cast<uint16 *>((lemmas_ + offset + K_MAGIC_2));
}

uint16 *UserDict::GetLemmaWord(uint32 offset)
{
    offset &= kUserDictOffsetMask;
    uint8 nchar = GetLemmaNchar(offset);
    return reinterpret_cast<uint16 *>((lemmas_ + offset + K_MAGIC_2 + (nchar << 1)));
}

LemmaIdType UserDict::GetMaxLemmaId() const
{
    // When a lemma is deleted, we don't not claim its id back for
    // simplicity and performance
    return startId_ + dictInfo_.lemmaCount - 1;
}

bool UserDict::IsValidLemmaId(LemmaIdType id)
{
    if (id >= startId_ && id <= GetMaxLemmaId()) {
        return true;
    }
    return false;
}

bool UserDict::IsValidState()
{
    if (state_ == USER_DICT_NONE) {
        return false;
    }
    return true;
}

UserDict::UserDict()
    : startId_(0), version_(0), lemmas_(nullptr), offsets_(nullptr), scores_(nullptr), ids_(nullptr),
#ifdef PREDICT_ENABLED
      predicts_(nullptr),
#endif
#ifdef SYNC_ENABLED
      syncs_(nullptr), syncCountSize_(0),
#endif
      offsetsById_(nullptr), lemmaCountLeft_(0), lemmaSizeLeft_(0), dictFile_(nullptr), state_(USER_DICT_NONE) {
    ImeMemset(&dictInfo_, sizeof(dictInfo_), 0, sizeof(dictInfo_));
    ImeMemset(&loadTime_, sizeof(loadTime_), 0, sizeof(loadTime_));
#ifdef CACHE_ENABLED
    CacheInit();
#endif
}

UserDict::~UserDict() { CloseDict(); }

bool UserDict::LoadDict(const char *fileName, LemmaIdType startId, LemmaIdType endId)
{
#ifdef DEBUG_PERF
    DEBUG_PERF_BEGIN;
#endif
    dictFile_ = strdup(fileName);
    if (!dictFile_) {
        return false;
    }

    startId_ = startId;

    if (Validate(fileName) == false && Reset(fileName) == false) {
        goto error;
    }
    if (Load(fileName, startId) == false) {
        goto error;
    }

    state_ = USER_DICT_SYNC;

    gettimeofday(&loadTime_, nullptr);

#ifdef DEBUG_PERF
    DEBUG_PERF_END;
    LogdPerf("LoadDict");
#endif
    return true;
error:
    free(const_cast<char *>(dictFile_));
    startId_ = 0;
    return false;
}

bool UserDict::CloseDict()
{
    if (state_ == USER_DICT_NONE) {
        return true;
    }
    if (state_ == USER_DICT_SYNC) {
        goto out;
    }

    // If dictionary is written back by others,
    // we can not simply write back here
    // To do a safe flush, we have to discard all newly added
    // lemmas and try to reload dict file.
    pthread_mutex_lock(&g_mutex);
    if (loadTime_.tv_sec > g_lastUpdate.tv_sec ||
        (loadTime_.tv_sec == g_lastUpdate.tv_sec && loadTime_.tv_usec > g_lastUpdate.tv_usec)) {
        WriteBack();
        gettimeofday(&g_lastUpdate, nullptr);
    }
    pthread_mutex_unlock(&g_mutex);

out:
    free(const_cast<char *>(dictFile_));
    free(lemmas_);
    free(offsets_);
    free(offsetsById_);
    free(scores_);
    free(ids_);
#ifdef PREDICT_ENABLED
    free(predicts_);
#endif

    version_ = 0;
    dictFile_ = nullptr;
    lemmas_ = nullptr;
#ifdef SYNC_ENABLED
    syncs_ = nullptr;
    syncCountSize_ = 0;
#endif
    offsets_ = nullptr;
    offsetsById_ = nullptr;
    scores_ = nullptr;
    ids_ = nullptr;
#ifdef PREDICT_ENABLED
    predicts_ = nullptr;
#endif

    ImeMemset(&dictInfo_, sizeof(dictInfo_), 0, sizeof(dictInfo_));
    lemmaCountLeft_ = 0;
    lemmaSizeLeft_ = 0;
    state_ = USER_DICT_NONE;

    return true;
}

size_t UserDict::NumberOfLemmas() { return dictInfo_.lemmaCount; }

void UserDict::ResetMilestones(uint16 fromStep, MileStoneHandle fromHandle) { return; }

MileStoneHandle UserDict::ExtendDict(MileStoneHandle fromHandle, const DictExtPara *dep, LmaPsbItem *lpiItems,
                                     size_t lpiMax, size_t *lpiNum)
{
    if (IsValidState() == false) {
        return 0;
    }

    bool needExtend = false;

#ifdef DEBUG_PERF
    DEBUG_PERF_BEGIN;
#endif
    *lpiNum = GetLpisInternal(dep->splids, dep->splidsExtended + 1, lpiItems, lpiMax, &needExtend);
#ifdef DEBUG_PERF
    DEBUG_PERF_END;
    LogdPerf("ExtendDict");
#endif
    return ((*lpiNum > 0 || needExtend) ? 1 : 0);
}

int UserDict::IsFuzzyPrefixSpellId(const uint16 *id1, uint16 len1, const UserDictSearchable *searchable)
{
    if (len1 < searchable->splidsLen) {
        return 0;
    }

    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    uint32 i = 0;
    for (i = 0; i < searchable->splidsLen; i++) {
        const char py1 = *splTrie.GetSpellingStr(id1[i]);
        uint16 off = 8 * (i % 4);
        const char py2 = ((searchable->signature[i / 4] & (0xff << off)) >> off);
        if (py1 == py2) {
            continue;
        }
        return 0;
    }
    return 1;
}

int UserDict::FuzzyCompareSpellId(const uint16 *id1, uint16 len1, const UserDictSearchable *searchable)
{
    if (len1 < searchable->splidsLen) {
        return -1;
    }
    if (len1 > searchable->splidsLen) {
        return 1;
    }

    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    uint32 i = 0;
    for (i = 0; i < len1; i++) {
        const char py1 = *splTrie.GetSpellingStr(id1[i]);
        uint16 off = 8 * (i % 4);
        const char py2 = ((searchable->signature[i / 4] & (0xff << off)) >> off);
        if (py1 == py2) {
            continue;
        }
        if (py1 > py2) {
            return 1;
        }
        return -1;
    }
    return 0;
}

bool UserDict::IsPrefixSpellId(const uint16 *fullids, uint16 fulllen, const UserDictSearchable *searchable)
{
    if (fulllen < searchable->splidsLen) {
        return false;
    }

    uint32 i = 0;
    for (; i < searchable->splidsLen; i++) {
        uint16 startId = searchable->splidStart[i];
        uint16 count = searchable->splidCount[i];
        if (fullids[i] >= startId && fullids[i] < startId + count) {
            continue;
        } else {
            return false;
        }
    }
    return true;
}

bool UserDict::EqualSpellId(const uint16 *fullids, uint16 fulllen, const UserDictSearchable *searchable)
{
    if (fulllen != searchable->splidsLen) {
        return false;
    }

    uint32 i = 0;
    for (; i < fulllen; i++) {
        uint16 startId = searchable->splidStart[i];
        uint16 count = searchable->splidCount[i];
        if (fullids[i] >= startId && fullids[i] < startId + count) {
            continue;
        } else {
            return false;
        }
    }
    return true;
}

int32 UserDict::LocateFirstInOffsets(const UserDictSearchable *searchable)
{
    int32 begin = 0;
    int32 end = dictInfo_.lemmaCount - 1;
    int32 middle = -1;

    int32 firstPrefix = middle;
    int32 lastMatched = middle;

    while (begin <= end) {
        middle = (begin + end) >> 1;
        uint32 offset = offsets_[middle];
        uint8 nchar = GetLemmaNchar(offset);
        const uint16 *splids = GetLemmaSpellIds(offset);
        int cmp = FuzzyCompareSpellId(splids, nchar, searchable);
        int pre = IsFuzzyPrefixSpellId(splids, nchar, searchable);
        if (pre) {
            firstPrefix = middle;
        }

        if (cmp < 0) {
            begin = middle + 1;
        } else if (cmp > 0) {
            end = middle - 1;
        } else {
            end = middle - 1;
            lastMatched = middle;
        }
    }

    return firstPrefix;
}

void UserDict::PrepareLocate(UserDictSearchable *searchable, const uint16 *splidStr, uint16 splidStrLen)
{
    searchable->splidsLen = splidStrLen;
    ImeMemset(searchable->signature, sizeof(searchable->signature), 0, sizeof(searchable->signature));

    SpellingTrie &splTrie = SpellingTrie::GetInstance();
    uint32 i = 0;
    for (; i < splidStrLen; i++) {
        if (splTrie.IsHalfId(splidStr[i])) {
            searchable->splidCount[i] = splTrie.HalfToFull(splidStr[i], &(searchable->splidStart[i]));
        } else {
            searchable->splidCount[i] = 1;
            searchable->splidStart[i] = splidStr[i];
        }
        const unsigned char py = *splTrie.GetSpellingStr(splidStr[i]);
        searchable->signature[i >> K_MAGIC_2] |= (py << (K_MAGIC_8 * (i % K_MAGIC_4)));
    }
}

size_t UserDict::GetLpis(const uint16 *splidStr, uint16 splidStrLen, LmaPsbItem *lpiItems, size_t lpiMax)
{
    return GetLpisInternal(splidStr, splidStrLen, lpiItems, lpiMax, nullptr);
}

void UserDict::ReloadFromDiskIfUpdated()
{
    if (pthread_mutex_trylock(&g_mutex) != 0) {
        return;
    }
    if (loadTime_.tv_sec < g_lastUpdate.tv_sec ||
        (loadTime_.tv_sec == g_lastUpdate.tv_sec && loadTime_.tv_usec < g_lastUpdate.tv_usec)) {
        pthread_mutex_unlock(&g_mutex);
        FlushCache();
    } else {
        pthread_mutex_unlock(&g_mutex);
    }
}

bool UserDict::LocateMiddle(UserDictSearchable *searchable, int32 &middle, uint32 &maxOff, uint32 &start,
                            bool &cached)
{
    uint32 count = 0;
    maxOff = dictInfo_.lemmaCount;
#ifdef CACHE_ENABLED
    cached = CacheHit(searchable, &start, &count);
    if (cached) {
        middle = start;
        maxOff = start + count;
    } else {
        middle = LocateFirstInOffsets(searchable);
        start = middle;
    }
#else
    cached = false;
    middle = LocateFirstInOffsets(searchable);
#endif
    if (middle == -1) {
#ifdef CACHE_ENABLED
        if (!cached) {
            CachePush(USER_DICT_MISS_CACHE, searchable, 0, 0);
        }
#endif
        return false;
    }
    return true;
}

bool UserDict::IsFuzzyBreak(uint16 *splids, uint8 nchar, UserDictSearchable *searchable, bool cached)
{
#ifdef CACHE_ENABLED
    if (cached) {
        return false;
    }
#else
    (void)cached;
#endif
    return FuzzyCompareSpellId(splids, nchar, searchable) != 0;
}

void UserDict::UpdatePrefixBreak(uint16 *splids, uint8 nchar, UserDictSearchable *searchable, bool &prefixBreak,
                                 bool *needExtend)
{
    if (prefixBreak) {
        return;
    }
    if (!IsFuzzyPrefixSpellId(splids, nchar, searchable)) {
        prefixBreak = true;
        return;
    }
    if (*needExtend == false && IsPrefixSpellId(splids, nchar, searchable)) {
        *needExtend = true;
    }
}

void UserDict::PushSearchCache(UserDictSearchable *searchable, int32 middle, uint32 start, bool cached)
{
#ifdef CACHE_ENABLED
    if (!cached) {
        uint32 count = middle - start;
        CachePush(USER_DICT_CACHE, searchable, start, count);
    }
#else
    (void)searchable;
    (void)middle;
    (void)start;
    (void)cached;
#endif
}

bool UserDict::PrepareLpisSearch(const uint16 *splidStr, uint16 splidStrLen, LpisSearchCtx &ctx)
{
    ReloadFromDiskIfUpdated();
    PrepareLocate(&ctx.searchable, splidStr, splidStrLen);

    ctx.middle = 0;
    ctx.maxOff = 0;
    ctx.start = 0;
    ctx.cached = false;
    return LocateMiddle(&ctx.searchable, ctx.middle, ctx.maxOff, ctx.start, ctx.cached);
}

size_t UserDict::GetLpisInternal(const uint16 *splidStr, uint16 splidStrLen, LmaPsbItem *lpiItems, size_t lpiMax,
                                 bool *needExtend)
{
    bool tmpExtend;
    if (!needExtend) {
        needExtend = &tmpExtend;
    }

    *needExtend = false;

    if (IsValidState() == false) {
        return 0;
    }
    if (lpiMax <= 0) {
        return 0;
    }

    LpisSearchCtx ctx;
    if (!PrepareLpisSearch(splidStr, splidStrLen, ctx)) {
        return 0;
    }

    size_t lpiCurrent = 0;

    bool fuzzyBreak = false;
    bool prefixBreak = false;
    while (static_cast<size_t>(ctx.middle) < ctx.maxOff && !fuzzyBreak && !prefixBreak) {
        if (lpiCurrent >= lpiMax) {
            break;
        }
        uint32 offset = offsets_[ctx.middle];
        // Ignore deleted lemmas
        if (offset & kUserDictOffsetFlagRemove) {
            ctx.middle++;
            continue;
        }
        uint8 nchar = GetLemmaNchar(offset);
        uint16 *splids = GetLemmaSpellIds(offset);
        if (IsFuzzyBreak(splids, nchar, &ctx.searchable, ctx.cached)) {
            fuzzyBreak = true;
        }

        UpdatePrefixBreak(splids, nchar, &ctx.searchable, prefixBreak, needExtend);

        if (EqualSpellId(splids, nchar, &ctx.searchable) == true) {
            lpiItems[lpiCurrent].psb = TranslateScore(scores_[ctx.middle]);
            lpiItems[lpiCurrent].id = ids_[ctx.middle];
            lpiItems[lpiCurrent].lmaLen = nchar;
            lpiCurrent++;
        }
        ctx.middle++;
    }

    PushSearchCache(&ctx.searchable, ctx.middle, ctx.start, ctx.cached);

    return lpiCurrent;
}

uint16 UserDict::GetLemmaStr(LemmaIdType idLemma, char16 *strBuf, uint16 strMax)
{
    if (IsValidState() == false) {
        return 0;
    }
    if (IsValidLemmaId(idLemma) == false) {
        return 0;
    }
    uint32 offset = offsetsById_[idLemma - startId_];
    uint8 nchar = GetLemmaNchar(offset);
    char16 *str = GetLemmaWord(offset);
    uint16 m = nchar < strMax - 1 ? nchar : strMax - 1;
    int i = 0;
    for (; i < m; i++) {
        strBuf[i] = str[i];
    }
    strBuf[i] = 0;
    return m;
}

uint16 UserDict::GetLemmaSplids(LemmaIdType idLemma, uint16 *splids, uint16 splidsMax, bool argValid)
{
    if (IsValidLemmaId(idLemma) == false) {
        return 0;
    }
    uint32 offset = offsetsById_[idLemma - startId_];
    uint8 nchar = GetLemmaNchar(offset);
    const uint16 *ids = GetLemmaSpellIds(offset);
    int i = 0;
    for (; i < nchar && i < splidsMax; i++) {
        splids[i] = ids[i];
    }
    return i;
}

size_t UserDict::Predict(const char16 lastHzs[], uint16 hzsLen, NPredictItem *npreItems, size_t npreMax,
                         size_t b4Used)
{
    uint32 newAdded = 0;
#ifdef PREDICT_ENABLED
    int32 end = dictInfo_.lemmaCount - 1;
    int j = LocateFirstInPredicts(reinterpret_cast<const uint16 *>(lastHzs), hzsLen);
    if (j == -1) {
        return 0;
    }

    while (j <= end) {
        uint32 offset = predicts_[j];
        // Ignore deleted lemmas
        if (offset & kUserDictOffsetFlagRemove) {
            j++;
            continue;
        }
        uint32 nchar = GetLemmaNchar(offset);
        uint16 *words = GetLemmaWord(offset);
        uint16 *splids = GetLemmaSpellIds(offset);

        if (nchar <= hzsLen) {
            j++;
            continue;
        }

        if (memcmp(words, lastHzs, hzsLen << 1) == 0) {
            if (newAdded >= npreMax) {
                return newAdded;
            }
            uint32 cpyLen = (nchar < K_MAX_PREDICT_SIZE ? (nchar << 1) : (K_MAX_PREDICT_SIZE << 1)) - (hzsLen << 1);
            npreItems[newAdded].hisLen = hzsLen;
            npreItems[newAdded].psb = GetLemmaScore(words, splids, nchar);
            ImeMemcpy(npreItems[newAdded].preHzs, cpyLen, words + hzsLen, cpyLen);
            if ((cpyLen >> 1) < K_MAX_PREDICT_SIZE) {
                npreItems[newAdded].preHzs[cpyLen >> 1] = 0;
            }
            newAdded++;
        } else {
            break;
        }

        j++;
    }
#endif
    return newAdded;
}

bool UserDict::LemmaWordMatches(uint32 offset, const char16 lemmaStr[], uint16 lemmaLen)
{
    uint16 *str = GetLemmaWord(offset);
    uint32 i = 0;
    for (i = 0; i < lemmaLen; i++) {
        if (str[i] == lemmaStr[i]) {
            continue;
        }
        break;
    }
    return i >= lemmaLen;
}

int32 UserDict::LocateInOffsets(const char16 lemmaStr[], uint16 splidStr[], uint16 lemmaLen)
{
    int32 maxOff = dictInfo_.lemmaCount;

    UserDictSearchable searchable;
    PrepareLocate(&searchable, splidStr, lemmaLen);
#ifdef CACHE_ENABLED
    int32 off;
    uint32 start;
    uint32 count;
    bool cached = LoadCache(&searchable, &start, &count);
    if (cached) {
        off = start;
        maxOff = start + count;
    } else {
        off = LocateFirstInOffsets(&searchable);
        start = off;
    }
#else
    int32 off = LocateFirstInOffsets(&searchable);
    bool cached = false;
#endif

    if (off == -1) {
        return off;
    }

    while (off < maxOff) {
        uint32 offset = offsets_[off];
        if (offset & kUserDictOffsetFlagRemove) {
            off++;
            continue;
        }
        uint16 *splids = GetLemmaSpellIds(offset);
        if (IsFuzzyBreak(splids, lemmaLen, &searchable, cached)) {
            break;
        }
        if (EqualSpellId(splids, lemmaLen, &searchable) == true) {
            if (LemmaWordMatches(offset, lemmaStr, lemmaLen)) {
                return off;
            }
            off++;
            continue;
        }
        off++;
    }

    return -1;
}

#ifdef PREDICT_ENABLED
uint32 UserDict::LocateWhereToInsertInPredicts(const uint16 *words, int lemmaLen)
{
    int32 begin = 0;
    int32 end = dictInfo_.lemmaCount - 1;
    int32 middle = end;

    uint32 lastMatched = middle;

    while (begin <= end) {
        middle = (begin + end) >> 1;
        uint32 offset = offsets_[middle];
        uint8 nchar = GetLemmaNchar(offset);
        const uint16 *ws = GetLemmaWord(offset);

        uint32 minl = nchar < lemmaLen ? nchar : lemmaLen;
        uint32 k = 0;
        int cmp = 0;

        for (; k < minl; k++) {
            if (ws[k] < words[k]) {
                cmp = -1;
                break;
            } else if (ws[k] > words[k]) {
                cmp = 1;
                break;
            }
        }
        if (cmp == 0) {
            if (nchar < lemmaLen) {
                cmp = -1;
            } else if (nchar > lemmaLen) {
                cmp = 1;
            }
        }

        if (cmp < 0) {
            begin = middle + 1;
            lastMatched = middle;
        } else if (cmp > 0) {
            end = middle - 1;
        } else {
            end = middle - 1;
            lastMatched = middle;
        }
    }

    return lastMatched;
}

int32 UserDict::LocateFirstInPredicts(const uint16 *words, int lemmaLen)
{
    int32 begin = 0;
    int32 end = dictInfo_.lemmaCount - 1;
    int32 middle = -1;

    int32 lastMatched = middle;

    while (begin <= end) {
        middle = (begin + end) >> 1;
        uint32 offset = offsets_[middle];
        uint8 nchar = GetLemmaNchar(offset);
        const uint16 *ws = GetLemmaWord(offset);

        uint32 minl = nchar < lemmaLen ? nchar : lemmaLen;
        uint32 k = 0;
        int cmp = 0;

        for (; k < minl; k++) {
            if (ws[k] < words[k]) {
                cmp = -1;
                break;
            } else if (ws[k] > words[k]) {
                cmp = 1;
                break;
            }
        }
        if (cmp == 0) {
            if (nchar >= lemmaLen) {
                lastMatched = middle;
            }
            if (nchar < lemmaLen) {
                cmp = -1;
            } else if (nchar > lemmaLen) {
                cmp = 1;
            }
        }

        if (cmp < 0) {
            begin = middle + 1;
        } else if (cmp > 0) {
            end = middle - 1;
        } else {
            end = middle - 1;
        }
    }

    return lastMatched;
}

#endif

LemmaIdType UserDict::GetLemmaId(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen)
{
    int32 off = LocateInOffsets(lemmaStr, splids, lemmaLen);
    if (off == -1) {
        return 0;
    }

    return ids_[off];
}

LmaScoreType UserDict::GetLemmaScore(LemmaIdType lemmaId)
{
    if (IsValidState() == false) {
        return 0;
    }
    if (IsValidLemmaId(lemmaId) == false) {
        return 0;
    }

    return TranslateScore(GetLemmaScoreInternal(lemmaId));
}

LmaScoreType UserDict::GetLemmaScore(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen)
{
    if (IsValidState() == false) {
        return 0;
    }
    return TranslateScore(GetLemmaScoreInternal(lemmaStr, splids, lemmaLen));
}

int UserDict::GetLemmaScoreInternal(LemmaIdType lemmaId)
{
    if (IsValidState() == false) {
        return 0;
    }
    if (IsValidLemmaId(lemmaId) == false) {
        return 0;
    }

    uint32 offset = offsetsById_[lemmaId - startId_];

    uint32 nchar = GetLemmaNchar(offset);
    uint16 *spl = GetLemmaSpellIds(offset);
    uint16 *wrd = GetLemmaWord(offset);

    int32 off = LocateInOffsets(wrd, spl, nchar);
    if (off == -1) {
        return 0;
    }

    return scores_[off];
}

int UserDict::GetLemmaScoreInternal(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen)
{
    if (IsValidState() == false) {
        return 0;
    }

    int32 off = LocateInOffsets(lemmaStr, splids, lemmaLen);
    if (off == -1) {
        return 0;
    }

    return scores_[off];
}

#ifdef SYNC_ENABLED
void UserDict::RemoveLemmaFromSyncList(uint32 offset)
{
    offset &= kUserDictOffsetMask;
    uint32 i = 0;
    for (; i < dictInfo_.syncCount; i++) {
        unsigned int off = (syncs_[i] & kUserDictOffsetMask);
        if (off == offset) {
            break;
        }
    }
    if (i < dictInfo_.syncCount) {
        syncs_[i] = syncs_[dictInfo_.syncCount - 1];
        dictInfo_.syncCount--;
    }
}
#endif

#ifdef PREDICT_ENABLED
void UserDict::RemoveLemmaFromPredictList(uint32 offset)
{
    offset &= kUserDictOffsetMask;
    uint32 i = 0;
    for (; i < dictInfo_.lemmaCount; i++) {
        unsigned int off = (predicts_[i] & kUserDictOffsetMask);
        if (off == offset) {
            predicts_[i] |= kUserDictOffsetFlagRemove;
            break;
        }
    }
}
#endif

bool UserDict::RemoveLemmaByOffsetIndex(int offsetIndex)
{
    if (IsValidState() == false) {
        return 0;
    }

    int32 off = offsetIndex;
    if (off == -1) {
        return false;
    }

    uint32 offset = offsets_[off];
    uint32 nchar = GetLemmaNchar(offset);

    offsets_[off] |= kUserDictOffsetFlagRemove;

#ifdef SYNC_ENABLED
    // Remove corresponding sync item
    RemoveLemmaFromSyncList(offset);
#endif

#ifdef PREDICT_ENABLED
    RemoveLemmaFromPredictList(offset);
#endif
    dictInfo_.freeCount++;
    dictInfo_.freeSize += (K_MAGIC_2 + (nchar << K_MAGIC_2));

    if (state_ < USER_DICT_OFFSET_DIRTY) {
        state_ = USER_DICT_OFFSET_DIRTY;
    }
    return true;
}

bool UserDict::RemoveLemma(LemmaIdType lemmaId)
{
    if (IsValidState() == false) {
        return 0;
    }
    if (IsValidLemmaId(lemmaId) == false) {
        return false;
    }
    uint32 offset = offsetsById_[lemmaId - startId_];

    uint32 nchar = GetLemmaNchar(offset);
    uint16 *spl = GetLemmaSpellIds(offset);
    uint16 *wrd = GetLemmaWord(offset);

    int32 off = LocateInOffsets(wrd, spl, nchar);

    return RemoveLemmaByOffsetIndex(off);
}

void UserDict::FlushCache()
{
    LemmaIdType startId = startId_;
    const char *file = strdup(dictFile_);
    if (!file) {
        return;
    }
    CloseDict();
    LoadDict(file, startId, K_USER_DICT_ID_END);
    free(const_cast<char *>(file));
#ifdef CACHE_ENABLED
    CacheInit();
#endif
    return;
}

bool UserDict::Reset(const char *file)
{
    FILE *fp = fopen(file, "w+");
    if (!fp) {
        return false;
    }
    uint32 version = kUserDictVersion;
    if (fwrite(&version, 1, sizeof(version), fp) != sizeof(version)) {
        (void)fclose(fp);
        unlink(file);
        return false;
    }
    UserDictInfo info;
    ImeMemset(&info, sizeof(info), 0, sizeof(info));
    // By default, no limitation for lemma count and size
