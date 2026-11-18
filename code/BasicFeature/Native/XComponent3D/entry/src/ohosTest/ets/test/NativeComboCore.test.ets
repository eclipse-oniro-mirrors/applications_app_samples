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
    GetContext,
    ProbeResult,
    ProbeIdResult,
    getShapeIndex,
    changeShape,
    animate,
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
    probeSetNeedSoftKeyboard
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

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

function isNonNegative(value: number): boolean {
    return value >= 0 && Number.isFinite(value);
}

function isWithinTilt(value: number): boolean {
    return value >= -TILT_LIMIT && value <= TILT_LIMIT;
}

export default function nativeComboCoreTest() {
    resetYieldCounter();
    describe('NativeComboCoreTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0001
         * @tc.name testCombo0001
         * @tc.desc 组合：标识与尺寸先后调用返回码一致，标识长度与尺寸回读互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0001 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const size: ProbeResult = probeGetXComponentSize();
            expect(identity.code).assertEqual(size.code);
            expect(identity.value).assertEqual(identity.id.length);
            expect(isNonNegative(size.value)).assertTrue();
            expect(probeGetXComponentId().value).assertEqual(identity.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0002
         * @tc.name testCombo0002
         * @tc.desc 组合：标识与偏移先后调用返回码一致，偏移量保持有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0002 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(identity.code).assertEqual(offset.code);
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(identity.id.length >= 0).assertTrue();
            expect(probeGetXComponentOffset().code).assertEqual(offset.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0003
         * @tc.name testCombo0003
         * @tc.desc 组合：标识与器具类型先后调用返回码一致，器具值落在枚举域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0003 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(identity.code).assertEqual(toolType.code);
            expect(toolType.value >= 0 && toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(toolType.aux).assertEqual(0);
            expect(probeGetTouchPointToolType(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0004
         * @tc.name testCombo0004
         * @tc.desc 组合：标识与横倾角先后调用返回码一致，倾角落在正负九十度内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0004 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(identity.code).assertEqual(tiltX.code);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(tiltX.aux).assertEqual(0);
            expect(probeGetTouchPointTiltX(0).value).assertEqual(tiltX.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0005
         * @tc.name testCombo0005
         * @tc.desc 组合：标识与纵倾角先后调用返回码一致，纵倾角落在正负九十度之间
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0005 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(identity.code).assertEqual(tiltY.code);
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            expect(tiltY.aux).assertEqual(0);
            expect(probeGetTouchPointTiltY(0).code).assertEqual(tiltY.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0006
         * @tc.name testCombo0006
         * @tc.desc 组合：标识与窗口横坐标先后调用返回码一致，坐标不出现无穷值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0006 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(identity.code).assertEqual(windowX.code);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(windowX.aux).assertEqual(0);
            expect(probeGetTouchPointWindowX(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0007
         * @tc.name testCombo0007
         * @tc.desc 组合：标识与窗口纵坐标先后调用返回码一致，纵坐标非 NaN
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0007 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(identity.code).assertEqual(windowY.code);
            expect(Number.isNaN(windowY.value)).assertFalse();
            expect(windowY.aux).assertEqual(0);
            expect(probeGetTouchPointWindowY(0).code).assertEqual(windowY.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0008
         * @tc.name testCombo0008
         * @tc.desc 组合：标识与屏幕横坐标先后调用返回码一致，屏幕坐标有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0008 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(identity.code).assertEqual(displayX.code);
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(displayX.aux).assertEqual(0);
            expect(probeGetTouchPointDisplayX(0).value).assertEqual(displayX.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0009
         * @tc.name testCombo0009
         * @tc.desc 组合：标识与屏幕纵坐标先后调用返回码一致，纵坐标有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0009 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(identity.code).assertEqual(displayY.code);
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(probeGetTouchPointDisplayY(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0010
         * @tc.name testCombo0010
         * @tc.desc 组合：标识与事件来源先后调用，两路返回码都落在契约集合，来源类型在输入枚举域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0010 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isResultCode(identity.code)).assertTrue();
            expect(isResultCode(sourceType.code)).assertTrue();
            expect(sourceType.value >= 0 && sourceType.value <= 5).assertTrue();
            expect(sourceType.aux).assertEqual(0);
            expect(probeGetTouchEventSourceType(0).code).assertEqual(sourceType.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0011
         * @tc.name testCombo0011
         * @tc.desc 组合：标识与历史点先后调用返回码一致，点数非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0011 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(identity.code).assertEqual(points.code);
            expect(isNonNegative(points.value)).assertTrue();
            expect(points.aux === 0 || points.aux === 1).assertTrue();
            expect(probeGetHistoricalPoints().value).assertEqual(points.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0012
         * @tc.name testCombo0012
         * @tc.desc 组合：标识与按键事件先后调用返回码一致，事件存在标志只取零或一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0012 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(identity.code).assertEqual(keyEvent.code);
            expect(keyEvent.value === 0 || keyEvent.value === 1).assertTrue();
            expect(isResultCode(keyEvent.code)).assertTrue();
            expect(probeGetKeyEvent().code).assertEqual(keyEvent.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0013
         * @tc.name testCombo0013
         * @tc.desc 组合：标识与扩展鼠标信息先后调用返回码一致，对象存在标志为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0013 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(identity.code).assertEqual(mouseInfo.code);
            expect(mouseInfo.value === 0 || mouseInfo.value === 1).assertTrue();
            expect(mouseInfo.aux).assertEqual(0);
            expect(probeGetExtraMouseEventInfo().value).assertEqual(mouseInfo.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0014
         * @tc.name testCombo0014
         * @tc.desc 组合：标识与修饰键状态先后调用返回码一致，高位拆分非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0014 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(identity.code).assertEqual(keys.code);
            expect(isNonNegative(keys.value)).assertTrue();
            expect(isNonNegative(keys.aux)).assertTrue();
            expect(probeGetMouseEventModifierKeyStates().code).assertEqual(keys.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0015
         * @tc.name testCombo0015
         * @tc.desc 组合：标识与无障碍提供者先后调用返回码一致，提供者标志只取零或一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0015 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(identity.code).assertEqual(provider.code);
            expect(provider.value === 0 || provider.value === 1).assertTrue();
            expect(provider.aux).assertEqual(0);
            expect(probeGetNativeAccessibilityProvider().value).assertEqual(provider.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0016
         * @tc.name testCombo0016
         * @tc.desc 组合：标识与帧率区间先后调用，帧率下限回显不受标识查询影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0016 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            expect(rate.value).assertEqual(60);
            expect(rate.aux).assertEqual(120);
            expect(isResultCode(rate.code)).assertTrue();
            expect(identity.code).assertEqual(rate.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0017
         * @tc.name testCombo0017
         * @tc.desc 组合：标识与软键盘开关先后调用，开关入参原值回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0017 begin');
            const identity: ProbeIdResult = probeGetXComponentId();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(keyboard.value).assertEqual(1);
            expect(isResultCode(keyboard.code)).assertTrue();
            expect(identity.code).assertEqual(keyboard.code);
            expect(probeSetNeedSoftKeyboard(1).value).assertEqual(keyboard.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0018
         * @tc.name testCombo0018
         * @tc.desc 组合：尺寸与偏移返回码一致，宽高与横纵偏移可同时取到
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0018 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(size.code).assertEqual(offset.code);
            expect(isNonNegative(size.value) && isNonNegative(size.aux)).assertTrue();
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0019
         * @tc.name testCombo0019
         * @tc.desc 组合：尺寸与器具类型返回码一致，尺寸不因器具查询被清零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0019 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(size.code).assertEqual(toolType.code);
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0020
         * @tc.name testCombo0020
         * @tc.desc 组合：尺寸与横倾角返回码一致，倾角查询不影响尺寸缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0020 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(size.code).assertEqual(tiltX.code);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetXComponentSize().code).assertEqual(size.code);
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0021
         * @tc.name testCombo0021
         * @tc.desc 组合：尺寸与纵倾角返回码一致，两路输出各自落在量纲内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0021 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(size.code).assertEqual(tiltY.code);
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            expect(size.aux >= 0).assertTrue();
            expect(probeGetTouchPointTiltY(0).value).assertEqual(tiltY.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0022
         * @tc.name testCombo0022
         * @tc.desc 组合：尺寸与窗口横坐标返回码一致，坐标查询不改写宽高
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0022 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(size.code).assertEqual(windowX.code);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0023
         * @tc.name testCombo0023
         * @tc.desc 组合：尺寸与窗口纵坐标返回码一致，纵坐标查询不改写高度
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0023 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(size.code).assertEqual(windowY.code);
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0024
         * @tc.name testCombo0024
         * @tc.desc 组合：尺寸与屏幕横坐标返回码一致，屏幕坐标不反写尺寸
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0024 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(size.code).assertEqual(displayX.code);
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(probeGetXComponentSize().code).assertEqual(size.code);
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0025
         * @tc.name testCombo0025
         * @tc.desc 组合：尺寸与屏幕纵坐标返回码一致，两路读数互不覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0025 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(size.code).assertEqual(displayY.code);
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0025 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0026
         * @tc.name testCombo0026
         * @tc.desc 组合：尺寸与事件来源，两路返回码都落在契约集合，来源类型不越出输入枚举
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0026 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isResultCode(size.code)).assertTrue();
            expect(isResultCode(sourceType.code)).assertTrue();
            expect(sourceType.value <= 5).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            expect(sourceType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0026 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0027
         * @tc.name testCombo0027
         * @tc.desc 组合：尺寸与历史点返回码一致，点数与宽高各自独立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0027 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(size.code).assertEqual(points.code);
            expect(points.value >= 0).assertTrue();
            expect(probeGetHistoricalPoints().code).assertEqual(points.code);
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0027 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0028
         * @tc.name testCombo0028
         * @tc.desc 组合：尺寸与按键事件返回码一致，事件存在标志不影响宽高
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0028 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(size.code).assertEqual(keyEvent.code);
            expect(keyEvent.value <= 1).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            expect(keyEvent.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0028 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0029
         * @tc.name testCombo0029
         * @tc.desc 组合：尺寸与扩展鼠标信息返回码一致，两条链路不共享输出槽
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0029 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(size.code).assertEqual(mouseInfo.code);
            expect(mouseInfo.value <= 1).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            expect(mouseInfo.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0029 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0030
         * @tc.name testCombo0030
         * @tc.desc 组合：尺寸与修饰键状态返回码一致，位拆分非负且不影响宽高
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0030 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(size.code).assertEqual(keys.code);
            expect(keys.value >= 0).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            expect(keys.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0030 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0031
         * @tc.name testCombo0031
         * @tc.desc 组合：尺寸与无障碍提供者返回码一致，提供者标志不污染尺寸
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0031 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(size.code).assertEqual(provider.code);
            expect(provider.value <= 1).assertTrue();
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            expect(provider.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0031 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0032
         * @tc.name testCombo0032
         * @tc.desc 组合：尺寸与帧率区间先后调用，区间回显与宽高互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0032 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(30, 90, 60);
            expect(rate.value).assertEqual(30);
            expect(rate.aux).assertEqual(90);
            expect(probeGetXComponentSize().code).assertEqual(size.code);
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0032 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0033
         * @tc.name testCombo0033
         * @tc.desc 组合：尺寸与软键盘开关先后调用，开关取零值与尺寸共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0033 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(keyboard.value).assertEqual(0);
            expect(size.aux >= 0).assertTrue();
            expect(probeGetXComponentSize().value).assertEqual(size.value);
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0033 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0034
         * @tc.name testCombo0034
         * @tc.desc 组合：偏移与器具类型返回码一致，器具索引回显与偏移量无干涉
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0034 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(offset.code).assertEqual(toolType.code);
            expect(toolType.aux).assertEqual(0);
            expect(Number.isFinite(offset.value) && Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0034 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0035
         * @tc.name testCombo0035
         * @tc.desc 组合：偏移与横倾角返回码一致，两路数值各自有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0035 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(offset.code).assertEqual(tiltX.code);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().code).assertEqual(offset.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0035 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0036
         * @tc.name testCombo0036
         * @tc.desc 组合：偏移与纵倾角返回码一致，倾斜量纲不受偏移查询影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0036 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(offset.code).assertEqual(tiltY.code);
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            expect(tiltY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0036 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0037
         * @tc.name testCombo0037
         * @tc.desc 组合：偏移与窗口横坐标返回码一致，窗口坐标与偏移量可同时取
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0037 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(offset.code).assertEqual(windowX.code);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0037 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0038
         * @tc.name testCombo0038
         * @tc.desc 组合：偏移与窗口纵坐标返回码一致，两路纵向量纲独立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0038 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(offset.code).assertEqual(windowY.code);
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0038 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0039
         * @tc.name testCombo0039
         * @tc.desc 组合：偏移与屏幕横坐标返回码一致，屏幕坐标与偏移并存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0039 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(offset.code).assertEqual(displayX.code);
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(probeGetXComponentOffset().code).assertEqual(offset.code);
            expect(displayX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0039 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0040
         * @tc.name testCombo0040
         * @tc.desc 组合：偏移与屏幕纵坐标返回码一致，纵坐标查询不回写偏移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0040 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(offset.code).assertEqual(displayY.code);
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0040 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0041
         * @tc.name testCombo0041
         * @tc.desc 组合：偏移与事件来源，两路返回码都落在契约集合，来源枚举与偏移量各自受限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0041 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isResultCode(offset.code)).assertTrue();
            expect(isResultCode(sourceType.code)).assertTrue();
            expect(sourceType.value >= 0 && sourceType.value <= 5).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            expect(sourceType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0041 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0042
         * @tc.name testCombo0042
         * @tc.desc 组合：偏移与历史点返回码一致，点数与偏移输出槽分离
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0042 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(offset.code).assertEqual(points.code);
            expect(points.value >= 0).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            expect(points.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0042 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0043
         * @tc.name testCombo0043
         * @tc.desc 组合：偏移与按键事件返回码一致，事件标志与偏移互不覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0043 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(offset.code).assertEqual(keyEvent.code);
            expect(keyEvent.value <= 1).assertTrue();
            expect(probeGetXComponentOffset().code).assertEqual(offset.code);
            expect(keyEvent.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0043 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0044
         * @tc.name testCombo0044
         * @tc.desc 组合：偏移与扩展鼠标信息返回码一致，布尔标志不影响偏移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0044 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(offset.code).assertEqual(mouseInfo.code);
            expect(mouseInfo.value <= 1).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            expect(mouseInfo.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0044 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0045
         * @tc.name testCombo0045
         * @tc.desc 组合：偏移与修饰键状态返回码一致，位拆分与偏移通道隔离
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0045 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(offset.code).assertEqual(keys.code);
            expect(keys.value >= 0 && keys.aux >= 0).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            expect(isResultCode(keys.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0045 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0046
         * @tc.name testCombo0046
         * @tc.desc 组合：偏移与无障碍提供者返回码一致，提供者存在不改变偏移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0046 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(offset.code).assertEqual(provider.code);
            expect(provider.value <= 1).assertTrue();
            expect(probeGetXComponentOffset().value).assertEqual(offset.value);
            expect(provider.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0046 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0047
         * @tc.name testCombo0047
         * @tc.desc 组合：偏移与帧率区间先后调用，区间回显独立于偏移读数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0047 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const rate: ProbeResult = probeSetExpectedFrameRateRange(45, 120, 90);
            expect(rate.value).assertEqual(45);
            expect(rate.aux).assertEqual(120);
            expect(probeGetXComponentOffset().code).assertEqual(offset.code);
            expect(Number.isFinite(offset.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0047 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0048
         * @tc.name testCombo0048
         * @tc.desc 组合：偏移与软键盘开关先后调用，开关回显与偏移可同时成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0048 begin');
            const offset: ProbeResult = probeGetXComponentOffset();
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(keyboard.value).assertEqual(1);
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(probeGetXComponentOffset().aux).assertEqual(offset.aux);
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0048 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0049
         * @tc.name testCombo0049
         * @tc.desc 组合：器具类型与横倾角返回码一致，两例索引回显同为第一点
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0049 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(toolType.code).assertEqual(tiltX.code);
            expect(toolType.aux).assertEqual(tiltX.aux);
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0049 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0050
         * @tc.name testCombo0050
         * @tc.desc 组合：器具类型与纵倾角返回码一致，双倾角查询不改写器具值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0050 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(toolType.code).assertEqual(tiltY.code);
            expect(Math.abs(tiltY.value) <= TILT_LIMIT).assertTrue();
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            expect(tiltY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0050 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0051
         * @tc.name testCombo0051
         * @tc.desc 组合：器具类型与窗口横坐标返回码一致，窗口坐标不影响器具枚举
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0051 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(toolType.code).assertEqual(windowX.code);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(probeGetTouchPointToolType(0).aux).assertEqual(toolType.aux);
            expect(toolType.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0051 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0052
         * @tc.name testCombo0052
         * @tc.desc 组合：器具类型与窗口纵坐标返回码一致，纵坐标查询器具值稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0052 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(toolType.code).assertEqual(windowY.code);
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0052 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0053
         * @tc.name testCombo0053
         * @tc.desc 组合：器具类型与屏幕横坐标返回码一致，屏幕读数不越出器具域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0053 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(toolType.code).assertEqual(displayX.code);
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(displayX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0053 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0054
         * @tc.name testCombo0054
         * @tc.desc 组合：器具类型与屏幕纵坐标返回码一致，两路输出各自可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0054 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(toolType.code).assertEqual(displayY.code);
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(probeGetTouchPointToolType(0).code).assertEqual(toolType.code);
            expect(probeGetTouchPointDisplayY(0).value).assertEqual(displayY.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0054 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0055
         * @tc.name testCombo0055
         * @tc.desc 组合：器具类型与事件来源，两路返回码都落在契约集合，两个枚举互不串值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0055 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isResultCode(toolType.code)).assertTrue();
            expect(isResultCode(sourceType.code)).assertTrue();
            expect(sourceType.value <= 5).assertTrue();
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            expect(sourceType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0055 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0056
         * @tc.name testCombo0056
         * @tc.desc 组合：器具类型与历史点返回码一致，点数查询不改写器具枚举
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0056 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(toolType.code).assertEqual(points.code);
            expect(points.value >= 0).assertTrue();
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            expect(points.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0056 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0057
         * @tc.name testCombo0057
         * @tc.desc 组合：器具类型与按键事件返回码一致，两条事件链路互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0057 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(toolType.code).assertEqual(keyEvent.code);
            expect(keyEvent.value <= 1).assertTrue();
            expect(probeGetTouchPointToolType(0).aux).assertEqual(toolType.aux);
            expect(keyEvent.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0057 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0058
         * @tc.name testCombo0058
         * @tc.desc 组合：器具类型与扩展鼠标信息返回码一致，鼠标标志不覆盖器具号
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0058 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(toolType.code).assertEqual(mouseInfo.code);
            expect(mouseInfo.value <= 1).assertTrue();
            expect(probeGetTouchPointToolType(0).code).assertEqual(toolType.code);
            expect(mouseInfo.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0058 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0059
         * @tc.name testCombo0059
         * @tc.desc 组合：器具类型与修饰键状态返回码一致，位域与枚举分属两条通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0059 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(toolType.code).assertEqual(keys.code);
            expect(keys.value >= 0 && keys.aux >= 0).assertTrue();
            expect(toolType.value >= 0).assertTrue();
            expect(probeGetMouseEventModifierKeyStates().code).assertEqual(keys.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0059 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0060
         * @tc.name testCombo0060
         * @tc.desc 组合：器具类型与无障碍提供者返回码一致，提供者标志不越出布尔域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0060 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(toolType.code).assertEqual(provider.code);
            expect(provider.value <= 1).assertTrue();
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            expect(provider.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0060 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0061
         * @tc.name testCombo0061
         * @tc.desc 组合：器具类型与帧率区间先后调用，区间回显独立于器具枚举
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0061 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 90);
            expect(rate.value).assertEqual(60);
            expect(rate.aux).assertEqual(120);
            expect(probeGetTouchPointToolType(0).value).assertEqual(toolType.value);
            expect(toolType.value <= TOOL_TYPE_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0061 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0062
         * @tc.name testCombo0062
         * @tc.desc 组合：器具类型与软键盘开关先后调用，开关回显与器具号共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0062 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(keyboard.value).assertEqual(0);
            expect(probeGetTouchPointToolType(0).aux).assertEqual(toolType.aux);
            expect(toolType.value >= 0).assertTrue();
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0062 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0063
         * @tc.name testCombo0063
         * @tc.desc 组合：横纵倾角同点查询返回码与索引回显完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testCombo0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0063 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(tiltX.code).assertEqual(tiltY.code);
            expect(tiltX.aux).assertEqual(tiltY.aux);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(isWithinTilt(tiltY.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0063 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0064
         * @tc.name testCombo0064
         * @tc.desc 组合：横倾角与窗口横坐标返回码一致，倾角查询不污染坐标槽
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0064 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(tiltX.code).assertEqual(windowX.code);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(probeGetTouchPointTiltX(0).value).assertEqual(tiltX.value);
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0064 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0065
         * @tc.name testCombo0065
         * @tc.desc 组合：横倾角与窗口纵坐标返回码一致，两路读数各自可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0065 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(tiltX.code).assertEqual(windowY.code);
            expect(Number.isFinite(windowY.value)).assertTrue();
            expect(probeGetTouchPointWindowY(0).code).assertEqual(windowY.code);
            expect(tiltX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0065 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0066
         * @tc.name testCombo0066
         * @tc.desc 组合：横倾角与屏幕横坐标返回码一致，屏幕读数不越出倾角量纲
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0066 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(tiltX.code).assertEqual(displayX.code);
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetTouchPointDisplayX(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0066 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0067
         * @tc.name testCombo0067
         * @tc.desc 组合：横倾角与屏幕纵坐标返回码一致，纵坐标查询不改写倾角
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0067 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(tiltX.code).assertEqual(displayY.code);
            expect(Number.isFinite(displayY.value)).assertTrue();
            expect(probeGetTouchPointTiltX(0).aux).assertEqual(tiltX.aux);
            expect(Math.abs(tiltX.value) <= TILT_LIMIT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0067 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0068
         * @tc.name testCombo0068
         * @tc.desc 组合：横倾角与事件来源，两路返回码都落在契约集合，来源枚举不覆盖倾角槽
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0068 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isResultCode(tiltX.code)).assertTrue();
            expect(isResultCode(sourceType.code)).assertTrue();
            expect(sourceType.value <= 5).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetTouchEventSourceType(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0068 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0069
         * @tc.name testCombo0069
         * @tc.desc 组合：横倾角与历史点返回码一致，点数非负且倾角仍在界内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0069 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(tiltX.code).assertEqual(points.code);
            expect(points.value >= 0).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetHistoricalPoints().aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0069 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0070
         * @tc.name testCombo0070
         * @tc.desc 组合：横倾角与按键事件返回码一致，事件标志与倾角各自独立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0070 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(tiltX.code).assertEqual(keyEvent.code);
            expect(keyEvent.value <= 1).assertTrue();
            expect(probeGetTouchPointTiltX(0).value).assertEqual(tiltX.value);
            expect(keyEvent.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0070 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0071
         * @tc.name testCombo0071
         * @tc.desc 组合：横倾角与扩展鼠标信息返回码一致，鼠标标志不改变倾角
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0071 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const mouseInfo: ProbeResult = probeGetExtraMouseEventInfo();
            expect(tiltX.code).assertEqual(mouseInfo.code);
            expect(mouseInfo.value <= 1).assertTrue();
            expect(probeGetTouchPointTiltX(0).code).assertEqual(tiltX.code);
            expect(mouseInfo.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0071 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0072
         * @tc.name testCombo0072
         * @tc.desc 组合：横倾角与修饰键状态返回码一致，位拆分非负且倾角在界内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0072 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(tiltX.code).assertEqual(keys.code);
            expect(keys.value >= 0 && keys.aux >= 0).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetMouseEventModifierKeyStates().value).assertEqual(keys.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0072 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0073
         * @tc.name testCombo0073
         * @tc.desc 组合：横倾角与无障碍提供者返回码一致，提供者标志不覆写倾角
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0073 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(tiltX.code).assertEqual(provider.code);
            expect(provider.value <= 1).assertTrue();
            expect(isWithinTilt(tiltX.value)).assertTrue();
            expect(probeGetNativeAccessibilityProvider().aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0073 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0074
         * @tc.name testCombo0074
         * @tc.desc 组合：横倾角与帧率区间先后调用，区间回显与倾角互不干涉
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0074 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(24, 60, 30);
            expect(rate.value).assertEqual(24);
            expect(rate.aux).assertEqual(60);
            expect(probeGetTouchPointTiltX(0).value).assertEqual(tiltX.value);
            expect(isWithinTilt(tiltX.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0074 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0075
         * @tc.name testCombo0075
         * @tc.desc 组合：横倾角与软键盘开关先后调用，开关入参原值回显且倾角不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0075 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(keyboard.value).assertEqual(1);
            expect(tiltX.aux).assertEqual(0);
            expect(probeGetTouchPointTiltX(0).aux).assertEqual(tiltX.aux);
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0075 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0076
         * @tc.name testCombo0076
         * @tc.desc 组合：重绘请求与尺寸回读，重绘不改变缓存宽高与返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0076 begin');
            const before: ProbeResult = probeGetXComponentSize();
            animate();
            const after: ProbeResult = probeGetXComponentSize();
            expect(after.code).assertEqual(before.code);
            expect(after.value).assertEqual(before.value);
            expect(after.aux).assertEqual(before.aux);
            expect(isResultCode(before.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0076 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0077
         * @tc.name testCombo0077
         * @tc.desc 组合：重绘请求与形状索引，重绘不改变已写入的形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0077 begin');
            const before: number = getShapeIndex();
            animate();
            const after: number = getShapeIndex();
            expect(after).assertEqual(before);
            expect(Number.isSafeInteger(after)).assertTrue();
            expect(after >= 0).assertTrue();
            expect(getShapeIndex()).assertEqual(before);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0077 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0078
         * @tc.name testCombo0078
         * @tc.desc 组合：形状切换与尺寸回读，切换形状不改写宽高缓存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0078 begin');
            const size: ProbeResult = probeGetXComponentSize();
            changeShape(3);
            expect(getShapeIndex()).assertEqual(3);
            const after: ProbeResult = probeGetXComponentSize();
            expect(after.value).assertEqual(size.value);
            expect(after.aux).assertEqual(size.aux);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0078 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0079
         * @tc.name testCombo0079
         * @tc.desc 组合：形状索引与尺寸回读，索引查询保持非负整数且尺寸稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0079 begin');
            const shape: number = getShapeIndex();
            const size: ProbeResult = probeGetXComponentSize();
            expect(Number.isInteger(shape)).assertTrue();
            expect(size.value >= 0).assertTrue();
            expect(getShapeIndex()).assertEqual(shape);
            expect(probeGetXComponentSize().aux).assertEqual(size.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0079 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0080
         * @tc.name testCombo0080
         * @tc.desc 组合：生命周期上下文与尺寸回读，上下文键集与宽高各自稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0080 begin');
            const context: object = GetContext(0);
            const keys: string[] = Object.getOwnPropertyNames(context);
            const size: ProbeResult = probeGetXComponentSize();
            expect(keys.length).assertEqual(4);
            expect(keys.indexOf('onShow') >= 0).assertTrue();
            expect(size.value >= 0).assertTrue();
            expect(Object.getOwnPropertyNames(GetContext(0)).length).assertEqual(keys.length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0080 end');
        });

    });
}
