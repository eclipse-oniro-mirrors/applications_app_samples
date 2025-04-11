/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include "ani/ani.h"
#include "hilog/log.h"
#include <iostream>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_TAG"  // 全局tag宏，标识模块日志tag

static ani_double HandleDoubleData([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_fn_object fnObj,
                                   ani_double val_double1)
{
    ani_class cls;
    if (ANI_OK != env->FindClass("Lstd/core/Double;", &cls)) {
        std::cerr << "Not found " << std::endl;
        return 0.0;
    }
    ani_method ctor;
    if (ANI_OK != env->Class_FindMethod(cls, "<ctor>", "D:V", &ctor)) {
        std::cerr << "Not found " << std::endl;
    }
    ani_object rs;
    if (ANI_OK != env->Object_New(cls, ctor, &rs, val_double1)) {
        std::cerr << "Object_New fail " << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Object_New success");
    ani_type result;
    if (ANI_OK != env->Object_GetType(rs, &result)) {
        std::cerr << "Object_GetType fail " << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Object_GetType success");
    ani_boolean boolresult;
    if (ANI_OK != env->Object_InstanceOf(fnObj, cls, &boolresult)) {
        std::cerr << "Object_InstanceOf fail " << std::endl;
    }
    OH_LOG_ERROR(LOG_APP, "testTag Object_InstanceOf result: %{public}d", boolresult);
    return val_double1;
}