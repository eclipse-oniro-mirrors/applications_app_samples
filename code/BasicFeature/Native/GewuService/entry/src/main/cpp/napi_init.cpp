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
#include <cassert>
#include <string>

// [Start gewu_demo]
#include <future>
#define LOG_TAG "DEMO"
#include <hilog/log.h>
#include <nlohmann/json.hpp>
#include <qos/qos.h>
#include <string>

#define DEMO_LOGD(fmt, ...) OH_LOG_DEBUG(LOG_APP, fmt, ##__VA_ARGS__)
#define DEMO_LOGI(fmt, ...) OH_LOG_INFO(LOG_APP, fmt, ##__VA_ARGS__)
#define DEMO_LOGW(fmt, ...) OH_LOG_WARN(LOG_APP, fmt, ##__VA_ARGS__)
#define DEMO_LOGE(fmt, ...) OH_LOG_ERROR(LOG_APP, fmt, ##__VA_ARGS__)

using json = nlohmann::json;

/* 用于保存聊天状态 */
struct ChatContext {
public:
    ChatContext()
    {
        future = promise.get_future();
    }

    void Join()
    {
        assert(future.valid());
        std::string stopReasonStr = future.get();
        DEMO_LOGI("stopReasonStr=%s", stopReasonStr.c_str());
    }

    std::promise<std::string> promise;
    std::future<std::string> future;
    std::string responseContent;
    bool earlyAbort = false;
};

/* 接收到推理结果时的回调函数 */
void OnChatResponse(void *context, const char *response)
{
    ChatContext *chatContext = static_cast<ChatContext *>(context);
    if (chatContext->earlyAbort) {
        DEMO_LOGD("ignore response after early abort");
        return;
    }
    try {
        json responseJson = json::parse(response);
        std::string role = responseJson.at("message").at("role").get<std::string>();
        if (role != "assistant") {
            DEMO_LOGW("Discarding invalid response due to incorrect role");
            return;
        }
        chatContext->responseContent += responseJson.at("message").at("content").get<std::string>();
        json finishReasonJson = responseJson.at("finish_reason");
        if (!finishReasonJson.is_null()) {
            /* finish */
            std::string finishReasonStr = finishReasonJson.get<std::string>();
            chatContext->promise.set_value(finishReasonStr);
        } else if (chatContext->responseContent.find("\n") != std::string::npos) {
            /* customized stop */
            chatContext->promise.set_value("customized");
            chatContext->earlyAbort = true;
        } else {
            /* continue */
            ;
        }
    } catch (json::exception &e) {
        DEMO_LOGE("failed to parse response: %s", e.what());
    }
}

int Demo(void)
{
    DEMO_LOGI("Demo starts");
    json attrJson = {
        /* 模型文件位置，根据实际情况修改 */
        {"model", "/data/storage/el2/base/files/qwen2-awq"},
    };
    std::string attrStr = attrJson.dump(4);

    /* 创建会话 */
    OH_QoS_GewuCreateSessionResult createResult = OH_QoS_GewuCreateSession(attrStr.c_str());
    if (createResult.error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to create session, error=%d", (int)createResult.error);
        return -1;
    }
    OH_QoS_GewuSession session = createResult.session;

    /* 创建并提交请求 */
    ChatContext context;
    json requestJson = {
        {"messages", json::array({
            {{"role", "developer"}, {"content", "You are a helpful assistant"}},
            {{"role", "user"}, {"content", "What is LLM?"}},
        })},
        {"stream", true},
    };
    std::string requestStr = requestJson.dump(4);
    OH_QoS_GewuSubmitRequestResult submitResult = OH_QoS_GewuSubmitRequest(session, requestStr.c_str(),
                                                                           OnChatResponse, &context);
    if (submitResult.error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to submit request, error=%d", (int)submitResult.error);
        OH_QoS_GewuDestroySession(session);
        return -1;
    }
    OH_QoS_GewuRequest request = submitResult.request;
    context.Join();

    /* 提前中止请求 */
    if (context.earlyAbort) {
        OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(session, request);
        if (error != OH_QOS_GEWU_OK) {
            DEMO_LOGE("failed to abort request, error=%d", (int)error);
            OH_QoS_GewuDestroySession(session);
            return -1;
        }
    }

    /* 打印结果 */
    DEMO_LOGI("response: %s", context.responseContent.c_str());

    /* 销毁会话 */
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(session);
    if (error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to destroy session, error=%d", (int)error);
        return -1;
    }
    return 0;
}
// [End gewu_demo]

static const char *GewuErrorString(OH_QoS_GewuErrorCode error)
{
    switch (error) {
        case OH_QOS_GEWU_OK:
            return "OK";
        case OH_QOS_GEWU_NOPERM:
            return "NOPERM";
        case OH_QOS_GEWU_NOMEM:
            return "NOMEM";
        case OH_QOS_GEWU_INVAL:
            return "INVAL";
        case OH_QOS_GEWU_EXIST:
            return "EXIST";
        case OH_QOS_GEWU_NOENT:
            return "NOENT";
        case OH_QOS_GEWU_NOSYS:
            return "NOSYS";
        default:
            return "FAULT";
    }
}

static OH_QoS_GewuSession g_session = OH_QOS_GEWU_INVALID_SESSION_ID;
static OH_QoS_GewuRequest g_request = OH_QOS_GEWU_INVALID_REQUEST_ID;
static ChatContext g_chatContext;

static std::string GetModelPath(napi_env env, napi_value arg)
{
    size_t length = 0;
    napi_get_value_string_utf8(env, arg, nullptr, 0, &length);
    std::string modelPath(length, '\0');
    if (length > 0) {
        napi_get_value_string_utf8(env, arg, &modelPath[0], length + 1, &length);
    }
    return modelPath;
}

static napi_value CreateSession(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    std::string modelPath = GetModelPath(env, args[0]);
    if (modelPath.empty()) {
        modelPath = "/data/storage/el2/base/files/qwen2-awq";
    }
    json attrJson = {
        {"model", modelPath},
    };
    std::string attrStr = attrJson.dump();
    OH_QoS_GewuCreateSessionResult createResult = OH_QoS_GewuCreateSession(attrStr.c_str());
    if (createResult.error == OH_QOS_GEWU_OK) {
        g_session = createResult.session;
        DEMO_LOGI("create session success, session=%u", g_session);
    } else {
        DEMO_LOGE("failed to create session, error=%s(%d)", GewuErrorString(createResult.error),
                  (int)createResult.error);
    }
    napi_value ret;
    napi_create_int32(env, (int32_t)createResult.error, &ret);
    return ret;
}

static napi_value SubmitRequest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (g_session == OH_QOS_GEWU_INVALID_SESSION_ID) {
        DEMO_LOGE("no valid session, please create session first");
        napi_value ret;
        napi_create_int32(env, (int32_t)OH_QOS_GEWU_NOENT, &ret);
        return ret;
    }
    std::string userMessage = GetModelPath(env, args[0]);
    if (userMessage.empty()) {
        userMessage = "What is LLM?";
    }
    json requestJson = {
        {"messages", json::array({
            {{"role", "developer"}, {"content", "You are a helpful assistant"}},
            {{"role", "user"}, {"content", userMessage}},
        })},
        {"stream", false},
    };
    std::string requestStr = requestJson.dump();
    OH_QoS_GewuSubmitRequestResult submitResult = OH_QoS_GewuSubmitRequest(g_session, requestStr.c_str(),
                                                                           OnChatResponse, &g_chatContext);
    if (submitResult.error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to submit request, error=%s(%d)", GewuErrorString(submitResult.error),
                  (int)submitResult.error);
        napi_value ret;
        napi_create_int32(env, (int32_t)submitResult.error, &ret);
        return ret;
    }
    g_request = submitResult.request;
    DEMO_LOGI("submit request success, request=%u", g_request);
    g_chatContext.Join();
    napi_value ret;
    napi_create_int32(env, (int32_t)OH_QOS_GEWU_OK, &ret);
    return ret;
}

static napi_value AbortRequest(napi_env env, napi_callback_info info)
{
    if (g_session == OH_QOS_GEWU_INVALID_SESSION_ID || g_request == OH_QOS_GEWU_INVALID_REQUEST_ID) {
        DEMO_LOGE("no valid request, please submit request first");
        napi_value ret;
        napi_create_int32(env, (int32_t)OH_QOS_GEWU_NOENT, &ret);
        return ret;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(g_session, g_request);
    if (error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to abort request, error=%s(%d)", GewuErrorString(error), (int)error);
    } else {
        DEMO_LOGI("abort request success, request=%u", g_request);
        g_request = OH_QOS_GEWU_INVALID_REQUEST_ID;
    }
    napi_value ret;
    napi_create_int32(env, (int32_t)error, &ret);
    return ret;
}

static napi_value DestroySession(napi_env env, napi_callback_info info)
{
    if (g_session == OH_QOS_GEWU_INVALID_SESSION_ID) {
        DEMO_LOGE("no valid session, please create session first");
        napi_value ret;
        napi_create_int32(env, (int32_t)OH_QOS_GEWU_NOENT, &ret);
        return ret;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(g_session);
    if (error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to destroy session, error=%s(%d)", GewuErrorString(error), (int)error);
    } else {
        DEMO_LOGI("destroy session success, session=%u", g_session);
        g_session = OH_QOS_GEWU_INVALID_SESSION_ID;
        g_request = OH_QOS_GEWU_INVALID_REQUEST_ID;
    }
    napi_value ret;
    napi_create_int32(env, (int32_t)error, &ret);
    return ret;
}

static napi_value GetResponse(napi_env env, napi_callback_info info)
{
    napi_value ret;
    napi_create_string_utf8(env, g_chatContext.responseContent.c_str(), g_chatContext.responseContent.length(), &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createSession", nullptr, CreateSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroySession", nullptr, DestroySession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"submitRequest", nullptr, SubmitRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"abortRequest", nullptr, AbortRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResponse", nullptr, GetResponse, nullptr, nullptr, nullptr, napi_default, nullptr}};
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
