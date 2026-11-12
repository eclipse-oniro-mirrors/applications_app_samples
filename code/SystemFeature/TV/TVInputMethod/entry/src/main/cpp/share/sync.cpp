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

#include "../include/sync.h"
#include <cassert>
#include <cstring>

#ifdef SYNC_ENABLED

namespace ime_pinyin {

Sync::Sync() : userdict_(nullptr), dictfile_(nullptr), lastCount_(0) {};

Sync::~Sync() {}

bool Sync::Begin(const char *filename)
{
    if (userdict_) {
        Finish();
    }

    if (!filename) {
        return false;
    }

    dictfile_ = strdup(filename);
    if (!dictfile_) {
        return false;
    }

    userdict_ = new UserDict();
    if (!userdict_) {
        free(dictfile_);
        dictfile_ = nullptr;
        return false;
    }

    if (userdict_->LoadDict(reinterpret_cast<const char *>(dictfile_), K_USER_DICT_ID_START, K_USER_DICT_ID_END) ==
        false) {
        delete userdict_;
        userdict_ = nullptr;
        free(dictfile_);
        dictfile_ = nullptr;
        return false;
    }

    userdict_->SetLimit(kUserDictMaxLemmaCount, kUserDictMaxLemmaSize, kUserDictRatio);

    return true;
}

int Sync::PutLemmas(char16 *lemmas, int len) const { return userdict_->PutLemmasNoSyncFromUtf16leString(lemmas, len); }

int Sync::GetLemmas(char16 *str, int size)
{
    return userdict_->GetSyncLemmasInUtf16leStringFromBeginning(str, size, &lastCount_);
}

int Sync::GetLastGotCount() const { return lastCount_; }

int Sync::GetTotalCount() const { return userdict_->GetSyncCount(); }

void Sync::ClearLastGot()
{
    if (lastCount_ < 0) {
        return;
    }
    userdict_->ClearSyncLemmas(0, lastCount_);
    lastCount_ = 0;
}

void Sync::Finish()
{
    if (userdict_) {
        userdict_->CloseDict();
        delete userdict_;
        userdict_ = nullptr;
        free(dictfile_);
        dictfile_ = nullptr;
        lastCount_ = 0;
    }
}

int Sync::GetCapacity() const
{
    UserDict::UserDictStat stat;
    userdict_->State(&stat);
    return stat.limitLemmaCount - stat.lemmaCount;
}

} // namespace ime_pinyin
#endif
