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
    PixelProbeResult,
    GetContext,
    animate,
    changeShape,
    getShapeIndex,
    probeRenderSolidPixel,
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
const INPUT_TYPE_MOUSE: number = 3;
const INPUT_TYPE_KEY: number = 4;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

// OH_NativeXComponent_RegisterUIInputEventCallback 返回 ArkUI 错误码域（0 / 401），
// 与 OH_NativeXComponent_ResultCode（0/-1/-2）不是同一集合，判定时两域并列承认。
const ARKUI_NO_ERROR: number = 0;
const ARKUI_PARAM_INVALID: number = 401;

// 规格常量：OH_NativeXComponent_KeyCode 的 KEY_UNKNOWN 与 KeyAction 的 UNKNOWN
const KEY_UNKNOWN: number = -1;
const KEY_ACTION_UNKNOWN: number = -1;

function isArkuiErrorCode(code: number): boolean {
    return code === ARKUI_NO_ERROR || code === ARKUI_PARAM_INVALID;
}

function isValidCode(code: number): boolean {
    return isResultCode(code) || isArkuiErrorCode(code);
}

function allValid(results: ProbeResult[]): boolean {
    for (let i = 0; i < results.length; i++) {
        if (!isValidCode(results[i].code)) {
            return false;
        }
    }
    return true;
}

function allSameCode(results: ProbeResult[]): boolean {
    if (results.length === 0) {
        return true;
    }
    const first: number = results[0].code;
    for (let i = 1; i < results.length; i++) {
        if (results[i].code !== first) {
            return false;
        }
    }
    return true;
}

function isWithinTilt(value: number): boolean {
    return value >= -TILT_LIMIT && value <= TILT_LIMIT;
}

export default function nativeComboMatrixTest() {
    resetYieldCounter();
    describe('NativeComboMatrixTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0321
         * @tc.name testCombo0321
         * @tc.desc 三阶：标识到尺寸到偏移，三路返回码同源且几何量各自成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0321 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(identity.value).assertEqual(identity.id.length);
            expect(size.value >= 0).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(allValid([size, offset])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0321 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0322
         * @tc.name testCombo0322
         * @tc.desc 三阶：尺寸到偏移到标识，读取顺序反转后三路仍合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0322 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(size.aux >= 0).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(identity.id.length >= 0).assertTrue();
            expect(allSameCode([size, offset, identity])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0322 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0323
         * @tc.name testCombo0323
         * @tc.desc 三阶：偏移到标识到尺寸，三路输出槽互不覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0323 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const identity: ProbeIdResult = probeGetXComponentId();
            const size: ProbeResult = probeGetXComponentSize();
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(size.value >= 0 && size.aux >= 0).assertTrue();
            expect(allValid([offset, size])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0323 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0324
         * @tc.name testCombo0324
         * @tc.desc 三阶：器具类型到横倾角到纵倾角，同点三子查询索引一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0324 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(toolType.aux).assertEqual(tiltX.aux);
            expect(tiltX.aux).assertEqual(tiltY.aux);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(isWithinTilt(tiltY.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0324 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0325
         * @tc.name testCombo0325
         * @tc.desc 三阶：横倾角到纵倾角到器具类型，倾角查询顺序反转仍一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0325 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(isWithinTilt(tiltX.value) && isWithinTilt(tiltY.value)).assertTrue();
            expect(toolType.value >= 0 && toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(allSameCode([tiltX, tiltY, toolType])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0325 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0326
         * @tc.name testCombo0326
         * @tc.desc 三阶：纵倾角到器具类型到横倾角，三路返回码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0326 begin');
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            expect(toolType.aux).assertEqual(0);
            expect(tiltX.aux).assertEqual(0);
            expect(allValid([tiltY, toolType, tiltX])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0326 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0327
         * @tc.name testCombo0327
         * @tc.desc 三阶：窗口横到窗口纵到屏幕横，三个坐标查询均有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0327 begin');
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(allValid([windowX, windowY, displayX])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0327 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0328
         * @tc.name testCombo0328
         * @tc.desc 三阶：窗口纵到屏幕横到屏幕纵，四坐标系读数不混淆
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0328 begin');
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(allSameCode([windowY, displayX, displayY])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0328 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0329
         * @tc.name testCombo0329
         * @tc.desc 三阶：屏幕横到屏幕纵到窗口横，三类坐标索引回显均为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0329 begin');
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(displayX.aux).assertEqual(0);
            expect(displayY.aux).assertEqual(0);
            expect(windowX.aux).assertEqual(0);
            expect(allValid([displayX, displayY, windowX])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0329 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0330
         * @tc.name testCombo0330
         * @tc.desc 三阶：屏幕纵到窗口横到窗口纵，坐标链路三连后仍合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0330 begin');
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(Number.isNaN(displayY.value)).assertFalse();
            expect(Number.isFinite(windowX.value) && Number.isFinite(windowY.value)).assertTrue();
            expect(allSameCode([displayY, windowX, windowY])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0330 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0331
         * @tc.name testCombo0331
         * @tc.desc 三阶：事件来源到历史点到按键事件，三条事件链路各自落在契约集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0331 begin');
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            const points: ProbeResult = probeGetHistoricalPoints();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(sourceType.value >= 0 && sourceType.value <= 5).assertTrue();
            expect(points.value >= 0).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            expect(allValid([sourceType, points, keyEvent])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0331 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0332
         * @tc.name testCombo0332
         * @tc.desc 三阶：历史点到按键事件到事件来源，事件链路顺序反转仍合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0332 begin');
            const points: ProbeResult = probeGetHistoricalPoints();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(points.aux >= 0).assertTrue();
            expect(keyEvent.value >= 0).assertTrue();
            expect(sourceType.value <= 5).assertTrue();
            expect(isResultCode(points.code)).assertTrue();
            expect(isResultCode(keyEvent.code)).assertTrue();
            expect(isResultCode(sourceType.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0332 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0333
         * @tc.name testCombo0333
         * @tc.desc 三阶：按键事件到事件来源到历史点，三路混合顺序保持稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0333 begin');
            const keyEvent: ProbeResult = probeGetKeyEvent();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(keyEvent.aux).assertEqual(0);
            expect(sourceType.aux).assertEqual(0);
            expect(points.value >= 0).assertTrue();
            expect(allValid([keyEvent, sourceType, points])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0333 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0334
         * @tc.name testCombo0334
         * @tc.desc 三阶：鼠标扩展信息到修饰键到无障碍提供者，三个标志位各自受限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0334 begin');
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(mouseInfo.value <= 1).assertTrue();
            expect(keys.value >= 0).assertTrue();
            expect(provider.value <= 1).assertTrue();
            expect(allValid([mouseInfo, keys, provider])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0334 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0335
         * @tc.name testCombo0335
         * @tc.desc 三阶：修饰键到无障碍提供者到鼠标扩展信息，顺序反转三路仍合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0335 begin');
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(keys.aux >= 0).assertTrue();
            expect(provider.aux).assertEqual(0);
            expect(mouseInfo.aux).assertEqual(0);
            expect(allSameCode([keys, provider, mouseInfo])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0335 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0336
         * @tc.name testCombo0336
         * @tc.desc 三阶：无障碍提供者到鼠标扩展到修饰键，三标志位互不串值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0336 begin');
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(provider.value === 0 || provider.value === 1).assertTrue();
            expect(mouseInfo.value === 0 || mouseInfo.value === 1).assertTrue();
            expect(keys.value >= 0 && keys.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0336 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0337
         * @tc.name testCombo0337
         * @tc.desc 三阶：帧率区间到软键盘到尺寸，设置类与查询类混合三连
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0337 begin');
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            const size: ProbeResult = probeGetXComponentSize();
            expect(rate.value).assertEqual(60);
            expect(keyboard.value).assertEqual(1);
            expect(size.value >= 0).assertTrue();
            expect(allValid([rate, keyboard, size])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0337 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0338
         * @tc.name testCombo0338
         * @tc.desc 三阶：软键盘到帧率区间到偏移，两个设置类设置后偏移仍可读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0338 begin');
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(30, 90, 45);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(keyboard.value).assertEqual(0);
            expect(rate.aux).assertEqual(90);
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(allValid([keyboard, rate, offset])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0338 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0339
         * @tc.name testCombo0339
         * @tc.desc 三阶：按键动作到按键码到按键事件，按键三个子查询同源
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0339 begin');
            const action: ProbeResult = probeGetKeyEventAction();
            const code: ProbeResult = probeGetKeyEventCode();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(action.aux).assertEqual(0);
            expect(code.aux).assertEqual(0);
            expect(keyEvent.value <= 1).assertTrue();
            expect(allSameCode([action, code, keyEvent])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0339 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0340
         * @tc.name testCombo0340
         * @tc.desc 三阶：两级上下文到尺寸，应用与页面上下文键数分别为四和二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0340 begin');
            const app: object = GetContext(0);
            const page: object = GetContext(1);
            const size: ProbeResult = probeGetXComponentSize();
            expect(Object.getOwnPropertyNames(app).length).assertEqual(4);
            expect(Object.getOwnPropertyNames(page).length).assertEqual(2);
            expect(size.value >= 0).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0340 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0341
         * @tc.name testCombo0341
         * @tc.desc 三阶：重绘到形状切换到索引回读，切换值原样回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0341 begin');
            animate();
            changeShape(2);
            const shape: number = getShapeIndex();
            expect(shape).assertEqual(2);
            expect(Number.isInteger(shape)).assertTrue();
            expect(getShapeIndex()).assertEqual(2);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0341 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0342
         * @tc.name testCombo0342
         * @tc.desc 三阶：形状切换到重绘到尺寸，重绘不抹除已写入的形状
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0342 begin');
            changeShape(5);
            animate();
            const size: ProbeResult = probeGetXComponentSize();
            expect(getShapeIndex()).assertEqual(5);
            expect(size.value >= 0).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0342 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0343
         * @tc.name testCombo0343
         * @tc.desc 三阶：索引回读到形状切换到偏移，切换不改写偏移缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0343 begin');
            const before: number = getShapeIndex();
            changeShape(6);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(getShapeIndex()).assertEqual(6);
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(before >= 0).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0343 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0344
         * @tc.name testCombo0344
         * @tc.desc 三阶：注册基础回调到尺寸到标识，注册后两路查询仍合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0344 begin');
            const register: ProbeResult = probeRegisterCallback();
            const size: ProbeResult = probeGetXComponentSize();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(isResultCode(register.code)).assertTrue();
            expect(size.value >= 0).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(allValid([register, size, identity])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0344 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0345
         * @tc.name testCombo0345
         * @tc.desc 三阶：逐帧注册到偏移到器具类型，逐帧链路不影响几何与触控查询
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0345 begin');
            const register: ProbeResult = probeRegisterOnFrameCallback();
            const offset: ProbeResult = probeGetXComponentOffset();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(isResultCode(register.code)).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(toolType.aux).assertEqual(0);
            expect(allSameCode([offset, toolType])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0345 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0346
         * @tc.name testCombo0346
         * @tc.desc 三阶：逐帧注销到横倾角到纵倾角，注销后倾角查询不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0346 begin');
            const unregister: ProbeResult = probeUnregisterOnFrameCallback();
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(isResultCode(unregister.code)).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(isWithinTilt(tiltY.value)).assertTrue();
            expect(tiltX.aux).assertEqual(tiltY.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0346 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0347
         * @tc.name testCombo0347
         * @tc.desc 三阶：显示注册到窗口横到窗口纵，显示链路与坐标查询共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0347 begin');
            const register: ProbeResult = probeRegisterSurfaceShowCallback();
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(isResultCode(register.code)).assertTrue();
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(allSameCode([windowX, windowY])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0347 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0348
         * @tc.name testCombo0348
         * @tc.desc 三阶：隐藏注册到屏幕横到屏幕纵，隐藏链路与屏幕查询共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0348 begin');
            const register: ProbeResult = probeRegisterSurfaceHideCallback();
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(isResultCode(register.code)).assertTrue();
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(allSameCode([displayX, displayY])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0348 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0349
         * @tc.name testCombo0349
         * @tc.desc 三阶：拦截注册到事件来源到历史点，拦截注册不影响事件查询
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0349 begin');
            const register: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(isResultCode(register.code)).assertTrue();
            expect(sourceType.value <= 5).assertTrue();
            expect(points.value >= 0).assertTrue();
            expect(allValid([sourceType, points])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0349 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0350
         * @tc.name testCombo0350
         * @tc.desc 三阶：触摸类输入注册到按键事件到尺寸，两域注册与查询共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0350 begin');
            const register: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            const size: ProbeResult = probeGetXComponentSize();
            expect(isArkuiErrorCode(register.code)).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            expect(size.aux >= 0).assertTrue();
            expect(allValid([register, keyEvent, size])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0350 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0351
         * @tc.name testCombo0351
         * @tc.desc 三阶：鼠标注册到鼠标扩展到修饰键，鼠标域三个接口同源
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0351 begin');
            const register: ProbeResult = probeRegisterMouseEventCallback();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(isResultCode(register.code)).assertTrue();
            expect(mouseInfo.value <= 1).assertTrue();
            expect(keys.value >= 0).assertTrue();
            expect(allValid([mouseInfo, keys])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0351 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0352
         * @tc.name testCombo0352
         * @tc.desc 三阶：获焦注册到提供者到偏移，焦点链路与无障碍查询共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0352 begin');
            const register: ProbeResult = probeRegisterFocusEventCallback();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(isResultCode(register.code)).assertTrue();
            expect(provider.value <= 1).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(allValid([register, provider, offset])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0352 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0353
         * @tc.name testCombo0353
         * @tc.desc 三阶：失焦注册到帧率区间到软键盘，三个设置类接口顺序执行
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0353 begin');
            const register: ProbeResult = probeRegisterBlurEventCallback();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(50, 100, 75);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(isResultCode(register.code)).assertTrue();
            expect(rate.value).assertEqual(50);
            expect(keyboard.value).assertEqual(1);
            expect(allValid([register, rate, keyboard])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0353 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0354
         * @tc.name testCombo0354
         * @tc.desc 三阶：按键注册到动作到按键码，按键域三接口同源回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0354 begin');
            const register: ProbeResult = probeRegisterKeyEventCallback();
            const action: ProbeResult = probeGetKeyEventAction();
            const code: ProbeResult = probeGetKeyEventCode();
            expect(isResultCode(register.code)).assertTrue();
            expect(action.aux).assertEqual(0);
            expect(code.aux).assertEqual(0);
            expect(allSameCode([action, code])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0354 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0355
         * @tc.name testCombo0355
         * @tc.desc 三阶：带结果按键注册到按键码到按键事件，两种注册形态可共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0355 begin');
            const register: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const code: ProbeResult = probeGetKeyEventCode();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(isResultCode(register.code)).assertTrue();
            expect(code.aux).assertEqual(0);
            expect(keyEvent.value <= 1).assertTrue();
            expect(allValid([register, code, keyEvent])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0355 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0356
         * @tc.name testCombo0356
         * @tc.desc 四阶：重绘到尺寸到偏移到标识，四个接口顺序执行全部有效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0356 begin');
            animate();
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(size.value >= 0).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(allSameCode([size, offset, identity])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0356 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0357
         * @tc.name testCombo0357
         * @tc.desc 四阶：形状切换到器具到横倾角到纵倾角，状态与触控四阶混合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0357 begin');
            changeShape(7);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(getShapeIndex()).assertEqual(7);
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(isWithinTilt(tiltX.value) && isWithinTilt(tiltY.value)).assertTrue();
            expect(allSameCode([toolType, tiltX, tiltY])).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0357 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0358
         * @tc.name testCombo0358
         * @tc.desc 四阶：上下文到帧率区间到软键盘到尺寸，配置类与查询类四阶
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0358 begin');
            const context: object = GetContext(0);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            const size: ProbeResult = probeGetXComponentSize();
            expect(Object.getOwnPropertyNames(context).length).assertEqual(4);
            expect(rate.value).assertEqual(60);
            expect(keyboard.value).assertEqual(0);
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0358 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0359
         * @tc.name testCombo0359
         * @tc.desc 四阶：基础鼠标获焦三注册到尺寸，三个不同域注册可共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0359 begin');
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterMouseEventCallback();
            const third: ProbeResult = probeRegisterFocusEventCallback();
            const size: ProbeResult = probeGetXComponentSize();
            expect(allValid([first, second, third])).assertTrue();
            expect(size.value >= 0).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0359 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0360
         * @tc.name testCombo0360
         * @tc.desc 四阶：两种按键注册到按键事件到按键码，按键域四阶混合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0360 begin');
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            const code: ProbeResult = probeGetKeyEventCode();
            expect(allValid([first, second])).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            expect(code.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0360 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0361
         * @tc.name testCombo0361
         * @tc.desc 状态机：形状递增序列后读尺寸与偏移，末态索引为二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0361 begin');
            changeShape(0);
            changeShape(1);
            changeShape(2);
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(getShapeIndex()).assertEqual(2);
            expect(size.value >= 0).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0361 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0362
         * @tc.name testCombo0362
         * @tc.desc 状态机：形状递减序列后读标识与器具，末态索引为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0362 begin');
            changeShape(3);
            changeShape(2);
            changeShape(1);
            const identity: ProbeIdResult = probeGetXComponentId();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(getShapeIndex()).assertEqual(1);
            expect(identity.id.length >= 0).assertTrue();
            expect(toolType.aux).assertEqual(0);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0362 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0363
         * @tc.name testCombo0363
         * @tc.desc 状态机：形状往返序列后读双倾角，末态回到零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0363 begin');
            changeShape(0);
            changeShape(2);
            changeShape(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(isWithinTilt(tiltY.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0363 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0364
         * @tc.name testCombo0364
         * @tc.desc 状态机：形状重复写同一值三次后读窗口坐标，幂等写入成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0364 begin');
            changeShape(1);
            changeShape(1);
            changeShape(1);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(getShapeIndex()).assertEqual(1);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(Number.isFinite(windowY.value)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0364 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0365
         * @tc.name testCombo0365
         * @tc.desc 状态机：形状两次往返后读屏幕坐标，末态回到三
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0365 begin');
            changeShape(0);
            changeShape(3);
            changeShape(0);
            changeShape(3);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(getShapeIndex()).assertEqual(3);
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(Number.isFinite(displayY.value)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0365 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0366
         * @tc.name testCombo0366
         * @tc.desc 状态机：等差步长形状序列后读历史点与按键，末态索引为八
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0366 begin');
            changeShape(2);
            changeShape(4);
            changeShape(6);
            changeShape(8);
            const points: ProbeResult = probeGetHistoricalPoints();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(getShapeIndex()).assertEqual(8);
            expect(points.value >= 0).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0366 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0367
         * @tc.name testCombo0367
         * @tc.desc 状态机：奇数递减形状序列后读修饰键与提供者，末态索引为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0367 begin');
            changeShape(9);
            changeShape(7);
            changeShape(5);
            changeShape(3);
            changeShape(1);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(getShapeIndex()).assertEqual(1);
            expect(keys.value >= 0).assertTrue();
            expect(provider.value <= 1).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0367 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0368
         * @tc.name testCombo0368
         * @tc.desc 状态机：等宽递增形状序列后读帧率与软键盘，末态索引为十五
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0368 begin');
            changeShape(0);
            changeShape(5);
            changeShape(10);
            changeShape(15);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(getShapeIndex()).assertEqual(15);
            expect(rate.value).assertEqual(60);
            expect(keyboard.value).assertEqual(1);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0368 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0369
         * @tc.name testCombo0369
         * @tc.desc 状态机：大索引形状序列后读标识与尺寸，末态索引为一百
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0369 begin');
            changeShape(100);
            changeShape(0);
            changeShape(100);
            const identity: ProbeIdResult = probeGetXComponentId();
            const size: ProbeResult = probeGetXComponentSize();
            expect(getShapeIndex()).assertEqual(100);
            expect(identity.value).assertEqual(identity.id.length);
            expect(size.value >= 0).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0369 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0370
         * @tc.name testCombo0370
         * @tc.desc 状态机：两步形状序列后读偏移与器具，末态索引为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0370 begin');
            changeShape(0);
            changeShape(1);
            const offset: ProbeResult = probeGetXComponentOffset();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(getShapeIndex()).assertEqual(1);
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0370 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0371
         * @tc.name testCombo0371
         * @tc.desc 状态机：边界值形状序列后读倾角与事件来源，末态索引为最大值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0371 begin');
            changeShape(255);
            changeShape(0);
            changeShape(255);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(getShapeIndex()).assertEqual(255);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(sourceType.value <= 5).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0371 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0372
         * @tc.name testCombo0372
         * @tc.desc 状态机：形状切换后重绘再到按键查询，切换值不被重绘抹除
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0372 begin');
            changeShape(3);
            animate();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            const action: ProbeResult = probeGetKeyEventAction();
            expect(getShapeIndex()).assertEqual(3);
            expect(keyEvent.value <= 1).assertTrue();
            expect(action.aux).assertEqual(0);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0372 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0373
         * @tc.name testCombo0373
         * @tc.desc 状态机：五步递增形状序列后读按键码与按键事件，末态索引为五
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0373 begin');
            changeShape(1);
            changeShape(2);
            changeShape(3);
            changeShape(4);
            changeShape(5);
            const code: ProbeResult = probeGetKeyEventCode();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(getShapeIndex()).assertEqual(5);
            expect(code.aux).assertEqual(0);
            expect(keyEvent.value <= 1).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0373 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0374
         * @tc.name testCombo0374
         * @tc.desc 状态机：五步递减形状序列后读尺寸与偏移，末态索引为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0374 begin');
            changeShape(5);
            changeShape(4);
            changeShape(3);
            changeShape(2);
            changeShape(1);
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(getShapeIndex()).assertEqual(1);
            expect(size.aux >= 0).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0374 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0375
         * @tc.name testCombo0375
         * @tc.desc 状态机：零值形状写入后读标识与偏移，零索引完全有效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0375 begin');
            changeShape(0);
            const identity: ProbeIdResult = probeGetXComponentId();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(getShapeIndex()).assertEqual(0);
            expect(identity.id.length >= 0).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0375 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0376
         * @tc.name testCombo0376
         * @tc.desc 状态机：七号形状写入后读器具与纵倾角，单位数索引有效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0376 begin');
            changeShape(7);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(getShapeIndex()).assertEqual(7);
            expect(toolType.aux).assertEqual(0);
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0376 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0377
         * @tc.name testCombo0377
         * @tc.desc 状态机：形状步进到八后读窗口与屏幕横坐标，两坐标系共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0377 begin');
            changeShape(0);
            changeShape(8);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(getShapeIndex()).assertEqual(8);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(Number.isFinite(displayX.value)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0377 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0378
         * @tc.name testCombo0378
         * @tc.desc 状态机：形状步进到十六后读窗口与屏幕纵坐标，末态索引为十六
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0378 begin');
            changeShape(0);
            changeShape(16);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(getShapeIndex()).assertEqual(16);
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(Number.isFinite(displayY.value)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0378 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0379
         * @tc.name testCombo0379
         * @tc.desc 状态机：形状步进到三十二后读历史点与鼠标扩展，末态索引为三十二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0379 begin');
            changeShape(0);
            changeShape(32);
            const points: ProbeResult = probeGetHistoricalPoints();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(getShapeIndex()).assertEqual(32);
            expect(points.aux >= 0).assertTrue();
            expect(mouseInfo.value <= 1).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0379 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0380
         * @tc.name testCombo0380
         * @tc.desc 状态机：形状步进到六十四后读修饰键与提供者，末态索引为六十四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0380 begin');
            changeShape(0);
            changeShape(64);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(getShapeIndex()).assertEqual(64);
            expect(keys.aux >= 0).assertTrue();
            expect(provider.aux).assertEqual(0);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0380 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0381
         * @tc.name testCombo0381
         * @tc.desc 五阶：形状到重绘到尺寸到偏移到标识，五路读数各自成立且形状保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0381 begin');
            changeShape(0);
            changeShape(2);
            animate();
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(getShapeIndex()).assertEqual(2);
            expect(size.value >= 0).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0381 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0382
         * @tc.name testCombo0382
         * @tc.desc 四阶：渲染到形状切换到再渲染到尺寸，两次渲染结构一致且形状不回退
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0382 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(10, 20, 30, 255);
            changeShape(4);
            const second: PixelProbeResult = probeRenderSolidPixel(30, 20, 10, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(first.pixel.length).assertEqual(4);
            expect(second.corner.length).assertEqual(4);
            expect(getShapeIndex()).assertEqual(4);
            expect(size.aux >= 0).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0382 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0383
         * @tc.name testCombo0383
         * @tc.desc 三阶：应用上下文到渲染到页面上下文，渲染穿插不影响上下文读取
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0383 begin');
            const app: object = GetContext(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(64, 128, 192, 255);
            const page: object = GetContext(1);
            expect(Object.getOwnPropertyNames(app).length).assertEqual(4);
            expect(Object.getOwnPropertyNames(page).length).assertEqual(2);
            expect(pixel.aux).assertEqual(4);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0383 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0384
         * @tc.name testCombo0384
         * @tc.desc 六阶：四类回调连续注册后读尺寸与偏移，注册链路全部返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0384 begin');
            const base: ProbeResult = probeRegisterCallback();
            const mouse: ProbeResult = probeRegisterMouseEventCallback();
            const focus: ProbeResult = probeRegisterFocusEventCallback();
            const blur: ProbeResult = probeRegisterBlurEventCallback();
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(allValid([base, mouse, focus, blur])).assertTrue();
            expect(size.aux >= 0).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0384 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0385
         * @tc.name testCombo0385
         * @tc.desc 五阶：两次重绘与两次形状切换后读尺寸，末次写入值为准且尺寸仍可读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0385 begin');
            animate();
            animate();
            changeShape(1);
            changeShape(3);
            const size: ProbeResult = probeGetXComponentSize();
            expect(getShapeIndex()).assertEqual(3);
            expect(size.value >= 0).assertTrue();
            expect(size.aux >= 0).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0385 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0386
         * @tc.name testCombo0386
         * @tc.desc 三阶：尺寸到形状切换到尺寸，切换形状不改写组件尺寸读数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0386 begin');
            const before: ProbeResult = probeGetXComponentSize();
            changeShape(5);
            const after: ProbeResult = probeGetXComponentSize();
            expect(before.value).assertEqual(after.value);
            expect(before.aux).assertEqual(after.aux);
            expect(getShapeIndex()).assertEqual(5);
            expect(allValid([before, after])).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0386 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0387
         * @tc.name testCombo0387
         * @tc.desc 三阶：偏移到重绘到偏移，重绘不改写组件偏移读数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0387 begin');
            const before: ProbeResult = probeGetXComponentOffset();
            animate();
            const after: ProbeResult = probeGetXComponentOffset();
            expect(before.value).assertEqual(after.value);
            expect(before.aux).assertEqual(after.aux);
            expect(Number.isFinite(after.value)).assertTrue();
            expect(isResultCode(after.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0387 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0388
         * @tc.name testCombo0388
         * @tc.desc 四阶：器具类型到横倾角到形状切换到纵倾角，倾角与形状互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0388 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            changeShape(7);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(toolType.aux).assertEqual(tiltX.aux);
            expect(tiltX.aux).assertEqual(tiltY.aux);
            expect(isWithinTilt(tiltY.value)).assertTrue();
            expect(getShapeIndex()).assertEqual(7);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0388 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0389
         * @tc.name testCombo0389
         * @tc.desc 三阶：帧率区间到渲染到软键盘，三类设置类接口均返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0389 begin');
            const range: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 120);
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(allValid([range, pixel, keyboard])).assertTrue();
            expect(pixel.pixel.length).assertEqual(4);
            expect(pixel.pixel[0] <= 255).assertTrue();
            expect(pixel.corner.length).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0389 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0390
         * @tc.name testCombo0390
         * @tc.desc 三阶：按键事件到形状切换到按键事件，形状切换不改写按键事件缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0390 begin');
            const before: ProbeResult = probeGetKeyEvent();
            changeShape(9);
            const after: ProbeResult = probeGetKeyEvent();
            expect(before.aux).assertEqual(after.aux);
            expect(isResultCode(before.code) && isResultCode(after.code)).assertTrue();
            expect(getShapeIndex()).assertEqual(9);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0390 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0391
         * @tc.name testCombo0391
         * @tc.desc 三阶：标识到渲染到标识，渲染不改写组件标识与标识长度
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0391 begin');
            const before: ProbeIdResult = probeGetXComponentId();
            probeRenderSolidPixel(255, 128, 0, 255);
            const after: ProbeIdResult = probeGetXComponentId();
            expect(before.id.length).assertEqual(after.id.length);
            expect(before.value).assertEqual(after.value);
            expect(after.id.length).assertEqual(after.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0391 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0392
         * @tc.name testCombo0392
         * @tc.desc 三阶：历史点到渲染到历史点，渲染不改写历史点缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0392 begin');
            const before: ProbeResult = probeGetHistoricalPoints();
            probeRenderSolidPixel(0, 128, 255, 255);
            const after: ProbeResult = probeGetHistoricalPoints();
            expect(before.value).assertEqual(after.value);
            expect(before.aux).assertEqual(after.aux);
            expect(after.value >= 0).assertTrue();
            expect(isResultCode(after.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0392 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0393
         * @tc.name testCombo0393
         * @tc.desc 三阶：无障碍提供者到渲染到无障碍提供者，渲染不影响提供者可用性
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0393 begin');
            const before: ProbeResult = probeGetNativeAccessibilityProvider();
            probeRenderSolidPixel(90, 180, 90, 255);
            const after: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(before.aux).assertEqual(after.aux);
            expect(after.value <= 1).assertTrue();
            expect(isResultCode(after.code)).assertTrue();
            expect(isResultCode(before.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0393 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0394
         * @tc.name testCombo0394
         * @tc.desc 三阶：修饰键状态到渲染到修饰键状态，渲染不改写修饰键位图
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0394 begin');
            const before: ProbeResult = probeGetMouseEventModifierKeyStates();
            probeRenderSolidPixel(11, 22, 33, 255);
            const after: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(before.value).assertEqual(after.value);
            expect(after.aux >= 0).assertTrue();
            expect(isResultCode(before.code)).assertTrue();
            expect(isResultCode(after.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0394 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0395
         * @tc.name testCombo0395
         * @tc.desc 三阶：逐帧注册到渲染到逐帧注销，帧回调开关不干扰像素回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0395 begin');
            const on: ProbeResult = probeRegisterOnFrameCallback();
            const pixel: PixelProbeResult = probeRenderSolidPixel(40, 80, 120, 255);
            const off: ProbeResult = probeUnregisterOnFrameCallback();
            expect(allValid([on, off])).assertTrue();
            expect(pixel.corner.length).assertEqual(4);
            expect(isResultCode(pixel.code)).assertTrue();
            expect(pixel.aux).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0395 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0396
         * @tc.name testCombo0396
         * @tc.desc 三阶：显示回调到渲染到隐藏回调，表面开关回调不影响渲染通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0396 begin');
            const show: ProbeResult = probeRegisterSurfaceShowCallback();
            const pixel: PixelProbeResult = probeRenderSolidPixel(200, 100, 50, 255);
            const hide: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(show.aux >= 0).assertTrue();
            expect(hide.aux >= 0).assertTrue();
            expect(pixel.value <= 255).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0396 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0397
         * @tc.name testCombo0397
         * @tc.desc 三阶：页面上下文两次读取到按键动作，上下文键数稳定且动作在合法域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0397 begin');
            const first: object = GetContext(1);
            const second: object = GetContext(1);
            const action: ProbeResult = probeGetKeyEventAction();
            expect(Object.getOwnPropertyNames(first).length).assertEqual(Object.getOwnPropertyNames(second).length);
            expect(Object.getOwnPropertyNames(first).length).assertEqual(2);
            expect(action.value >= KEY_ACTION_UNKNOWN).assertTrue();
            expect(isResultCode(action.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0397 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0398
         * @tc.name testCombo0398
         * @tc.desc 三阶：形状两次归零到按键码，归零写入幂等且按键码落在未知键码之上
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0398 begin');
            changeShape(0);
            changeShape(0);
            const code: ProbeResult = probeGetKeyEventCode();
            expect(getShapeIndex()).assertEqual(0);
            expect(code.value >= KEY_UNKNOWN).assertTrue();
            expect(isResultCode(code.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0398 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0399
         * @tc.name testCombo0399
         * @tc.desc 三阶：按键类输入事件注册到渲染到尺寸，输入事件注册不阻断渲染链路
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0399 begin');
            const keyReg: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            const pixel: PixelProbeResult = probeRenderSolidPixel(1, 2, 3, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(isArkuiErrorCode(keyReg.code)).assertTrue();
            expect(pixel.pixel.length).assertEqual(4);
            expect(size.value >= 0).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0399 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0400
         * @tc.name testCombo0400
         * @tc.desc 十阶：标识到形状到尺寸到偏移到重绘到器具到修饰键，全链路末态可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0400 begin');
            changeShape(0);
            const identity: ProbeIdResult = probeGetXComponentId();
            changeShape(12);
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            animate();
            const pixel: PixelProbeResult = probeRenderSolidPixel(240, 120, 60, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            changeShape(0);
            expect(identity.value).assertEqual(identity.id.length);
            expect(allValid([size, offset, pixel, toolType, keys])).assertTrue();
            expect(pixel.corner.length).assertEqual(4);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0400 end');
        });

    });
}
