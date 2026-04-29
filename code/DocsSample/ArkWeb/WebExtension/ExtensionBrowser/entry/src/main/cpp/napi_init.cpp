#include "napi/native_api.h"
#include <unistd.h>

static napi_value CreatePipe(napi_env env, napi_callback_info info)
{
    int fd[2] = {};
    pipe(fd);
    char * keys[2] = {
        "readFd",
        "writeFd"
    };
    napi_value FdValue[2];
    napi_create_int32(env, fd[0], &FdValue[0]);
    napi_create_int32(env, fd[1], &FdValue[1]);
    napi_value result;
    napi_create_object_with_named_properties(env,
                                         &result,
                                         2,
                                         (const char **)keys,
                                         FdValue);
  return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "createPipe", nullptr, CreatePipe, nullptr, nullptr, nullptr, napi_default, nullptr }
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
