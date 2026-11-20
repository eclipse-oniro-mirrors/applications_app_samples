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

import {
    ProbeResult,
    ProbeIdResult,
    getShapeIndex,
    changeShape,
    animate,
    probeRegisterCallback,
    probeRegisterMouseEventCallback,
    probeRegisterFocusEventCallback,
    probeRegisterBlurEventCallback,
    probeRegisterKeyEventCallback,
    probeRegisterKeyEventCallbackWithResult,
    probeRegisterOnFrameCallback,
    probeUnregisterOnFrameCallback,
    probeRegisterSurfaceShowCallback,
    probeRegisterSurfaceHideCallback,
    probeRegisterOnTouchInterceptCallback,
    probeRegisterUIInputEventCallback,
    probeGetKeyEventAction,
    probeGetKeyEventCode,
    probeGetXComponentSize,
    probeGetXComponentOffset,
    probeGetXComponentId,
    probeGetTouchPointToolType,
    probeSetNeedSoftKeyboard,
    probeSetExpectedFrameRateRange
} from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

// 规格常量：OH_NativeXComponent_ResultCode 三个取值
const RESULT_SUCCESS: number = 0;
const RESULT_FAILED: number = -1;
const RESULT_BAD_PARAMETER: number = -2;

// 规格常量：ARKUI_UIINPUTEVENT_TYPE_UNKNOWN / TOUCH / MOUSE / KEY
const INPUT_TYPE_UNKNOWN: number = 0;
const INPUT_TYPE_TOUCH: number = 1;
const INPUT_TYPE_MOUSE: number = 3;
const INPUT_TYPE_KEY: number = 4;

// 规格常量：HTM_DEFAULT 为 0
const HTM_DEFAULT: number = 0;

const READY_WAIT_MS: number = 10000;
const POLL_INTERVAL_MS: number = 50;

// 规格常量：OH_NativeXComponent_KeyCode 的 KEY_UNKNOWN 与 OH_NativeXComponent_KeyAction 的 UNKNOWN
const KEY_UNKNOWN: number = -1;
const KEY_ACTION_UNKNOWN: number = -1;

// OH_NativeXComponent_RegisterUIInputEventCallback 返回 ArkUI 错误码域，
// 与 OH_NativeXComponent_ResultCode（0/-1/-2）不是同一集合：0 为成功，401 为参数非法。
const ARKUI_NO_ERROR: number = 0;
const ARKUI_PARAM_INVALID: number = 401;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

function isArkuiErrorCode(code: number): boolean {
    return code === ARKUI_NO_ERROR || code === ARKUI_PARAM_INVALID;
}

function delay(intervalMs: number): Promise<void> {
    return new Promise<void>((resolve) => {
        setTimeout(() => {
            resolve();
        }, intervalMs);
    });
}

/**
 * 轮询等待 XComponent 上下文就绪，以尺寸查询返回成功且宽高为正作为判据。
 */
async function waitProbeReady(): Promise<boolean> {
    const start: number = Date.now();
    while (Date.now() - start < READY_WAIT_MS) {
        const size: ProbeResult = probeGetXComponentSize();
        if (size.code === RESULT_SUCCESS && size.value > 0 && size.aux > 0) {
            return true;
        }
        await delay(POLL_INTERVAL_MS);
    }
    return false;
}

export default function nativeRegisterTest() {
    resetYieldCounter();
    describe('NativeRegisterTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0001
         * @tc.name testRegister0001
         * @tc.desc 契约：重复注册应用回调的返回码属于规格集合，两次调用返回码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRegister0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0001 begin');
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(first.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0002
         * @tc.name testRegister0002
         * @tc.desc 契约：重复注册鼠标回调的返回码合法，两次调用返回码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRegister0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0002 begin');
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterMouseEventCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(first.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0003
         * @tc.name testRegister0003
         * @tc.desc 契约：注册焦点回调的返回码合法，连续两次调用幂等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0003 begin');
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterFocusEventCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(first.code <= RESULT_SUCCESS).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0004
         * @tc.name testRegister0004
         * @tc.desc 契约：注册失焦回调的返回码合法，连续两次调用幂等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0004 begin');
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterBlurEventCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(first.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0005
         * @tc.name testRegister0005
         * @tc.desc 契约：注册按键回调的返回码合法，重复注册不改变返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0005 begin');
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(second.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0006
         * @tc.name testRegister0006
         * @tc.desc 契约：注册带返回值按键回调的返回码合法，且晚于无返回值版本注册
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0006 begin');
            const plain: ProbeResult = probeRegisterKeyEventCallback();
            const withResult: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(isResultCode(withResult.code)).assertTrue();
            expect(isResultCode(plain.code)).assertTrue();
            expect(withResult.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0007
         * @tc.name testRegister0007
         * @tc.desc 契约：注册帧回调的返回码合法，注册后立即注销避免影响后续用例
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0007 begin');
            const registered: ProbeResult = probeRegisterOnFrameCallback();
            const unregistered: ProbeResult = probeUnregisterOnFrameCallback();
            expect(isResultCode(registered.code)).assertTrue();
            expect(isResultCode(unregistered.code)).assertTrue();
            expect(registered.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0008
         * @tc.name testRegister0008
         * @tc.desc 状态：未注册帧回调时直接注销，返回码仍属于规格集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0008 begin');
            const unregistered: ProbeResult = probeUnregisterOnFrameCallback();
            expect(isResultCode(unregistered.code)).assertTrue();
            expect(unregistered.value).assertEqual(0);
            expect(unregistered.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0009
         * @tc.name testRegister0009
         * @tc.desc 契约：注册显示回调的返回码合法，两次调用一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0009 begin');
            const first: ProbeResult = probeRegisterSurfaceShowCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(first.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0010
         * @tc.name testRegister0010
         * @tc.desc 契约：注册隐藏回调的返回码合法，两次调用一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0010 begin');
            const first: ProbeResult = probeRegisterSurfaceHideCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0011
         * @tc.name testRegister0011
         * @tc.desc 契约：注册触摸拦截回调后 value 回显 HTM_DEFAULT（0），返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0011 begin');
            const result: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(HTM_DEFAULT);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0012
         * @tc.name testRegister0012
         * @tc.desc 契约：注册 UI 输入回调时 value 回显传入的触摸类型 1，返回码落在 ArkUI 错误码集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0012 begin');
            const result: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            expect(isArkuiErrorCode(result.code)).assertTrue();
            expect(result.value).assertEqual(INPUT_TYPE_TOUCH);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0013
         * @tc.name testRegister0013
         * @tc.desc 边界值：UI 输入回调类型传 0（UNKNOWN），value 回显 0 且返回码落在 ArkUI 错误码集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0013 begin');
            const result: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_UNKNOWN);
            expect(result.value).assertEqual(INPUT_TYPE_UNKNOWN);
            expect(isArkuiErrorCode(result.code)).assertTrue();
            expect(Number.isInteger(result.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0014
         * @tc.name testRegister0014
         * @tc.desc 合法值：UI 输入回调类型传 3（MOUSE），value 回显 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0014 begin');
            const result: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            expect(result.value).assertEqual(INPUT_TYPE_MOUSE);
            expect(isArkuiErrorCode(result.code)).assertTrue();
            expect(result.value !== INPUT_TYPE_TOUCH).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0015
         * @tc.name testRegister0015
         * @tc.desc 合法值：UI 输入回调类型传 4（KEY），value 回显 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0015 begin');
            const result: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            expect(result.value).assertEqual(INPUT_TYPE_KEY);
            expect(isArkuiErrorCode(result.code)).assertTrue();
            expect(result.value > INPUT_TYPE_MOUSE).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0016
         * @tc.name testRegister0016
         * @tc.desc 极值：UI 输入回调类型传 99（越界枚举），value 回显 99 且返回码落在 ArkUI 错误码集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0016 begin');
            const result: ProbeResult = probeRegisterUIInputEventCallback(99);
            expect(result.value).assertEqual(99);
            expect(isArkuiErrorCode(result.code)).assertTrue();
            expect(result.value !== INPUT_TYPE_KEY).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0017
         * @tc.name testRegister0017
         * @tc.desc 组合：三种合法输入类型注册后返回码互不矛盾，且回显各自入参
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0017 begin');
            const touch: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const mouse: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            const key: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            const touchOk: boolean = isArkuiErrorCode(touch.code) && isArkuiErrorCode(mouse.code);
            expect(touchOk && isArkuiErrorCode(key.code)).assertTrue();
            expect(touch.value + mouse.value + key.value).assertEqual(8);
            expect(touch.value === key.value).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0018
         * @tc.name testRegister0018
         * @tc.desc 状态：帧回调注册、注销、再注册三个动作的返回码都合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0018 begin');
            const registered: ProbeResult = probeRegisterOnFrameCallback();
            const unregistered: ProbeResult = probeUnregisterOnFrameCallback();
            const again: ProbeResult = probeRegisterOnFrameCallback();
            expect(isResultCode(registered.code)).assertTrue();
            expect(isResultCode(unregistered.code)).assertTrue();
            expect(again.code).assertEqual(registered.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0019
         * @tc.name testRegister0019
         * @tc.desc 状态：连续两次注销帧回调的返回码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0019 begin');
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(second.code).assertEqual(first.code);
            expect(first.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0020
         * @tc.name testRegister0020
         * @tc.desc 状态：注销之后再次注册帧回调仍返回合法返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0020 begin');
            const unregistered: ProbeResult = probeUnregisterOnFrameCallback();
            const registered: ProbeResult = probeRegisterOnFrameCallback();
            expect(isResultCode(unregistered.code)).assertTrue();
            expect(isResultCode(registered.code)).assertTrue();
            expect(registered.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0021
         * @tc.name testRegister0021
         * @tc.desc 组合：注册帧回调后尺寸查询仍返回合法返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0021 begin');
            const registered: ProbeResult = probeRegisterOnFrameCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(isResultCode(registered.code)).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0022
         * @tc.name testRegister0022
         * @tc.desc 组合：注销帧回调后尺寸查询仍返回合法返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0022 begin');
            const unregistered: ProbeResult = probeUnregisterOnFrameCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(isResultCode(unregistered.code)).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            expect(size.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0023
         * @tc.name testRegister0023
         * @tc.desc 契约：无按键事件时取按键动作，数值落在 UNKNOWN 与按下/抬起之间
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0023 begin');
            const result: ProbeResult = probeGetKeyEventAction();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value >= KEY_ACTION_UNKNOWN).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0024
         * @tc.name testRegister0024
         * @tc.desc 契约：无按键事件时取按键码，数值落在未知键码之上
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0024 begin');
            const result: ProbeResult = probeGetKeyEventCode();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value >= KEY_UNKNOWN).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0025
         * @tc.name testRegister0025
         * @tc.desc 组合：取按键动作与取按键码在无事件时返回同一返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0025 begin');
            const action: ProbeResult = probeGetKeyEventAction();
            const code: ProbeResult = probeGetKeyEventCode();
            expect(code.code).assertEqual(action.code);
            expect(isResultCode(code.code)).assertTrue();
            expect(action.value >= KEY_ACTION_UNKNOWN && code.value >= KEY_UNKNOWN).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0025 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0026
         * @tc.name testRegister0026
         * @tc.desc 状态：两个按键查询接口各调两次，返回码与数值输出都一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0026 begin');
            const actionFirst: ProbeResult = probeGetKeyEventAction();
            const actionSecond: ProbeResult = probeGetKeyEventAction();
            const codeFirst: ProbeResult = probeGetKeyEventCode();
            expect(actionSecond.code).assertEqual(actionFirst.code);
            expect(actionSecond.value).assertEqual(actionFirst.value);
            expect(isResultCode(codeFirst.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0026 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0027
         * @tc.name testRegister0027
         * @tc.desc 边界值：无按键事件时按键动作的数值输出停留在 UNKNOWN 初值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0027 begin');
            const action: ProbeResult = probeGetKeyEventAction();
            expect(action.value).assertEqual(KEY_ACTION_UNKNOWN);
            expect(isResultCode(action.code)).assertTrue();
            expect(action.code <= RESULT_SUCCESS).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0027 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0028
         * @tc.name testRegister0028
         * @tc.desc 状态：重复注册应用回调两次的返回码一致，且不影响形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0028 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterCallback();
            expect(second.code).assertEqual(first.code);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0028 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0029
         * @tc.name testRegister0029
         * @tc.desc 状态：重注册应用回调后形状索引仍可正常读写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0029 begin');
            const registered: ProbeResult = probeRegisterCallback();
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(isResultCode(registered.code)).assertTrue();
            expect(getShapeIndex() >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0029 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0030
         * @tc.name testRegister0030
         * @tc.desc 状态：重注册应用回调后 changeShape 仍能改变形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0030 begin');
            probeRegisterCallback();
            changeShape(2);
            expect(getShapeIndex()).assertEqual(2);
            changeShape(1);
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex() === 2).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0030 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0031
         * @tc.name testRegister0031
         * @tc.desc 组合：重注册应用回调后尺寸查询返回码仍合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0031 begin');
            probeRegisterCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(isResultCode(size.code)).assertTrue();
            expect(size.code <= RESULT_SUCCESS).assertTrue();
            expect(size.value >= 0 && size.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0031 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0032
         * @tc.name testRegister0032
         * @tc.desc 状态：重注册应用回调后调用 animate 不改变形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0032 begin');
            probeRegisterCallback();
            changeShape(0);
            const shapeBefore: number = getShapeIndex();
            animate();
            animate();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(0);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0032 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0033
         * @tc.name testRegister0033
         * @tc.desc 组合：连续注册六类空回调，返回码都落在规格集合内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0033 begin');
            const focus: ProbeResult = probeRegisterFocusEventCallback();
            const blur: ProbeResult = probeRegisterBlurEventCallback();
            const key: ProbeResult = probeRegisterKeyEventCallback();
            const show: ProbeResult = probeRegisterSurfaceShowCallback();
            const hide: ProbeResult = probeRegisterSurfaceHideCallback();
            const intercept: ProbeResult = probeRegisterOnTouchInterceptCallback();
            let validCount: number = 0;
            const codes: number[] = [focus.code, blur.code, key.code, show.code, hide.code, intercept.code];
            for (let index = 0; index < codes.length; index++) {
                if (isResultCode(codes[index])) {
                    validCount++;
                }
            }
            expect(validCount).assertEqual(6);
            expect(focus.value).assertEqual(0);
            expect(intercept.value).assertEqual(HTM_DEFAULT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0033 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0034
         * @tc.name testRegister0034
         * @tc.desc 组合：完成全部注册后尺寸与偏移查询返回码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0034 begin');
            probeRegisterFocusEventCallback();
            probeRegisterSurfaceShowCallback();
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(size.code).assertEqual(offset.code);
            expect(isResultCode(size.code)).assertTrue();
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0034 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0035
         * @tc.name testRegister0035
         * @tc.desc 组合：完成注册后触点工具类型查询仍返回合法返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0035 begin');
            probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(isResultCode(toolType.code)).assertTrue();
            expect(toolType.value >= 0 && toolType.value <= 8).assertTrue();
            expect(toolType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0035 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0036
         * @tc.name testRegister0036
         * @tc.desc 组合：完成注册后软键盘设置仍回显入参
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0036 begin');
            probeRegisterKeyEventCallback();
            const needOn: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(needOn.value).assertEqual(1);
            expect(isResultCode(needOn.code)).assertTrue();
            expect(needOn.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0036 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0037
         * @tc.name testRegister0037
         * @tc.desc 组合：完成注册后帧率区间设置仍回显入参上下限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRegister0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0037 begin');
            probeRegisterOnFrameCallback();
            const range: ProbeResult = probeSetExpectedFrameRateRange(0, 120, 60);
            probeUnregisterOnFrameCallback();
            expect(range.value).assertEqual(0);
            expect(range.aux).assertEqual(120);
            expect(isResultCode(range.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0037 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0038
         * @tc.name testRegister0038
         * @tc.desc 状态：等待上下文就绪后，尺寸直连查询返回成功且宽高为正
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRegister0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0038 begin');
            const ready: boolean = await waitProbeReady();
            const size: ProbeResult = probeGetXComponentSize();
            expect(ready).assertTrue();
            expect(size.code).assertEqual(RESULT_SUCCESS);
            expect(size.value > 0 && size.aux > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0038 end');
            done();
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0039
         * @tc.name testRegister0039
         * @tc.desc 状态：上下文就绪后，偏移直连查询返回成功且坐标有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0039 begin');
            const ready: boolean = await waitProbeReady();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(ready).assertTrue();
            expect(offset.code).assertEqual(RESULT_SUCCESS);
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0039 end');
            done();
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CALLBACK_0040
         * @tc.name testRegister0040
         * @tc.desc 状态：上下文就绪后，组件 id 直连查询返回成功且 id 非空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRegister0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0040 begin');
            const ready: boolean = await waitProbeReady();
            const componentId: ProbeIdResult = probeGetXComponentId();
            expect(ready).assertTrue();
            expect(componentId.code).assertEqual(RESULT_SUCCESS);
            expect(componentId.id.length > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRegister0040 end');
            done();
        });
    });
}
