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
    ProbeResult, ProbeIdResult, PixelProbeResult, GetContext, animate, changeShape, getShapeIndex,
    probeRenderSolidPixel, probeGetXComponentSize, probeGetXComponentOffset, probeGetXComponentId,
    probeGetTouchPointToolType, probeGetTouchPointTiltX, probeGetTouchPointTiltY,
    probeGetTouchPointWindowX, probeGetTouchPointWindowY, probeGetTouchPointDisplayX, probeGetTouchPointDisplayY,
    probeGetTouchEventSourceType, probeGetHistoricalPoints, probeGetKeyEvent, probeGetExtraMouseEventInfo,
    probeGetMouseEventModifierKeyStates, probeGetNativeAccessibilityProvider,
    probeSetExpectedFrameRateRange, probeSetNeedSoftKeyboard,
    probeRegisterCallback, probeRegisterMouseEventCallback, probeRegisterFocusEventCallback,
    probeRegisterBlurEventCallback, probeRegisterKeyEventCallback, probeRegisterKeyEventCallbackWithResult,
    probeRegisterOnFrameCallback, probeUnregisterOnFrameCallback, probeRegisterSurfaceShowCallback,
    probeRegisterSurfaceHideCallback, probeRegisterOnTouchInterceptCallback, probeRegisterUIInputEventCallback
} from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

const RESULT_SUCCESS: number = 0;
const RESULT_FAILED: number = -1;
const RESULT_BAD_PARAMETER: number = -2;

const CHANNEL_COUNT: number = 4;
const PROBE_BUFFER_EDGE: number = 4;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

function rgbSum(pixel: number[]): number {
    return pixel[0] + pixel[1] + pixel[2];
}

function channelSum(pixel: number[]): number {
    let total: number = 0;
    for (let i = 0; i < pixel.length; i++) { total += pixel[i]; }
    return total;
}

function maxChannel(pixel: number[]): number {
    let max: number = 0;
    for (let i = 0; i < pixel.length; i++) {
        if (pixel[i] > max) { max = pixel[i]; }
    }
    return max;
}

function channelDelta(first: number[], second: number[]): number {
    if (first.length !== second.length) { return -1; }
    let delta: number = 0;
    for (let i = 0; i < first.length; i++) { delta += Math.abs(first[i] - second[i]); }
    return delta;
}

function sameProbe(first: ProbeResult, second: ProbeResult): boolean {
    return first.code === second.code && first.value === second.value && first.aux === second.aux;
}

function samePixel(first: PixelProbeResult, second: PixelProbeResult): boolean {
    if (first.code !== second.code || first.value !== second.value || first.aux !== second.aux) {
        return false;
    }
    if (first.pixel.length !== second.pixel.length || first.corner.length !== second.corner.length) {
        return false;
    }
    return channelDelta(first.pixel, second.pixel) === 0 && channelDelta(first.corner, second.corner) === 0;
}

function renderRounds(red: number, green: number, blue: number, rounds: number): PixelProbeResult {
    let last: PixelProbeResult = probeRenderSolidPixel(red, green, blue, 255);
    for (let i = 1; i < rounds; i++) {
        last = probeRenderSolidPixel(red, green, blue, 255);
    }
    return last;
}

function renderAlternating(firstRed: number, firstGreen: number, firstBlue: number,
    secondRed: number, secondGreen: number, secondBlue: number, rounds: number): PixelProbeResult {
    let last: PixelProbeResult = probeRenderSolidPixel(firstRed, firstGreen, firstBlue, 255);
    for (let i = 0; i < rounds; i++) {
        last = probeRenderSolidPixel(secondRed, secondGreen, secondBlue, 255);
        last = probeRenderSolidPixel(firstRed, firstGreen, firstBlue, 255);
    }
    return last;
}

export default function nativeStableExtTest() {
    resetYieldCounter();
    describe('NativeStableExtTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0051
         * @tc.name testStable0051
         * @tc.desc 稳定：触摸工具类型两次查询，判定码与工具类型取值完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0051 begin');
            const first: ProbeResult = probeGetTouchPointToolType(0);
            const second: ProbeResult = probeGetTouchPointToolType(0);
            expect(sameProbe(first, second)).assertTrue();
            expect(second.aux).assertEqual(0);
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0051 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0052
         * @tc.name testStable0052
         * @tc.desc 稳定：横向倾角两次查询，倾角值与判定码都不漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0052 begin');
            const first: ProbeResult = probeGetTouchPointTiltX(0);
            const second: ProbeResult = probeGetTouchPointTiltX(0);
            expect(second.value).assertEqual(first.value);
            expect(second.code).assertEqual(first.code);
            expect(Number.isFinite(second.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0052 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0053
         * @tc.name testStable0053
         * @tc.desc 稳定：纵向倾角三次查询，三次倾角取值两两相等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0053 begin');
            const first: ProbeResult = probeGetTouchPointTiltY(0);
            const second: ProbeResult = probeGetTouchPointTiltY(0);
            const third: ProbeResult = probeGetTouchPointTiltY(0);
            expect(second.value).assertEqual(first.value);
            expect(third.value).assertEqual(first.value);
            expect(third.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0053 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0054
         * @tc.name testStable0054
         * @tc.desc 稳定：窗口横坐标两次查询，坐标值与判定码保持同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0054 begin');
            const first: ProbeResult = probeGetTouchPointWindowX(0);
            const second: ProbeResult = probeGetTouchPointWindowX(0);
            expect(sameProbe(first, second)).assertTrue();
            expect(second.value >= 0).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0054 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0055
         * @tc.name testStable0055
         * @tc.desc 稳定：窗口纵坐标四次查询，四次结果完全同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0055 begin');
            const baseline: ProbeResult = probeGetTouchPointWindowY(0);
            let stable: number = 0;
            for (let i = 0; i < 3; i++) {
                if (sameProbe(baseline, probeGetTouchPointWindowY(0))) { stable++; }
            }
            expect(stable).assertEqual(3);
            expect(baseline.value >= 0).assertTrue();
            expect(baseline.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0055 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0056
         * @tc.name testStable0056
         * @tc.desc 稳定：屏幕横坐标两次查询，坐标值与判定码完全相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0056 begin');
            const first: ProbeResult = probeGetTouchPointDisplayX(0);
            const second: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(first.value);
            expect(Number.isFinite(second.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0056 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0057
         * @tc.name testStable0057
         * @tc.desc 稳定：屏幕纵坐标三次查询，结果与判定码三者同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0057 begin');
            const first: ProbeResult = probeGetTouchPointDisplayY(0);
            const second: ProbeResult = probeGetTouchPointDisplayY(0);
            const third: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(second.value).assertEqual(first.value);
            expect(third.value).assertEqual(first.value);
            expect(third.aux).assertEqual(first.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0057 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0058
         * @tc.name testStable0058
         * @tc.desc 稳定：事件来源类型两次查询，来源类型取值与码都不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0058 begin');
            const first: ProbeResult = probeGetTouchEventSourceType(0);
            const second: ProbeResult = probeGetTouchEventSourceType(0);
            expect(sameProbe(first, second)).assertTrue();
            expect(second.value >= 0).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0058 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0059
         * @tc.name testStable0059
         * @tc.desc 稳定：历史点两次查询，点数与指针非空标志保持一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0059 begin');
            const first: ProbeResult = probeGetHistoricalPoints();
            const second: ProbeResult = probeGetHistoricalPoints();
            expect(sameProbe(first, second)).assertTrue();
            expect(second.value >= 0).assertTrue();
            expect(second.aux === 0 || second.aux === 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0059 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0060
         * @tc.name testStable0060
         * @tc.desc 稳定：按键事件两次查询，事件指针标志与判定码一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0060 begin');
            const first: ProbeResult = probeGetKeyEvent();
            const second: ProbeResult = probeGetKeyEvent();
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(first.value);
            expect(second.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0060 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0061
         * @tc.name testStable0061
         * @tc.desc 稳定：鼠标扩展信息两次查询，指针标志在两次调用中一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0061 begin');
            const first: ProbeResult = probeGetExtraMouseEventInfo();
            const second: ProbeResult = probeGetExtraMouseEventInfo();
            expect(sameProbe(first, second)).assertTrue();
            expect(second.value === 0 || second.value === 1).assertTrue();
            expect(second.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0061 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0062
         * @tc.name testStable0062
         * @tc.desc 稳定：修饰键位图与无障碍提供者各查两次，返回码分别一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0062 begin');
            const keysFirst: ProbeResult = probeGetMouseEventModifierKeyStates();
            const providerFirst: ProbeResult = probeGetNativeAccessibilityProvider();
            const keysSecond: ProbeResult = probeGetMouseEventModifierKeyStates();
            const providerSecond: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(keysSecond.code).assertEqual(keysFirst.code);
            expect(providerSecond.code).assertEqual(providerFirst.code);
            expect(providerSecond.value === 0 || providerSecond.value === 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0062 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0063
         * @tc.name testStable0063
         * @tc.desc 稳定：点索引零与负一各查两次，负索引被稳定拒绝而零索引稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0063 begin');
            const zeroFirst: ProbeResult = probeGetTouchPointToolType(0);
            const zeroSecond: ProbeResult = probeGetTouchPointToolType(0);
            const negativeFirst: ProbeResult = probeGetTouchPointToolType(-1);
            const negativeSecond: ProbeResult = probeGetTouchPointToolType(-1);
            expect(zeroSecond.code).assertEqual(zeroFirst.code);
            expect(negativeSecond.code).assertEqual(negativeFirst.code);
            expect(negativeSecond.aux).assertEqual(-1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0063 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0064
         * @tc.name testStable0064
         * @tc.desc 稳定：点索引零与九各查两次，附加字段精确回显点索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0064 begin');
            const zero: ProbeResult = probeGetTouchPointTiltX(0);
            const nine: ProbeResult = probeGetTouchPointTiltX(9);
            const nineAgain: ProbeResult = probeGetTouchPointTiltX(9);
            expect(zero.aux).assertEqual(0);
            expect(nine.aux).assertEqual(9);
            expect(nineAgain.value).assertEqual(nine.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0064 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0065
         * @tc.name testStable0065
         * @tc.desc 稳定：点索引一千零二十三两次查询，索引回显与判定码不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0065 begin');
            const first: ProbeResult = probeGetTouchPointTiltY(1023);
            const second: ProbeResult = probeGetTouchPointTiltY(1023);
            expect(second.code).assertEqual(first.code);
            expect(second.aux).assertEqual(1023);
            expect(Number.isFinite(second.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0065 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0066
         * @tc.name testStable0066
         * @tc.desc 稳定：点索引五的窗口横坐标三次查询，索引与坐标同时保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0066 begin');
            const first: ProbeResult = probeGetTouchPointWindowX(5);
            const second: ProbeResult = probeGetTouchPointWindowX(5);
            const third: ProbeResult = probeGetTouchPointWindowX(5);
            expect(second.value).assertEqual(first.value);
            expect(third.aux).assertEqual(5);
            expect(third.code).assertEqual(first.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0066 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0067
         * @tc.name testStable0067
         * @tc.desc 稳定：点索引三的窗口纵坐标两次查询，两次结果同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0067 begin');
            const first: ProbeResult = probeGetTouchPointWindowY(3);
            const second: ProbeResult = probeGetTouchPointWindowY(3);
            expect(sameProbe(first, second)).assertTrue();
            expect(second.aux).assertEqual(3);
            expect(isResultCode(first.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0067 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0068
         * @tc.name testStable0068
         * @tc.desc 稳定：点索引七的屏幕横坐标两次查询，索引回显与坐标不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0068 begin');
            const first: ProbeResult = probeGetTouchPointDisplayX(7);
            const second: ProbeResult = probeGetTouchPointDisplayX(7);
            expect(second.value).assertEqual(first.value);
            expect(second.aux).assertEqual(7);
            expect(second.code).assertEqual(first.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0068 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0069
         * @tc.name testStable0069
         * @tc.desc 稳定：二十阶同色长序列渲染，末次与首轮完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0069 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(80, 160, 240, 255);
            const last: PixelProbeResult = renderRounds(80, 160, 240, 20);
            expect(samePixel(first, last)).assertTrue();
            expect(last.aux).assertEqual(PROBE_BUFFER_EDGE);
            expect(channelSum(last.pixel)).assertEqual(channelSum(first.pixel));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0069 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0070
         * @tc.name testStable0070
         * @tc.desc 稳定：三十阶同色长序列渲染，回读值与角点采样始终同源
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0070 begin');
            const last: PixelProbeResult = renderRounds(15, 30, 45, 30);
            expect(channelDelta(last.pixel, last.corner)).assertEqual(0);
            expect(last.value).assertEqual(last.pixel[0]);
            expect(last.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0070 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0071
         * @tc.name testStable0071
         * @tc.desc 稳定：四十阶灰阶循环渲染，最大通道取值恒为中灰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0071 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
            const last: PixelProbeResult = renderRounds(128, 128, 128, 40);
            expect(maxChannel(last.pixel)).assertEqual(maxChannel(first.pixel));
            expect(rgbSum(last.pixel)).assertEqual(rgbSum(first.pixel));
            expect(samePixel(first, last)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0071 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0072
         * @tc.name testStable0072
         * @tc.desc 稳定：双色交替二十五轮后回甲色，结果与甲色基线一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0072 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(48, 96, 144, 255);
            const last: PixelProbeResult = renderAlternating(48, 96, 144, 144, 96, 48, 25);
            expect(samePixel(baseline, last)).assertTrue();
            expect(channelDelta(baseline.pixel, last.pixel)).assertEqual(0);
            expect(last.aux).assertEqual(baseline.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0072 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0073
         * @tc.name testStable0073
         * @tc.desc 稳定：渲染长序列每五轮插入尺寸查询，尺寸始终不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0073 begin');
            const baseline: ProbeResult = probeGetXComponentSize();
            let stable: number = 0;
            for (let i = 0; i < 20; i++) {
                probeRenderSolidPixel(i * 10, 200 - i * 10, 100, 255);
                if (i % 5 === 4 && sameProbe(baseline, probeGetXComponentSize())) { stable++; }
            }
            expect(stable).assertEqual(4);
            expect(probeGetXComponentSize().value).assertEqual(baseline.value);
            expect(isResultCode(baseline.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0073 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0074
         * @tc.name testStable0074
         * @tc.desc 稳定：渲染长序列每四轮插入偏移查询，偏移始终不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0074 begin');
            const baseline: ProbeResult = probeGetXComponentOffset();
            let stable: number = 0;
            for (let i = 0; i < 16; i++) {
                probeRenderSolidPixel(200 - i * 5, 50, i * 5, 255);
                if (i % 4 === 3 && sameProbe(baseline, probeGetXComponentOffset())) { stable++; }
            }
            expect(stable).assertEqual(4);
            expect(probeGetXComponentOffset().aux).assertEqual(baseline.aux);
            expect(Number.isFinite(baseline.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0074 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0075
         * @tc.name testStable0075
         * @tc.desc 稳定：渲染每三轮插入动画调用，十五轮后像素仍与基线一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0075 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(64, 64, 64, 255);
            let renders: number = 0;
            for (let i = 0; i < 15; i++) {
                probeRenderSolidPixel(64, 64, 64, 255);
                renders++;
                if (i % 3 === 2) { animate(); }
            }
            const last: PixelProbeResult = probeRenderSolidPixel(64, 64, 64, 255);
            expect(renders).assertEqual(15);
            expect(samePixel(baseline, last)).assertTrue();
            expect(last.aux).assertEqual(PROBE_BUFFER_EDGE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0075 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0076
         * @tc.name testStable0076
         * @tc.desc 稳定：渲染每两轮插入形状切换，十轮后形状可控并复位归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0076 begin');
            let matched: number = 0;
            for (let i = 0; i < 10; i++) {
                probeRenderSolidPixel(70, 140, 210, 255);
                if (i % 2 === 1) {
                    changeShape(i % 3);
                    if (getShapeIndex() === i % 3) { matched++; }
                }
            }
            expect(matched).assertEqual(5);
            animate();
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(probeRenderSolidPixel(70, 140, 210, 255).aux).assertEqual(PROBE_BUFFER_EDGE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0076 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0077
         * @tc.name testStable0077
         * @tc.desc 稳定：尺寸偏移渲染形状动画五元循环十轮，五项不变量全保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0077 begin');
            const sizeBase: ProbeResult = probeGetXComponentSize();
            const offsetBase: ProbeResult = probeGetXComponentOffset();
            let shapeOk: number = 0;
            let geometryOk: number = 0;
            for (let i = 0; i < 10; i++) {
                probeRenderSolidPixel(40, 80, 120, 255);
                changeShape(i % 3);
                if (getShapeIndex() === i % 3) { shapeOk++; }
                animate();
                const sizeSame: boolean = sameProbe(sizeBase, probeGetXComponentSize());
                const offsetSame: boolean = sameProbe(offsetBase, probeGetXComponentOffset());
                if (sizeSame && offsetSame) {
                    geometryOk++;
                }
            }
            expect(shapeOk).assertEqual(10);
            expect(geometryOk).assertEqual(10);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0077 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0078
         * @tc.name testStable0078
         * @tc.desc 稳定：加入标识查询的六元循环八轮，标识串尺寸偏移均不漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0078 begin');
            const idBase: ProbeIdResult = probeGetXComponentId();
            const sizeBase: ProbeResult = probeGetXComponentSize();
            let stable: number = 0;
            for (let i = 0; i < 8; i++) {
                probeRenderSolidPixel(90, 45, 135, 255);
                changeShape(i % 2);
                animate();
                const sizeNow: ProbeResult = probeGetXComponentSize();
                const idNow: ProbeIdResult = probeGetXComponentId();
                const idSame: boolean = idNow.id === idBase.id && idNow.value === idBase.value;
                if (sameProbe(sizeBase, sizeNow) && idSame) {
                    stable++;
                }
            }
            expect(stable).assertEqual(8);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(idBase.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0078 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0079
         * @tc.name testStable0079
         * @tc.desc 稳定：回调注册与点查询交替六轮，注册码与查询码每轮保持同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0079 begin');
            const registerBase: ProbeResult = probeRegisterCallback();
            let stable: number = 0;
            for (let i = 0; i < 6; i++) {
                const registered: ProbeResult = probeRegisterCallback();
                const toolType: ProbeResult = probeGetTouchPointToolType(0);
                if (registered.code === registerBase.code && toolType.code === probeGetTouchPointToolType(0).code) {
                    stable++;
                }
            }
            expect(stable).assertEqual(6);
            expect(isResultCode(registerBase.code)).assertTrue();
            expect(probeGetTouchPointToolType(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0079 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0080
         * @tc.name testStable0080
         * @tc.desc 稳定：帧率设置与尺寸查询交替六轮，两类返回码各自不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0080 begin');
            const rateBase: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 45);
            const sizeBase: ProbeResult = probeGetXComponentSize();
            let stable: number = 0;
            for (let i = 0; i < 6; i++) {
                const rateNow: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 45);
                const sizeNow: ProbeResult = probeGetXComponentSize();
                if (rateNow.code === rateBase.code && sameProbe(sizeBase, sizeNow)) { stable++; }
            }
            expect(stable).assertEqual(6);
            expect(rateBase.value).assertEqual(30);
            expect(rateBase.aux).assertEqual(60);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0080 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0081
         * @tc.name testStable0081
         * @tc.desc 稳定：渲染形状渲染查询四步五轮，每轮像素与形状均一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0081 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(25, 50, 75, 255);
            let pixelOk: number = 0;
            let shapeOk: number = 0;
            for (let i = 0; i < 5; i++) {
                probeRenderSolidPixel(75, 50, 25, 255);
                changeShape(i % 4);
                const pixelNow: PixelProbeResult = probeRenderSolidPixel(25, 50, 75, 255);
                if (samePixel(baseline, pixelNow)) { pixelOk++; }
                if (getShapeIndex() === i % 4) { shapeOk++; }
                probeGetHistoricalPoints();
            }
            expect(pixelOk).assertEqual(5);
            expect(shapeOk).assertEqual(5);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0081 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0082
         * @tc.name testStable0082
         * @tc.desc 稳定：十接口串联一轮重复五轮，逐轮与本轮首轮的返回码相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0082 begin');
            const sizeBase: ProbeResult = probeGetXComponentSize();
            const offsetBase: ProbeResult = probeGetXComponentOffset();
            const pixelBase: PixelProbeResult = probeRenderSolidPixel(1, 2, 3, 255);
            let stable: number = 0;
            for (let i = 0; i < 5; i++) {
                const sizeNow: ProbeResult = probeGetXComponentSize();
                const offsetNow: ProbeResult = probeGetXComponentOffset();
                const pixelNow: PixelProbeResult = probeRenderSolidPixel(1, 2, 3, 255);
                changeShape(8);
                const shapeNow: number = getShapeIndex();
                animate();
                probeRegisterSurfaceShowCallback();
                probeGetTouchEventSourceType(0);
                probeGetKeyEvent();
                probeGetNativeAccessibilityProvider();
                probeSetNeedSoftKeyboard(0);
                if (sameProbe(sizeBase, sizeNow) && sameProbe(offsetBase, offsetNow) &&
                    samePixel(pixelBase, pixelNow) && shapeNow === 8) {
                    stable++;
                }
            }
            expect(stable).assertEqual(5);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(probeGetXComponentSize().value).assertEqual(sizeBase.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0082 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0083
         * @tc.name testStable0083
         * @tc.desc 稳定：标识尺寸偏移三查循环八轮，三元组与标识串均不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0083 begin');
            const idBase: ProbeIdResult = probeGetXComponentId();
            const sizeBase: ProbeResult = probeGetXComponentSize();
            const offsetBase: ProbeResult = probeGetXComponentOffset();
            let stable: number = 0;
            for (let i = 0; i < 8; i++) {
                const idNow: ProbeIdResult = probeGetXComponentId();
                const sizeNow: ProbeResult = probeGetXComponentSize();
                const offsetNow: ProbeResult = probeGetXComponentOffset();
                if (idNow.id === idBase.id && sameProbe(sizeBase, sizeNow) && sameProbe(offsetBase, offsetNow)) {
                    stable++;
                }
            }
            expect(stable).assertEqual(8);
            expect(idBase.id.length >= 0).assertTrue();
            expect(sizeBase.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0083 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0084
         * @tc.name testStable0084
         * @tc.desc 稳定：上下文获取与渲染交替六轮，上下文键数与应用上下文键数均不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0084 begin');
            const appKeysBase: number = Object.getOwnPropertyNames(GetContext(0)).length;
            const pageKeysBase: number = Object.getOwnPropertyNames(GetContext(1)).length;
            const pixelBase: PixelProbeResult = probeRenderSolidPixel(44, 88, 132, 255);
            let stable: number = 0;
            for (let i = 0; i < 6; i++) {
                const appKeys: number = Object.getOwnPropertyNames(GetContext(0)).length;
                const pageKeys: number = Object.getOwnPropertyNames(GetContext(1)).length;
                const pixelNow: PixelProbeResult = probeRenderSolidPixel(44, 88, 132, 255);
                if (appKeys === appKeysBase && pageKeys === pageKeysBase && samePixel(pixelBase, pixelNow)) {
                    stable++;
                }
            }
            expect(stable).assertEqual(6);
            expect(appKeysBase > 0).assertTrue();
            expect(pageKeysBase > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0084 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0085
         * @tc.name testStable0085
         * @tc.desc 稳定：九种回调注册重复两轮，同一回调两轮判定码相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0085 begin');
            const roundOne: number[] = [
                probeRegisterCallback().code, probeRegisterMouseEventCallback().code,
                probeRegisterFocusEventCallback().code, probeRegisterBlurEventCallback().code,
                probeRegisterKeyEventCallback().code, probeRegisterKeyEventCallbackWithResult().code,
                probeRegisterOnFrameCallback().code, probeUnregisterOnFrameCallback().code,
                probeRegisterSurfaceHideCallback().code
            ];
            const roundTwo: number[] = [
                probeRegisterCallback().code, probeRegisterMouseEventCallback().code,
                probeRegisterFocusEventCallback().code, probeRegisterBlurEventCallback().code,
                probeRegisterKeyEventCallback().code, probeRegisterKeyEventCallbackWithResult().code,
                probeRegisterOnFrameCallback().code, probeUnregisterOnFrameCallback().code,
                probeRegisterSurfaceHideCallback().code
            ];
            let matched: number = 0;
            for (let i = 0; i < roundOne.length; i++) {
                if (roundOne[i] === roundTwo[i]) { matched++; }
            }
            expect(matched).assertEqual(9);
            expect(roundOne.length).assertEqual(9);
            expect(isResultCode(roundTwo[0])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0085 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0086
         * @tc.name testStable0086
         * @tc.desc 稳定：十二种查询重复三轮，每轮同一查询的前后两次结果相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0086 begin');
            let matched: number = 0;
            for (let round = 0; round < 3; round++) {
                if (sameProbe(probeGetTouchPointToolType(0), probeGetTouchPointToolType(0))) { matched++; }
                if (sameProbe(probeGetTouchPointTiltX(0), probeGetTouchPointTiltX(0))) { matched++; }
                if (sameProbe(probeGetTouchPointTiltY(0), probeGetTouchPointTiltY(0))) { matched++; }
                if (sameProbe(probeGetTouchPointWindowX(0), probeGetTouchPointWindowX(0))) { matched++; }
                if (sameProbe(probeGetTouchPointWindowY(0), probeGetTouchPointWindowY(0))) { matched++; }
                if (sameProbe(probeGetTouchPointDisplayX(0), probeGetTouchPointDisplayX(0))) { matched++; }
                if (sameProbe(probeGetTouchPointDisplayY(0), probeGetTouchPointDisplayY(0))) { matched++; }
                if (sameProbe(probeGetTouchEventSourceType(0), probeGetTouchEventSourceType(0))) { matched++; }
                if (sameProbe(probeGetHistoricalPoints(), probeGetHistoricalPoints())) { matched++; }
                if (sameProbe(probeGetKeyEvent(), probeGetKeyEvent())) { matched++; }
                if (sameProbe(probeGetExtraMouseEventInfo(), probeGetExtraMouseEventInfo())) { matched++; }
                const providerFirst: ProbeResult = probeGetNativeAccessibilityProvider();
                const providerSecond: ProbeResult = probeGetNativeAccessibilityProvider();
                if (sameProbe(providerFirst, providerSecond)) { matched++; }
            }
            expect(matched).assertEqual(36);
            expect(isResultCode(probeGetHistoricalPoints().code)).assertTrue();
            expect(probeGetTouchEventSourceType(0).aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0086 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0087
         * @tc.name testStable0087
         * @tc.desc 恢复：形状切换后复位再次渲染，像素与复位前基线一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0087 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(60, 120, 180, 255);
            changeShape(5);
            probeRenderSolidPixel(180, 120, 60, 255);
            changeShape(0);
            const restored: PixelProbeResult = probeRenderSolidPixel(60, 120, 180, 255);
            expect(samePixel(baseline, restored)).assertTrue();
            expect(getShapeIndex()).assertEqual(0);
            expect(channelDelta(baseline.pixel, restored.pixel)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0087 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0088
         * @tc.name testStable0088
         * @tc.desc 恢复：越界渲染被拒后立即回退合法参数，像素正常落地
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0088 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(400, 0, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(200, 100, 50, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rgbSum(rejected.pixel)).assertEqual(0);
            expect(recovered.code === RESULT_BAD_PARAMETER).assertFalse();
            expect(recovered.pixel.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0088 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0089
         * @tc.name testStable0089
         * @tc.desc 恢复：连续十次越界拒绝后合法渲染，返回码与结构不再异常
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0089 begin');
            let rejectedCount: number = 0;
            for (let i = 0; i < 10; i++) {
                if (probeRenderSolidPixel(-1, -1, -1, -1).code === RESULT_BAD_PARAMETER) { rejectedCount++; }
            }
            const recovered: PixelProbeResult = probeRenderSolidPixel(128, 64, 32, 255);
            expect(rejectedCount).assertEqual(10);
            expect(recovered.code === RESULT_BAD_PARAMETER).assertFalse();
            expect(recovered.aux).assertEqual(PROBE_BUFFER_EDGE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0089 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0090
         * @tc.name testStable0090
         * @tc.desc 恢复：形状零到九循环后渲染，像素仍与初始基线一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0090 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(33, 66, 99, 255);
            for (let i = 0; i < 10; i++) {
                changeShape(i);
            }
            changeShape(0);
            const restored: PixelProbeResult = probeRenderSolidPixel(33, 66, 99, 255);
            expect(samePixel(baseline, restored)).assertTrue();
            expect(maxChannel(restored.pixel)).assertEqual(maxChannel(baseline.pixel));
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0090 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0091
         * @tc.name testStable0091
         * @tc.desc 恢复：全量回调注册后渲染，像素与注册前基线保持同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0091 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(111, 222, 33, 255);
            probeRegisterCallback();
            probeRegisterMouseEventCallback();
            probeRegisterFocusEventCallback();
            probeRegisterBlurEventCallback();
            probeRegisterKeyEventCallback();
            probeRegisterOnFrameCallback();
            probeRegisterSurfaceShowCallback();
            probeRegisterSurfaceHideCallback();
            probeRegisterOnTouchInterceptCallback();
            probeRegisterUIInputEventCallback(1);
            const after: PixelProbeResult = probeRenderSolidPixel(111, 222, 33, 255);
            expect(samePixel(baseline, after)).assertTrue();
            expect(after.aux).assertEqual(PROBE_BUFFER_EDGE);
            expect(channelSum(after.corner)).assertEqual(channelSum(baseline.corner));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0091 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0092
         * @tc.name testStable0092
         * @tc.desc 恢复：帧率与键盘设置后渲染，像素与设置前基线一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0092 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(9, 99, 199, 255);
            probeSetExpectedFrameRateRange(15, 120, 60);
            probeSetNeedSoftKeyboard(1);
            probeSetNeedSoftKeyboard(0);
            const after: PixelProbeResult = probeRenderSolidPixel(9, 99, 199, 255);
            expect(samePixel(baseline, after)).assertTrue();
            expect(after.value).assertEqual(baseline.value);
            expect(isResultCode(after.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0092 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0093
         * @tc.name testStable0093
         * @tc.desc 恢复：混合长序列结束后重查标识与尺寸，均与序列开始前一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0093 begin');
            const idBase: ProbeIdResult = probeGetXComponentId();
            const sizeBase: ProbeResult = probeGetXComponentSize();
            for (let i = 0; i < 12; i++) {
                probeRenderSolidPixel(i * 20, 128, 255 - i * 20, 255);
                changeShape(i % 5);
                animate();
                probeGetTouchPointToolType(0);
                probeSetNeedSoftKeyboard(i % 2);
            }
            const idNow: ProbeIdResult = probeGetXComponentId();
            const sizeNow: ProbeResult = probeGetXComponentSize();
            expect(idNow.id).assertEqual(idBase.id);
            expect(idNow.value).assertEqual(idBase.value);
            expect(sameProbe(sizeBase, sizeNow)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0093 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0094
         * @tc.name testStable0094
         * @tc.desc 恢复：长序列结束后形状归零，再次切换仍能正常生效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0094 begin');
            for (let i = 0; i < 20; i++) {
                changeShape(i % 7);
            }
            changeShape(0);
            const zero: number = getShapeIndex();
            changeShape(6);
            const switched: number = getShapeIndex();
            expect(zero).assertEqual(0);
            expect(switched).assertEqual(6);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0094 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0095
         * @tc.name testStable0095
         * @tc.desc 汇总：二十次渲染的全部判定码均落在合法域内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0095 begin');
            let validCodes: number = 0;
            for (let i = 0; i < 20; i++) {
                const pixel: PixelProbeResult = probeRenderSolidPixel(i * 12, 128, 128, 255);
                if (isResultCode(pixel.code)) { validCodes++; }
            }
            expect(validCodes).assertEqual(20);
            expect(probeRenderSolidPixel(0, 128, 128, 255).pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(probeRenderSolidPixel(240, 128, 128, 255).code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0095 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0096
         * @tc.name testStable0096
         * @tc.desc 汇总：三十次渲染的表面边长恒为四，无一次异常膨胀
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0096 begin');
            let matched: number = 0;
            for (let i = 0; i < 30; i++) {
                if (probeRenderSolidPixel(255 - i * 8, i * 8, 128, 255).aux === PROBE_BUFFER_EDGE) { matched++; }
            }
            expect(matched).assertEqual(30);
            expect(probeRenderSolidPixel(0, 0, 0, 255).aux).assertEqual(PROBE_BUFFER_EDGE);
            expect(PROBE_BUFFER_EDGE).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0096 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0097
         * @tc.name testStable0097
         * @tc.desc 汇总：连续三十二次读取形状索引，取值恒等于末次设定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0097 begin');
            changeShape(5);
            let matched: number = 0;
            for (let i = 0; i < 32; i++) {
                if (getShapeIndex() === 5) { matched++; }
            }
            expect(matched).assertEqual(32);
            expect(getShapeIndex()).assertEqual(5);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0097 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0098
         * @tc.name testStable0098
         * @tc.desc 汇总：连续十六次尺寸查询，宽高与判定码每次相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0098 begin');
            const baseline: ProbeResult = probeGetXComponentSize();
            let stable: number = 0;
            for (let i = 0; i < 16; i++) {
                if (sameProbe(baseline, probeGetXComponentSize())) { stable++; }
            }
            expect(stable).assertEqual(16);
            expect(baseline.aux >= 0).assertTrue();
            expect(baseline.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0098 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0099
         * @tc.name testStable0099
         * @tc.desc 汇总：连续十六次偏移查询，横纵坐标每次相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0099 begin');
            const baseline: ProbeResult = probeGetXComponentOffset();
            let stable: number = 0;
            for (let i = 0; i < 16; i++) {
                if (probeGetXComponentOffset().value === baseline.value) { stable++; }
            }
            expect(stable).assertEqual(16);
            expect(probeGetXComponentOffset().aux).assertEqual(baseline.aux);
            expect(Number.isFinite(baseline.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0099 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0100
         * @tc.name testStable0100
         * @tc.desc 汇总：终态收敛校验，形状归零且尺寸偏移渲染三项均稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0100 begin');
            changeShape(0);
            const sizeOne: ProbeResult = probeGetXComponentSize();
            const sizeTwo: ProbeResult = probeGetXComponentSize();
            const offsetOne: ProbeResult = probeGetXComponentOffset();
            const offsetTwo: ProbeResult = probeGetXComponentOffset();
            const pixel: PixelProbeResult = probeRenderSolidPixel(100, 150, 200, 255);
            expect(getShapeIndex()).assertEqual(0);
            expect(sameProbe(sizeOne, sizeTwo)).assertTrue();
            expect(sameProbe(offsetOne, offsetTwo)).assertTrue();
            expect(pixel.aux).assertEqual(PROBE_BUFFER_EDGE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0100 end');
        });
    });
}
