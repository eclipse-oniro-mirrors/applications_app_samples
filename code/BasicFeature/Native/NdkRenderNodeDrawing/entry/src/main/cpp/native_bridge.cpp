/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstdint>
#include <string>

#include "napi/native_api.h"
#include <multimedia/image_framework/image_pixel_map_mdk.h>

#include "common/log_common.h"
#include "capability/capability_dispatch.h"
#include "capability/capability_type.h"
#include "drawing/drawing_effect.h"
#include "drawing/drawing_image.h"
#include "drawing/drawing_shape.h"
#include "drawing/drawing_text.h"
#include "drawing/drawing_transform.h"
#include "drawing/scene_type.h"

namespace {
// nativeRenderDraw 必填参数个数：context、width、height、scene、kind。
constexpr size_t RENDER_ARG_COUNT = 5;
// 图片场景额外需要一个 PixelMap 参数。
constexpr size_t IMAGE_ARG_COUNT = 6;
constexpr size_t MEASURE_ARG_COUNT = 3;
// nativeRenderScene 必填参数个数：context、width、height、group、scene、params。
constexpr size_t SCENE_ARG_COUNT = 6;
// 第 7 个参数为可选的 PixelMap，仅像素图能力域需要，缺失时对应场景降级为示意图。
constexpr size_t SCENE_MAX_ARG_COUNT = 7;

// nativeRenderDraw 的参数顺序：context、width、height、scene、kind、pixelMap。
constexpr size_t ARG_CONTEXT = 0;
constexpr size_t ARG_WIDTH = 1;
constexpr size_t ARG_HEIGHT = 2;
constexpr size_t ARG_SCENE = 3;
constexpr size_t ARG_KIND = 4;
constexpr size_t ARG_PIXEL_MAP = 5;
// nativeMeasureText 的参数顺序：text、fontSize、maxWidth。
constexpr size_t ARG_TEXT = 0;
constexpr size_t ARG_FONT_SIZE = 1;
constexpr size_t ARG_MAX_WIDTH = 2;
// nativeRenderScene 的参数顺序：context、width、height、group、scene、params、pixelMap。
constexpr size_t ARG_GROUP = 3;
constexpr size_t ARG_PARAMS = 5;
constexpr size_t ARG_SCENE_PIXEL_MAP = 6;

bool GetInt32Arg(napi_env env, napi_value value, int32_t &result)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, value, &type) != napi_ok || type != napi_number) {
        return false;
    }
    return napi_get_value_int32(env, value, &result) == napi_ok;
}

bool GetDoubleArg(napi_env env, napi_value value, double &result)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, value, &type) != napi_ok || type != napi_number) {
        return false;
    }
    return napi_get_value_double(env, value, &result) == napi_ok;
}

// 从 ArkTS 的 number[] 中提取参数，超长部分丢弃，返回值表示是否整体合法。
bool GetDoubleArray(napi_env env, napi_value value, double *out, uint32_t capacity, uint32_t &count)
{
    count = 0;
    bool isArray = false;
    if (napi_is_array(env, value, &isArray) != napi_ok || !isArray) {
        return false;
    }
    uint32_t length = 0;
    if (napi_get_array_length(env, value, &length) != napi_ok) {
        return false;
    }
    if (length > capacity) {
        length = capacity;
    }
    for (uint32_t index = 0; index < length; index++) {
        napi_value element = nullptr;
        if (napi_get_element(env, value, index, &element) != napi_ok) {
            return false;
        }
        if (!GetDoubleArg(env, element, out[index])) {
            return false;
        }
    }
    count = length;
    return true;
}

bool IsNullOrUndefined(napi_env env, napi_value value)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, value, &type) != napi_ok) {
        return true;
    }
    return type == napi_undefined || type == napi_null;
}

napi_value CreateUndefined(napi_env env)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    return result;
}

const char *SceneName(int32_t scene)
{
    switch (scene) {
        case ndr::SCENE_SHAPE:
            return "shape";
        case ndr::SCENE_EFFECT:
            return "effect";
        case ndr::SCENE_TRANSFORM:
            return "transform";
        case ndr::SCENE_IMAGE:
            return "image";
        case ndr::SCENE_TEXT:
            return "text";
        default:
            return "unknown";
    }
}

// 校验场景编号与场景内种类编号，避免越界取值。
bool IsSceneParamValid(int32_t scene, int32_t kind)
{
    switch (scene) {
        case ndr::SCENE_SHAPE:
            return kind >= ndr::SHAPE_POINT && kind < ndr::SHAPE_KIND_COUNT;
        case ndr::SCENE_EFFECT:
            return kind >= ndr::EFFECT_FILL_STROKE && kind < ndr::EFFECT_KIND_COUNT;
        case ndr::SCENE_TRANSFORM:
            return kind >= ndr::TRANSFORM_CLIP_RECT && kind < ndr::TRANSFORM_KIND_COUNT;
        case ndr::SCENE_IMAGE:
            return kind >= ndr::IMAGE_STRETCH && kind < ndr::IMAGE_KIND_COUNT;
        case ndr::SCENE_TEXT:
            return kind >= ndr::TEXT_BLOB && kind < ndr::TEXT_KIND_COUNT;
        default:
            return false;
    }
}

void DispatchScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height,
    int32_t scene, int32_t kind, NativePixelMap *nativePixelMap)
{
    switch (scene) {
        case ndr::SCENE_SHAPE:
            ndr::DrawShapeScene(canvas, width, height, kind);
            break;
        case ndr::SCENE_EFFECT:
            ndr::DrawEffectScene(canvas, width, height, kind);
            break;
        case ndr::SCENE_TRANSFORM:
            ndr::DrawTransformScene(canvas, width, height, kind);
            break;
        case ndr::SCENE_IMAGE:
            ndr::DrawImageScene(canvas, width, height, nativePixelMap, kind);
            break;
        case ndr::SCENE_TEXT:
            ndr::DrawTextScene(canvas, width, height, kind);
            break;
        default:
            DRAWING_LOGE("DispatchScene unsupported scene=%{public}d", scene);
            break;
    }
}

// 布局未就绪时上层会以 0 尺寸触发一次绘制，属正常时序，静默跳过；负数才视为参数异常。
bool IsUsableSceneSize(int32_t width, int32_t height)
{
    if (width > 0 && height > 0) {
        return true;
    }
    if (width < 0 || height < 0) {
        DRAWING_LOGE("NativeRenderScene negative size, width=%{public}d height=%{public}d", width, height);
    }
    return false;
}

// PixelMap 参数为可选项，仅在像素图能力域读取；取失败时退化为示意图，不阻断绘制。
void *ResolveScenePixelMap(napi_env env, size_t argc, napi_value *args, int32_t group)
{
    if (group != ndr::GROUP_PIXELMAP || argc <= SCENE_ARG_COUNT) {
        return nullptr;
    }
    if (IsNullOrUndefined(env, args[ARG_SCENE_PIXEL_MAP])) {
        return nullptr;
    }
    void *nativePixelMap = OH_PixelMap_InitNativePixelMap(env, args[ARG_SCENE_PIXEL_MAP]);
    if (nativePixelMap == nullptr) {
        DRAWING_LOGW("NativeRenderScene init pixel map failed, fallback to schematic scene");
    }
    return nativePixelMap;
}
} // namespace

// ArkTS 侧 DrawContext.canvas 的包装对象，需与 native_bridge 中导出的方法配合使用。
static napi_value NativeRenderDraw(napi_env env, napi_callback_info info)
{
    size_t argc = IMAGE_ARG_COUNT;
    napi_value args[IMAGE_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < RENDER_ARG_COUNT) {
        DRAWING_LOGE("NativeRenderDraw invalid argc=%{public}d", static_cast<int32_t>(argc));
        return CreateUndefined(env);
    }

    void *context = nullptr;
    if (napi_unwrap(env, args[ARG_CONTEXT], &context) != napi_ok || context == nullptr) {
        DRAWING_LOGE("NativeRenderDraw unwrap canvas failed");
        return CreateUndefined(env);
    }
    OH_Drawing_Canvas *canvas = reinterpret_cast<OH_Drawing_Canvas *>(context);

    int32_t width = 0;
    int32_t height = 0;
    int32_t scene = 0;
    int32_t kind = 0;
    if (!GetInt32Arg(env, args[ARG_WIDTH], width) || !GetInt32Arg(env, args[ARG_HEIGHT], height) ||
        !GetInt32Arg(env, args[ARG_SCENE], scene) || !GetInt32Arg(env, args[ARG_KIND], kind)) {
        DRAWING_LOGE("NativeRenderDraw invalid number argument");
        return CreateUndefined(env);
    }
    if (width <= 0 || height <= 0) {
        // 布局未就绪时上层会以 0 尺寸触发一次绘制，属正常时序，静默跳过；负数才视为参数异常。
        if (width < 0 || height < 0) {
            DRAWING_LOGE("NativeRenderDraw negative size, width=%{public}d height=%{public}d", width, height);
        }
        return CreateUndefined(env);
    }
    if (!IsSceneParamValid(scene, kind)) {
        DRAWING_LOGE("NativeRenderDraw invalid scene=%{public}d kind=%{public}d", scene, kind);
        return CreateUndefined(env);
    }

    NativePixelMap *nativePixelMap = nullptr;
    if (scene == ndr::SCENE_IMAGE) {
        if (argc < IMAGE_ARG_COUNT || IsNullOrUndefined(env, args[ARG_PIXEL_MAP])) {
            DRAWING_LOGE("NativeRenderDraw image scene requires pixel map");
            return CreateUndefined(env);
        }
        nativePixelMap = OH_PixelMap_InitNativePixelMap(env, args[ARG_PIXEL_MAP]);
        if (nativePixelMap == nullptr) {
            DRAWING_LOGE("NativeRenderDraw init pixel map failed");
            return CreateUndefined(env);
        }
    }

    DRAWING_LOGI("NativeRenderDraw scene=%{public}s kind=%{public}d size=%{public}dx%{public}d",
        SceneName(scene), kind, width, height);
    DispatchScene(canvas, width, height, scene, kind, nativePixelMap);
    return CreateUndefined(env);
}

// 测量文本占用尺寸，返回 { width, height }，单位像素。
static napi_value NativeMeasureText(napi_env env, napi_callback_info info)
{
    size_t argc = MEASURE_ARG_COUNT;
    napi_value args[MEASURE_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < MEASURE_ARG_COUNT) {
        DRAWING_LOGE("NativeMeasureText invalid argc=%{public}d", static_cast<int32_t>(argc));
        return CreateUndefined(env);
    }

    std::string text;
    size_t length = 0;
    if (napi_get_value_string_utf8(env, args[ARG_TEXT], nullptr, 0, &length) == napi_ok) {
        text.resize(length + 1);
        size_t copied = 0;
        if (napi_get_value_string_utf8(env, args[ARG_TEXT], &text[0], text.size(), &copied) == napi_ok) {
            text.resize(copied);
        } else {
            text.clear();
        }
    }
    double fontSize = 0.0;
    double maxWidth = 0.0;
    if (!GetDoubleArg(env, args[ARG_FONT_SIZE], fontSize) || !GetDoubleArg(env, args[ARG_MAX_WIDTH], maxWidth)) {
        DRAWING_LOGE("NativeMeasureText invalid number argument");
        return CreateUndefined(env);
    }

    const ndr::TextMeasureResult measure = ndr::MeasureText(text.c_str(), fontSize, maxWidth);
    napi_value result = nullptr;
    napi_value widthValue = nullptr;
    napi_value heightValue = nullptr;
    if (napi_create_object(env, &result) != napi_ok || napi_create_double(env, measure.width, &widthValue) != napi_ok ||
        napi_create_double(env, measure.height, &heightValue) != napi_ok) {
        DRAWING_LOGE("NativeMeasureText create result failed");
        return CreateUndefined(env);
    }
    napi_set_named_property(env, result, "width", widthValue);
    napi_set_named_property(env, result, "height", heightValue);
    return result;
}

// 能力域统一绘制入口：场景编号与参数数组直传 native，绘制细节由各能力域模块负责。
static napi_value NativeRenderScene(napi_env env, napi_callback_info info)
{
    size_t argc = SCENE_MAX_ARG_COUNT;
    napi_value args[SCENE_MAX_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < SCENE_ARG_COUNT) {
        DRAWING_LOGE("NativeRenderScene invalid argc=%{public}d", static_cast<int32_t>(argc));
        return CreateUndefined(env);
    }

    void *context = nullptr;
    if (napi_unwrap(env, args[ARG_CONTEXT], &context) != napi_ok || context == nullptr) {
        DRAWING_LOGE("NativeRenderScene unwrap canvas failed");
        return CreateUndefined(env);
    }
    OH_Drawing_Canvas *canvas = reinterpret_cast<OH_Drawing_Canvas *>(context);

    int32_t width = 0;
    int32_t height = 0;
    int32_t group = 0;
    int32_t scene = 0;
    if (!GetInt32Arg(env, args[ARG_WIDTH], width) || !GetInt32Arg(env, args[ARG_HEIGHT], height) ||
        !GetInt32Arg(env, args[ARG_GROUP], group) || !GetInt32Arg(env, args[ARG_SCENE], scene)) {
        DRAWING_LOGE("NativeRenderScene invalid number argument");
        return CreateUndefined(env);
    }
    if (!IsUsableSceneSize(width, height)) {
        return CreateUndefined(env);
    }
    if (!ndr::IsCapabilitySupported(group, scene)) {
        DRAWING_LOGE("NativeRenderScene unsupported group=%{public}d scene=%{public}d", group, scene);
        return CreateUndefined(env);
    }

    double values[ndr::MAX_SCENE_PARAMS] = {0.0};
    uint32_t count = 0;
    if (!GetDoubleArray(env, args[ARG_PARAMS], values, ndr::MAX_SCENE_PARAMS, count)) {
        DRAWING_LOGE("NativeRenderScene invalid params array");
        return CreateUndefined(env);
    }

    DRAWING_LOGI("NativeRenderScene group=%{public}s scene=%{public}d params=%{public}d size=%{public}dx%{public}d",
        ndr::CapabilityGroupName(group), scene, static_cast<int32_t>(count), width, height);

    void *nativePixelMap = ResolveScenePixelMap(env, argc, args, group);
    ndr::DispatchCapability(canvas, width, height, group, scene, values, count, nativePixelMap);
    return CreateUndefined(env);
}

EXTERN_C_START
// Init 将在 exports 上挂载本模块的 native 方法，exports 即 ArkTS 侧 import 之后获取到的对象。
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nativeRenderDraw", nullptr, NativeRenderDraw, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeRenderScene", nullptr, NativeRenderScene, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeMeasureText", nullptr, NativeMeasureText, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
