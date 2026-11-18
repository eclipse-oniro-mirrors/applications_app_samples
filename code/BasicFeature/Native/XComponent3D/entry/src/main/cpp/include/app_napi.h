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

#ifndef APP_NAPI_H
#define APP_NAPI_H

#include <string>
#include <unordered_map>

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <napi/native_api.h>
#include "opengl_draw.h"

#define CIRCUMFERENCE_DEGREE 360

class AppNapi
{
public:
    explicit AppNapi(std::string &id);
    static AppNapi *GetInstance(std::string &id);
    static OH_NativeXComponent_Callback *GetNXComponentCallback();
    static OH_NativeXComponent_MouseEvent_Callback *GetNXComponentMouseEventCallback();
    void SetNativeXComponent(OH_NativeXComponent *component);

public:
    // NAPI interface
    napi_value Export(napi_env env, napi_value exports);
    // 把 xts 回读函数无条件注册到模块导出对象，使其不依赖 XComponent 上下文
    static void RegisterXtsFunctions(napi_env env, napi_value exports);
    // 取当前已绑定的 XComponent 实例，供 probe 接口直连原生接口使用
    static OH_NativeXComponent *GetActiveComponent(void);

    // Exposed to JS developers by NAPI
    static napi_value Animate(napi_env env, napi_callback_info info);
    static napi_value ChangeShape(napi_env env, napi_callback_info info);
    static napi_value Quit(napi_env env, napi_callback_info info);

    // xts interfaces
    static napi_value GetXComponentId(napi_env env, napi_callback_info info);
    static napi_value GetXComponentSize_Height(napi_env env, napi_callback_info info);
    static napi_value GetXComponentSize_Width(napi_env env, napi_callback_info info);
    static napi_value GetXComponentOffset_x(napi_env env, napi_callback_info info);
    static napi_value GetXComponentOffset_y(napi_env env, napi_callback_info info);
    static napi_value GetXComponent_TouchEvent(napi_env env, napi_callback_info info);
    static napi_value GetXComponent_MouseEvent(napi_env env, napi_callback_info info);
    static napi_value GetXComponentpointtool_tiltx(napi_env env, napi_callback_info info);
    static napi_value GetXComponentpointtool_tilty(napi_env env, napi_callback_info info);
    static napi_value GetXComponentpointtool_type(napi_env env, napi_callback_info info);
    static napi_value GetXComponent_RegisterMouseEventCallback(napi_env env, napi_callback_info info);
    static napi_value GetShapeIndex(napi_env env, napi_callback_info info);

    // xts probe: 直连原生查询接口，返回 { code, value, aux }，供测试验证返回码与输出范围
    static napi_value ProbeGetXComponentId(napi_env env, napi_callback_info info);
    static napi_value ProbeGetXComponentSize(napi_env env, napi_callback_info info);
    static napi_value ProbeGetXComponentOffset(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchPointToolType(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchPointTiltX(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchPointTiltY(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchPointWindowX(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchPointWindowY(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchPointDisplayX(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchPointDisplayY(napi_env env, napi_callback_info info);
    static napi_value ProbeGetTouchEventSourceType(napi_env env, napi_callback_info info);
    static napi_value ProbeGetHistoricalPoints(napi_env env, napi_callback_info info);
    static napi_value ProbeGetKeyEvent(napi_env env, napi_callback_info info);
    static napi_value ProbeGetExtraMouseEventInfo(napi_env env, napi_callback_info info);
    static napi_value ProbeGetMouseEventModifierKeyStates(napi_env env, napi_callback_info info);
    static napi_value ProbeGetNativeAccessibilityProvider(napi_env env, napi_callback_info info);
    static napi_value ProbeSetExpectedFrameRateRange(napi_env env, napi_callback_info info);
    static napi_value ProbeSetNeedSoftKeyboard(napi_env env, napi_callback_info info);

    // xts probe: 注册类接口，返回 { code, value, aux }，value 回显入参或输出值
    static napi_value ProbeRegisterCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterMouseEventCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterFocusEventCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterBlurEventCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterKeyEventCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterKeyEventCallbackWithResult(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterOnFrameCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeUnregisterOnFrameCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterSurfaceShowCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterSurfaceHideCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterOnTouchInterceptCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeRegisterUIInputEventCallback(napi_env env, napi_callback_info info);
    static napi_value ProbeGetKeyEventAction(napi_env env, napi_callback_info info);
    static napi_value ProbeGetKeyEventCode(napi_env env, napi_callback_info info);

    // xts probe: 独立 EGL 上下文渲染并与 glReadPixels 回读，返回 { code, value, aux, pixel, corner }
    static napi_value ProbeRenderSolidPixel(napi_env env, napi_callback_info info);

    // Callback, called by ACE XComponent
    void OnSurfaceCreated(OH_NativeXComponent *component, void *window);
    void OnSurfaceChanged(OH_NativeXComponent *component, void *window);
    void OnSurfaceDestroyed(OH_NativeXComponent *component, void *window);
    void DispatchTouchEvent(OH_NativeXComponent *component, void *window);
    void DispatchMouseEvent(OH_NativeXComponent *component, void *window);
    OpenglDraw *GetOpenglDraw(void);

public:
    static std::unordered_map<std::string, AppNapi *> instance_;
    static OH_NativeXComponent_Callback callback_;
    static uint32_t isCreated_;
    static uint32_t xcHeight_;
    static uint32_t xcWidth_;
    static uint32_t toolType_;
    static float tiltX_;
    static float tiltY_;
    static uint32_t mousecallback_;
    static double off_x;
    static double off_y;
    static uint32_t touchType;
    static uint32_t shapeIndex_;
    static OH_NativeXComponent_TouchEvent testTouchEvent_;
    static OH_NativeXComponent_MouseEvent testMouseEvent_;
    static OH_NativeXComponent_MouseEvent_Callback mouseEventcallback_;

    OH_NativeXComponent *component_;
    // 绘制区生命周期内有效的窗口句柄，Destroyed 后置空
    static void *window_;
    std::string id_;
    uint64_t width_;
    uint64_t height_;

    float angleX_ = 30.0;
    float angleY_ = 45.0;
    double x_;
    double y_;
    OH_NativeXComponent_TouchEvent touchEvent_;
    OH_NativeXComponent_MouseEvent mouseEvent_;
};

#endif // APP_NAPI_H
