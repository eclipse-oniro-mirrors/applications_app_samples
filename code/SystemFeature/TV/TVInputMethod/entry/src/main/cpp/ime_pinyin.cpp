/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include <js_native_api.h>

#include "../include/pinyinime.h"
#include "../include/sync.h"
#include "../include/userdict.h"
#include "utf16char.h"
#include <cstring>
#include <unistd.h>

#include <codecvt>
#include <iostream>
#include <locale>
constexpr int K_MAGIC_2 = 2;
constexpr int K_MAGIC_3 = 3;

#ifdef LOG_TAG
#undef LOG_TAG
#define LOG_TAG "imePinYin:"
#endif
#define LOG_DOMAIN 0x0201

using namespace ime_pinyin;

static Sync g_syncWorker;

#define RET_BUF_LEN 256
static char16 g_retbuf[RET_BUF_LEN];
static char16 (*g_predictBuf)[K_MAX_PREDICT_SIZE + 1] = nullptr;
static size_t g_predictLen;

std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> conversion;

static napi_value ImOpenDecoder(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *fsd = nullptr;
    size_t fsdLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &fsdLen);
    fsd = new char[fsdLen + 1];
    napi_get_value_string_utf8(env, args[0], fsd, fsdLen + 1, &fsdLen);

    char *fud = nullptr;
    size_t fudLen = 0;
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &fudLen);
    fud = new char[fudLen + 1];
    napi_get_value_string_utf8(env, args[1], fud, fudLen + 1, &fudLen);

    bool ret = ImOpenDecoder(reinterpret_cast<const char *>(fsd), reinterpret_cast<const char *>(fud));
    napi_value result;
    napi_get_boolean(env, ret, &result);
    return result;
}

static napi_value ImOpenDecoderFd(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int fd;
    napi_get_value_int32(env, args[0], &fd);
    int64_t startOffset;
    napi_get_value_int64(env, args[1], &startOffset);
    int64_t length;
    napi_get_value_int64(env, args[K_MAGIC_2], &length);

    char *fud = nullptr;
    size_t fudLen = 0;
    napi_get_value_string_utf8(env, args[K_MAGIC_3], nullptr, 0, &fudLen);
    fud = new char[fudLen + 1];
    napi_get_value_string_utf8(env, args[K_MAGIC_3], fud, fudLen + 1, &fudLen);

    int newfd = dup(fd);
    bool ret = ImOpenDecoderFd(newfd, startOffset, length, reinterpret_cast<const char *>(fud));
    close(newfd);

    napi_value result;
    napi_get_boolean(env, ret, &result);
    return result;
}

static napi_value ImSetMaxLens(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int maxSpsLen;
    napi_get_value_int32(env, args[0], &maxSpsLen);
    int maxHzsLen;
    napi_get_value_int32(env, args[1], &maxHzsLen);

    ImSetMaxLens(static_cast<size_t>(maxSpsLen), static_cast<size_t>(maxHzsLen));
    return nullptr;
}

static napi_value ImCloseDecoder(napi_env env, napi_callback_info info)
{
    ImCloseDecoder();
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ImSearch(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *pybuf = nullptr;
    size_t tomergeLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &tomergeLen);
    pybuf = new char[tomergeLen + 1];
    napi_get_value_string_utf8(env, args[0], pybuf, tomergeLen + 1, &tomergeLen);

    int pyLen;
    napi_get_value_int32(env, args[1], &pyLen);

    int ret = ImSearch(reinterpret_cast<const char *>(pybuf), static_cast<size_t>(pyLen));

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ImDelSearch(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int pos;
    napi_get_value_int32(env, args[0], &pos);
    bool isPosInSplid;
    napi_get_value_bool(env, args[1], &isPosInSplid);
    bool clearFixedThisStep;
    napi_get_value_bool(env, args[K_MAGIC_2], &clearFixedThisStep);

    int ret = static_cast<int>(ImDelsearch(static_cast<size_t>(pos), isPosInSplid, clearFixedThisStep));

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ImResetSearch(napi_env env, napi_callback_info info)
{
    ImResetSearch();
    return nullptr;
}

static napi_value ImAddLetter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t ch;
    napi_get_value_uint32(env, args[0], &ch);

    int value = static_cast<int>(ImAddLetter(ch));

    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ImGetPyStr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    bool decoded;
    napi_get_value_bool(env, args[0], &decoded);

    size_t pyLen;
    const char *py = ImGetSpsStr(&pyLen);
    if (!decoded) {
        pyLen = strlen(py);
    }

    const unsigned short *splStart;
    size_t len = ImGetSplStartPos(splStart);

    size_t i;
    for (i = 0; i < pyLen; i++) {
        g_retbuf[i] = py[i];
    }
    g_retbuf[i] = static_cast<char16>('\0');

    napi_value result;
    std::string tmp = conversion.to_bytes((char16_t *)g_retbuf);
    napi_create_string_utf8(env, tmp.c_str(), tmp.length(), &result);
    return result;
}

static napi_value ImGetPyStrLen(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    bool decoded;
    napi_get_value_bool(env, args[0], &decoded);

    size_t pyLen;
    const char *py = ImGetSpsStr(&pyLen);
    if (!decoded) {
        pyLen = strlen(py);
    }

    napi_value result;
    napi_create_int32(env, (int)pyLen, &result);
    return result;
}

static napi_value ImGetSplStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    const unsigned short *splStart;

    // There will be len + 1 elements in the buffer when len > 0.
    size_t len = ImGetSplStartPos(splStart);

    napi_create_array(env, &result);
    napi_value lenValue;
    napi_create_int32(env, len, &lenValue);
    napi_set_element(env, result, 0, lenValue);

    for (size_t i = 0; i <= len; i++) {
        napi_value num;
        napi_create_int32(env, splStart[i], &num);
        napi_set_element(env, result, i + 1, num);
    }

    return result;
}

static napi_value ImGetChoice(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int choiceId;
    napi_get_value_int32(env, args[0], &choiceId);

    napi_value result;
    if (ImGetCandidate(choiceId, g_retbuf, RET_BUF_LEN)) {
        std::string tmp = conversion.to_bytes((char16_t *)g_retbuf);
        napi_create_string_utf8(env, tmp.c_str(), tmp.length(), &result);
    } else {
        napi_create_string_utf8(env, (const char *)g_retbuf, 0, &result);
    }
    return result;
}

static napi_value ImChoose(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int choiceId;
    napi_get_value_int32(env, args[0], &choiceId);

    int value = static_cast<int>(ImChoose(choiceId));
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ImCancelLastChoice(napi_env env, napi_callback_info info)
{
    int value = static_cast<int>(ImCancelLastChoice());
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ImGetFixedLen(napi_env env, napi_callback_info info)
{
    int value = static_cast<int>(ImGetFixedLen());
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ImCancelInput(napi_env env, napi_callback_info info)
{
    bool value = ImCancelInput();
    napi_value result;
    napi_get_boolean(env, value, &result);
    return result;
}

static napi_value ImFlushCache(napi_env env, napi_callback_info info)
{
    ImFlushCache();
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value ImGetPredictsNum(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *fixed = nullptr;
    size_t fixedLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &fixedLen);
    fixed = new char[fixedLen + 1];
    napi_get_value_string_utf8(env, args[0], fixed, fixedLen + 1, &fixedLen);

    char16 fixedBuf[K_MAX_PREDICT_SIZE + 1];

    if (fixedLen > K_MAX_PREDICT_SIZE) {
        fixed += fixedLen - K_MAX_PREDICT_SIZE;
        fixedLen = K_MAX_PREDICT_SIZE;
    }
    Utf16Strncpy(fixedBuf, reinterpret_cast<char16 *>(fixed), fixedLen);
    fixedBuf[fixedLen] = static_cast<char16>('\0');

    g_predictLen = ImGetPredicts(fixedBuf, g_predictBuf);

    napi_value result;
    napi_create_int32(env, (int)g_predictLen, &result);
    return result;
}

static napi_value ImGetPredictItem(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int predictNo;
    napi_get_value_int32(env, args[0], &predictNo);

    g_syncWorker.Finish();

    napi_value result;

    if (predictNo < 0 || static_cast<size_t>(predictNo) >= g_predictLen) {
        napi_create_string_utf8(env, (const char *)g_predictBuf[0], 0, &result);
    } else {
        napi_create_string_utf8(env, (const char *)g_predictBuf[predictNo], Utf16Strlen(g_predictBuf[predictNo]),
                                &result);
    }
    return result;
}

static napi_value SyncUserDict(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *userDict = nullptr;
    size_t userDictLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &userDictLen);
    userDict = new char[userDictLen + 1];
    napi_get_value_string_utf8(env, args[0], userDict, userDictLen + 1, &userDictLen);

    char *toMerge = nullptr;
    size_t toMergeLen = 0;
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &toMergeLen);
    toMerge = new char[toMergeLen + 1];
    napi_get_value_string_utf8(env, args[1], toMerge, toMergeLen + 1, &toMergeLen);

    napi_value result;

    std::string ret = "test";
    napi_create_string_utf8(env, ret.c_str(), ret.length(), &result);
    return result;
}

static napi_value SyncBegin(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *userDict = nullptr;
    size_t userDictLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &userDictLen);
    userDict = new char[userDictLen + 1];
    napi_get_value_string_utf8(env, args[0], userDict, userDictLen + 1, &userDictLen);

    bool ret = g_syncWorker.Begin(reinterpret_cast<const char *>(userDict));

    napi_value result;
    napi_get_boolean(env, ret, &result);
    return result;
}

static napi_value SyncFinish(napi_env env, napi_callback_info info)
{
    g_syncWorker.Finish();
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value SyncGetLemmas(napi_env env, napi_callback_info info)
{
    int len = g_syncWorker.GetLemmas(g_retbuf, RET_BUF_LEN);
    if (len == 0) {
        return nullptr;
    }
    napi_value result;

    std::string tmp = conversion.to_bytes((char16_t *)g_retbuf);
    napi_create_string_utf8(env, tmp.c_str(), tmp.length(), &result);
    return result;
}

static napi_value SyncPutLemmas(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *tomerge = nullptr;
    size_t tomergeLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &tomergeLen);
    tomerge = new char[tomergeLen + 1];
    napi_get_value_string_utf8(env, args[0], tomerge, tomergeLen + 1, &tomergeLen);

    int added = g_syncWorker.PutLemmas(reinterpret_cast<char16 *>(tomerge), tomergeLen);
    napi_value result;
    napi_create_int32(env, added, &result);
    return result;
}

static napi_value SyncGetLastCount(napi_env env, napi_callback_info info)
{
    int capacity = g_syncWorker.GetLastGotCount();
    napi_value result;
    napi_create_int32(env, capacity, &result);
    return result;
}

static napi_value SyncGetTotalCount(napi_env env, napi_callback_info info)
{
    int capacity = g_syncWorker.GetTotalCount();
    napi_value result;
    napi_create_int32(env, capacity, &result);
    return result;
}

static napi_value SyncClearLastGot(napi_env env, napi_callback_info info)
{
    g_syncWorker.ClearLastGot();
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value SyncGetCapacity(napi_env env, napi_callback_info info)
{
    int capacity = g_syncWorker.GetCapacity();
    napi_value result;
    napi_create_int32(env, capacity, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nativeImOpenDecoder", nullptr, ImOpenDecoder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImOpenDecoderFd", nullptr, ImOpenDecoderFd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImSetMaxLens", nullptr, ImSetMaxLens, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImCloseDecoder", nullptr, ImCloseDecoder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImSearch", nullptr, ImSearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImDelSearch", nullptr, ImDelSearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImResetSearch", nullptr, ImResetSearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImAddLetter", nullptr, ImAddLetter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImGetPyStr", nullptr, ImGetPyStr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImGetPyStrLen", nullptr, ImGetPyStrLen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImGetSplStart", nullptr, ImGetSplStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImGetChoice", nullptr, ImGetChoice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImChoose", nullptr, ImChoose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImCancelLastChoice", nullptr, ImCancelLastChoice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImGetFixedLen", nullptr, ImGetFixedLen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImCancelInput", nullptr, ImCancelInput, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImFlushCache", nullptr, ImFlushCache, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImGetPredictsNum", nullptr, ImGetPredictsNum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeImGetPredictItem", nullptr, ImGetPredictItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncGetLastCount", nullptr, SyncGetLastCount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncGetTotalCount", nullptr, SyncGetTotalCount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncClearLastGot", nullptr, SyncClearLastGot, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncGetCapacity", nullptr, SyncGetCapacity, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncUserDict", nullptr, SyncUserDict, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncBegin", nullptr, SyncBegin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncFinish", nullptr, SyncFinish, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncGetLemmas", nullptr, SyncGetLemmas, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeSyncPutLemmas", nullptr, SyncPutLemmas, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
