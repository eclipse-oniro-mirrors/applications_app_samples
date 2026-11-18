/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <bits/alltypes.h>
#include <cstdint>
#include "napi_manager.h"
#include "native_common.h"
#include "opengl_draw.h"
#include "pixel_probe.h"
#include "log.h"
#include "app_napi.h"

std::unordered_map<std::string, AppNapi *> AppNapi::instance_;
OH_NativeXComponent_Callback AppNapi::callback_;
static OpenglDraw *openglDraw;

uint32_t AppNapi::isCreated_ = 0;
uint32_t AppNapi::xcHeight_ = 0;
uint32_t AppNapi::xcWidth_ = 0;
double AppNapi::off_x = 0;
double AppNapi::off_y = 0;
uint32_t AppNapi::toolType_ = 5;
uint32_t AppNapi::mousecallback_ = 0;
float AppNapi::tiltX_ = 0;
float AppNapi::tiltY_ = 0;
uint32_t AppNapi::touchType = 4;
uint32_t AppNapi::shapeIndex_ = 0;
OH_NativeXComponent_TouchEvent AppNapi::testTouchEvent_;
OH_NativeXComponent_MouseEvent AppNapi::testMouseEvent_;
OH_NativeXComponent_MouseEvent_Callback AppNapi::mouseEventcallback_;
void *AppNapi::window_ = nullptr;

OpenglDraw *AppNapi::GetOpenglDraw(void) { return openglDraw; }

static void OnSurfaceCreatedCB(OH_NativeXComponent *component, void *window)
{
    LOGE("OnSurfaceCreatedCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        return;
    }

    std::string id(idStr);
    auto instance = AppNapi::GetInstance(id);
    instance->OnSurfaceCreated(component, window);
}

static void OnSurfaceChangedCB(OH_NativeXComponent *component, void *window)
{
    int32_t retChange;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    retChange = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (retChange != OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        return;
    }
    std::string id(idStr);
    auto instance = AppNapi::GetInstance(id);
    instance->OnSurfaceChanged(component, window);
}

static void OnSurfaceDestroyedCB(OH_NativeXComponent *component, void *window)
{
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        return;
    }
    std::string id(idStr);
    auto instance = AppNapi::GetInstance(id);
    openglDraw->Quit();
    instance->OnSurfaceDestroyed(component, window);
}

static void DispatchTouchEventCB(OH_NativeXComponent *component, void *window)
{
    LOGE("DispatchTouchEventCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        return;
    }
    std::string id(idStr);
    auto instance = AppNapi::GetInstance(id);
    instance->DispatchTouchEvent(component, window);
}

static void DispatchMouseEventCB(OH_NativeXComponent *component, void *window)
{
    LOGD("DispatchMouseEventCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        return;
    }
    std::string id(idStr);
    auto instance = AppNapi::GetInstance(id);
    instance->DispatchMouseEvent(component, window);
}

AppNapi::AppNapi(std::string &id)
{
    id_ = id;
    component_ = nullptr;
    auto appCallback = AppNapi::GetNXComponentCallback();
    appCallback->OnSurfaceCreated = OnSurfaceCreatedCB;
    appCallback->OnSurfaceChanged = OnSurfaceChangedCB;
    appCallback->OnSurfaceDestroyed = OnSurfaceDestroyedCB;
    appCallback->DispatchTouchEvent = DispatchTouchEventCB;
    auto appMouseEventCallback = AppNapi::GetNXComponentMouseEventCallback();
    appMouseEventCallback->DispatchMouseEvent = DispatchMouseEventCB;

    openglDraw = new OpenglDraw();
}

AppNapi *AppNapi::GetInstance(std::string &id)
{
    if (instance_.find(id) == instance_.end())
    {
        AppNapi *instance = new AppNapi(id);
        instance_[id] = instance;
        return instance;
    }
    else
    {
        return instance_[id];
    }
}

OH_NativeXComponent_Callback *AppNapi::GetNXComponentCallback() { return &AppNapi::callback_; }

OH_NativeXComponent_MouseEvent_Callback *AppNapi::GetNXComponentMouseEventCallback()
{
    return &AppNapi::mouseEventcallback_;
}

void AppNapi::SetNativeXComponent(OH_NativeXComponent *component)
{
    component_ = component;
    OH_NativeXComponent_RegisterCallback(component_, &AppNapi::callback_);
    uint32_t mousecallback = OH_NativeXComponent_RegisterMouseEventCallback(component_, &AppNapi::mouseEventcallback_);
    mousecallback_ = mousecallback;
}

void AppNapi::OnSurfaceCreated(OH_NativeXComponent *component, void *window)
{
    LOGE("AppNapi::OnSurfaceCreated");

    int32_t ret = OH_NativeXComponent_GetXComponentSize(component, window, &width_, &height_);

    LOGE("Offset : x = %{public}f, y = %{public}f ", x_, y_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        openglDraw->Init(reinterpret_cast<EGLNativeWindowType>(window), width_, height_);
        openglDraw->Update();
        isCreated_++;
        xcHeight_ = height_;
        xcWidth_ = width_;

        int32_t retOffset = OH_NativeXComponent_GetXComponentOffset(component, window, &x_, &y_);
        if (retOffset == OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
        {
            off_x = x_;
            off_y = y_;
            LOGE("Offset : x = %{public}lf, y = %{public}lf ", off_x, off_y);
        }
        else
        {
            LOGE("Offset Get failed");
        }

        window_ = window;

        LOGE("AppNapi::OnSurfaceCreated success ");
    }
    else
    {
        LOGE("AppNapi::OnSurfaceCreated failed");
    }
}

void AppNapi::OnSurfaceChanged(OH_NativeXComponent *component, void *window)
{
    LOGE("AppNapi::OnSurfaceChanged");
    int32_t ret = OH_NativeXComponent_GetXComponentSize(component, window, &width_, &height_);
    int32_t ret1;
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        xcHeight_ = height_;
        xcWidth_ = width_;
        window_ = window;
        LOGE("after width = %{public}d, height = %{public}d", xcWidth_, xcHeight_);
        ret1 = OH_NativeXComponent_GetXComponentOffset(component, window, &x_, &y_);
        off_x = x_;
        off_y = y_;

        if (ret1 == OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
        {
            LOGE("Offset : x = %{public}lf, y = %{public}lf ", off_x, off_y);
        }
        else
        {
            LOGE("Offset Get failed");
        }

        LOGE("AppNapi::GetOffset ");
        LOGE("Offset : x = %{public}lf, y = %{public}lf ", off_x, off_y);
    }
}

void AppNapi::OnSurfaceDestroyed(OH_NativeXComponent *component, void *window)
{
    LOGE("AppNapi::OnSurfaceDestroyed");
    window_ = nullptr;
    isCreated_--;
    LOGE("AppNapi::OnSurfaceDestroyed iscreated %{public}d", isCreated_);
}

void AppNapi::DispatchTouchEvent(OH_NativeXComponent *component, void *window)
{
    int32_t ret = OH_NativeXComponent_GetTouchEvent(component, window, &touchEvent_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        testTouchEvent_ = touchEvent_;
        LOGE("Touch Info : x = %{public}f, y = %{public}f screenx = %{public}f, screeny = %{public}f", touchEvent_.x,
             touchEvent_.y, touchEvent_.screenX, touchEvent_.screenY);
        for (uint32_t i = 0; i < touchEvent_.numPoints; i++)
        {
            LOGE("Touch Info : dots[%{public}d] id %{public}d x = %{public}f, y = %{public}f", i,
                 touchEvent_.touchPoints[i].id, touchEvent_.touchPoints[i].x, touchEvent_.touchPoints[i].y);
            LOGE("Touch Info : screenx = %{public}f, screeny = %{public}f", touchEvent_.touchPoints[i].screenX,
                 touchEvent_.touchPoints[i].screenY);
            OH_NativeXComponent_TouchPointToolType toolType;
            float tiltX = 123.0;
            float tiltY = 321.0;
            int32_t ret1;
            int32_t ret2;
            int32_t ret3;
            ret1 = OH_NativeXComponent_GetTouchPointToolType(component, i, &toolType);
            ret2 = OH_NativeXComponent_GetTouchPointTiltX(component, i, &tiltX);
            ret3 = OH_NativeXComponent_GetTouchPointTiltY(component, i, &tiltY);
            toolType_ = toolType;
            tiltX_ = tiltX;
            tiltY_ = tiltY;
            LOGE("Touch Info : [%{public}d] %{public}u, %{public}f, %{public}f", i, toolType, tiltX, tiltY);
        }
    }
    else
    {
        LOGE("Touch fail");
    }
}

void AppNapi::DispatchMouseEvent(OH_NativeXComponent *component, void *window)
{
    int32_t ret = OH_NativeXComponent_GetMouseEvent(component, window, &mouseEvent_);
    LOGE("Mouse Info DispatchMouseEvent");
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        testMouseEvent_ = mouseEvent_;
        LOGE("Mouse Info : x = %{public}f, y = %{public}f screenx = %{public}f, screeny = %{public}f", mouseEvent_.x,
             mouseEvent_.y, mouseEvent_.screenX, mouseEvent_.screenY);
        LOGE("Mouse Info : action = %{public}d, button = %{public}d", mouseEvent_.action, mouseEvent_.button);
    }
    else
    {
        LOGE("Mouse Info fail");
    }
}

napi_value AppNapi::Animate(napi_env env, napi_callback_info info)
{
    if (openglDraw != nullptr)
    {
        openglDraw->Animate();
        openglDraw->Update();
    }
    return nullptr;
}

napi_value AppNapi::Quit(napi_env env, napi_callback_info info)
{
    LOGE("AppNapi -> Quit");
    napi_value exportInstance;
    napi_value thisArg;
    napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    openglDraw->Quit();

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok)
    {
        return nullptr;
    }

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent));
    if (status != napi_ok)
    {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        return nullptr;
    }

    return 0;
}

napi_value AppNapi::GetXComponentId(napi_env env, napi_callback_info info)
{
    napi_value thisArg;
    napi_status status;
    napi_value exportInstance;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));
    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    status = napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent));
    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS)
    {
        return nullptr;
    }

    std::string id(idStr);

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, idStr, id.length(), &output));

    return output;
}

napi_value AppNapi::GetXComponentSize_Height(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponentSize_Height");
    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, xcHeight_, &output));
    LOGE(" GetXComponentSize_Height %{public}d ", xcHeight_);
    return output;
}

napi_value AppNapi::GetXComponentSize_Width(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponentSize_Width");
    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, xcWidth_, &output));
    LOGE(" GetXComponentSize_Width %{public}d ", xcWidth_);
    return output;
}

napi_value AppNapi::GetXComponentOffset_x(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponentOffset_x");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, off_x, &output));
    LOGE("GetXComponentOffset_x : %{public}f", off_x);

    return output;
}

napi_value AppNapi::GetXComponentOffset_y(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponentOffset_y");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, off_y, &output));
    LOGE("GetXComponentOffset_y : %{public}f", off_y);

    return output;
}

napi_value AppNapi::GetXComponentpointtool_tiltx(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponentpointtool_tiltx");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, tiltX_, &output));
    LOGE("GetXComponentpointtool_tiltx : %{public}f", tiltX_);

    return output;
}

napi_value AppNapi::GetXComponentpointtool_tilty(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponentpointtool_tilty");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, tiltY_, &output));
    LOGE("GetXComponentpointtool_tilty : %{public}f", tiltY_);

    return output;
}

napi_value AppNapi::GetXComponentpointtool_type(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponentpointtool_type");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, toolType_, &output));
    LOGE("GetXComponentpointtool_type : %{public}u", toolType_);

    return output;
}

napi_value AppNapi::GetXComponent_TouchEvent(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponent_TouchEvent");

    napi_value surf_x;
    napi_value surf_y;
    napi_value t_type;

    NAPI_CALL(env, napi_create_double(env, testTouchEvent_.x, &(surf_x)));
    NAPI_CALL(env, napi_create_double(env, testTouchEvent_.y, &(surf_y)));
    NAPI_CALL(env, napi_create_uint32(env, testTouchEvent_.type, &(t_type)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_X", surf_x));
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_Y", surf_y));
    NAPI_CALL(env, napi_set_named_property(env, obj, "touchType", t_type));

    return obj;
}

napi_value AppNapi::GetXComponent_MouseEvent(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponent_MouseEvent");

    napi_value surf_x;
    napi_value surf_y;
    napi_value t_button;

    NAPI_CALL(env, napi_create_double(env, testMouseEvent_.x, &(surf_x)));
    NAPI_CALL(env, napi_create_double(env, testMouseEvent_.y, &(surf_y)));
    NAPI_CALL(env, napi_create_uint32(env, testMouseEvent_.button, &(t_button)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_X1", surf_x));    // float x
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_Y1", surf_y));    // float y
    NAPI_CALL(env, napi_set_named_property(env, obj, "mousebutton", t_button)); // int32_t

    return obj;
}

napi_value AppNapi::GetXComponent_RegisterMouseEventCallback(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetXComponent_RegisterMouseEventCallback");

    napi_value callback_;
    NAPI_CALL(env, napi_create_double(env, mousecallback_, &(callback_)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "MouseCallback_", callback_)); // float x

    return obj;
}

napi_value AppNapi::GetShapeIndex(napi_env env, napi_callback_info info)
{
    LOGE("running AppNapi::GetShapeIndex");

    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, shapeIndex_, &output));
    LOGE("GetShapeIndex : %{public}u", shapeIndex_);

    return output;
}

void AppNapi::RegisterXtsFunctions(napi_env env, napi_value exports)
{
    // 同一 exports 对象可能被 Init 与 XComponent 上下文各调用一次，已注册则跳过
    bool registered = false;
    napi_status status = napi_has_named_property(env, exports, "getShapeIndex", &registered);
    if (status != napi_ok || registered)
    {
        return;
    }

    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("Quit", AppNapi::Quit),
        DECLARE_NAPI_FUNCTION("GetXComponentId", AppNapi::GetXComponentId),
        DECLARE_NAPI_FUNCTION("GetXComponentSize_Height", AppNapi::GetXComponentSize_Height),
        DECLARE_NAPI_FUNCTION("GetXComponentSize_Width", AppNapi::GetXComponentSize_Width),
        DECLARE_NAPI_FUNCTION("GetXComponentOffset_x", AppNapi::GetXComponentOffset_x),
        DECLARE_NAPI_FUNCTION("GetXComponentOffset_y", AppNapi::GetXComponentOffset_y),
        DECLARE_NAPI_FUNCTION("GetXComponent_TouchEvent", AppNapi::GetXComponent_TouchEvent),
        DECLARE_NAPI_FUNCTION("GetXComponent_MouseEvent", AppNapi::GetXComponent_MouseEvent),
        DECLARE_NAPI_FUNCTION("GetXComponentpointtool_tilty", AppNapi::GetXComponentpointtool_tilty),
        DECLARE_NAPI_FUNCTION("GetXComponentpointtool_type", AppNapi::GetXComponentpointtool_type),
        DECLARE_NAPI_FUNCTION("GetXComponentpointtool_tiltx", AppNapi::GetXComponentpointtool_tiltx),
        DECLARE_NAPI_FUNCTION("GetXComponent_RegisterMouseEventCallback",
                              AppNapi::GetXComponent_RegisterMouseEventCallback),
        DECLARE_NAPI_FUNCTION("getShapeIndex", AppNapi::GetShapeIndex),
        DECLARE_NAPI_FUNCTION("probeGetXComponentId", AppNapi::ProbeGetXComponentId),
        DECLARE_NAPI_FUNCTION("probeGetXComponentSize", AppNapi::ProbeGetXComponentSize),
        DECLARE_NAPI_FUNCTION("probeGetXComponentOffset", AppNapi::ProbeGetXComponentOffset),
        DECLARE_NAPI_FUNCTION("probeGetTouchPointToolType", AppNapi::ProbeGetTouchPointToolType),
        DECLARE_NAPI_FUNCTION("probeGetTouchPointTiltX", AppNapi::ProbeGetTouchPointTiltX),
        DECLARE_NAPI_FUNCTION("probeGetTouchPointTiltY", AppNapi::ProbeGetTouchPointTiltY),
        DECLARE_NAPI_FUNCTION("probeGetTouchPointWindowX", AppNapi::ProbeGetTouchPointWindowX),
        DECLARE_NAPI_FUNCTION("probeGetTouchPointWindowY", AppNapi::ProbeGetTouchPointWindowY),
        DECLARE_NAPI_FUNCTION("probeGetTouchPointDisplayX", AppNapi::ProbeGetTouchPointDisplayX),
        DECLARE_NAPI_FUNCTION("probeGetTouchPointDisplayY", AppNapi::ProbeGetTouchPointDisplayY),
        DECLARE_NAPI_FUNCTION("probeGetTouchEventSourceType", AppNapi::ProbeGetTouchEventSourceType),
        DECLARE_NAPI_FUNCTION("probeGetHistoricalPoints", AppNapi::ProbeGetHistoricalPoints),
        DECLARE_NAPI_FUNCTION("probeGetKeyEvent", AppNapi::ProbeGetKeyEvent),
        DECLARE_NAPI_FUNCTION("probeGetExtraMouseEventInfo", AppNapi::ProbeGetExtraMouseEventInfo),
        DECLARE_NAPI_FUNCTION("probeGetMouseEventModifierKeyStates", AppNapi::ProbeGetMouseEventModifierKeyStates),
        DECLARE_NAPI_FUNCTION("probeGetNativeAccessibilityProvider", AppNapi::ProbeGetNativeAccessibilityProvider),
        DECLARE_NAPI_FUNCTION("probeSetExpectedFrameRateRange", AppNapi::ProbeSetExpectedFrameRateRange),
        DECLARE_NAPI_FUNCTION("probeSetNeedSoftKeyboard", AppNapi::ProbeSetNeedSoftKeyboard),
        DECLARE_NAPI_FUNCTION("probeRegisterCallback", AppNapi::ProbeRegisterCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterMouseEventCallback", AppNapi::ProbeRegisterMouseEventCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterFocusEventCallback", AppNapi::ProbeRegisterFocusEventCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterBlurEventCallback", AppNapi::ProbeRegisterBlurEventCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterKeyEventCallback", AppNapi::ProbeRegisterKeyEventCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterKeyEventCallbackWithResult",
                              AppNapi::ProbeRegisterKeyEventCallbackWithResult),
        DECLARE_NAPI_FUNCTION("probeRegisterOnFrameCallback", AppNapi::ProbeRegisterOnFrameCallback),
        DECLARE_NAPI_FUNCTION("probeUnregisterOnFrameCallback", AppNapi::ProbeUnregisterOnFrameCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterSurfaceShowCallback", AppNapi::ProbeRegisterSurfaceShowCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterSurfaceHideCallback", AppNapi::ProbeRegisterSurfaceHideCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterOnTouchInterceptCallback", AppNapi::ProbeRegisterOnTouchInterceptCallback),
        DECLARE_NAPI_FUNCTION("probeRegisterUIInputEventCallback", AppNapi::ProbeRegisterUIInputEventCallback),
        DECLARE_NAPI_FUNCTION("probeGetKeyEventAction", AppNapi::ProbeGetKeyEventAction),
        DECLARE_NAPI_FUNCTION("probeGetKeyEventCode", AppNapi::ProbeGetKeyEventCode),
        DECLARE_NAPI_FUNCTION("probeRenderSolidPixel", AppNapi::ProbeRenderSolidPixel),
    };
    status = napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    if (status != napi_ok)
    {
        LOGE("RegisterXtsFunctions failed %{public}d", status);
    }
}

OH_NativeXComponent *AppNapi::GetActiveComponent(void)
{
    for (auto &entry : instance_)
    {
        if (entry.second != nullptr && entry.second->component_ != nullptr)
        {
            return entry.second->component_;
        }
    }
    return nullptr;
}

namespace
{
    const int32_t PROBE_BAD_PARAMETER = OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;

    // 帧率区间 probe 的三个入参：最小值、最大值、期望值，下标与 napi 实参顺序一致
    constexpr size_t ARG_RATE_MIN = 0;
    constexpr size_t ARG_RATE_MAX = 1;
    constexpr size_t ARG_RATE_EXPECTED = 2;
    constexpr size_t RATE_RANGE_ARG_COUNT = 3;

    // 像素探针的四个通道参数：顺序固定为 R、G、B、A
    constexpr size_t ARG_RED = 0;
    constexpr size_t ARG_GREEN = 1;
    constexpr size_t ARG_BLUE = 2;
    constexpr size_t ARG_ALPHA = 3;
    constexpr size_t PIXEL_ARG_COUNT = 4;
    constexpr size_t PROBE_CHANNEL_COUNT = 4;
    // 颜色通道上限，入参超出 0~255 即判为非法
    constexpr int32_t PROBE_CHANNEL_MAX = 255;
    // 缺省青色，便于未传参时也能回读到非零像素
    constexpr int32_t PROBE_DEFAULT_CHANNELS[PROBE_CHANNEL_COUNT] = {
        0, PROBE_CHANNEL_MAX, PROBE_CHANNEL_MAX, PROBE_CHANNEL_MAX};

    // 修饰键位图为 uint64，低半区与高半区分别用两个 double 回显
    constexpr uint32_t MODIFIER_LOW_BITS_MASK = 0xFFFFFFFFU;
    constexpr int32_t MODIFIER_HIGH_BITS_SHIFT = 32;

    // 统一的 probe 返回对象：code 为原生接口返回码，value/aux 为数值型输出，字段固定以便测试断言
    napi_value MakeProbeResult(napi_env env, int32_t code, double value, double aux)
    {
        napi_value obj = nullptr;
        napi_value codeValue = nullptr;
        napi_value valueValue = nullptr;
        napi_value auxValue = nullptr;
        napi_create_int32(env, code, &codeValue);
        napi_create_double(env, value, &valueValue);
        napi_create_double(env, aux, &auxValue);
        napi_create_object(env, &obj);
        napi_set_named_property(env, obj, "code", codeValue);
        napi_set_named_property(env, obj, "value", valueValue);
        napi_set_named_property(env, obj, "aux", auxValue);
        return obj;
    }

    int32_t GetInt32Arg(napi_env env, napi_callback_info info, int32_t defaultValue)
    {
        size_t argc = 1;
        napi_value args[1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        int32_t value = defaultValue;
        if (argc >= 1 && args[0] != nullptr)
        {
            napi_get_value_int32(env, args[0], &value);
        }
        return value;
    }

    // 需要 window 的 probe 先确认上下文就绪，缺失时直接走 BAD_PARAMETER 分支，不触碰原生接口
    bool ProbeWindowReady(const OH_NativeXComponent *component)
    {
        return component != nullptr && AppNapi::window_ != nullptr;
    }

    // 逐个通道读取像素探针入参；缺省回填青色，任一通道越界或类型不符时返回 false
    bool ReadPixelChannels(napi_env env, napi_callback_info info, int32_t outChannels[PROBE_CHANNEL_COUNT])
    {
        for (size_t i = 0; i < PROBE_CHANNEL_COUNT; i++)
        {
            outChannels[i] = PROBE_DEFAULT_CHANNELS[i];
        }
        size_t argc = PIXEL_ARG_COUNT;
        napi_value args[PIXEL_ARG_COUNT] = {nullptr, nullptr, nullptr, nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        bool channelValid = true;
        for (size_t i = 0; i < PROBE_CHANNEL_COUNT && i < argc; i++)
        {
            if (args[i] == nullptr)
            {
                continue;
            }
            int32_t channel = 0;
            if (napi_get_value_int32(env, args[i], &channel) != napi_ok || channel < 0 ||
                channel > PROBE_CHANNEL_MAX)
            {
                channelValid = false;
                continue;
            }
            outChannels[i] = channel;
        }
        return channelValid;
    }

    // 把样本拆成两个数组属性：pixel 为左下角采样点，corner 为右上角采样点
    void AttachPixelSamples(napi_env env, napi_value result, const uint8_t rgba[PixelProbe::PROBE_RGBA_BYTES])
    {
        napi_value pixel = nullptr;
        napi_value corner = nullptr;
        napi_create_array_with_length(env, PROBE_CHANNEL_COUNT, &pixel);
        napi_create_array_with_length(env, PROBE_CHANNEL_COUNT, &corner);
        for (uint32_t i = 0; i < PROBE_CHANNEL_COUNT; i++)
        {
            napi_value channel = nullptr;
            napi_create_uint32(env, rgba[i], &channel);
            napi_set_element(env, pixel, i, channel);
            napi_value cornerChannel = nullptr;
            napi_create_uint32(env, rgba[PixelProbe::PROBE_CHANNEL_BYTES + i], &cornerChannel);
            napi_set_element(env, corner, i, cornerChannel);
        }
        napi_set_named_property(env, result, "pixel", pixel);
        napi_set_named_property(env, result, "corner", corner);
    }

    void EmptyComponentCallback(OH_NativeXComponent *component, void *window)
    {
        (void)component;
        (void)window;
    }

    void EmptyFrameCallback(OH_NativeXComponent *component, uint64_t timestamp, uint64_t targetTimestamp)
    {
        (void)component;
        (void)timestamp;
        (void)targetTimestamp;
    }

    bool EmptyKeyCallbackWithResult(OH_NativeXComponent *component, void *window)
    {
        (void)component;
        (void)window;
        return false;
    }

    HitTestMode EmptyHitTestCallback(OH_NativeXComponent *component, ArkUI_UIInputEvent *event)
    {
        (void)component;
        (void)event;
        return HTM_DEFAULT;
    }

    void EmptyUIInputCallback(OH_NativeXComponent *component, ArkUI_UIInputEvent *event, ArkUI_UIInputEvent_Type type)
    {
        (void)component;
        (void)event;
        (void)type;
    }
} // namespace

napi_value AppNapi::ProbeGetXComponentId(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    int32_t code = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    std::string idValueStr(idStr);
    napi_value result = MakeProbeResult(env, code, static_cast<double>(idValueStr.size()), static_cast<double>(idSize));
    napi_value idValue = nullptr;
    napi_create_string_utf8(env, idStr, NAPI_AUTO_LENGTH, &idValue);
    napi_set_named_property(env, result, "id", idValue);
    return result;
}

napi_value AppNapi::ProbeGetXComponentSize(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (!ProbeWindowReady(component))
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    uint64_t width = 0;
    uint64_t height = 0;
    int32_t code = OH_NativeXComponent_GetXComponentSize(component, window_, &width, &height);
    return MakeProbeResult(env, code, static_cast<double>(width), static_cast<double>(height));
}

napi_value AppNapi::ProbeGetXComponentOffset(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (!ProbeWindowReady(component))
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    double x = 0;
    double y = 0;
    int32_t code = OH_NativeXComponent_GetXComponentOffset(component, window_, &x, &y);
    return MakeProbeResult(env, code, x, y);
}

napi_value AppNapi::ProbeGetTouchPointToolType(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointIndex = GetInt32Arg(env, info, -1);
    OH_NativeXComponent_TouchPointToolType toolType = OH_NATIVEXCOMPONENT_TOOL_TYPE_UNKNOWN;
    int32_t code = OH_NativeXComponent_GetTouchPointToolType(component, static_cast<uint32_t>(pointIndex), &toolType);
    return MakeProbeResult(env, code, static_cast<double>(toolType), static_cast<double>(pointIndex));
}

napi_value AppNapi::ProbeGetTouchPointTiltX(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointIndex = GetInt32Arg(env, info, -1);
    float tiltX = 0;
    int32_t code = OH_NativeXComponent_GetTouchPointTiltX(component, static_cast<uint32_t>(pointIndex), &tiltX);
    return MakeProbeResult(env, code, static_cast<double>(tiltX), static_cast<double>(pointIndex));
}

napi_value AppNapi::ProbeGetTouchPointTiltY(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointIndex = GetInt32Arg(env, info, -1);
    float tiltY = 0;
    int32_t code = OH_NativeXComponent_GetTouchPointTiltY(component, static_cast<uint32_t>(pointIndex), &tiltY);
    return MakeProbeResult(env, code, static_cast<double>(tiltY), static_cast<double>(pointIndex));
}

napi_value AppNapi::ProbeGetTouchPointWindowX(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointIndex = GetInt32Arg(env, info, -1);
    float windowX = 0;
    int32_t code = OH_NativeXComponent_GetTouchPointWindowX(component, static_cast<uint32_t>(pointIndex), &windowX);
    return MakeProbeResult(env, code, static_cast<double>(windowX), static_cast<double>(pointIndex));
}

napi_value AppNapi::ProbeGetTouchPointWindowY(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointIndex = GetInt32Arg(env, info, -1);
    float windowY = 0;
    int32_t code = OH_NativeXComponent_GetTouchPointWindowY(component, static_cast<uint32_t>(pointIndex), &windowY);
    return MakeProbeResult(env, code, static_cast<double>(windowY), static_cast<double>(pointIndex));
}

napi_value AppNapi::ProbeGetTouchPointDisplayX(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointIndex = GetInt32Arg(env, info, -1);
    float displayX = 0;
    int32_t code = OH_NativeXComponent_GetTouchPointDisplayX(component, static_cast<uint32_t>(pointIndex), &displayX);
    return MakeProbeResult(env, code, static_cast<double>(displayX), static_cast<double>(pointIndex));
}

napi_value AppNapi::ProbeGetTouchPointDisplayY(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointIndex = GetInt32Arg(env, info, -1);
    float displayY = 0;
    int32_t code = OH_NativeXComponent_GetTouchPointDisplayY(component, static_cast<uint32_t>(pointIndex), &displayY);
    return MakeProbeResult(env, code, static_cast<double>(displayY), static_cast<double>(pointIndex));
}

napi_value AppNapi::ProbeGetTouchEventSourceType(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t pointId = GetInt32Arg(env, info, -1);
    OH_NativeXComponent_EventSourceType sourceType = OH_NATIVEXCOMPONENT_SOURCE_TYPE_UNKNOWN;
    int32_t code = OH_NativeXComponent_GetTouchEventSourceType(component, pointId, &sourceType);
    return MakeProbeResult(env, code, static_cast<double>(sourceType), static_cast<double>(pointId));
}

napi_value AppNapi::ProbeGetHistoricalPoints(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (!ProbeWindowReady(component))
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t size = 0;
    OH_NativeXComponent_HistoricalPoint *points = nullptr;
    int32_t code = OH_NativeXComponent_GetHistoricalPoints(component, window_, &size, &points);
    return MakeProbeResult(env, code, static_cast<double>(size), points == nullptr ? 0 : 1);
}

napi_value AppNapi::ProbeGetKeyEvent(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    int32_t code = OH_NativeXComponent_GetKeyEvent(component, &keyEvent);
    return MakeProbeResult(env, code, keyEvent == nullptr ? 0 : 1, 0);
}

napi_value AppNapi::ProbeGetExtraMouseEventInfo(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    OH_NativeXComponent_ExtraMouseEventInfo *extraInfo = nullptr;
    int32_t code = OH_NativeXComponent_GetExtraMouseEventInfo(component, &extraInfo);
    return MakeProbeResult(env, code, extraInfo == nullptr ? 0 : 1, 0);
}

napi_value AppNapi::ProbeGetMouseEventModifierKeyStates(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    OH_NativeXComponent_ExtraMouseEventInfo *extraInfo = nullptr;
    int32_t code = OH_NativeXComponent_GetExtraMouseEventInfo(component, &extraInfo);
    if (code != OH_NATIVEXCOMPONENT_RESULT_SUCCESS || extraInfo == nullptr)
    {
        return MakeProbeResult(env, code, 0, 0);
    }
    uint64_t keys = 0;
    int32_t keyCode = OH_NativeXComponent_GetMouseEventModifierKeyStates(extraInfo, &keys);
    return MakeProbeResult(env, keyCode, static_cast<double>(keys & MODIFIER_LOW_BITS_MASK),
                           static_cast<double>(keys >> MODIFIER_HIGH_BITS_SHIFT));
}

napi_value AppNapi::ProbeGetNativeAccessibilityProvider(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    ArkUI_AccessibilityProvider *provider = nullptr;
    int32_t code = OH_NativeXComponent_GetNativeAccessibilityProvider(component, &provider);
    return MakeProbeResult(env, code, provider == nullptr ? 0 : 1, 0);
}

napi_value AppNapi::ProbeSetExpectedFrameRateRange(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    size_t argc = RATE_RANGE_ARG_COUNT;
    napi_value args[RATE_RANGE_ARG_COUNT] = {nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t min = 0;
    int32_t max = 0;
    int32_t expected = 0;
    if (argc > ARG_RATE_MIN && args[ARG_RATE_MIN] != nullptr)
    {
        napi_get_value_int32(env, args[ARG_RATE_MIN], &min);
    }
    if (argc > ARG_RATE_MAX && args[ARG_RATE_MAX] != nullptr)
    {
        napi_get_value_int32(env, args[ARG_RATE_MAX], &max);
    }
    if (argc > ARG_RATE_EXPECTED && args[ARG_RATE_EXPECTED] != nullptr)
    {
        napi_get_value_int32(env, args[ARG_RATE_EXPECTED], &expected);
    }
    OH_NativeXComponent_ExpectedRateRange range = {min, max, expected};
    int32_t code = OH_NativeXComponent_SetExpectedFrameRateRange(component, &range);
    return MakeProbeResult(env, code, static_cast<double>(min), static_cast<double>(max));
}

napi_value AppNapi::ProbeSetNeedSoftKeyboard(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t need = GetInt32Arg(env, info, 0);
    bool needSoftKeyboard = need != 0;
    int32_t code = OH_NativeXComponent_SetNeedSoftKeyboard(component, needSoftKeyboard);
    return MakeProbeResult(env, code, static_cast<double>(need), 0);
}

napi_value AppNapi::ProbeRegisterCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterCallback(component, &AppNapi::callback_);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterMouseEventCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterMouseEventCallback(component, &AppNapi::mouseEventcallback_);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterFocusEventCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterFocusEventCallback(component, EmptyComponentCallback);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterBlurEventCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterBlurEventCallback(component, EmptyComponentCallback);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterKeyEventCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterKeyEventCallback(component, EmptyComponentCallback);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterKeyEventCallbackWithResult(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterKeyEventCallbackWithResult(component, EmptyKeyCallbackWithResult);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterOnFrameCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterOnFrameCallback(component, EmptyFrameCallback);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeUnregisterOnFrameCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_UnregisterOnFrameCallback(component);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterSurfaceShowCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterSurfaceShowCallback(component, EmptyComponentCallback);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterSurfaceHideCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterSurfaceHideCallback(component, EmptyComponentCallback);
    return MakeProbeResult(env, code, 0, 0);
}

napi_value AppNapi::ProbeRegisterOnTouchInterceptCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t code = OH_NativeXComponent_RegisterOnTouchInterceptCallback(component, EmptyHitTestCallback);
    return MakeProbeResult(env, code, static_cast<double>(HTM_DEFAULT), 0);
}

napi_value AppNapi::ProbeRegisterUIInputEventCallback(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    int32_t inputType = GetInt32Arg(env, info, static_cast<int32_t>(ARKUI_UIINPUTEVENT_TYPE_TOUCH));
    int32_t code = OH_NativeXComponent_RegisterUIInputEventCallback(
        component, EmptyUIInputCallback, static_cast<ArkUI_UIInputEvent_Type>(inputType));
    return MakeProbeResult(env, code, static_cast<double>(inputType), 0);
}

napi_value AppNapi::ProbeGetKeyEventAction(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    int32_t code = OH_NativeXComponent_GetKeyEvent(component, &keyEvent);
    if (code != OH_NATIVEXCOMPONENT_RESULT_SUCCESS || keyEvent == nullptr)
    {
        return MakeProbeResult(env, code, 0, 0);
    }
    OH_NativeXComponent_KeyAction action = OH_NATIVEXCOMPONENT_KEY_ACTION_UNKNOWN;
    int32_t actionCode = OH_NativeXComponent_GetKeyEventAction(keyEvent, &action);
    return MakeProbeResult(env, actionCode, static_cast<double>(action), 0);
}

napi_value AppNapi::ProbeGetKeyEventCode(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent *component = GetActiveComponent();
    if (component == nullptr)
    {
        return MakeProbeResult(env, PROBE_BAD_PARAMETER, 0, 0);
    }
    OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
    int32_t code = OH_NativeXComponent_GetKeyEvent(component, &keyEvent);
    if (code != OH_NATIVEXCOMPONENT_RESULT_SUCCESS || keyEvent == nullptr)
    {
        return MakeProbeResult(env, code, 0, 0);
    }
    OH_NativeXComponent_KeyCode keyCode = static_cast<OH_NativeXComponent_KeyCode>(0);
    int32_t keyCodeResult = OH_NativeXComponent_GetKeyEventCode(keyEvent, &keyCode);
    return MakeProbeResult(env, keyCodeResult, static_cast<double>(keyCode), 0);
}

napi_value AppNapi::ProbeRenderSolidPixel(napi_env env, napi_callback_info info)
{
    int32_t channels[PROBE_CHANNEL_COUNT] = {};
    const bool channelsValid = ReadPixelChannels(env, info, channels);

    uint8_t rgba[PixelProbe::PROBE_RGBA_BYTES] = {};
    int32_t code = PROBE_BAD_PARAMETER;
    if (channelsValid)
    {
        code = PixelProbe::RenderSolidAndRead(static_cast<uint8_t>(channels[ARG_RED]),
                                              static_cast<uint8_t>(channels[ARG_GREEN]),
                                              static_cast<uint8_t>(channels[ARG_BLUE]),
                                              static_cast<uint8_t>(channels[ARG_ALPHA]), rgba);
    }

    napi_value result = MakeProbeResult(env, code, static_cast<double>(rgba[ARG_RED]),
                                        static_cast<double>(PixelProbe::GetProbeSurfaceSize()));
    AttachPixelSamples(env, result, rgba);
    return result;
}

napi_value AppNapi::Export(napi_env env, napi_value exports)
{
    LOGE("AppNapi::Export");
    RegisterXtsFunctions(env, exports);
    return exports;
}

napi_value AppNapi::ChangeShape(napi_env env, napi_callback_info info)
{
    LOGE("Update");
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t value1;
    napi_get_value_uint32(env, args[0], &value1);
    shapeIndex_ = value1;
    if (openglDraw != nullptr)
    {
        openglDraw->ChangeShape(value1);
        openglDraw->Update();
    }
    return nullptr;
}