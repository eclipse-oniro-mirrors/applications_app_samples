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

/**
 * 驱动一帧绘制：取当前形状的下一帧动画并刷新绘制区。
 */
export function animate(): void;

/**
 * 按索引切换绘制形状，0 为立方体，其余为矩形。
 * @param shapeIndex 形状索引，经 napi_get_value_uint32 转为 uint32。
 */
export function changeShape(shapeIndex: number): void;

/**
 * 回读 changeShape 最近一次收到的 shapeIndex。
 */
export function getShapeIndex(): number;

/**
 * 回读 OH_NativeXComponent_GetXComponentSize 缓存的绘制区宽度，真机单位为 px。
 */
export function GetXComponentSize_Width(): number;

/**
 * 回读 OH_NativeXComponent_GetXComponentSize 缓存的绘制区高度，真机单位为 px。
 */
export function GetXComponentSize_Height(): number;

/**
 * 回读 OH_NativeXComponent_GetXComponentOffset 缓存的 x 坐标，真机单位为 px，当前实现恒返 0。
 */
export function GetXComponentOffset_x(): number;

/**
 * 回读 OH_NativeXComponent_GetXComponentOffset 缓存的 y 坐标，真机单位为 px，当前实现恒返 0。
 */
export function GetXComponentOffset_y(): number;

/**
 * 取生命周期回调容器。type 为 0 时返回 onCreate/onShow/onHide/onDestroy，
 * 为 1 时返回 onPageShow/onPageHide，其它值返回空对象。
 * @param type 生命周期类型，按 int64 比较
 */
export function GetContext(type: number): object;

/**
 * probe 接口的统一返回对象。
 * code 为原生接口返回码：0 成功、-1 执行失败、-2 参数错误；
 * value 与 aux 为数值型输出，含义见各接口注释。
 */
export interface ProbeResult {
    code: number;
    value: number;
    aux: number;
}

/**
 * 带组件 id 字符串的 probe 返回。
 */
export interface ProbeIdResult extends ProbeResult {
    id: string;
}

/**
 * 直连 OH_NativeXComponent_GetXComponentId，value 为 id 长度，aux 为回填后的 idSize。
 */
export function probeGetXComponentId(): ProbeIdResult;

/**
 * 直连 OH_NativeXComponent_GetXComponentSize，value 为宽、aux 为高，真机单位为 px。
 */
export function probeGetXComponentSize(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetXComponentOffset，value 为 x、aux 为 y，真机单位为 px，当前实现恒返 0。
 */
export function probeGetXComponentOffset(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchPointToolType，value 为工具类型，aux 为入参 pointIndex。
 * @param pointIndex 触点索引，越界时由原生接口判错
 */
export function probeGetTouchPointToolType(pointIndex: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchPointTiltX，value 为倾角，aux 为入参 pointIndex。
 */
export function probeGetTouchPointTiltX(pointIndex: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchPointTiltY，value 为倾角，aux 为入参 pointIndex。
 */
export function probeGetTouchPointTiltY(pointIndex: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchPointWindowX，value 为窗口坐标，aux 为入参 pointIndex。
 */
export function probeGetTouchPointWindowX(pointIndex: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchPointWindowY，value 为窗口坐标，aux 为入参 pointIndex。
 */
export function probeGetTouchPointWindowY(pointIndex: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchPointDisplayX，value 为屏幕坐标，aux 为入参 pointIndex。
 */
export function probeGetTouchPointDisplayX(pointIndex: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchPointDisplayY，value 为屏幕坐标，aux 为入参 pointIndex。
 */
export function probeGetTouchPointDisplayY(pointIndex: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetTouchEventSourceType，value 为来源类型，aux 为入参 pointId。
 */
export function probeGetTouchEventSourceType(pointId: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetHistoricalPoints，value 为历史点数量，aux 为点数组是否为空。
 */
export function probeGetHistoricalPoints(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetKeyEvent，value 为事件指针是否为空，aux 固定 0。
 */
export function probeGetKeyEvent(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_GetExtraMouseEventInfo，value 为扩展信息指针是否为空。
 */
export function probeGetExtraMouseEventInfo(): ProbeResult;

/**
 * 先取 OH_NativeXComponent_GetExtraMouseEventInfo，再取修饰键状态；
 * value 为低 32 位，aux 为高 32 位。
 */
export function probeGetMouseEventModifierKeyStates(): ProbeResult;

/**
 * 直连 provider 查询接口，value 为 provider 是否为空。
 */
export function probeGetNativeAccessibilityProvider(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_SetExpectedFrameRateRange，value/aux 回显入参 min/max。
 * @param min 期望帧率下限，帧每秒
 * @param max 期望帧率上限，帧每秒
 * @param expected 期望帧率，帧每秒
 */
export function probeSetExpectedFrameRateRange(min: number, max: number, expected: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_SetNeedSoftKeyboard，value 回显入参。
 */
export function probeSetNeedSoftKeyboard(need: number): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterCallback，重复注册应用回调。
 */
export function probeRegisterCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterMouseEventCallback，重复注册鼠标回调。
 */
export function probeRegisterMouseEventCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterFocusEventCallback，注册空焦点回调。
 */
export function probeRegisterFocusEventCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterBlurEventCallback，注册空失焦回调。
 */
export function probeRegisterBlurEventCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterKeyEventCallback，注册空按键回调。
 */
export function probeRegisterKeyEventCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterKeyEventCallbackWithResult，回调恒返回 false。
 */
export function probeRegisterKeyEventCallbackWithResult(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterOnFrameCallback，注册空帧回调。
 */
export function probeRegisterOnFrameCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_UnregisterOnFrameCallback。
 */
export function probeUnregisterOnFrameCallback(): ProbeResult;

/**
 * 直连显示回调注册接口，value 固定 0。
 */
export function probeRegisterSurfaceShowCallback(): ProbeResult;

/**
 * 直连隐藏回调注册接口，value 固定 0。
 */
export function probeRegisterSurfaceHideCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterOnTouchInterceptCallback，回调恒返回 HTM_DEFAULT（0）。
 */
export function probeRegisterOnTouchInterceptCallback(): ProbeResult;

/**
 * 直连 OH_NativeXComponent_RegisterUIInputEventCallback，value 回显传入事件类型。
 * @param inputType 事件类型，1 为触摸、3 为鼠标、4 为按键
 */
export function probeRegisterUIInputEventCallback(inputType: number): ProbeResult;

/**
 * 先取 OH_NativeXComponent_GetKeyEvent，再取按键动作；无事件时返回取事件的返回码。
 */
export function probeGetKeyEventAction(): ProbeResult;

/**
 * 先取 OH_NativeXComponent_GetKeyEvent，再取按键码；无事件时返回取事件的返回码。
 */
export function probeGetKeyEventCode(): ProbeResult;

/**
 * 像素回读结果：pixel 为左下角采样点 RGBA，corner 为右上角采样点 RGBA，
 * 每通道取值 0~255。
 */
export interface PixelProbeResult extends ProbeResult {
    pixel: number[];
    corner: number[];
}

/**
 * 用独立 EGL 上下文将 4×4 pbuffer 清成指定颜色并回读像素，
 * 不复用 XComponent 渲染线程的窗口。
 * 返回码 0 成功、-1 EGL 或 GL 失败、-2 入参越界；value 为左下角红通道，aux 为 pbuffer 边长。
 * @param red 0~255 红通道
 * @param green 0~255 绿通道
 * @param blue 0~255 蓝通道
 * @param alpha 0~255 透明通道
 */
export function probeRenderSolidPixel(red: number, green: number, blue: number, alpha: number): PixelProbeResult;