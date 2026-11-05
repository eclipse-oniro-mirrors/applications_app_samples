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

// [Start GewuServiceCodeExample]
#include <string>
#include <future>
#include <chrono>
#include <atomic>
#include <memory>
#define LOG_TAG "DEMO"
#include <hilog/log.h>
#include <nlohmann/json.hpp>
#include <qos/qos.h>

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
        std::string stopReasonStr = future.get();
        DEMO_LOGI("stopReasonStr=%s", stopReasonStr.c_str());
    }

    /* 仅在未完成时置值，避免重复 set_value 导致崩溃 */
    void Complete(const std::string &finishReason)
    {
        if (done) {
            return;
        }
        done = true;
        promise.set_value(finishReason);
    }

    std::promise<std::string> promise;
    std::future<std::string> future;
    std::string responseContent;
    std::atomic<bool> earlyAbort { false };
    std::atomic<bool> done { false };
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
            chatContext->Complete(finishReasonStr);
        } else if (chatContext->responseContent.find("\n") != std::string::npos) {
            /* customized stop */
            chatContext->Complete("customized");
            chatContext->earlyAbort = true;
        } else {
            /* continue */
            ;
        }
    } catch (json::exception &e) {
        DEMO_LOGE("failed to parse response: %s", e.what());
    }
}

static int CreateDemoSession(OH_QoS_GewuSession &session)
{
    json attrJson = {
        /* 模型文件位置，根据实际情况修改 */
        {"model", "/data/storage/el2/base/files/Qwen2_5_0_5B_CPU_Q4"},
        {"eval_settings", {
            {"backend", "cpu"},
            {"max_ctx", 8192}
        }}
    };
    std::string attrStr = attrJson.dump(4);

    OH_QoS_GewuCreateSessionResult createResult = OH_QoS_GewuCreateSession(attrStr.c_str());
    if (createResult.error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to create session, error=%d", (int)createResult.error);
        return -1;
    }
    session = createResult.session;
    return 0;
}

static int SubmitDemoRequest(OH_QoS_GewuSession session, ChatContext &context, OH_QoS_GewuRequest &request)
{
    json requestJson = {
        {"type", "chat"},
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
        return -1;
    }
    request = submitResult.request;
    return 0;
}

/* 自定义停止后主动中止请求 */
static int AbortDemoRequest(OH_QoS_GewuSession session, OH_QoS_GewuRequest request, ChatContext &context)
{
    if (!context.earlyAbort) {
        return 0;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(session, request);
    if (error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to abort request, error=%d", (int)error);
        return -1;
    }
    return 0;
}

int Demo(void)
{
    DEMO_LOGI("Demo starts");

    /* 创建会话 */
    OH_QoS_GewuSession session = OH_QOS_GEWU_INVALID_SESSION_ID;
    if (CreateDemoSession(session) != 0) {
        return -1;
    }

    /* 创建并提交请求 */
    ChatContext context;
    OH_QoS_GewuRequest request = OH_QOS_GEWU_INVALID_REQUEST_ID;
    if (SubmitDemoRequest(session, context, request) != 0) {
        OH_QoS_GewuDestroySession(session);
        return -1;
    }
    context.Join();

    /* 提前中止请求 */
    if (AbortDemoRequest(session, request, context) != 0) {
        OH_QoS_GewuDestroySession(session);
        return -1;
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
// [End GewuServiceCodeExample]

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
static std::unique_ptr<ChatContext> g_chatContext;
/* 用户点击"停止"触发 abortRequest 成功后置位，工作线程据此提前结束等待 */
static std::atomic<bool> g_abortRequested { false };
/* 轮询推理结果是否就绪的间隔（毫秒） */
static constexpr int WAIT_INTERVAL_MS = 100;

/* 创建会话的异步任务上下文 */
struct CreateWork {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    std::string modelPath;
    int32_t error = OH_QOS_GEWU_OK;
    OH_QoS_GewuSession session = OH_QOS_GEWU_INVALID_SESSION_ID;
};

/* 提交请求的异步任务上下文 */
struct SubmitWork {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    std::string messagesJson;
    int32_t error = OH_QOS_GEWU_OK;
    OH_QoS_GewuSession session = OH_QOS_GEWU_INVALID_SESSION_ID;
    OH_QoS_GewuRequest request = OH_QOS_GEWU_INVALID_REQUEST_ID;
};

/* 读取 napi 字符串参数 */
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

/* 将整数错误码封装为已 resolve 的 Promise，用于异步接口的快速失败返回 */
static napi_value ResolveInt(napi_env env, int32_t value)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    napi_resolve_deferred(env, deferred, result);
    return promise;
}

static void CreateExecute(napi_env env, void *data)
{
    CreateWork *work = static_cast<CreateWork *>(data);
    json attrJson = {
        {"model", work->modelPath},
        {"eval_settings", {
            {"backend", "cpu"},
            {"max_ctx", 8192}
        }}
    };
    std::string attrStr = attrJson.dump();
    OH_QoS_GewuCreateSessionResult createResult = OH_QoS_GewuCreateSession(attrStr.c_str());
    work->error = createResult.error;
    work->session = createResult.session;
    if (createResult.error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to create session, error=%s(%d)", GewuErrorString(createResult.error),
                  (int)createResult.error);
    }
}

static void CreateComplete(napi_env env, napi_status status, void *data)
{
    CreateWork *work = static_cast<CreateWork *>(data);
    if (work->error == OH_QOS_GEWU_OK) {
        g_session = work->session;
        DEMO_LOGI("create session success, session=%u", g_session);
    }
    napi_value result = nullptr;
    napi_create_int32(env, work->error, &result);
    napi_resolve_deferred(env, work->deferred, result);
    napi_delete_async_work(env, work->work);
    delete work;
}

static napi_value CreateSession(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    std::string modelPath;
    if (argc >= 1 && args[0] != nullptr) {
        modelPath = GetModelPath(env, args[0]);
    }
    if (modelPath.empty()) {
        modelPath = "/data/storage/el2/base/files/Qwen2_5_0_5B_CPU_Q4";
    }

    CreateWork *work = new CreateWork();
    work->modelPath = modelPath;
    napi_value promise = nullptr;
    napi_create_promise(env, &work->deferred, &promise);

    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "GewuCreateSession", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, CreateExecute, CreateComplete, work, &work->work);
    napi_queue_async_work(env, work->work);
    return promise;
}

static void SubmitExecute(napi_env env, void *data)
{
    SubmitWork *work = static_cast<SubmitWork *>(data);
    while (true) {
        if (g_chatContext->future.wait_for(std::chrono::milliseconds(WAIT_INTERVAL_MS)) ==
            std::future_status::ready) {
            g_chatContext->Join();
            break;
        }
        if (g_abortRequested.load()) {
            /* 用户已调用 abortRequest 中止请求，不再等待推理完成 */
            break;
        }
    }
    if (g_chatContext->earlyAbort.load()) {
        /* 自定义停止（首个换行）后主动中止请求，与参考示例 Demo() 保持一致 */
        OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(work->session, work->request);
        if (error != OH_QOS_GEWU_OK) {
            DEMO_LOGE("failed to abort request after early stop, error=%s(%d)", GewuErrorString(error),
                      (int)error);
        }
    }
}

static void SubmitComplete(napi_env env, napi_status status, void *data)
{
    SubmitWork *work = static_cast<SubmitWork *>(data);
    if (work->error == OH_QOS_GEWU_OK) {
        g_request = OH_QOS_GEWU_INVALID_REQUEST_ID;
    }
    napi_value result = nullptr;
    napi_create_int32(env, work->error, &result);
    napi_resolve_deferred(env, work->deferred, result);
    napi_delete_async_work(env, work->work);
    delete work;
}

/* 解析入参中的 messages JSON，失败时返回对应错误码 */
static OH_QoS_GewuErrorCode ParseMessagesJson(napi_env env, size_t argc, napi_value *args, json &messagesArr)
{
    std::string messagesJson;
    if (argc >= 1 && args[0] != nullptr) {
        messagesJson = GetModelPath(env, args[0]);
    }
    if (messagesJson.empty()) {
        messagesJson = "[{\"role\":\"user\",\"content\":\"What is LLM?\"}]";
    }

    try {
        messagesArr = json::parse(messagesJson);
    } catch (json::exception &e) {
        DEMO_LOGE("failed to parse messages json: %s", e.what());
        return OH_QOS_GEWU_INVAL;
    }
    return OH_QOS_GEWU_OK;
}

static std::string BuildRequestJson(const json &messagesArr)
{
    json requestJson = {
        {"type", "chat"},
        {"messages", messagesArr},
        {"stream", false},
    };
    return requestJson.dump();
}

/* 创建并启动提交请求的异步任务，返回对应的 Promise */
static napi_value StartSubmitWork(napi_env env, OH_QoS_GewuSession session, OH_QoS_GewuRequest request)
{
    SubmitWork *work = new SubmitWork();
    work->session = session;
    work->request = request;
    napi_value promise = nullptr;
    napi_create_promise(env, &work->deferred, &promise);

    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "GewuSubmitRequest", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, SubmitExecute, SubmitComplete, work, &work->work);
    napi_queue_async_work(env, work->work);
    return promise;
}

static napi_value SubmitRequest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (g_session == OH_QOS_GEWU_INVALID_SESSION_ID) {
        DEMO_LOGE("no valid session, please create session first");
        return ResolveInt(env, OH_QOS_GEWU_NOENT);
    }

    json messagesArr;
    OH_QoS_GewuErrorCode parseError = ParseMessagesJson(env, argc, args, messagesArr);
    if (parseError != OH_QOS_GEWU_OK) {
        return ResolveInt(env, parseError);
    }

    std::string requestStr = BuildRequestJson(messagesArr);
    g_abortRequested.store(false);
    g_chatContext = std::make_unique<ChatContext>();
    OH_QoS_GewuSubmitRequestResult submitResult = OH_QoS_GewuSubmitRequest(g_session, requestStr.c_str(),
                                                                           OnChatResponse, g_chatContext.get());
    if (submitResult.error != OH_QOS_GEWU_OK) {
        DEMO_LOGE("failed to submit request, error=%s(%d)", GewuErrorString(submitResult.error),
                  (int)submitResult.error);
        return ResolveInt(env, submitResult.error);
    }
    g_request = submitResult.request;
    DEMO_LOGI("submit request success, request=%u", g_request);
    DEMO_LOGI("request: %s", requestStr.c_str());
    return StartSubmitWork(env, g_session, submitResult.request);
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
        g_abortRequested.store(true);
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
        g_abortRequested.store(false);
    }
    napi_value ret;
    napi_create_int32(env, (int32_t)error, &ret);
    return ret;
}

static napi_value GetResponse(napi_env env, napi_callback_info info)
{
    std::string response = g_chatContext ? g_chatContext->responseContent : std::string();
    napi_value ret;
    napi_create_string_utf8(env, response.c_str(), response.size(), &ret);
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
