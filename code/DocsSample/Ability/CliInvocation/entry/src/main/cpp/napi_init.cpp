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
#include <string>
#include <vector>
#include <unistd.h>
#include <sys/wait.h>

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value ForkAndExecute(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    const size_t bufSize = 1024;
    char buf[bufSize];
    size_t bundleNameLen = 0;
    napi_get_value_string_utf8(env, args[0], buf, bufSize, &bundleNameLen);
    std::string bundleName = std::string(buf);

    char buf2[bufSize];
    size_t abilityNameLen = 0;
    napi_get_value_string_utf8(env, args[1], buf2, bufSize, &abilityNameLen);
    std::string abilityName = std::string(buf2);
    
    std::string aaCmd = "/system/bin/cli_tool/executable/ohos-aa";
    std::string subCmd = "start";
    std::string optBundleName = "--bundlename";
    std::string optAbilityName = "--abilityname";
    std::vector<char*> execArgs;
    execArgs.push_back(const_cast<char *>(aaCmd.c_str()));
    execArgs.push_back(const_cast<char *>(subCmd.c_str()));
    execArgs.push_back(const_cast<char *>(optBundleName.c_str()));
    execArgs.push_back(const_cast<char *>(bundleName.c_str()));
    execArgs.push_back(const_cast<char *>(optAbilityName.c_str()));
    execArgs.push_back(const_cast<char *>(abilityName.c_str()));
    execArgs.push_back(nullptr);
    
    // fork and execvp
    pid_t pid = fork();
    if (pid < 0) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    if (pid == 0) {
        // child process
        execvp(aaCmd.c_str(), execArgs.data());
        // if execvp returns, it failed
        const int exitExecFailed = 127;
        _exit(exitExecFailed);
    }
    // parent process: wait for child
    int status = 0;
    waitpid(pid, &status, 0);
    napi_value result;
    napi_create_int32(env, WIFEXITED(status) ? WEXITSTATUS(status) : -1, &result);
    return result;
}

static napi_value ForkAndForceStop(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    const size_t bufSize = 1024;
    char buf[bufSize];
    size_t bundleNameLen = 0;
    napi_get_value_string_utf8(env, args[0], buf, bufSize, &bundleNameLen);
    std::string bundleName = std::string(buf);

    std::string aaCmd = "/system/bin/cli_tool/executable/ohos-aa";
    std::string subCmd = "force-stop";
    std::string optBundleName = "--bundlename";
    std::vector<char*> execArgs;
    execArgs.push_back(const_cast<char *>(aaCmd.c_str()));
    execArgs.push_back(const_cast<char *>(subCmd.c_str()));
    execArgs.push_back(const_cast<char *>(optBundleName.c_str()));
    execArgs.push_back(const_cast<char *>(bundleName.c_str()));
    execArgs.push_back(nullptr);

    pid_t pid = fork();
    if (pid < 0) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    if (pid == 0) {
        execvp(aaCmd.c_str(), execArgs.data());
        const int exitExecFailed = 127;
        _exit(exitExecFailed);
    }
    int status = 0;
    waitpid(pid, &status, 0);
    napi_value result;
    napi_create_int32(env, WIFEXITED(status) ? WEXITSTATUS(status) : -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "forkAndExecute", nullptr, ForkAndExecute, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "forkAndForceStop", nullptr, ForkAndForceStop, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
