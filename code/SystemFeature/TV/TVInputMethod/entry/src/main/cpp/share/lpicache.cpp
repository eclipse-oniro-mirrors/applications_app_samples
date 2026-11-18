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

#include "../include/lpicache.h"
#include <cassert>

#include "ime_assert.h"

namespace ime_pinyin {

LpiCache *LpiCache::instance_ = nullptr;

LpiCache::LpiCache()
{
    lpiCache_ = new LmaPsbItem[K_FULL_SPL_ID_START * kMaxLpiCachePerId];
    lpiCacheLen_ = new uint16[K_FULL_SPL_ID_START];
    ASSERT(lpiCache_ != nullptr);
    ASSERT(lpiCacheLen_ != nullptr);
    for (uint16 id = 0; id < K_FULL_SPL_ID_START; id++) {
        lpiCacheLen_[id] = 0;
    }
}

LpiCache::~LpiCache()
{
    if (lpiCache_ != nullptr) {
        delete[] lpiCache_;
    }

    if (lpiCacheLen_ != nullptr) {
        delete[] lpiCacheLen_;
    }
}

LpiCache &LpiCache::GetInstance()
{
    if (instance_ == nullptr) {
        instance_ = new LpiCache();
        ASSERT(instance_ != nullptr);
    }
    return *instance_;
}

bool LpiCache::IsCached(uint16 splid)
{
    if (splid >= K_FULL_SPL_ID_START) {
        return false;
    }
    return lpiCacheLen_[splid] != 0;
}

size_t LpiCache::PutCache(uint16 splid, const LmaPsbItem lpiItems[], size_t lpiNum) const
{
    uint16 num = kMaxLpiCachePerId;
    if (num > lpiNum) {
        num = static_cast<uint16>(lpiNum);
    }

    LmaPsbItem *lpiCacheThis = lpiCache_ + splid * kMaxLpiCachePerId;
    for (uint16 pos = 0; pos < num; pos++) {
        lpiCacheThis[pos] = lpiItems[pos];
    }

    lpiCacheLen_[splid] = num;
    return num;
}

size_t LpiCache::GetCache(uint16 splid, LmaPsbItem lpiItems[], size_t lpiMax)
{
    if (lpiMax > lpiCacheLen_[splid]) {
        lpiMax = lpiCacheLen_[splid];
    }

    LmaPsbItem *lpiCacheThis = lpiCache_ + splid * kMaxLpiCachePerId;
    for (uint16 pos = 0; pos < lpiMax; pos++) {
        lpiItems[pos] = lpiCacheThis[pos];
    }
    return lpiMax;
}

} // namespace ime_pinyin
