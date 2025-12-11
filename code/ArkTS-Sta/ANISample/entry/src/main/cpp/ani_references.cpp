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
#include <iostream>

static ani_boolean Global_Local_References([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref;
    ani_ref result;
    if (ANI_OK != env->GlobalReference_Create(ref, &result)) {
        std::cerr << "GlobalReference_Create FAILED" << std::endl;
        return false;
    }
    ani_boolean isNull;
    if (ANI_OK != env->Reference_IsNull(result, &isNull)) {
        std::cerr << "Reference_IsNull" << std::endl;
        return false;
    }
    ani_ref ref0 = nullptr;
    ani_ref ref1 = nullptr;
    ani_boolean boolResult;
    if (ANI_OK != env->Reference_StrictEquals(ref0, ref1, &boolResult)) {
        std::cerr << "Reference_StrictEquals" << std::endl;
        return false;
    }

    if (ANI_OK != env->GlobalReference_Delete(result)) {
        std::cerr << "Reference_IsNull" << std::endl;
        return false;
    }
    return true;
}

//  Weak Global References;
static ani_boolean Weak_Global_References([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref;
    ani_wref result;
    if (ANI_OK != env->WeakReference_Create(ref, &result)) {
        std::cerr << "WeakReference_Create FAILED" << std::endl;
        return false;
    }
    if (ANI_OK != env->WeakReference_Delete(result)) {
        std::cerr << "WeakReference_Delete FAILED" << std::endl;
        return false;
    }
    return true;
}