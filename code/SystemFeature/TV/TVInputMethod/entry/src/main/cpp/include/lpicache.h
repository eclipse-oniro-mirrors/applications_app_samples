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

#ifndef PINYINIME_ANDPY_INCLUDE_LPICACHE_H_
#define PINYINIME_ANDPY_INCLUDE_LPICACHE_H_

#include "./searchutility.h"
#include "./spellingtrie.h"
#include <cstdlib>

namespace ime_pinyin {

// Used to cache LmaPsbItem list for half spelling ids.
class LpiCache {
private:
    static LpiCache *instance_;
    static const int kMaxLpiCachePerId = 15;

    LmaPsbItem *lpiCache_;
    uint16 *lpiCacheLen_;

public:
    LpiCache();
    ~LpiCache();

    static LpiCache &GetInstance();

    // Test if the LPI list of the given splid  has been cached.
    // If splid is a full spelling id, it returns false, because we only cache
    // list for half ids.
    bool IsCached(uint16 splid);

    // Put LPI list to cahce. If the length of the list, lpiNum, is longer than
    // the cache buffer. the list will be truncated, and function returns the
    // maximum length of the cache buffer.
    // Note: splid must be a half id, and lpiItems must be not nullptr. The
    // caller of this function should guarantee this.
    size_t PutCache(uint16 splid, const LmaPsbItem lpiItems[], size_t lpiNum) const;

    // Get the cached list for the given half id.
    // Return the length of the cached buffer.
    // Note: splid must be a half id, and lpiItems must be not nullptr. The
    // caller of this function should guarantee this.
    size_t GetCache(uint16 splid, LmaPsbItem lpiItems[], size_t lpiMax);
};

} // namespace ime_pinyin

#endif // PINYINIME_ANDPY_INCLUDE_LPICACHE_H_
