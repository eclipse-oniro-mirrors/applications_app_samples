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

#ifdef SYNC_ENABLED
void UserDict::ClearSyncLemmas(unsigned int start, unsigned int end)
{
    if (IsValidState() == false) {
        return;
    }
    if (end > dictInfo_.syncCount) {
        end = dictInfo_.syncCount;
    }
    if (ImeMemmove(syncs_ + start, (dictInfo_.syncCount - end) << K_MAGIC_2, syncs_ + end,
                   (dictInfo_.syncCount - end) << K_MAGIC_2) != 0) {
        return;
    }
    dictInfo_.syncCount -= (end - start);
    if (state_ < USER_DICT_SYNC_DIRTY) {
        state_ = USER_DICT_SYNC_DIRTY;
    }
}

int UserDict::GetSyncCount()
{
    if (IsValidState() == false) {
        return 0;
    }
    return dictInfo_.syncCount;
}

LemmaIdType UserDict::PutLemmaNoSync(char16 lemmaStr[], uint16 splids[], uint16 lemmaLen, uint16 count, uint64 lmt)
{
    int again = 0;
    LemmaIdType id = 0;
    while (true) {
        uint32 *syncsBak = syncs_;
        syncs_ = nullptr;
        id = PutLemmaInternal(lemmaStr, splids, lemmaLen, count, lmt);
        syncs_ = syncsBak;
        if (id == 0 && again == 0) {
            if ((dictInfo_.limitLemmaCount > 0 && dictInfo_.lemmaCount >= dictInfo_.limitLemmaCount) ||
                (dictInfo_.limitLemmaSize > 0 &&
                 dictInfo_.lemmaSize + (K_MAGIC_2 + (lemmaLen << K_MAGIC_2)) > dictInfo_.limitLemmaSize)) {
                // XXX Always Reclaim and defrag in sync code path
                //     sync thread is background thread and ok with heavy work
                Reclaim();
                Defragment();
                FlushCache();
                again = 1;
                continue;
            }
        }
        break;
    }
    return id;
}

bool UserDict::ParsePinyinField(SpellingParser *splParser, NoSyncRecordCtx &ctx, char16 *&p)
{
    char16 *py16 = p;
    ctx.splidLen = 0;
    while (*p != 0x2c && (p - ctx.ptr) < ctx.len) {
        if (*p == 0x20) {
            ctx.splidLen++;
        }
        p++;
    }
    ctx.splidLen++;
    if (p - ctx.ptr == ctx.len) {
        return false;
    }
    int py16Len = p - py16;
    if (ctx.splidLen < K_MAX_LEMMA_SIZE) {
        return false;
    }
    bool isPre;
    SplStr16 s16 = {py16, static_cast<uint16>(py16Len)};
    SpellIdxBuf idxBuf = {ctx.splid, nullptr};
    int splidl = splParser->Splstr16ToIdxsF(s16, idxBuf, K_MAX_LEMMA_SIZE, isPre);
    return splidl == ctx.splidLen;
}

bool UserDict::ParseNoSyncRecord(SpellingParser *splParser, NoSyncRecordCtx &ctx)
{
    // Pinyin
    char16 *p = ctx.p;
    if (!ParsePinyinField(splParser, ctx, p)) {
        ctx.p = p;
        return false;
    }
    // Phrase
    ctx.hz16 = ++p;
    while (*p != 0x2c && (p - ctx.ptr) < ctx.len) {
        p++;
    }
    int hz16Len = p - ctx.hz16;
    if (hz16Len != ctx.splidLen) {
        ctx.p = p;
        return false;
    }
    // Frequency
    char16 *fr16 = ++p;
    while (*p != 0x2c && (p - ctx.ptr) < ctx.len) {
        p++;
    }
    ctx.intf = static_cast<uint32>(Utf16leAtoll(fr16, p - fr16));
    // Last modified time
    fr16 = ++p;
    while (*p != 0x3b && (p - ctx.ptr) < ctx.len) {
        p++;
    }
    ctx.lastMod = Utf16leAtoll(fr16, p - fr16);
    ctx.p = p;
    return true;
}

int UserDict::PutLemmasNoSyncFromUtf16leString(char16 *lemmas, int len)
{
    int newlyAdded = 0;

    SpellingParser *splParser = new SpellingParser();
    if (!splParser) {
        return 0;
    }
#ifdef DEBUG_PERF
    DEBUG_PERF_BEGIN;
#endif
    char16 *ptr = lemmas;

    // Extract pinyin,words,frequence,last_mod_time
    uint16 splid[K_MAX_LEMMA_SIZE];
    NoSyncRecordCtx ctx = {ptr, len, ptr, nullptr, splid, 0, 0, 0};

    while (ctx.p - ctx.ptr < len) {
        if (!ParseNoSyncRecord(splParser, ctx)) {
            break;
        }

        PutLemmaNoSync(ctx.hz16, ctx.splid, ctx.splidLen, ctx.intf, ctx.lastMod);
        newlyAdded++;

        ctx.p++;
    }

#ifdef DEBUG_PERF
    DEBUG_PERF_END;
    LogdPerf("PutLemmasNoSyncFromUtf16leString");
#endif
    return newlyAdded;
}

bool UserDict::AppendSyncPinyin(SpellingTrie *splTrie, const uint16 *spl, uint32 nchar, char16 *&ptemp,
                                char16 *tempEnd)
{
    for (uint32 j = 0; j < nchar; j++) {
        int retLen = splTrie->GetSpellingStr16(spl[j], ptemp, tempEnd - ptemp);
        if (retLen <= 0) {
            return false;
        }
        ptemp += retLen;
        if (ptemp < tempEnd - 1) {
            *(ptemp++) = ' ';
        } else {
            return false;
        }
    }
    ptemp--;
    if (ptemp >= tempEnd - 1) {
        return false;
    }
    *(ptemp++) = ',';
    return true;
}

int UserDict::BuildSyncRecord(SpellingTrie *splTrie, int offset, char16 *temp, char16 *tempEnd)
{
    uint32 nchar = GetLemmaNchar(offset);
    uint16 *spl = GetLemmaSpellIds(offset);
    uint16 *wrd = GetLemmaWord(offset);
    int score = GetLemmaScoreInternal(wrd, spl, nchar);

    char16 *ptemp = temp;

    // Add pinyin
    if (!AppendSyncPinyin(splTrie, spl, nchar, ptemp, tempEnd)) {
        return 0;
    }
    // Add phrase
    for (uint32 j = 0; j < nchar; j++) {
        if (ptemp < tempEnd - 1) {
            *(ptemp++) = wrd[j];
        } else {
            return 0;
        }
    }
    if (ptemp >= tempEnd - 1) {
        return 0;
    }
    *(ptemp++) = ',';
    // Add frequency
    uint32 intf = ExtractScoreFreq(score);
    int retLen = Utf16leLltoa(intf, ptemp, tempEnd - ptemp);
    if (retLen <= 0) {
        return 0;
    }
    ptemp += retLen;
    if (ptemp >= tempEnd - 1) {
        return 0;
    }
    *(ptemp++) = ',';
    // Add last modified time
    uint64 lastMod = ExtractScoreLmt(score);
    retLen = Utf16leLltoa(lastMod, ptemp, tempEnd - ptemp);
    if (retLen <= 0) {
        return 0;
    }
    ptemp += retLen;
    if (ptemp >= tempEnd - 1) {
        return 0;
    }
    *(ptemp++) = ';';

    return ptemp - temp;
}

int UserDict::GetSyncLemmasInUtf16leStringFromBeginning(char16 *str, int size, int *count)
{
    int len = 0;
    *count = 0;

    int leftLen = size;

    if (IsValidState() == false) {
        return len;
    }

    SpellingTrie *splTrie = &SpellingTrie::GetInstance();
    if (!splTrie) {
        return 0;
    }

    char16 temp[256];
    for (uint32 i = 0; i < dictInfo_.syncCount; i++) {
        int needLen = BuildSyncRecord(splTrie, syncs_[i], temp, temp + sizeof(temp));
        if (needLen <= 0) {
            continue;
        }
        if (needLen > leftLen) {
            break;
        }
        if (ImeMemcpy(str + len, needLen * K_MAGIC_2, temp, needLen * K_MAGIC_2) != 0) {
            return 0;
        }
        leftLen -= needLen;

        len += needLen;
        (*count)++;
    }

    if (len > 0) {
        if (state_ < USER_DICT_SYNC_DIRTY) {
            state_ = USER_DICT_SYNC_DIRTY;
        }
    }
    return len;
}

#endif

} // namespace ime_pinyin
