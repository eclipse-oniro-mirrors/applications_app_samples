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

#include "../include/splparser.h"
#include <cassert>
constexpr int K_MAGIC_2 = 2;

namespace ime_pinyin {

SpellingParser::SpellingParser() { splTrie_ = SpellingTrie::GetCpinstance(); }

bool SpellingParser::IsValidToParse(char ch) const { return SpellingTrie::IsValidSplChar(ch); }

const SpellingNode *SpellingParser::FindSonNode(const SpellingNode *nodeThis, char charThis, uint16 strPos) const
{
    if (strPos == 0) {
        if (charThis >= 'a') {
            return splTrie_->level1Sons_[charThis - 'a'];
        }
        return splTrie_->level1Sons_[charThis - 'A'];
    }
    SpellingNode *firstSon = nodeThis->firstSon;
    for (int i = 0; i < nodeThis->numOfSon; i++) {
        SpellingNode *thisSon = firstSon + i;
        if (SpellingTrie::IsSameSplChar(thisSon->charThisNode, charThis)) {
            return thisSon;
        }
    }
    return nullptr;
}

const SpellingNode *SpellingParser::FindSonNode(const SpellingNode *nodeThis, char16 charThis, uint16 strPos) const
{
    if (strPos == 0) {
        if (charThis >= 'a') {
            return splTrie_->level1Sons_[charThis - 'a'];
        }
        return splTrie_->level1Sons_[charThis - 'A'];
    }
    SpellingNode *firstSon = nodeThis->firstSon;
    for (int i = 0; i < nodeThis->numOfSon; i++) {
        SpellingNode *thisSon = firstSon + i;
        if (SpellingTrie::IsSameSplChar(thisSon->charThisNode, static_cast<char>(charThis))) {
            return thisSon;
        }
    }
    return nullptr;
}

bool SpellingParser::AppendEndableId(const SpellingNode *nodeThis, uint16 splIdx[], uint16 &idxNum, uint16 startPos[],
                                     uint16 strPos) const
{
    uint16 idThis = nodeThis->spellingIdx;
    if (!splTrie_->IfValidIdUpdate(&idThis)) {
        return false;
    }
    splIdx[idxNum] = idThis;
    idxNum++;
    if (startPos != nullptr) {
        startPos[idxNum] = strPos;
    }
    return true;
}

bool SpellingParser::HandleSplitter(const SpellIdxBuf &buf, SpellParseState &st, uint16 maxSize) const
{
    if (AppendEndableId(st.nodeThis, buf.splIdx, st.idxNum, buf.startPos, st.strPos + 1)) {
        st.strPos++;
        if (st.idxNum >= maxSize) {
            return true;
        }
        st.nodeThis = splTrie_->root_;
        st.lastIsSplitter = true;
        return false;
    }
    if (!st.lastIsSplitter) {
        return true;
    }
    st.strPos++;
    if (buf.startPos != nullptr) {
        buf.startPos[st.idxNum] = st.strPos;
    }
    return false;
}

uint16 SpellingParser::SplstrToIdxs(const SplStr &s, const SpellIdxBuf &buf, uint16 maxSize, bool &lastIsPre) const
{
    if (s.str == nullptr || maxSize == 0 || s.len == 0) {
        return 0;
    }

    if (!SpellingTrie::IsValidSplChar(s.str[0])) {
        return 0;
    }

    lastIsPre = false;
    SpellParseState st = {splTrie_->root_, 0, 0, false};
    if (buf.startPos != nullptr) {
        buf.startPos[0] = 0;
    }

    while (st.strPos < s.len) {
        char charThis = s.str[st.strPos];
        if (!SpellingTrie::IsValidSplChar(charThis)) {
            if (HandleSplitter(buf, st, maxSize)) {
                return st.idxNum;
            }
            continue;
        }

        st.lastIsSplitter = false;
        const SpellingNode *foundSon = FindSonNode(st.nodeThis, charThis, st.strPos);
        if (foundSon != nullptr) {
            st.nodeThis = foundSon;
            st.strPos++;
            continue;
        }
        if (!AppendEndableId(st.nodeThis, buf.splIdx, st.idxNum, buf.startPos, st.strPos)) {
            return st.idxNum;
        }
        if (st.idxNum >= maxSize) {
            return st.idxNum;
        }
        st.nodeThis = splTrie_->root_;
    }

    uint16 idThis = st.nodeThis->spellingIdx;
    if (splTrie_->IfValidIdUpdate(&idThis)) {
        buf.splIdx[st.idxNum] = idThis;
        st.idxNum++;
        if (buf.startPos != nullptr) {
            buf.startPos[st.idxNum] = st.strPos;
        }
    }

    lastIsPre = !st.lastIsSplitter;
    return st.idxNum;
}

uint16 SpellingParser::SplstrToIdxsF(const SplStr &s, const SpellIdxBuf &buf, uint16 maxSize, bool &lastIsPre) const
{
    uint16 idxNum = SplstrToIdxs(s, buf, maxSize, lastIsPre);
    for (uint16 pos = 0; pos < idxNum; pos++) {
        if (splTrie_->IsHalfIdYunmu(buf.splIdx[pos])) {
            splTrie_->HalfToFull(buf.splIdx[pos], buf.splIdx + pos);
            if (pos == idxNum - 1) {
                lastIsPre = false;
            }
        }
    }
    return idxNum;
}

uint16 SpellingParser::Splstr16ToIdxs(const SplStr16 &s, const SpellIdxBuf &buf, uint16 maxSize,
                                      bool &lastIsPre) const
{
    if (s.str == nullptr || maxSize == 0 || s.len == 0) {
        return 0;
    }

    if (!SpellingTrie::IsValidSplChar(s.str[0])) {
        return 0;
    }

    lastIsPre = false;
    SpellParseState st = {splTrie_->root_, 0, 0, false};
    if (buf.startPos != nullptr) {
        buf.startPos[0] = 0;
    }

    while (st.strPos < s.len) {
        char16 charThis = s.str[st.strPos];
        if (!SpellingTrie::IsValidSplChar(charThis)) {
            if (HandleSplitter(buf, st, maxSize)) {
                return st.idxNum;
            }
            continue;
        }

        st.lastIsSplitter = false;
        const SpellingNode *foundSon = FindSonNode(st.nodeThis, charThis, st.strPos);
        if (foundSon != nullptr) {
            st.nodeThis = foundSon;
            st.strPos++;
            continue;
        }
        if (!AppendEndableId(st.nodeThis, buf.splIdx, st.idxNum, buf.startPos, st.strPos)) {
            return st.idxNum;
        }
        if (st.idxNum >= maxSize) {
            return st.idxNum;
        }
        st.nodeThis = splTrie_->root_;
    }

    uint16 idThis = st.nodeThis->spellingIdx;
    if (splTrie_->IfValidIdUpdate(&idThis)) {
        buf.splIdx[st.idxNum] = idThis;
        st.idxNum++;
        if (buf.startPos != nullptr) {
            buf.startPos[st.idxNum] = st.strPos;
        }
    }

    lastIsPre = !st.lastIsSplitter;
    return st.idxNum;
}

uint16 SpellingParser::Splstr16ToIdxsF(const SplStr16 &s, const SpellIdxBuf &buf, uint16 maxSize,
                                       bool &lastIsPre) const
{
    uint16 idxNum = Splstr16ToIdxs(s, buf, maxSize, lastIsPre);
    for (uint16 pos = 0; pos < idxNum; pos++) {
        if (splTrie_->IsHalfIdYunmu(buf.splIdx[pos])) {
            splTrie_->HalfToFull(buf.splIdx[pos], buf.splIdx + pos);
            if (pos == idxNum - 1) {
                lastIsPre = false;
            }
        }
    }
    return idxNum;
}

uint16 SpellingParser::GetSplidByStr(const char *splstr, uint16 strLen, bool *isPre) const
{
    if (isPre == nullptr) {
        return 0;
    }

    uint16 splIdx[2];
    uint16 startPos[3];
    SplStr s = {splstr, strLen};
    SpellIdxBuf buf = {splIdx, startPos};

    if (SplstrToIdxs(s, buf, K_MAGIC_2, *isPre) != 1) {
        return 0;
    }

    if (startPos[1] != strLen) {
        return 0;
    }
    return splIdx[0];
}

uint16 SpellingParser::GetSplidByStrF(const char *splstr, uint16 strLen, bool *isPre) const
{
    if (isPre == nullptr) {
        return 0;
    }

    uint16 splIdx[2];
    uint16 startPos[3];
    SplStr s = {splstr, strLen};
    SpellIdxBuf buf = {splIdx, startPos};

    if (SplstrToIdxs(s, buf, K_MAGIC_2, *isPre) != 1) {
        return 0;
    }

    if (startPos[1] != strLen) {
        return 0;
    }
    if (splTrie_->IsHalfIdYunmu(splIdx[0])) {
        splTrie_->HalfToFull(splIdx[0], splIdx);
        *isPre = false;
    }

    return splIdx[0];
}

uint16 SpellingParser::GetSplidsParallel(const SplStr &s, uint16 splidx[], uint16 maxSize, uint16 &fullIdNum,
                                         bool &isPre) const
{
    if (maxSize <= 0 || !IsValidToParse(s.str[0])) {
        return 0;
    }

    splidx[0] = GetSplidByStr(s.str, s.len, &isPre);
    fullIdNum = 0;
    if (splidx[0] != 0) {
        if (splidx[0] >= K_FULL_SPL_ID_START) {
            fullIdNum = 1;
        }
        return 1;
    }
    return 0;
}

} // namespace ime_pinyin
