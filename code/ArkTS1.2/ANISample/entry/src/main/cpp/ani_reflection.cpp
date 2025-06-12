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
#include <ani/ani.h>
#include <iostream>

#define NUM_5000 5000

void CreateInstance(ani_env *env, ani_class *cls, ani_object *person_obj)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    if (ANI_OK != env->FindClass(className, cls)) {
        std::cerr << "Not found '" << className << "'" << std::endl;
        return;
    }
    ani_method ctor;
    if (ANI_OK != env->Class_FindMethod(*cls, "<ctor>", nullptr, &ctor)) {
        std::cerr << "get ctor Failed'" << className << "'" << std::endl;
        return;
    }
    if (ANI_OK != env->Object_New(*cls, ctor, person_obj)) {
        std::cerr << "Create Object Failed'" << className << "'" << std::endl;
        return;
    }
}

static ani_object CreatePerson([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static const char *className = "Lentry/src/main/ets/pages/Index/Calc;";
    ani_object person_obj = {};
    ani_class cls;
    CreateInstance(env, &cls, &person_obj);
    std::string name = "China";
    ani_string name_string{};
    if (ANI_OK != env->String_NewUTF8(name.c_str(), name.size(), &name_string)) {
        std::cerr << "String_NewUTF8 Failed'" << className << "'" << std::endl;
    }
    ani_int age_value(NUM_5000);
    if (ANI_OK != env->Object_SetPropertyByName_Int(person_obj, "age", age_value)) {
        std::cerr << "Object_SetPropertyByName_Int Failed'" << className << "'" << std::endl;
    }
    if (ANI_OK != env->Object_SetPropertyByName_Ref(person_obj, "name", name_string)) {
        std::cerr << "Object_SetPropertyByName_Ref Failed'" << className << "'" << std::endl;
    }
    ani_int age_value_ret;
    ani_ref name_string_ret;
    if (ANI_OK != env->Object_GetPropertyByName_Int(person_obj, "age", &age_value_ret)) {
        std::cerr << "Object_GetPropertyByName_Int Failed'" << className << "'" << std::endl;
    }
    if (ANI_OK != env->Object_GetPropertyByName_Ref(person_obj, "name", &name_string_ret)) {
        std::cerr << "Object_GetPropertyByName_Ref Failed'" << className << "'" << std::endl;
    }
    return person_obj;
}

ani_int BindGet([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int rs;
    const char *fieldName = "_thisIsProperty";
    env->Object_GetFieldByName_Int(object, fieldName, &rs);
    return rs;
}

void BindSet([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_int i)
{
    const char *fieldName = "_thisIsProperty";
    env->Object_SetFieldByName_Int(object, fieldName, i);
    return;
}