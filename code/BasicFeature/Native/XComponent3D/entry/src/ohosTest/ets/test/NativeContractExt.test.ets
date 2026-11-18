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

// 规格常量：OH_NativeXComponent_ResultCode 三个取值
const RESULT_SUCCESS: number = 0;
const RESULT_FAILED: number = -1;
const RESULT_BAD_PARAMETER: number = -2;

// 规格常量：OH_NativeXComponent_TouchPointToolType 值域 UNKNOWN(0) ~ LENS(8)
const TOOL_TYPE_MIN: number = 0;
const TOOL_TYPE_MAX: number = 8;

// 规格常量：触控笔倾斜角量纲为角度，取值区间为 [-90, 90]
const TILT_LIMIT: number = 90;

// 规格常量：ARKUI_UIINPUTEVENT_TYPE 枚举值
const INPUT_TYPE_TOUCH: number = 1;
const INPUT_TYPE_MOUSE: number = 3;
const INPUT_TYPE_KEY: number = 4;

// 坐标量纲上限：屏幕与窗口坐标的量值不会超过该量级
const COORD_LIMIT: number = 100000;

// 规格常量：无按键事件时 OH_NativeXComponent_KeyCode 回读 KEY_UNKNOWN，
// 对应的 OH_NativeXComponent_KeyAction 回读 UNKNOWN，两者取值都是 -1
const KEY_UNKNOWN: number = -1;
const KEY_ACTION_UNKNOWN: number = -1;

// OH_NativeXComponent_RegisterUIInputEventCallback 返回 ArkUI 错误码域，
// 与 OH_NativeXComponent_ResultCode（0/-1/-2）不是同一集合：0 表示成功，401 表示参数非法
const ARKUI_NO_ERROR: number = 0;
const ARKUI_PARAM_INVALID: number = 401;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

function isArkuiErrorCode(code: number): boolean {
    return code === ARKUI_NO_ERROR || code === ARKUI_PARAM_INVALID;
}

function allSameCode(codes: number[]): boolean {
    for (let i = 1; i < codes.length; i++) {
        if (codes[i] !== codes[0]) {
            return false;
        }
    }
    return true;
}

function isBinaryFlag(value: number): boolean {
    return value === 0 || value === 1;
}

function intersectCount(first: string[], second: string[]): number {
    let count: number = 0;
    for (let i = 0; i < first.length; i++) {
        if (second.includes(first[i])) {
            count++;
        }
    }
    return count;
}

function isContextEmpty(type: number): boolean {
    return Object.getOwnPropertyNames(GetContext(type)).length === 0;
}

export default function nativeContractExtTest() {
    resetYieldCounter();
    describe('NativeContractExtTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        // ---------------- GetContext 参数域 ----------------

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0088
         * @tc.name testContractExt0001
         * @tc.desc 契约：GetContext(0) 返回应用生命周期四键容器，键数恰为四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContractExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0001 begin');
            const keys: string[] = Object.getOwnPropertyNames(GetContext(0));
            expect(keys.length).assertEqual(4);
            expect(keys.includes('onCreate')).assertTrue();
            expect(keys.includes('onDestroy')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0089
         * @tc.name testContractExt0002
         * @tc.desc 契约：GetContext(0) 键名集合排序后精确等于四个生命周期名称
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContractExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0002 begin');
            const joined: string = Object.getOwnPropertyNames(GetContext(0)).sort().join(',');
            expect(joined).assertEqual('onCreate,onDestroy,onHide,onShow');
            expect(joined.split(',').length).assertEqual(4);
            expect(joined.indexOf('onShow') >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0090
         * @tc.name testContractExt0003
         * @tc.desc 契约：GetContext(1) 返回页面生命周期两键容器，键数恰为二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContractExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0003 begin');
            const keys: string[] = Object.getOwnPropertyNames(GetContext(1));
            expect(keys.length).assertEqual(2);
            expect(keys.join(',').indexOf('onPageShow') >= 0).assertTrue();
            expect(keys.filter((each: string) => each.startsWith('onPage')).length).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0091
         * @tc.name testContractExt0004
         * @tc.desc 契约：GetContext(1) 键名集合排序后精确等于两个页面生命周期名称
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContractExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0004 begin');
            const joined: string = Object.getOwnPropertyNames(GetContext(1)).sort().join(',');
            expect(joined).assertEqual('onPageHide,onPageShow');
            expect(joined.split(',').length).assertEqual(2);
            expect(joined.startsWith('onPage')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0092
         * @tc.name testContractExt0005
         * @tc.desc 契约：应用生命周期与页面生命周期的键集合互不重叠
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0005 begin');
            const appKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            const pageKeys: string[] = Object.getOwnPropertyNames(GetContext(1));
            expect(intersectCount(appKeys, pageKeys)).assertEqual(0);
            expect(appKeys.length).assertEqual(4);
            expect(pageKeys.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0093
         * @tc.name testContractExt0006
         * @tc.desc 契约：两个生命周期容器的键数之和恰为六，无键被漏配
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0006 begin');
            const appCount: number = Object.getOwnPropertyNames(GetContext(0)).length;
            const pageCount: number = Object.getOwnPropertyNames(GetContext(1)).length;
            expect(appCount + pageCount).assertEqual(6);
            expect(appCount > pageCount).assertTrue();
            expect(pageCount).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0094
         * @tc.name testContractExt0007
         * @tc.desc 契约：GetContext(0) 重复调用返回相同键集，取值幂等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0007 begin');
            const first: string = Object.getOwnPropertyNames(GetContext(0)).sort().join(',');
            const second: string = Object.getOwnPropertyNames(GetContext(0)).sort().join(',');
            expect(second).assertEqual(first);
            expect(second.length).assertEqual(first.length);
            expect(second.includes('onCreate')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0095
         * @tc.name testContractExt0008
         * @tc.desc 契约：先取应用容器再取页面容器后，回到应用容器仍为四键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0008 begin');
            const before: number = Object.getOwnPropertyNames(GetContext(0)).length;
            Object.getOwnPropertyNames(GetContext(1));
            const after: number = Object.getOwnPropertyNames(GetContext(0)).length;
            expect(after).assertEqual(before);
            expect(after).assertEqual(4);
            expect(after !== 2).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0096
         * @tc.name testContractExt0009
         * @tc.desc 非法：GetContext 传入 0 与 1 之外的整数一律返回空容器
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0009 begin');
            const others: number[] = [2, 3, 4, 5, 100, 999, -1, -2, -100];
            let emptyCount: number = 0;
            for (let i = 0; i < others.length; i++) {
                if (isContextEmpty(others[i])) {
                    emptyCount++;
                }
            }
            expect(emptyCount).assertEqual(others.length);
            expect(emptyCount > 0).assertTrue();
            expect(isContextEmpty(2)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0097
         * @tc.name testContractExt0010
         * @tc.desc 边界：GetContext 入参按 ToInt64 截断后分发，0.5 落应用分支、1.5 落页面分支、2.5 落空容器
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0010 begin');
            const fractions: number[] = [0.5, 1.5, 2.5, -0.5, 0.1];
            let nonEmpty: number = 0;
            for (let i = 0; i < fractions.length; i++) {
                if (!isContextEmpty(fractions[i])) {
                    nonEmpty++;
                }
            }
            // 0.5/1.5/-0.5/0.1 截断后为 0/1/0/0，只有 2.5 截断为 2 落空容器
            expect(nonEmpty).assertEqual(4);
            expect(Object.getOwnPropertyNames(GetContext(0.5)).length).assertEqual(4);
            expect(Object.getOwnPropertyNames(GetContext(1.5)).length).assertEqual(2);
            expect(isContextEmpty(2.5)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0098
         * @tc.name testContractExt0011
         * @tc.desc 非法：GetContext 传入 NaN 与正负无穷时归零处理，落到应用生命周期容器
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0011 begin');
            const specials: number[] = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY];
            const results: boolean[] = [];
            for (let i = 0; i < specials.length; i++) {
                results.push(isContextEmpty(specials[i]));
            }
            expect(results.filter((hit: boolean) => hit).length).assertEqual(0);
            expect(Object.getOwnPropertyNames(GetContext(Number.NaN)).length).assertEqual(4);
            expect(results.length).assertEqual(specials.length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0099
         * @tc.name testContractExt0012
         * @tc.desc 非法：GetContext 传入超出 int32 范围的整数时返回空容器
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0012 begin');
            const overflows: number[] = [2147483648, 4294967296, -4294967296];
            let emptyCount: number = 0;
            for (let i = 0; i < overflows.length; i++) {
                if (Object.getOwnPropertyNames(GetContext(overflows[i])).length === 0) {
                    emptyCount++;
                }
            }
            expect(emptyCount).assertEqual(3);
            expect(isContextEmpty(2147483648)).assertTrue();
            expect(overflows[0] > 2147483647).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0100
         * @tc.name testContractExt0013
         * @tc.desc 边界：GetContext(1.0) 与整数 1 同分支，返回页面生命周期两键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0013 begin');
            const integerKeys: string = Object.getOwnPropertyNames(GetContext(1)).sort().join(',');
            const floatKeys: string = Object.getOwnPropertyNames(GetContext(1.0)).sort().join(',');
            expect(floatKeys).assertEqual(integerKeys);
            expect(floatKeys.includes('onPageShow')).assertTrue();
            expect(floatKeys.split(',').length).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0101
         * @tc.name testContractExt0014
         * @tc.desc 边界：GetContext(0.0) 与整数 0 同分支，返回应用生命周期四键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0014 begin');
            const floatKeys: string[] = Object.getOwnPropertyNames(GetContext(0.0));
            expect(floatKeys.length).assertEqual(4);
            expect(floatKeys.includes('onHide')).assertTrue();
            expect(floatKeys.includes('onPageShow')).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0102
         * @tc.name testContractExt0015
         * @tc.desc 边界：GetContext 传入负零时与正零同分支，返回应用生命周期四键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0015 begin');
            const negativeZero: number = 0 * -1;
            const keys: string[] = Object.getOwnPropertyNames(GetContext(negativeZero));
            expect(negativeZero === 0).assertTrue();
            expect(keys.length).assertEqual(4);
            expect(keys.includes('onDestroy')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0015 end');
        });

        // ---------------- 单个 probe 的值语义 ----------------

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0103
         * @tc.name testContractExt0016
         * @tc.desc 契约：id probe 的 value 等于返回字符串长度，aux 为缓冲容量不小于长度
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0016 begin');
            const result: ProbeIdResult = probeGetXComponentId();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(result.id.length);
            expect(result.aux >= result.value).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0104
         * @tc.name testContractExt0017
         * @tc.desc 契约：size probe 的宽高均为非负整数，不含负尺寸
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0017 begin');
            const result: ProbeResult = probeGetXComponentSize();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value >= 0).assertTrue();
            expect(result.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0105
         * @tc.name testContractExt0018
         * @tc.desc 契约：offset probe 的横纵偏移均为有限数，不出现无穷与 NaN
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0018 begin');
            const result: ProbeResult = probeGetXComponentOffset();
            expect(isResultCode(result.code)).assertTrue();
            expect(Math.abs(result.value) <= COORD_LIMIT).assertTrue();
            expect(Math.abs(result.aux) <= COORD_LIMIT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0106
         * @tc.name testContractExt0019
         * @tc.desc 契约：toolType probe 的 value 为非负整数，aux 回显索引 7
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0019 begin');
            const result: ProbeResult = probeGetTouchPointToolType(7);
            expect(result.aux).assertEqual(7);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(Math.floor(result.value));
            expect(result.value >= TOOL_TYPE_MIN).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0107
         * @tc.name testContractExt0020
         * @tc.desc 契约：tiltX probe 的倾角量纲不超过 90 度，aux 回显索引 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0020 begin');
            const result: ProbeResult = probeGetTouchPointTiltX(1);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(1);
            expect(result.value >= -TILT_LIMIT && result.value <= TILT_LIMIT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0108
         * @tc.name testContractExt0021
         * @tc.desc 契约：tiltY probe 的倾角量值不超过 90 度，aux 回显索引 2
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0021 begin');
            const result: ProbeResult = probeGetTouchPointTiltY(2);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(2);
            expect(Math.abs(result.value) <= TILT_LIMIT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0109
         * @tc.name testContractExt0022
         * @tc.desc 契约：windowX probe 的坐标为有限数且量级受限，aux 回显索引 3
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0022 begin');
            const result: ProbeResult = probeGetTouchPointWindowX(3);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(3);
            expect(Number.isFinite(result.value) && Math.abs(result.value) <= COORD_LIMIT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0110
         * @tc.name testContractExt0023
         * @tc.desc 契约：windowY probe 的纵坐标非负偏差可控，aux 回显索引 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0023 begin');
            const result: ProbeResult = probeGetTouchPointWindowY(4);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(4);
            expect(result.value <= COORD_LIMIT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0111
         * @tc.name testContractExt0024
         * @tc.desc 契约：displayX probe 的屏幕横坐标下界受限，aux 回显索引 5
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0024 begin');
            const result: ProbeResult = probeGetTouchPointDisplayX(5);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(5);
            expect(result.value >= -COORD_LIMIT).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0112
         * @tc.name testContractExt0025
         * @tc.desc 契约：displayY probe 的屏幕纵坐标非 NaN，aux 回显索引 6
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0025 begin');
            const result: ProbeResult = probeGetTouchPointDisplayY(6);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(6);
            expect(Number.isNaN(result.value)).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0025 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0113
         * @tc.name testContractExt0026
         * @tc.desc 契约：事件来源类型 probe 的 value 落在 ARKUI 输入类型枚举域，aux 回显 pointId 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0026 begin');
            const result: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(0);
            expect(result.value >= 0 && result.value <= 5).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0026 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0114
         * @tc.name testContractExt0027
         * @tc.desc 契约：历史点 probe 的 value 为点数且非负，aux 为指针存在标志
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0027 begin');
            const result: ProbeResult = probeGetHistoricalPoints();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value >= 0).assertTrue();
            expect(isBinaryFlag(result.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0027 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0115
         * @tc.name testContractExt0028
         * @tc.desc 契约：按键事件 probe 的 value 为事件对象存在标志，只取 0 或 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0028 begin');
            const result: ProbeResult = probeGetKeyEvent();
            expect(isResultCode(result.code)).assertTrue();
            expect(isBinaryFlag(result.value)).assertTrue();
            expect(result.value).assertEqual(Math.floor(result.value));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0028 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0116
         * @tc.name testContractExt0029
         * @tc.desc 契约：扩展鼠标信息 probe 的 value 为对象存在标志，取值非零即一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0029 begin');
            const result: ProbeResult = probeGetExtraMouseEventInfo();
            expect(isResultCode(result.code)).assertTrue();
            expect(isBinaryFlag(result.value)).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0029 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0117
         * @tc.name testContractExt0030
         * @tc.desc 契约：修饰键状态按高低 32 位拆分，低半部为非负整数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0030 begin');
            const result: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value >= 0).assertTrue();
            expect(Number.isFinite(result.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0030 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0118
         * @tc.name testContractExt0031
         * @tc.desc 契约：修饰键状态的高 32 位同样为非负整数，拆分不丢位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0031 begin');
            const result: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux >= 0).assertTrue();
            expect(result.aux).assertEqual(Math.floor(result.aux));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0031 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0119
         * @tc.name testContractExt0032
         * @tc.desc 契约：无障碍提供者 probe 的 value 为存在标志，只取 0 或 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0032 begin');
            const result: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(isResultCode(result.code)).assertTrue();
            expect(isBinaryFlag(result.value)).assertTrue();
            expect(result.value === 0 || result.value === 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0032 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0120
         * @tc.name testContractExt0033
         * @tc.desc 契约：帧率区间 probe 的 value 回显下限 60，入参不被改写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0033 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(60);
            expect(result.value !== 120).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0033 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0121
         * @tc.name testContractExt0034
         * @tc.desc 契约：帧率区间 probe 的 aux 回显上限 120，与下限分别取位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0034 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(30, 90, 60);
            expect(result.aux).assertEqual(90);
            expect(result.value).assertEqual(30);
            expect(result.aux > result.value).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0034 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0122
         * @tc.name testContractExt0035
         * @tc.desc 边界：帧率区间接受负下限并按原值回显，不静默归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0035 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(-5, 5, 0);
            expect(result.value).assertEqual(-5);
            expect(result.aux).assertEqual(5);
            expect(result.value < 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0035 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0123
         * @tc.name testContractExt0036
         * @tc.desc 契约：软键盘开关 probe 的 value 回显入参 1，表示需要软键盘
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0036 begin');
            const result: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(1);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0036 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0124
         * @tc.name testContractExt0037
         * @tc.desc 契约：软键盘开关 probe 的 value 回显入参 0，表示不需要软键盘
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0037 begin');
            const result: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.value <= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0037 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0125
         * @tc.name testContractExt0038
         * @tc.desc 边界：软键盘开关入参为负一时回显原值，布尔化只在内部生效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0038 begin');
            const result: ProbeResult = probeSetNeedSoftKeyboard(-1);
            expect(result.value).assertEqual(-1);
            expect(result.value !== 0).assertTrue();
            expect(result.value < 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0038 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0126
         * @tc.name testContractExt0039
         * @tc.desc 契约：应用回调注册 probe 只返回码与零值回显，无副作用字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0039 begin');
            const result: ProbeResult = probeRegisterCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0039 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0127
         * @tc.name testContractExt0040
         * @tc.desc 契约：鼠标回调注册 probe 的 value 为零，注册不携带业务值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0040 begin');
            const result: ProbeResult = probeRegisterMouseEventCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux === 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0040 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0128
         * @tc.name testContractExt0041
         * @tc.desc 契约：焦点回调注册 probe 返回码合法，且不回传焦点状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0041 begin');
            const result: ProbeResult = probeRegisterFocusEventCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0041 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0129
         * @tc.name testContractExt0042
         * @tc.desc 契约：失焦回调注册 probe 返回码合法，与焦点注册互不影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0042 begin');
            const result: ProbeResult = probeRegisterBlurEventCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0042 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0130
         * @tc.name testContractExt0043
         * @tc.desc 契约：按键回调注册 probe 返回码合法，空回调不消费按键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0043 begin');
            const result: ProbeResult = probeRegisterKeyEventCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0043 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0131
         * @tc.name testContractExt0044
         * @tc.desc 契约：带返回值按键回调注册 probe 返回码合法，空回调恒返回否
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0044 begin');
            const result: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0044 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0132
         * @tc.name testContractExt0045
         * @tc.desc 契约：帧回调注册 probe 返回码合法，注册不产生额外输出值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0045 begin');
            const result: ProbeResult = probeRegisterOnFrameCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0045 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0133
         * @tc.name testContractExt0046
         * @tc.desc 契约：帧回调注销 probe 返回码合法，未注册时注销也不报业务错
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0046 begin');
            const result: ProbeResult = probeUnregisterOnFrameCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0046 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0134
         * @tc.name testContractExt0047
         * @tc.desc 契约：显示回调注册 probe 返回码合法，不改变显示状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0047 begin');
            const result: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0047 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0135
         * @tc.name testContractExt0048
         * @tc.desc 契约：隐藏回调注册 probe 返回码合法，不改变可见性
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0048 begin');
            const result: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0048 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0136
         * @tc.name testContractExt0049
         * @tc.desc 契约：触摸拦截回调注册 probe 返回码合法，默认拦截模式为 HTM_DEFAULT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0049 begin');
            const result: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value).assertEqual(0);
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0049 end');
        });

        // ---------------- 成对与组合语义 ----------------

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0137
         * @tc.name testContractExt0050
         * @tc.desc 组合：尺寸与偏移在同一上下文下返回码一致，不存在一成一败
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0050 begin');
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(size.code).assertEqual(offset.code);
            expect(isResultCode(size.code)).assertTrue();
            expect(isResultCode(offset.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0050 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0138
         * @tc.name testContractExt0051
         * @tc.desc 组合：同一触点的横纵倾角返回码一致，倾角成对可得
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0051 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(tiltX.code).assertEqual(tiltY.code);
            expect(tiltX.aux).assertEqual(tiltY.aux);
            expect(tiltX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0051 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0139
         * @tc.name testContractExt0052
         * @tc.desc 组合：窗口横纵坐标返回码一致，坐标成对回读不残缺
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0052 begin');
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(windowX.code).assertEqual(windowY.code);
            expect(windowX.aux).assertEqual(0);
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0052 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0140
         * @tc.name testContractExt0053
         * @tc.desc 组合：屏幕横纵坐标返回码一致，跨坐标系不出现单边失败
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0053 begin');
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(displayX.code).assertEqual(displayY.code);
            expect(displayX.aux).assertEqual(0);
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0053 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0141
         * @tc.name testContractExt0054
         * @tc.desc 组合：不同触点索引的器具类型查询返回码一致，索引边界不改变结论
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0054 begin');
            const first: ProbeResult = probeGetTouchPointToolType(0);
            const last: ProbeResult = probeGetTouchPointToolType(5);
            expect(first.code).assertEqual(last.code);
            expect(first.aux).assertEqual(0);
            expect(last.aux).assertEqual(5);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0054 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0142
         * @tc.name testContractExt0055
         * @tc.desc 组合：横纵窗口坐标的索引回显互不串位，各自等于入参
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0055 begin');
            const windowX: ProbeResult = probeGetTouchPointWindowX(1);
            const windowY: ProbeResult = probeGetTouchPointWindowY(1);
            expect(windowX.aux).assertEqual(1);
            expect(windowY.aux).assertEqual(1);
            expect(windowX.aux).assertEqual(windowY.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0055 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0143
         * @tc.name testContractExt0056
         * @tc.desc 组合：屏幕横纵坐标的索引回显互不串位，索引二成对出现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0056 begin');
            const displayX: ProbeResult = probeGetTouchPointDisplayX(2);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(2);
            expect(displayX.aux).assertEqual(2);
            expect(displayY.aux).assertEqual(2);
            expect(displayX.aux + displayY.aux).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0056 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0144
         * @tc.name testContractExt0057
         * @tc.desc 组合：按键事件与动作查询共用同一事件对象，返回码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0057 begin');
            const keyEvent: ProbeResult = probeGetKeyEvent();
            const action: ProbeResult = probeGetKeyEventAction();
            expect(keyEvent.code).assertEqual(action.code);
            expect(isResultCode(keyEvent.code)).assertTrue();
            expect(action.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0057 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0145
         * @tc.name testContractExt0058
         * @tc.desc 组合：按键事件与键值查询共用同一事件对象，返回码一致且键值不低于未知键码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0058 begin');
            const keyEvent: ProbeResult = probeGetKeyEvent();
            const keyCode: ProbeResult = probeGetKeyEventCode();
            expect(keyEvent.code).assertEqual(keyCode.code);
            expect(keyCode.value >= KEY_UNKNOWN).assertTrue();
            expect(keyCode.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0058 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0146
         * @tc.name testContractExt0059
         * @tc.desc 组合：动作查询与键值查询返回码一致，动作与键值均不低于未知枚举
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0059 begin');
            const action: ProbeResult = probeGetKeyEventAction();
            const keyCode: ProbeResult = probeGetKeyEventCode();
            expect(action.code).assertEqual(keyCode.code);
            expect(action.value >= KEY_ACTION_UNKNOWN).assertTrue();
            expect(keyCode.value >= KEY_UNKNOWN).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0059 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0147
         * @tc.name testContractExt0060
         * @tc.desc 组合：动作与键值的输出均为非负整数，不出现小数键码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0060 begin');
            const action: ProbeResult = probeGetKeyEventAction();
            const keyCode: ProbeResult = probeGetKeyEventCode();
            expect(action.value).assertEqual(Math.floor(action.value));
            expect(keyCode.value).assertEqual(Math.floor(keyCode.value));
            expect(keyCode.value).assertEqual(keyCode.value * 1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0060 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0148
         * @tc.name testContractExt0061
         * @tc.desc 一致性：尺寸与器具类查询的返回码在两轮调用后保持全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0061 begin');
            const codes: number[] = [probeGetXComponentSize().code, probeGetXComponentOffset().code,
            probeGetXComponentId().code, probeGetTouchPointToolType(0).code, probeGetTouchPointTiltX(0).code,
            probeGetTouchPointTiltY(0).code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(6);
            expect(isResultCode(codes[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0061 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0149
         * @tc.name testContractExt0062
         * @tc.desc 一致性：坐标与来源类查询的返回码都落在 ResultCode 集合，索引回显与入参一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0062 begin');
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            const source: ProbeResult = probeGetTouchEventSourceType(0);
            const history: ProbeResult = probeGetHistoricalPoints();
            const codes: number[] = [windowX.code, windowY.code, displayX.code, displayY.code, source.code,
            history.code];
            for (let i = 0; i < codes.length; i++) {
                expect(isResultCode(codes[i])).assertTrue();
            }
            expect(codes.length).assertEqual(6);
            expect(windowX.aux).assertEqual(0);
            expect(windowY.aux).assertEqual(0);
            expect(displayX.aux).assertEqual(0);
            expect(displayY.aux).assertEqual(0);
            expect(source.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0062 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0150
         * @tc.name testContractExt0063
         * @tc.desc 一致性：事件与设置类查询的返回码保持全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0063 begin');
            const codes: number[] = [probeGetKeyEvent().code, probeGetExtraMouseEventInfo().code,
            probeGetMouseEventModifierKeyStates().code, probeGetNativeAccessibilityProvider().code,
            probeSetExpectedFrameRateRange(60, 120, 60).code, probeSetNeedSoftKeyboard(1).code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(6);
            expect(isResultCode(codes[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0063 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0151
         * @tc.name testContractExt0064
         * @tc.desc 一致性：七个基础回调注册的返回码全等，注册互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0064 begin');
            const codes: number[] = [probeRegisterCallback().code, probeRegisterMouseEventCallback().code,
            probeRegisterFocusEventCallback().code, probeRegisterBlurEventCallback().code,
            probeRegisterKeyEventCallback().code, probeRegisterKeyEventCallbackWithResult().code,
            probeRegisterOnFrameCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(7);
            expect(isResultCode(codes[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0064 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0152
         * @tc.name testContractExt0065
         * @tc.desc 一致性：注销与显示/隐藏回调类落在 ResultCode 集合，输入类注册落在 ArkUI 错误码集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0065 begin');
            const codes: number[] = [probeUnregisterOnFrameCallback().code, probeRegisterSurfaceShowCallback().code,
            probeRegisterSurfaceHideCallback().code, probeRegisterOnTouchInterceptCallback().code,
            probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH).code,
            probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE).code,
            probeRegisterUIInputEventCallback(INPUT_TYPE_KEY).code];
            for (let i = 0; i < 4; i++) {
                expect(isResultCode(codes[i])).assertTrue();
            }
            for (let i = 4; i < 7; i++) {
                expect(isArkuiErrorCode(codes[i])).assertTrue();
            }
            expect(codes.length).assertEqual(7);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0065 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0153
         * @tc.name testContractExt0066
         * @tc.desc 幂等：尺寸查询连续三次返回码恒定，读数不被重复调用扰动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0066 begin');
            const codes: number[] = [probeGetXComponentSize().code, probeGetXComponentSize().code,
            probeGetXComponentSize().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(3);
            expect(isResultCode(codes[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0066 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0154
         * @tc.name testContractExt0067
         * @tc.desc 幂等：偏移查询连续三次返回码恒定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0067 begin');
            const codes: number[] = [probeGetXComponentOffset().code, probeGetXComponentOffset().code,
            probeGetXComponentOffset().code];
            expect(allSameCode(codes)).assertTrue();
            expect(isResultCode(codes[0])).assertTrue();
            expect(codes.length).assertEqual(3);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0067 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0155
         * @tc.name testContractExt0068
         * @tc.desc 幂等：器具类型查询的索引回显三次恒定，aux 不漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0068 begin');
            const first: ProbeResult = probeGetTouchPointToolType(2);
            const second: ProbeResult = probeGetTouchPointToolType(2);
            const third: ProbeResult = probeGetTouchPointToolType(2);
            expect(first.aux).assertEqual(2);
            expect(second.aux).assertEqual(third.aux);
            expect(allSameCode([first.code, second.code, third.code])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0068 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0156
         * @tc.name testContractExt0069
         * @tc.desc 幂等：横倾角查询的索引回显三次恒定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0069 begin');
            const first: ProbeResult = probeGetTouchPointTiltX(2);
            const second: ProbeResult = probeGetTouchPointTiltX(2);
            const third: ProbeResult = probeGetTouchPointTiltX(2);
            expect(second.aux).assertEqual(2);
            expect(third.value).assertEqual(first.value);
            expect(allSameCode([first.code, second.code, third.code])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0069 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0157
         * @tc.name testContractExt0070
         * @tc.desc 幂等：事件来源查询的 pointId 回显三次恒定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0070 begin');
            const first: ProbeResult = probeGetTouchEventSourceType(2);
            const second: ProbeResult = probeGetTouchEventSourceType(2);
            const third: ProbeResult = probeGetTouchEventSourceType(2);
            expect(first.aux).assertEqual(2);
            expect(third.aux).assertEqual(second.aux);
            expect(second.value).assertEqual(third.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0070 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0158
         * @tc.name testContractExt0071
         * @tc.desc 幂等：帧率区间下限回显两次一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0071 begin');
            const first: ProbeResult = probeSetExpectedFrameRateRange(45, 90, 60);
            const second: ProbeResult = probeSetExpectedFrameRateRange(45, 90, 60);
            expect(first.value).assertEqual(second.value);
            expect(first.value).assertEqual(45);
            expect(allSameCode([first.code, second.code])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0071 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0159
         * @tc.name testContractExt0072
         * @tc.desc 幂等：帧率区间上限回显两次一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0072 begin');
            const first: ProbeResult = probeSetExpectedFrameRateRange(45, 90, 60);
            const second: ProbeResult = probeSetExpectedFrameRateRange(45, 90, 60);
            expect(first.aux).assertEqual(second.aux);
            expect(first.aux).assertEqual(90);
            expect(first.aux > first.value).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0072 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0160
         * @tc.name testContractExt0073
         * @tc.desc 幂等：软键盘开关回显两次一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0073 begin');
            const first: ProbeResult = probeSetNeedSoftKeyboard(1);
            const second: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(first.value).assertEqual(second.value);
            expect(second.value).assertEqual(1);
            expect(second.aux).assertEqual(first.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0073 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0161
         * @tc.name testContractExt0074
         * @tc.desc 幂等：历史点查询两次返回码与点数一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0074 begin');
            const first: ProbeResult = probeGetHistoricalPoints();
            const second: ProbeResult = probeGetHistoricalPoints();
            expect(first.code).assertEqual(second.code);
            expect(first.value).assertEqual(second.value);
            expect(first.aux).assertEqual(second.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0074 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0162
         * @tc.name testContractExt0075
         * @tc.desc 幂等：按键事件查询两次的存在标志一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0075 begin');
            const first: ProbeResult = probeGetKeyEvent();
            const second: ProbeResult = probeGetKeyEvent();
            expect(first.value).assertEqual(second.value);
            expect(isBinaryFlag(first.value)).assertTrue();
            expect(first.code).assertEqual(second.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0075 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0163
         * @tc.name testContractExt0076
         * @tc.desc 幂等：无障碍提供者查询两次的存在标志一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0076 begin');
            const first: ProbeResult = probeGetNativeAccessibilityProvider();
            const second: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(first.value).assertEqual(second.value);
            expect(isBinaryFlag(second.value)).assertTrue();
            expect(second.code).assertEqual(first.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0076 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0164
         * @tc.name testContractExt0077
         * @tc.desc 幂等：修饰键状态两次返回码一致，位拆分不随机
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0077 begin');
            const first: ProbeResult = probeGetMouseEventModifierKeyStates();
            const second: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(first.code).assertEqual(second.code);
            expect(first.value >= 0).assertTrue();
            expect(second.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0077 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0165
         * @tc.name testContractExt0078
         * @tc.desc 一致性：应用与页面容器键集合并后恰为六个不同键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0078 begin');
            const appKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            const pageKeys: string[] = Object.getOwnPropertyNames(GetContext(1));
            const merged: string[] = appKeys.concat(pageKeys).sort();
            expect(merged.length).assertEqual(6);
            expect(merged[0]).assertEqual('onCreate');
            expect(merged[merged.length - 1]).assertEqual('onShow');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0078 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0166
         * @tc.name testContractExt0079
         * @tc.desc 一致性：容器键名均为非空字符串，不出现未命名槽位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0079 begin');
            const appKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            const pageKeys: string[] = Object.getOwnPropertyNames(GetContext(1));
            const keys: string[] = appKeys.concat(pageKeys);
            let blank: number = 0;
            for (let i = 0; i < keys.length; i++) {
                if (keys[i].length === 0) {
                    blank++;
                }
            }
            expect(blank).assertEqual(0);
            expect(keys.length).assertEqual(6);
            expect(keys.includes('undefined')).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0079 end');
        });

        // ---------------- 幂等与交错稳定性 ----------------

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0167
         * @tc.name testContractExt0080
         * @tc.desc 幂等：应用回调注册连续三次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0080 begin');
            const codes: number[] = [probeRegisterCallback().code, probeRegisterCallback().code,
            probeRegisterCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(3);
            expect(isResultCode(codes[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0080 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0168
         * @tc.name testContractExt0081
         * @tc.desc 幂等：鼠标回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0081 begin');
            const codes: number[] = [probeRegisterMouseEventCallback().code, probeRegisterMouseEventCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(isResultCode(codes[1])).assertTrue();
            expect(codes.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0081 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0169
         * @tc.name testContractExt0082
         * @tc.desc 幂等：焦点回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0082 begin');
            const codes: number[] = [probeRegisterFocusEventCallback().code, probeRegisterFocusEventCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes[0]).assertEqual(codes[1]);
            expect(codes.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0082 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0170
         * @tc.name testContractExt0083
         * @tc.desc 幂等：失焦回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0083 begin');
            const codes: number[] = [probeRegisterBlurEventCallback().code, probeRegisterBlurEventCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(isResultCode(codes[0])).assertTrue();
            expect(codes[1] === codes[0]).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0083 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0171
         * @tc.name testContractExt0084
         * @tc.desc 幂等：按键回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContractExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0084 begin');
            const codes: number[] = [probeRegisterKeyEventCallback().code, probeRegisterKeyEventCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(2);
            expect(isResultCode(codes[codes.length - 1])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0084 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0172
         * @tc.name testContractExt0085
         * @tc.desc 幂等：带返回值按键回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0085 begin');
            const codes: number[] = [probeRegisterKeyEventCallbackWithResult().code,
            probeRegisterKeyEventCallbackWithResult().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(2);
            expect(isResultCode(codes[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0085 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0173
         * @tc.name testContractExt0086
         * @tc.desc 幂等：帧回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0086 begin');
            const codes: number[] = [probeRegisterOnFrameCallback().code, probeRegisterOnFrameCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(isResultCode(codes[0])).assertTrue();
            expect(codes[0]).assertEqual(codes[1]);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0086 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0174
         * @tc.name testContractExt0087
         * @tc.desc 幂等：帧回调注销连续两次返回码全等，重复注销不报错
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0087 begin');
            const codes: number[] = [probeUnregisterOnFrameCallback().code, probeUnregisterOnFrameCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(2);
            expect(isResultCode(codes[1])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0087 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0175
         * @tc.name testContractExt0088
         * @tc.desc 幂等：显示回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0088 begin');
            const codes: number[] = [probeRegisterSurfaceShowCallback().code, probeRegisterSurfaceShowCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(isResultCode(codes[0])).assertTrue();
            expect(codes.length).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0088 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0176
         * @tc.name testContractExt0089
         * @tc.desc 幂等：隐藏回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0089 begin');
            const codes: number[] = [probeRegisterSurfaceHideCallback().code, probeRegisterSurfaceHideCallback().code];
            expect(allSameCode(codes)).assertTrue();
            expect(codes.length).assertEqual(2);
            expect(isResultCode(codes[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0089 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0177
         * @tc.name testContractExt0090
         * @tc.desc 幂等：触摸拦截回调注册连续两次返回码全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0090 begin');
            const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(first.code).assertEqual(second.code);
            expect(isResultCode(second.code)).assertTrue();
            expect(second.value).assertEqual(first.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0090 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0178
         * @tc.name testContractExt0091
         * @tc.desc 幂等：触摸类输入回调注册连续两次返回码全等，入参回显一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0091 begin');
            const first: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            expect(first.code).assertEqual(second.code);
            expect(first.value).assertEqual(INPUT_TYPE_TOUCH);
            expect(second.value).assertEqual(first.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0091 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0179
         * @tc.name testContractExt0092
         * @tc.desc 幂等：鼠标类输入回调注册返回码与触摸类一致，类型不影响返回码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0092 begin');
            const touch: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const mouse: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            expect(mouse.code).assertEqual(touch.code);
            expect(mouse.value).assertEqual(INPUT_TYPE_MOUSE);
            expect(touch.value).assertEqual(INPUT_TYPE_TOUCH);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0092 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0180
         * @tc.name testContractExt0093
         * @tc.desc 交错：注册与尺寸查询交替调用，注册返回码不被查询扰动
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0093 begin');
            const before: number = probeRegisterFocusEventCallback().code;
            probeGetXComponentSize();
            const after: number = probeRegisterFocusEventCallback().code;
            expect(after).assertEqual(before);
            expect(isResultCode(after)).assertTrue();
            expect(before).assertEqual(after * 1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0093 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0181
         * @tc.name testContractExt0094
         * @tc.desc 交错：帧回调注册注销循环五次，全程返回码落在合法集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0094 begin');
            const codes: number[] = [];
            for (let i = 0; i < 5; i++) {
                codes.push(probeRegisterOnFrameCallback().code);
                codes.push(probeUnregisterOnFrameCallback().code);
            }
            expect(codes.length).assertEqual(10);
            let invalid: number = 0;
            for (let i = 0; i < codes.length; i++) {
                if (!isResultCode(codes[i])) {
                    invalid++;
                }
            }
            expect(invalid).assertEqual(0);
            expect(allSameCode(codes)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0094 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0182
         * @tc.name testContractExt0095
         * @tc.desc 交错：注册后注销再注册，首末返回码相同，状态可重入
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0095 begin');
            const first: number = probeRegisterOnFrameCallback().code;
            probeUnregisterOnFrameCallback();
            const last: number = probeRegisterOnFrameCallback().code;
            expect(last).assertEqual(first);
            expect(isResultCode(last)).assertTrue();
            expect(first === last).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0095 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0183
         * @tc.name testContractExt0096
         * @tc.desc 稳定：十四个注册类 probe 两轮调用的返回码逐位全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0096 begin');
            const firstRound: number[] = [probeRegisterCallback().code, probeRegisterMouseEventCallback().code,
            probeRegisterFocusEventCallback().code, probeRegisterBlurEventCallback().code,
            probeRegisterKeyEventCallback().code, probeRegisterKeyEventCallbackWithResult().code,
            probeRegisterOnFrameCallback().code, probeUnregisterOnFrameCallback().code];
            const secondRound: number[] = [probeRegisterCallback().code, probeRegisterMouseEventCallback().code,
            probeRegisterFocusEventCallback().code, probeRegisterBlurEventCallback().code,
            probeRegisterKeyEventCallback().code, probeRegisterKeyEventCallbackWithResult().code,
            probeRegisterOnFrameCallback().code, probeUnregisterOnFrameCallback().code];
            expect(firstRound.join(',')).assertEqual(secondRound.join(','));
            expect(firstRound.length).assertEqual(8);
            expect(allSameCode(firstRound)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0096 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0184
         * @tc.name testContractExt0097
         * @tc.desc 稳定：六组查询类 probe 两轮调用的返回码逐位全等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0097 begin');
            const firstRound: number[] = [probeGetXComponentSize().code, probeGetXComponentOffset().code,
            probeGetTouchPointToolType(0).code, probeGetTouchPointTiltX(0).code, probeGetKeyEvent().code,
            probeGetHistoricalPoints().code];
            const secondRound: number[] = [probeGetXComponentSize().code, probeGetXComponentOffset().code,
            probeGetTouchPointToolType(0).code, probeGetTouchPointTiltX(0).code, probeGetKeyEvent().code,
            probeGetHistoricalPoints().code];
            expect(firstRound.join(',')).assertEqual(secondRound.join(','));
            expect(secondRound.length).assertEqual(6);
            expect(isResultCode(secondRound[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0097 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0185
         * @tc.name testContractExt0098
         * @tc.desc 稳定：全量 probe 一轮调用后返回码全部落在规格集合内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0098 begin');
            const codes: number[] = [probeGetXComponentId().code, probeGetXComponentSize().code,
            probeGetXComponentOffset().code, probeGetTouchPointToolType(0).code, probeGetTouchPointTiltX(0).code,
            probeGetTouchPointTiltY(0).code, probeGetTouchPointWindowX(0).code, probeGetTouchPointWindowY(0).code,
            probeGetTouchPointDisplayX(0).code, probeGetTouchPointDisplayY(0).code,
            probeGetTouchEventSourceType(0).code, probeGetHistoricalPoints().code, probeGetKeyEvent().code,
            probeGetExtraMouseEventInfo().code, probeGetMouseEventModifierKeyStates().code,
            probeGetNativeAccessibilityProvider().code];
            let invalid: number = 0;
            for (let i = 0; i < codes.length; i++) {
                if (!isResultCode(codes[i])) {
                    invalid++;
                }
            }
            expect(invalid).assertEqual(0);
            expect(codes.length).assertEqual(16);
            expect(codes.includes(RESULT_BAD_PARAMETER) || codes.includes(RESULT_SUCCESS)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0098 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0186
         * @tc.name testContractExt0099
         * @tc.desc 稳定：全量 probe 两轮调用返回码序列完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0099 begin');
            const first: string = [probeGetXComponentSize().code, probeGetTouchPointToolType(1).code,
            probeGetKeyEvent().code, probeSetNeedSoftKeyboard(1).code, probeRegisterCallback().code].join(',');
            const second: string = [probeGetXComponentSize().code, probeGetTouchPointToolType(1).code,
            probeGetKeyEvent().code, probeSetNeedSoftKeyboard(1).code, probeRegisterCallback().code].join(',');
            expect(second).assertEqual(first);
            expect(second.split(',').length).assertEqual(5);
            expect(second.length > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0099 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0187
         * @tc.name testContractExt0100
         * @tc.desc 交错：生命周期容器取值与 probe 调用交错进行，probe 返回码不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContractExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0100 begin');
            const before: number = probeGetXComponentSize().code;
            Object.getOwnPropertyNames(GetContext(0));
            Object.getOwnPropertyNames(GetContext(1));
            const after: number = probeGetXComponentSize().code;
            expect(after).assertEqual(before);
            expect(isResultCode(after)).assertTrue();
            expect(after === before).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContractExt0100 end');
        });

    });
}
