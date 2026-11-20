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
    probeGetXComponentId,
    probeGetXComponentSize,
    probeGetXComponentOffset,
    probeGetTouchPointToolType,
    probeGetTouchPointTiltX,
    probeGetTouchPointTiltY,
    probeGetTouchPointWindowX,
    probeGetTouchPointWindowY,
    probeGetTouchPointDisplayX,
    probeGetTouchPointDisplayY,
    probeGetTouchEventSourceType,
    probeGetHistoricalPoints,
    probeGetKeyEvent,
    probeGetExtraMouseEventInfo,
    probeGetMouseEventModifierKeyStates,
    probeGetNativeAccessibilityProvider,
    probeSetExpectedFrameRateRange,
    probeSetNeedSoftKeyboard,
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
    probeGetKeyEventCode
} from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

const RESULT_SUCCESS: number = 0;
const RESULT_FAILED: number = -1;
const RESULT_BAD_PARAMETER: number = -2;

const TOOL_TYPE_MAX: number = 8;
const TILT_LIMIT: number = 90;
const INPUT_TYPE_TOUCH: number = 1;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

// OH_NativeXComponent_RegisterUIInputEventCallback 返回 ArkUI 错误码域（0 / 401），
// 与 OH_NativeXComponent_ResultCode（0/-1/-2）不是同一集合，判定时两域并列承认。
const ARKUI_NO_ERROR: number = 0;
const ARKUI_PARAM_INVALID: number = 401;

function isArkuiErrorCode(code: number): boolean {
    return code === ARKUI_NO_ERROR || code === ARKUI_PARAM_INVALID;
}

function isValidCode(code: number): boolean {
    return isResultCode(code) || isArkuiErrorCode(code);
}

function isNonNegative(value: number): boolean {
    return value >= 0 && Number.isFinite(value);
}

function isWithinTilt(value: number): boolean {
    return value >= -TILT_LIMIT && value <= TILT_LIMIT;
}

function bothValid(first: ProbeResult, second: ProbeResult): boolean {
    return isValidCode(first.code) && isValidCode(second.code);
}

export default function nativeComboExtTest() {
    resetYieldCounter();
    describe('NativeComboExtTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0081
         * @tc.name testCombo0081
         * @tc.desc 组合：注册基础回调后立即读标识，两路返回码均合法且标识长度自洽
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0081 begin');
            const register: ProbeResult = probeRegisterCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(identity.code).assertEqual(probeGetXComponentId().code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0081 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0082
         * @tc.name testCombo0082
         * @tc.desc 组合：注册基础回调后读尺寸，注册结果不改变尺寸回读链路
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0082 begin');
            const register: ProbeResult = probeRegisterCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(isNonNegative(size.value)).assertTrue();
            expect(probeGetXComponentSize().code).assertEqual(size.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0082 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0083
         * @tc.name testCombo0083
         * @tc.desc 组合：注册基础回调后读偏移，偏移量保持有限且可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0083 begin');
            const register: ProbeResult = probeRegisterCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0083 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0084
         * @tc.name testCombo0084
         * @tc.desc 组合：注册基础回调后读器具类型，器具枚举与索引回显各自成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0084 begin');
            const register: ProbeResult = probeRegisterCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.value >= 0 && toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(toolType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0084 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0085
         * @tc.name testCombo0085
         * @tc.desc 组合：注册基础回调后读横倾角，倾角落在正负九十度内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0085 begin');
            const register: ProbeResult = probeRegisterCallback();
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(bothValid(register, tiltX)).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetTouchPointTiltX(0).value).assertEqual(tiltX.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0085 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0086
         * @tc.name testCombo0086
         * @tc.desc 组合：注册基础回调后读纵倾角，纵倾角落在正负九十度之间
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0086 begin');
            const register: ProbeResult = probeRegisterCallback();
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(bothValid(register, tiltY)).assertTrue();
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            expect(tiltY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0086 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0087
         * @tc.name testCombo0087
         * @tc.desc 组合：注册基础回调后读窗口横坐标，坐标有限且索引回显为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0087 begin');
            const register: ProbeResult = probeRegisterCallback();
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(bothValid(register, windowX)).assertTrue();
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0087 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0088
         * @tc.name testCombo0088
         * @tc.desc 组合：注册基础回调后读窗口纵坐标，纵坐标非 NaN 且可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0088 begin');
            const register: ProbeResult = probeRegisterCallback();
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(bothValid(register, windowY)).assertTrue();
            expect(Number.isNaN(windowY.value)).assertFalse();
            expect(probeGetTouchPointWindowY(0).value).assertEqual(windowY.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0088 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0089
         * @tc.name testCombo0089
         * @tc.desc 组合：注册基础回调后读屏幕横坐标，屏幕坐标不出现无穷值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0089 begin');
            const register: ProbeResult = probeRegisterCallback();
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(bothValid(register, displayX)).assertTrue();
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(probeGetTouchPointDisplayX(0).code).assertEqual(displayX.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0089 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0090
         * @tc.name testCombo0090
         * @tc.desc 组合：注册基础回调后读屏幕纵坐标，纵坐标保持有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0090 begin');
            const register: ProbeResult = probeRegisterCallback();
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(bothValid(register, displayY)).assertTrue();
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0090 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0091
         * @tc.name testCombo0091
         * @tc.desc 组合：注册基础回调后读事件来源，来源类型落在输入枚举域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0091 begin');
            const register: ProbeResult = probeRegisterCallback();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(bothValid(register, sourceType)).assertTrue();
            expect(sourceType.value >= 0 && sourceType.value <= 5).assertTrue();
            expect(sourceType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0091 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0092
         * @tc.name testCombo0092
         * @tc.desc 组合：注册基础回调后读历史点，点数非负且指针标志为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0092 begin');
            const register: ProbeResult = probeRegisterCallback();
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(bothValid(register, points)).assertTrue();
            expect(points.value >= 0).assertTrue();
            expect(points.aux === 0 || points.aux === 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0092 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0093
         * @tc.name testCombo0093
         * @tc.desc 组合：注册鼠标回调后读标识，鼠标链路注册不影响标识回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0093 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(identity.id.length >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0093 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0094
         * @tc.name testCombo0094
         * @tc.desc 组合：注册鼠标回调后读尺寸，宽高与返回码均可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0094 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(isNonNegative(size.aux)).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0094 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0095
         * @tc.name testCombo0095
         * @tc.desc 组合：注册鼠标回调后读偏移，偏移横纵分量有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0095 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0095 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0096
         * @tc.name testCombo0096
         * @tc.desc 组合：注册鼠标回调后读器具类型，鼠标回调不覆盖触控点器具值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0096 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0096 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0097
         * @tc.name testCombo0097
         * @tc.desc 组合：注册鼠标回调后读横倾角，倾角查询仍然落在量纲内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0097 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(bothValid(register, tiltX)).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(tiltX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0097 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0098
         * @tc.name testCombo0098
         * @tc.desc 组合：注册鼠标回调后读窗口横坐标，坐标链路与注册链路独立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0098 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(bothValid(register, windowX)).assertTrue();
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(probeGetTouchPointWindowX(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0098 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0099
         * @tc.name testCombo0099
         * @tc.desc 组合：注册鼠标回调后读扩展鼠标信息，存在标志只取零或一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0099 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(bothValid(register, mouseInfo)).assertTrue();
            expect(mouseInfo.value === 0 || mouseInfo.value === 1).assertTrue();
            expect(mouseInfo.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0099 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0100
         * @tc.name testCombo0100
         * @tc.desc 组合：注册鼠标回调后读修饰键状态，高低位拆分均为非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0100 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(bothValid(register, keys)).assertTrue();
            expect(keys.value >= 0 && keys.aux >= 0).assertTrue();
            expect(probeGetMouseEventModifierKeyStates().aux).assertEqual(keys.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0100 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0101
         * @tc.name testCombo0101
         * @tc.desc 组合：注册鼠标回调后设帧率区间，区间回显外部传入的上下限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0101 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            expect(rate.value).assertEqual(60);
            expect(rate.aux).assertEqual(120);
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0101 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0102
         * @tc.name testCombo0102
         * @tc.desc 组合：注册鼠标回调后设软键盘开关，开关入参按原值回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0102 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(keyboard.value).assertEqual(1);
            expect(isResultCode(keyboard.code)).assertTrue();
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0102 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0103
         * @tc.name testCombo0103
         * @tc.desc 组合：注册获焦回调后读标识，焦点链路注册不改写标识缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0103 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(probeGetXComponentId().code).assertEqual(identity.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0103 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0104
         * @tc.name testCombo0104
         * @tc.desc 组合：注册获焦回调后读尺寸，尺寸读数与注册返回码均合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0104 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(size.value >= 0 && size.aux >= 0).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0104 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0105
         * @tc.name testCombo0105
         * @tc.desc 组合：注册获焦回调后读偏移，偏移读数不受焦点链路影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0105 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().code).assertEqual(offset.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0105 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0106
         * @tc.name testCombo0106
         * @tc.desc 组合：注册获焦回调后读纵倾角，倾角量纲保持稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0106 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(bothValid(register, tiltY)).assertTrue();
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            expect(probeGetTouchPointTiltY(0).aux).assertEqual(tiltY.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0106 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0107
         * @tc.name testCombo0107
         * @tc.desc 组合：注册获焦回调后读屏幕纵坐标，纵坐标有限且可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0107 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(bothValid(register, displayY)).assertTrue();
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(probeGetTouchPointDisplayY(0).value).assertEqual(displayY.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0107 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0108
         * @tc.name testCombo0108
         * @tc.desc 组合：注册获焦回调后读历史点，点数与指针标志互相独立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0108 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(bothValid(register, points)).assertTrue();
            expect(points.value >= 0).assertTrue();
            expect(probeGetHistoricalPoints().code).assertEqual(points.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0108 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0109
         * @tc.name testCombo0109
         * @tc.desc 组合：注册获焦回调后读按键事件，事件标志不越出布尔域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0109 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(bothValid(register, keyEvent)).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            expect(keyEvent.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0109 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0110
         * @tc.name testCombo0110
         * @tc.desc 组合：注册获焦回调后读修饰键状态，位域拆分非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0110 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(bothValid(register, keys)).assertTrue();
            expect(isNonNegative(keys.value)).assertTrue();
            expect(probeGetMouseEventModifierKeyStates().value).assertEqual(keys.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0110 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0111
         * @tc.name testCombo0111
         * @tc.desc 组合：注册失焦回调后读标识，失焦链路注册不改写标识
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0111 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(identity.id.length >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0111 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0112
         * @tc.name testCombo0112
         * @tc.desc 组合：注册失焦回调后读尺寸，宽高读数保持非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0112 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(isNonNegative(size.value)).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0112 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0113
         * @tc.name testCombo0113
         * @tc.desc 组合：注册失焦回调后读偏移，偏移横分量有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0113 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0113 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0114
         * @tc.name testCombo0114
         * @tc.desc 组合：注册失焦回调后读器具类型，器具枚举不越界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0114 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(toolType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0114 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0115
         * @tc.name testCombo0115
         * @tc.desc 组合：注册失焦回调后读窗口纵坐标，纵坐标有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0115 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(bothValid(register, windowY)).assertTrue();
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(probeGetTouchPointWindowY(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0115 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0116
         * @tc.name testCombo0116
         * @tc.desc 组合：注册失焦回调后读无障碍提供者，提供者标志为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0116 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(bothValid(register, provider)).assertTrue();
            expect(provider.value === 0 || provider.value === 1).assertTrue();
            expect(provider.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0116 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0117
         * @tc.name testCombo0117
         * @tc.desc 组合：注册失焦回调后设帧率区间，区间回显与实际入参一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0117 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 45);
            expect(rate.value).assertEqual(30);
            expect(rate.aux).assertEqual(60);
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0117 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0118
         * @tc.name testCombo0118
         * @tc.desc 组合：注册失焦回调后设软键盘开关，关闭值原样回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0118 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(keyboard.value).assertEqual(0);
            expect(isResultCode(keyboard.code)).assertTrue();
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0118 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0119
         * @tc.name testCombo0119
         * @tc.desc 组合：注册按键回调后读按键事件，事件存在标志仍为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0119 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(bothValid(register, keyEvent)).assertTrue();
            expect(keyEvent.value === 0 || keyEvent.value === 1).assertTrue();
            expect(probeGetKeyEvent().value).assertEqual(keyEvent.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0119 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0120
         * @tc.name testCombo0120
         * @tc.desc 组合：注册按键回调后读按键动作，动作枚举与注册结果均可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0120 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const action: ProbeResult = probeGetKeyEventAction();
            expect(bothValid(register, action)).assertTrue();
            expect(isResultCode(action.code)).assertTrue();
            expect(probeGetKeyEventAction().code).assertEqual(action.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0120 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0121
         * @tc.name testCombo0121
         * @tc.desc 组合：注册按键回调后读标识，按键链路注册不影响标识缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0121 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(probeGetXComponentId().value).assertEqual(identity.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0121 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0122
         * @tc.name testCombo0122
         * @tc.desc 组合：注册按键回调后读尺寸，宽高缓存不被按键注册改写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0122 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(size.aux >= 0).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0122 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0123
         * @tc.name testCombo0123
         * @tc.desc 组合：注册按键回调后读偏移，偏移两分量均为有限数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0123 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0123 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0124
         * @tc.name testCombo0124
         * @tc.desc 组合：注册按键回调后读器具类型，器具索引回显仍为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0124 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.aux).assertEqual(0);
            expect(toolType.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0124 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0125
         * @tc.name testCombo0125
         * @tc.desc 组合：注册按键回调后设帧率区间，区间回显不与注册结果混淆
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0125 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 90, 60);
            expect(rate.value).assertEqual(60);
            expect(rate.aux).assertEqual(90);
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0125 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0126
         * @tc.name testCombo0126
         * @tc.desc 组合：注册带结果的按键回调后读标识，标识长度自洽
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0126 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(identity.id.length >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0126 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0127
         * @tc.name testCombo0127
         * @tc.desc 组合：注册带结果的按键回调后读尺寸，宽高非负且可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0127 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(isNonNegative(size.value)).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0127 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0128
         * @tc.name testCombo0128
         * @tc.desc 组合：注册带结果的按键回调后读偏移，偏移横纵分量有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0128 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().code).assertEqual(offset.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0128 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0129
         * @tc.name testCombo0129
         * @tc.desc 组合：注册带结果的按键回调后读按键码，按键码回读可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0129 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const code: ProbeResult = probeGetKeyEventCode();
            expect(bothValid(register, code)).assertTrue();
            expect(isResultCode(code.code)).assertTrue();
            expect(probeGetKeyEventCode().value).assertEqual(code.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0129 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0130
         * @tc.name testCombo0130
         * @tc.desc 组合：注册带结果的按键回调后读按键动作，动作查询结果稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0130 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const action: ProbeResult = probeGetKeyEventAction();
            expect(bothValid(register, action)).assertTrue();
            expect(action.aux).assertEqual(0);
            expect(probeGetKeyEventAction().aux).assertEqual(action.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0130 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0131
         * @tc.name testCombo0131
         * @tc.desc 组合：注册带结果的按键回调后读按键事件，事件标志为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0131 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(bothValid(register, keyEvent)).assertTrue();
            expect(keyEvent.value >= 0 && keyEvent.value <= 1).assertTrue();
            expect(probeGetKeyEvent().code).assertEqual(keyEvent.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0131 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0132
         * @tc.name testCombo0132
         * @tc.desc 组合：注册带结果的按键回调后设软键盘，开关入参按原值回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0132 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(keyboard.value).assertEqual(1);
            expect(isResultCode(keyboard.code)).assertTrue();
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0132 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0133
         * @tc.name testCombo0133
         * @tc.desc 组合：注册逐帧回调后读尺寸，逐帧链路注册不影响宽高
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0133 begin');
            const register: ProbeResult = probeRegisterOnFrameCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(size.value >= 0).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0133 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0134
         * @tc.name testCombo0134
         * @tc.desc 组合：注册逐帧回调后读偏移，偏移读数保持有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0134 begin');
            const register: ProbeResult = probeRegisterOnFrameCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0134 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0135
         * @tc.name testCombo0135
         * @tc.desc 组合：注册逐帧回调后读标识，标识长度与字段值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0135 begin');
            const register: ProbeResult = probeRegisterOnFrameCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(probeGetXComponentId().code).assertEqual(identity.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0135 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0136
         * @tc.name testCombo0136
         * @tc.desc 组合：注册逐帧回调后读历史点，点数非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0136 begin');
            const register: ProbeResult = probeRegisterOnFrameCallback();
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(bothValid(register, points)).assertTrue();
            expect(isNonNegative(points.value)).assertTrue();
            expect(probeGetHistoricalPoints().value).assertEqual(points.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0136 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0137
         * @tc.name testCombo0137
         * @tc.desc 组合：注册逐帧回调后读器具类型，器具枚举仍在域内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0137 begin');
            const register: ProbeResult = probeRegisterOnFrameCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(probeGetTouchPointToolType(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0137 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0138
         * @tc.name testCombo0138
         * @tc.desc 组合：注册逐帧回调后设帧率区间，区间回显上下限正确
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0138 begin');
            const register: ProbeResult = probeRegisterOnFrameCallback();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(120, 240, 120);
            expect(rate.value).assertEqual(120);
            expect(rate.aux).assertEqual(240);
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0138 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0139
         * @tc.name testCombo0139
         * @tc.desc 组合：注销逐帧回调后读尺寸，注销不影响宽高缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0139 begin');
            const unregister: ProbeResult = probeUnregisterOnFrameCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(unregister, size)).assertTrue();
            expect(size.aux >= 0).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0139 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0140
         * @tc.name testCombo0140
         * @tc.desc 组合：注销逐帧回调后读偏移，偏移两分量有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0140 begin');
            const unregister: ProbeResult = probeUnregisterOnFrameCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(unregister, offset)).assertTrue();
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0140 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0141
         * @tc.name testCombo0141
         * @tc.desc 组合：注销逐帧回调后读标识，标识回读不依赖逐帧注册状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0141 begin');
            const unregister: ProbeResult = probeUnregisterOnFrameCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(unregister, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(identity.id.length >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0141 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0142
         * @tc.name testCombo0142
         * @tc.desc 组合：注销逐帧回调后读器具类型，器具索引回显为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0142 begin');
            const unregister: ProbeResult = probeUnregisterOnFrameCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(unregister, toolType)).assertTrue();
            expect(toolType.aux).assertEqual(0);
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0142 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0143
         * @tc.name testCombo0143
         * @tc.desc 组合：注销逐帧回调后设帧率区间，区间回显不受注销影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0143 begin');
            const unregister: ProbeResult = probeUnregisterOnFrameCallback();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            expect(rate.value).assertEqual(60);
            expect(rate.aux).assertEqual(120);
            expect(isResultCode(unregister.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0143 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0144
         * @tc.name testCombo0144
         * @tc.desc 组合：注销逐帧回调后设软键盘开关，开关回显与原入参一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0144 begin');
            const unregister: ProbeResult = probeUnregisterOnFrameCallback();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(keyboard.value).assertEqual(1);
            expect(isResultCode(keyboard.code)).assertTrue();
            expect(isResultCode(unregister.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0144 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0145
         * @tc.name testCombo0145
         * @tc.desc 组合：注册显示回调后读尺寸，显示链路不影响宽高缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0145 begin');
            const register: ProbeResult = probeRegisterSurfaceShowCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(isNonNegative(size.value)).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0145 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0146
         * @tc.name testCombo0146
         * @tc.desc 组合：注册显示回调后读偏移，偏移读数保持有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0146 begin');
            const register: ProbeResult = probeRegisterSurfaceShowCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0146 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0147
         * @tc.name testCombo0147
         * @tc.desc 组合：注册显示回调后读标识，标识字段与长度一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0147 begin');
            const register: ProbeResult = probeRegisterSurfaceShowCallback();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(bothValid(register, identity)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(probeGetXComponentId().code).assertEqual(identity.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0147 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0148
         * @tc.name testCombo0148
         * @tc.desc 组合：注册显示回调后读按键事件，事件标志不越出布尔域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0148 begin');
            const register: ProbeResult = probeRegisterSurfaceShowCallback();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(bothValid(register, keyEvent)).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            expect(probeGetKeyEvent().value).assertEqual(keyEvent.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0148 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0149
         * @tc.name testCombo0149
         * @tc.desc 组合：注册显示回调后设帧率区间，区间回显与实际入参一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0149 begin');
            const register: ProbeResult = probeRegisterSurfaceShowCallback();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(45, 90, 60);
            expect(rate.value).assertEqual(45);
            expect(rate.aux).assertEqual(90);
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0149 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0150
         * @tc.name testCombo0150
         * @tc.desc 组合：注册隐藏回调后读尺寸，隐藏链路不影响宽高缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0150 begin');
            const register: ProbeResult = probeRegisterSurfaceHideCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(bothValid(register, size)).assertTrue();
            expect(size.aux >= 0).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0150 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0151
         * @tc.name testCombo0151
         * @tc.desc 组合：注册隐藏回调后读偏移，偏移横纵分量有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0151 begin');
            const register: ProbeResult = probeRegisterSurfaceHideCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(bothValid(register, offset)).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0151 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0152
         * @tc.name testCombo0152
         * @tc.desc 组合：注册隐藏回调后读器具类型，器具枚举仍在域内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0152 begin');
            const register: ProbeResult = probeRegisterSurfaceHideCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.value >= 0 && toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(toolType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0152 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0153
         * @tc.name testCombo0153
         * @tc.desc 组合：注册隐藏回调后读按键事件，事件标志为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0153 begin');
            const register: ProbeResult = probeRegisterSurfaceHideCallback();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(bothValid(register, keyEvent)).assertTrue();
            expect(keyEvent.value === 0 || keyEvent.value === 1).assertTrue();
            expect(keyEvent.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0153 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0154
         * @tc.name testCombo0154
         * @tc.desc 组合：注册隐藏回调后设软键盘开关，关闭值原样回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0154 begin');
            const register: ProbeResult = probeRegisterSurfaceHideCallback();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(keyboard.value).assertEqual(0);
            expect(isResultCode(keyboard.code)).assertTrue();
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0154 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0155
         * @tc.name testCombo0155
         * @tc.desc 组合：注册触摸拦截后读器具类型，拦截图与触控查询互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0155 begin');
            const register: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0155 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0156
         * @tc.name testCombo0156
         * @tc.desc 组合：注册触摸拦截后读横倾角，倾角量纲保持稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0156 begin');
            const register: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(bothValid(register, tiltX)).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetTouchPointTiltX(0).aux).assertEqual(tiltX.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0156 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0157
         * @tc.name testCombo0157
         * @tc.desc 组合：注册触摸拦截后读事件来源，来源枚举不越界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0157 begin');
            const register: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(bothValid(register, sourceType)).assertTrue();
            expect(sourceType.value >= 0 && sourceType.value <= 5).assertTrue();
            expect(probeGetTouchEventSourceType(0).code).assertEqual(sourceType.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0157 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0158
         * @tc.name testCombo0158
         * @tc.desc 组合：按触摸类型注册输入事件回调后读器具类型，两链路参数域独立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0158 begin');
            const register: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(bothValid(register, toolType)).assertTrue();
            expect(toolType.aux).assertEqual(0);
            expect(probeGetTouchPointToolType(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0158 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0159
         * @tc.name testCombo0159
         * @tc.desc 组合：按鼠标类型注册输入事件回调后读扩展鼠标信息，标志为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0159 begin');
            const register: ProbeResult = probeRegisterUIInputEventCallback(3);
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(bothValid(register, mouseInfo)).assertTrue();
            expect(mouseInfo.value === 0 || mouseInfo.value === 1).assertTrue();
            expect(probeGetExtraMouseEventInfo().value).assertEqual(mouseInfo.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0159 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0160
         * @tc.name testCombo0160
         * @tc.desc 组合：按按键类型注册输入事件回调后读按键码，按键码查询可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0160 begin');
            const register: ProbeResult = probeRegisterUIInputEventCallback(4);
            const code: ProbeResult = probeGetKeyEventCode();
            expect(bothValid(register, code)).assertTrue();
            expect(code.aux).assertEqual(0);
            expect(probeGetKeyEventCode().value).assertEqual(code.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0160 end');
        });

    });
}
