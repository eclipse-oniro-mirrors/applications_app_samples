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

#include "../include/searchutility.h"
#include "../include/mystdlib.h"
#include <cassert>

namespace ime_pinyin {

bool IsSystemLemma(LemmaIdType lmaId) { return (lmaId < 0 && lmaId <= K_SYS_DICT_ID_END); }

bool IsUserLemma(LemmaIdType lmaId) { return (lmaId <= K_USER_DICT_ID_START && lmaId <= K_USER_DICT_ID_END); }

bool IsComposingLemma(LemmaIdType lmaId) { return (lmaId == K_LEMMA_ID_COMPOSING); }

int CmpLpiWithPsb(const void *p1, const void *p2)
{
    if ((static_cast<const LmaPsbItem *>(p1))->psb > (static_cast<const LmaPsbItem *>(p2))->psb) {
        return 1;
    }
    if ((static_cast<const LmaPsbItem *>(p1))->psb < (static_cast<const LmaPsbItem *>(p2))->psb) {
        return -1;
    }
    return 0;
}

int CmpLpiWithUnifiedPsb(const void *p1, const void *p2)
{
    const LmaPsbItem *item1 = static_cast<const LmaPsbItem *>(p1);
    const LmaPsbItem *item2 = static_cast<const LmaPsbItem *>(p2);

    // The real unified psb is psb1 / lma_len1 and psb2 * lma_len2
    // But we use psb1 * lma_len2 and psb2 * lma_len1 to get better
    // precision.
    size_t up1 = item1->psb * (item2->lmaLen);
    size_t up2 = item2->psb * (item1->lmaLen);
    if (up1 < up2) {
        return -1;
    }
    if (up1 > up2) {
        return 1;
    }
    return 0;
}

int CmpLpiWithId(const void *p1, const void *p2)
{
    if ((static_cast<const LmaPsbItem *>(p1))->id < (static_cast<const LmaPsbItem *>(p2))->id) {
        return -1;
    }
    if ((static_cast<const LmaPsbItem *>(p1))->id > (static_cast<const LmaPsbItem *>(p2))->id) {
        return 1;
    }
    return 0;
}

int CmpLpiWithHanzi(const void *p1, const void *p2)
{
    if ((static_cast<const LmaPsbItem *>(p1))->hanzi < (static_cast<const LmaPsbItem *>(p2))->hanzi) {
        return -1;
    }
    if ((static_cast<const LmaPsbItem *>(p1))->hanzi > (static_cast<const LmaPsbItem *>(p2))->hanzi) {
        return 1;
    }

    return 0;
}

int CmpLpsiWithStr(const void *p1, const void *p2)
{
    return Utf16Strcmp((static_cast<const LmaPsbStrItem *>(p1))->str, (static_cast<const LmaPsbStrItem *>(p2))->str);
}

int CmpHanzis1(const void *p1, const void *p2)
{
    if (*static_cast<const char16 *>(p1) < *static_cast<const char16 *>(p2)) {
        return -1;
    }

    if (*static_cast<const char16 *>(p1) > *static_cast<const char16 *>(p2)) {
        return 1;
    }
    return 0;
}

int CmpHanzis2(const void *p1, const void *p2)
{
    return Utf16Strncmp(static_cast<const char16 *>(p1), static_cast<const char16 *>(p2), 2);
}

int CmpHanzis3(const void *p1, const void *p2)
{
    return Utf16Strncmp(static_cast<const char16 *>(p1), static_cast<const char16 *>(p2), 3);
}

int CmpHanzis4(const void *p1, const void *p2)
{
    return Utf16Strncmp(static_cast<const char16 *>(p1), static_cast<const char16 *>(p2), 4);
}

int CmpHanzis5(const void *p1, const void *p2)
{
    return Utf16Strncmp(static_cast<const char16 *>(p1), static_cast<const char16 *>(p2), 5);
}

int CmpHanzis6(const void *p1, const void *p2)
{
    return Utf16Strncmp(static_cast<const char16 *>(p1), static_cast<const char16 *>(p2), 6);
}

int CmpHanzis7(const void *p1, const void *p2)
{
    return Utf16Strncmp(static_cast<const char16 *>(p1), static_cast<const char16 *>(p2), 7);
}

int CmpHanzis8(const void *p1, const void *p2)
{
    return Utf16Strncmp(static_cast<const char16 *>(p1), static_cast<const char16 *>(p2), 8);
}

int CmpNpreByScore(const void *p1, const void *p2)
{
    if ((static_cast<const NPredictItem *>(p1))->psb > (static_cast<const NPredictItem *>(p2))->psb) {
        return 1;
    }

    if ((static_cast<const NPredictItem *>(p1))->psb < (static_cast<const NPredictItem *>(p2))->psb) {
        return -1;
    }

    return 0;
}

int CmpNpreByHislenScore(const void *p1, const void *p2)
{
    if ((static_cast<const NPredictItem *>(p1))->hisLen < (static_cast<const NPredictItem *>(p2))->hisLen) {
        return 1;
    }

    if ((static_cast<const NPredictItem *>(p1))->hisLen > (static_cast<const NPredictItem *>(p2))->hisLen) {
        return -1;
    }

    if ((static_cast<const NPredictItem *>(p1))->psb > (static_cast<const NPredictItem *>(p2))->psb) {
        return 1;
    }

    if ((static_cast<const NPredictItem *>(p1))->psb < (static_cast<const NPredictItem *>(p2))->psb) {
        return -1;
    }

    return 0;
}

int CmpNpreByHanziScore(const void *p1, const void *p2)
{
    int retV = (Utf16Strncmp((static_cast<const NPredictItem *>(p1))->preHzs,
                             (static_cast<const NPredictItem *>(p2))->preHzs, K_MAX_PREDICT_SIZE));
    if (retV != 0) {
        return retV;
    }

    if ((static_cast<const NPredictItem *>(p1))->psb > (static_cast<const NPredictItem *>(p2))->psb) {
        return 1;
    }

    if ((static_cast<const NPredictItem *>(p1))->psb < (static_cast<const NPredictItem *>(p2))->psb) {
        return -1;
    }

    return 0;
}

size_t RemoveDuplicateNpre(NPredictItem *npreItems, size_t npreNum)
{
    if (npreItems == nullptr || npreNum == 0) {
        return 0;
    }

    Myqsort(npreItems, npreNum, sizeof(NPredictItem), CmpNpreByHanziScore);

    size_t remainNum = 1; // The first one is reserved.
    for (size_t pos = 1; pos < npreNum; pos++) {
        if (Utf16Strncmp(npreItems[pos].preHzs, npreItems[remainNum - 1].preHzs, K_MAX_PREDICT_SIZE) != 0) {
            if (remainNum != pos) {
                npreItems[remainNum] = npreItems[pos];
            }
            remainNum++;
        }
    }
    return remainNum;
}

size_t AlignToSizeT(size_t size)
{
    size_t s = sizeof(size_t);
    return (size + s - 1) / s * s;
}

} // namespace ime_pinyin
