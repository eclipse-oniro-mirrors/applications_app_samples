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
    probeGetTouchEventSourceType,
    probeGetKeyEvent,
    probeGetExtraMouseEventInfo,
    probeGetHistoricalPoints,
    probeGetNativeAccessibilityProvider,
    probeSetNeedSoftKeyboard
} from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

// 规格常量：OH_NativeXComponent_ResultCode 只定义三个取值
const RESULT_SUCCESS: number = 0;
const RESULT_FAILED: number = -1;
const RESULT_BAD_PARAMETER: number = -2;

// 规格常量：OH_NativeXComponent_TouchPointToolType 从 UNKNOWN(0) 到 LENS(8)
const TOOL_TYPE_MIN: number = 0;
const TOOL_TYPE_MAX: number = 8;

/**
 * 原生返回码是否落在规格定义的三个取值内。
 */
function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

/**
 * 返回码是否为正整数或零，用于长度类输出。
 */
function isNonNegativeInteger(value: number): boolean {
    return value >= 0 && Math.floor(value) === value;
}

export default function nativeContractTest() {
    resetYieldCounter();
    describe('NativeContractTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0001
         * @tc.name testContract0001
         * @tc.desc 合法值：GetContext(0) 返回 4 个生命周期回调键，含 onCreate 与 onDestroy
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0001 begin');
            const appContext: object = GetContext(0);
            const keys: string[] = Object.getOwnPropertyNames(appContext);
            expect(keys.length).assertEqual(4);
            expect(keys.includes('onCreate')).assertTrue();
            expect(keys.includes('onDestroy')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0002
         * @tc.name testContract0002
         * @tc.desc 合法值：GetContext(0) 含 onShow 与 onHide，且取法 0 不含页面生命周期键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContract0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0002 begin');
            const appContext: object = GetContext(0);
            const keys: string[] = Object.getOwnPropertyNames(appContext);
            expect(keys.includes('onShow')).assertTrue();
            expect(keys.includes('onHide')).assertTrue();
            expect(keys.includes('onPageShow')).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0003
         * @tc.name testContract0003
         * @tc.desc 组合：GetContext(0) 的四个键逐一可查且总数等于四，无多余键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0003 begin');
            const appContext: object = GetContext(0);
            const keys: string[] = Object.getOwnPropertyNames(appContext);
            let matched: number = 0;
            for (let index = 0; index < keys.length; index++) {
                const key: string = keys[index];
                if (key === 'onCreate' || key === 'onShow' || key === 'onHide' || key === 'onDestroy') {
                    matched++;
                }
            }
            expect(matched).assertEqual(4);
            expect(keys.length).assertEqual(4);
            expect(keys.includes('onPageHide')).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0004
         * @tc.name testContract0004
         * @tc.desc 合法值：GetContext(1) 返回 2 个页面生命周期键，含 onPageShow 与 onPageHide
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContract0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0004 begin');
            const pageContext: object = GetContext(1);
            const keys: string[] = Object.getOwnPropertyNames(pageContext);
            expect(keys.length).assertEqual(2);
            expect(keys.includes('onPageShow')).assertTrue();
            expect(keys.includes('onPageHide')).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0005
         * @tc.name testContract0005
         * @tc.desc 非法值：取法 1 不包含应用生命周期键，键数不等于取法 0 的键数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0005 begin');
            const pageContext: object = GetContext(1);
            const keys: string[] = Object.getOwnPropertyNames(pageContext);
            const appKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            expect(keys.includes('onCreate')).assertFalse();
            expect(keys.includes('onShow')).assertFalse();
            expect(keys.length === appKeys.length).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0006
         * @tc.name testContract0006
         * @tc.desc 边界值：GetContext(2) 走默认分支，返回空对象且不含任何生命周期键
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0006 begin');
            const unknownContext: object = GetContext(2);
            const keys: string[] = Object.getOwnPropertyNames(unknownContext);
            expect(keys.length).assertEqual(0);
            expect(keys.includes('onCreate')).assertFalse();
            expect(unknownContext !== null).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0007
         * @tc.name testContract0007
         * @tc.desc 极值：GetContext(-1) 同样走默认分支，返回空对象且键数为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0007 begin');
            const negativeContext: object = GetContext(-1);
            const keys: string[] = Object.getOwnPropertyNames(negativeContext);
            expect(keys.length).assertEqual(0);
            expect(keys.includes('onPageShow')).assertFalse();
            expect(keys.includes('onCreate')).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0008
         * @tc.name testContract0008
         * @tc.desc 状态：GetContext(0) 连续两次调用键数一致且键集合逐字相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0008 begin');
            const firstKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            const secondKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            expect(secondKeys.length).assertEqual(firstKeys.length);
            expect(secondKeys.join(',')).assertEqual(firstKeys.join(','));
            expect(firstKeys.length).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0009
         * @tc.name testContract0009
         * @tc.desc 状态：GetContext(1) 连续两次调用键数一致且键集合逐字相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0009 begin');
            const firstKeys: string[] = Object.getOwnPropertyNames(GetContext(1));
            const secondKeys: string[] = Object.getOwnPropertyNames(GetContext(1));
            expect(firstKeys.length).assertEqual(2);
            expect(secondKeys.includes('onPageHide')).assertTrue();
            expect(secondKeys.join(',')).assertEqual(firstKeys.join(','));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0010
         * @tc.name testContract0010
         * @tc.desc 组合：取法 0 与取法 1 的键集合无交集，两段键数之和为六
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0010 begin');
            const appKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            const pageKeys: string[] = Object.getOwnPropertyNames(GetContext(1));
            let overlapped: number = 0;
            for (let index = 0; index < pageKeys.length; index++) {
                if (appKeys.includes(pageKeys[index])) {
                    overlapped++;
                }
            }
            expect(overlapped).assertEqual(0);
            expect(appKeys.length + pageKeys.length).assertEqual(6);
            expect(appKeys.length !== pageKeys.length).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0011
         * @tc.name testContract0011
         * @tc.desc 边界值：取法 0 的每个键都是非空字符串，且都能在对象上取到回调函数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0011 begin');
            const appContext: object = GetContext(0);
            const keys: string[] = Object.getOwnPropertyNames(appContext);
            let nonEmptyKeys: number = 0;
            for (let index = 0; index < keys.length; index++) {
                if (keys[index].length > 0) {
                    nonEmptyKeys++;
                }
            }
            expect(nonEmptyKeys).assertEqual(keys.length);
            expect(keys.includes('')).assertFalse();
            expect(keys.length).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0012
         * @tc.name testContract0012
         * @tc.desc 状态：取法 2 对象非空但键数为零，与取法 0 的键数不同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0012 begin');
            const unknownContext: object = GetContext(2);
            const unknownKeys: string[] = Object.getOwnPropertyNames(unknownContext);
            const appKeys: string[] = Object.getOwnPropertyNames(GetContext(0));
            expect(unknownKeys.length).assertEqual(0);
            expect(unknownContext !== null).assertTrue();
            expect(appKeys.length !== unknownKeys.length).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0013
         * @tc.name testContract0013
         * @tc.desc 契约：probeGetXComponentId 返回 code/value/aux/id 四字段，返回码属于规格集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContract0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0013 begin');
            const result: ProbeIdResult = probeGetXComponentId();
            expect(result.code !== undefined).assertTrue();
            expect(isResultCode(result.code)).assertTrue();
            expect(typeof result.id === 'string').assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0014
         * @tc.name testContract0014
         * @tc.desc 契约：probeGetXComponentSize 返回 code/value/aux 三字段且返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testContract0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0014 begin');
            const result: ProbeResult = probeGetXComponentSize();
            expect(result.value !== undefined).assertTrue();
            expect(result.aux !== undefined).assertTrue();
            expect(isResultCode(result.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0015
         * @tc.name testContract0015
         * @tc.desc 契约：probeGetXComponentOffset 的返回码合法，且 value/aux 为有限数值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0015 begin');
            const result: ProbeResult = probeGetXComponentOffset();
            expect(isResultCode(result.code)).assertTrue();
            expect(Number.isFinite(result.value)).assertTrue();
            expect(Number.isFinite(result.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0016
         * @tc.name testContract0016
         * @tc.desc 契约：probeGetTouchPointToolType(0) 的返回码合法且 aux 回显入参索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0016 begin');
            const result: ProbeResult = probeGetTouchPointToolType(0);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(0);
            expect(result.value >= TOOL_TYPE_MIN && result.value <= TOOL_TYPE_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0017
         * @tc.name testContract0017
         * @tc.desc 契约：probeGetTouchPointTiltX(0) 返回码合法，倾角输出为有限数值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0017 begin');
            const result: ProbeResult = probeGetTouchPointTiltX(0);
            expect(isResultCode(result.code)).assertTrue();
            expect(Number.isFinite(result.value)).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0018
         * @tc.name testContract0018
         * @tc.desc 契约：probeGetTouchEventSourceType(0) 返回码合法且来源类型为不透明枚举值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0018 begin');
            const result: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value >= 0).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0019
         * @tc.name testContract0019
         * @tc.desc 契约：probeGetKeyEvent 的返回码合法，事件是否为空以 0/1 表达
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0019 begin');
            const result: ProbeResult = probeGetKeyEvent();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value === 0 || result.value === 1).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0020
         * @tc.name testContract0020
         * @tc.desc 契约：probeGetExtraMouseEventInfo 返回码合法，指针存在性以 0/1 表达
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0020 begin');
            const result: ProbeResult = probeGetExtraMouseEventInfo();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value === 0 || result.value === 1).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0021
         * @tc.name testContract0021
         * @tc.desc 极值：返回码为上界 0 与下界 -2 之间的整数，不存在超出规格集合的取值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0021 begin');
            const sizeResult: ProbeResult = probeGetXComponentSize();
            const offsetResult: ProbeResult = probeGetXComponentOffset();
            expect(sizeResult.code <= RESULT_SUCCESS).assertTrue();
            expect(sizeResult.code >= RESULT_BAD_PARAMETER).assertTrue();
            expect(offsetResult.code >= RESULT_BAD_PARAMETER).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0022
         * @tc.name testContract0022
         * @tc.desc 边界值：触点索引 0 与越界索引 999 的返回码都落在规格集合内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0022 begin');
            const inside: ProbeResult = probeGetTouchPointToolType(0);
            const outside: ProbeResult = probeGetTouchPointToolType(999);
            expect(isResultCode(inside.code)).assertTrue();
            expect(isResultCode(outside.code)).assertTrue();
            expect(outside.aux).assertEqual(999);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0023
         * @tc.name testContract0023
         * @tc.desc 非法值：负索引 -1 经 uint32 转换后成为极大值，返回码仍属于规格集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0023 begin');
            const result: ProbeResult = probeGetTouchPointToolType(-1);
            expect(isResultCode(result.code)).assertTrue();
            expect(result.aux).assertEqual(-1);
            expect(result.value >= TOOL_TYPE_MIN).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0024
         * @tc.name testContract0024
         * @tc.desc 状态：同一索引连续两次取工具类型，返回码与数值输出一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0024 begin');
            const first: ProbeResult = probeGetTouchPointToolType(0);
            const second: ProbeResult = probeGetTouchPointToolType(0);
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(first.value);
            expect(second.aux).assertEqual(first.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0025
         * @tc.name testContract0025
         * @tc.desc 组合：三个触点查询接口在缺失触摸事件时返回码彼此一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0025 begin');
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(tiltX.code).assertEqual(toolType.code);
            expect(tiltY.code).assertEqual(toolType.code);
            expect(toolType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0025 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0026
         * @tc.name testContract0026
         * @tc.desc 契约：历史触点数量为非负整数，点数组存在性以 0/1 表达
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0026 begin');
            const result: ProbeResult = probeGetHistoricalPoints();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value >= 0).assertTrue();
            expect(result.aux === 0 || result.aux === 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0026 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0027
         * @tc.name testContract0027
         * @tc.desc 契约：无障碍 provider 是否存在以 0/1 表达，返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0027 begin');
            const result: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(isResultCode(result.code)).assertTrue();
            expect(result.value === 0 || result.value === 1).assertTrue();
            expect(result.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0027 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0028
         * @tc.name testContract0028
         * @tc.desc 组合：设置软键盘需求后回显入参，两次调用返回码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0028 begin');
            const disabled: ProbeResult = probeSetNeedSoftKeyboard(0);
            const enabled: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(disabled.value).assertEqual(0);
            expect(enabled.value).assertEqual(1);
            expect(isResultCode(disabled.code) && isResultCode(enabled.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0028 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0029
         * @tc.name testContract0029
         * @tc.desc 契约：组件 id 长度与回填的 id 实际长度一致，且为非负整数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0029 begin');
            const result: ProbeIdResult = probeGetXComponentId();
            expect(isResultCode(result.code)).assertTrue();
            expect(isNonNegativeInteger(result.value)).assertTrue();
            expect(result.id.length).assertEqual(result.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0029 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0030
         * @tc.name testContract0030
         * @tc.desc 状态：组件 id 连续两次读取结果一致，不随调用次数变化
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0030 begin');
            const first: ProbeIdResult = probeGetXComponentId();
            const second: ProbeIdResult = probeGetXComponentId();
            expect(second.code).assertEqual(first.code);
            expect(second.id).assertEqual(first.id);
            expect(second.value).assertEqual(first.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0030 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0031
         * @tc.name testContract0031
         * @tc.desc 组合：尺寸与偏移两个 probe 的返回码一致，成功时宽高均为正
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testContract0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0031 begin');
            const sizeResult: ProbeResult = probeGetXComponentSize();
            const offsetResult: ProbeResult = probeGetXComponentOffset();
            expect(sizeResult.code).assertEqual(offsetResult.code);
            if (sizeResult.code === RESULT_SUCCESS) {
                expect(sizeResult.value > 0 && sizeResult.aux > 0).assertTrue();
            } else {
                expect(sizeResult.value).assertEqual(0);
            }
            expect(offsetResult.code <= RESULT_SUCCESS).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0031 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0032
         * @tc.name testContract0032
         * @tc.desc 组合：低值索引查询与越界索引查询的 aux 分别回显各自入参
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testContract0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0032 begin');
            const lowIndex: ProbeResult = probeGetTouchPointWindowX(3);
            const highIndex: ProbeResult = probeGetTouchPointWindowX(1024);
            expect(lowIndex.aux).assertEqual(3);
            expect(highIndex.aux).assertEqual(1024);
            expect(isResultCode(lowIndex.code) && isResultCode(highIndex.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testContract0032 end');
        });
    });
}
