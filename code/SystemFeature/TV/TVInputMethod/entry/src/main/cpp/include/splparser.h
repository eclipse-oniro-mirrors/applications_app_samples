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

#ifndef PINYINIME_INCLUDE_SPLPARSER_H_
#define PINYINIME_INCLUDE_SPLPARSER_H_

#include "./dictdef.h"
#include "./spellingtrie.h"

namespace ime_pinyin {

struct SplStr {
    const char *str;
    uint16 len;
};

struct SplStr16 {
    const char16 *str;
    uint16 len;
};

struct SpellIdxBuf {
    uint16 *splIdx;
    uint16 *startPos;
};

struct SpellParseState {
    const SpellingNode *nodeThis;
    uint16 idxNum;
    uint16 strPos;
    bool lastIsSplitter;
};

class SpellingParser {
protected:
    const SpellingTrie *splTrie_;

private:
    const SpellingNode *FindSonNode(const SpellingNode *nodeThis, char charThis, uint16 strPos) const;
    const SpellingNode *FindSonNode(const SpellingNode *nodeThis, char16 charThis, uint16 strPos) const;
    bool AppendEndableId(const SpellingNode *nodeThis, uint16 splIdx[], uint16 &idxNum, uint16 startPos[],
                         uint16 strPos) const;
    bool HandleSplitter(const SpellIdxBuf &buf, SpellParseState &st, uint16 maxSize) const;

public:
    SpellingParser();

    // Given a string, parse it into a spelling id stream.
    // If the whole string are sucessfully parsed, lastIsPre will be true;
    // if the whole string is not fullly parsed, lastIsPre will return whether
    // the last part of the string is a prefix of a full spelling string. For
    // example, given string "zhengzhon", "zhon" is not a valid speling, but it is
    // the prefix of "zhong".
    // If splstr starts with a character not in ['a'-z'] (it is a split char),
    // return 0.
    // Split char can only appear in the middle of the string or at the end.
    uint16 SplstrToIdxs(const SplStr &s, const SpellIdxBuf &buf, uint16 maxSize, bool &lastIsPre) const;

    // Similar to SplstrToIdxs(), the only difference is that SplstrToIdxs()
    // convert single-character Yunmus into half ids, while this function converts
    // them into full ids.
    uint16 SplstrToIdxsF(const SplStr &s, const SpellIdxBuf &buf, uint16 maxSize, bool &lastIsPre) const;

    // Similar to SplstrToIdxs(), the only difference is that this function
    // uses char16 instead of char8.
    uint16 Splstr16ToIdxs(const SplStr16 &s, const SpellIdxBuf &buf, uint16 maxSize, bool &lastIsPre) const;

    // Similar to SplstrToIdxsF(), the only difference is that this function
    // uses char16 instead of char8.
    uint16 Splstr16ToIdxsF(const SplStr16 &s, const SpellIdxBuf &buf, uint16 maxSize, bool &lastIsPre) const;

    // If the given string is a spelling, return the id, others, return 0.
    // If the give string is a single char Yunmus like "A", and the char is
    // enabled in ShouZiMu mode, the returned spelling id will be a half id.
    // When the returned spelling id is a half id, *isPre returns whether it
    // is a prefix of a full spelling string.
    uint16 GetSplidByStr(const char *splstr, uint16 strLen, bool *isPre) const;

    // If the given string is a spelling, return the id, others, return 0.
    // If the give string is a single char Yunmus like "a", no matter the char
    // is enabled in ShouZiMu mode or not, the returned spelling id will be
    // a full id.
    // When the returned spelling id is a half id, *p_is_pre returns whether it
    // is a prefix of a full spelling string.
    uint16 GetSplidByStrF(const char *splstr, uint16 strLen, bool *isPre) const;

    // Splitter chars are not included.
    bool IsValidToParse(char ch) const;

    // When auto-correction is not enabled, GetSplidByStr() will be called to
    // return the single result. When auto-correction is enabled, this function
    // will be called to get the results. Auto-correction is not ready.
    // fullIdNum returns number of full spelling ids.
    // isPre returns whether the given string is the prefix of a full spelling
    // string.
    // If splstr starts with a character not in [a-zA-Z] (it is a split char),
    // return 0.
    // Split char can only appear in the middle of the string or at the end.
    // The caller should guarantee splstr != nullptr&& strLen > 0 && splidx != nullptr
    uint16 GetSplidsParallel(const SplStr &s, uint16 splidx[], uint16 maxSize, uint16 &fullIdNum, bool &isPre) const;
};
} // namespace ime_pinyin

#endif // PINYINIME_INCLUDE_SPLPARSER_H_
