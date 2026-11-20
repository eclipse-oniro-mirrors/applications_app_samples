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
    probeRegisterOnFrameCallback, probeUnregisterOnFrameCallback,
    probeRegisterSurfaceShowCallback, probeRegisterSurfaceHideCallback,
    probeRegisterOnTouchInterceptCallback, probeRegisterUIInputEventCallback,
    probeGetKeyEventAction, probeGetKeyEventCode
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
const CHANNEL_MAX: number = 255;
const PIXEL_SIZE: number = 4;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

// OH_NativeXComponent_RegisterUIInputEventCallback 返回 ArkUI 错误码域，
// 与 OH_NativeXComponent_ResultCode（0/-1/-2）不是同一集合：0 表示成功，401 表示参数非法
const ARKUI_NO_ERROR: number = 0;
const ARKUI_PARAM_INVALID: number = 401;

function isArkuiErrorCode(code: number): boolean { return code === ARKUI_NO_ERROR || code === ARKUI_PARAM_INVALID; }

// 采样与角点都是 RGBA 四通道，末位 alpha 恒为 255，
// 色彩最值与一致性只能看前三通道，否则 alpha 会掩盖真实色彩关系
function rgbMax(pixel: number[]): number {
    let max: number = 0;
    for (let i = 0; i < 3 && i < pixel.length; i++) { if (pixel[i] > max) { max = pixel[i]; } }
    return max;
}

function isRgbEqual(pixel: number[]): boolean {
    for (let i = 1; i < 3 && i < pixel.length; i++) { if (pixel[i] !== pixel[0]) { return false; } }
    return true;
}

function rgbSum(pixel: number[]): number { return pixel[0] + pixel[1] + pixel[2]; }

function channelSum(pixel: number[]): number {
    let total: number = 0;
    for (let i = 0; i < pixel.length; i++) { total += pixel[i]; }
    return total;
}

function isAllEqual(pixel: number[]): boolean {
    for (let i = 1; i < pixel.length; i++) { if (pixel[i] !== pixel[0]) { return false; } }
    return true;
}

function isGrayBalanced(pixel: number[]): boolean {
    return pixel.length === CHANNEL_COUNT && pixel[0] === pixel[1] && pixel[1] === pixel[2];
}

function countAbove(pixel: number[], limit: number): number {
    let count: number = 0;
    for (let i = 0; i < pixel.length; i++) { if (pixel[i] > limit) { count++; } }
    return count;
}

function distinctValues(pixel: number[]): number {
    const seen: number[] = [];
    for (let i = 0; i < pixel.length; i++) { if (seen.indexOf(pixel[i]) < 0) { seen.push(pixel[i]); } }
    return seen.length;
}

function channelDelta(first: number[], second: number[]): number {
    if (first.length !== second.length) { return -1; }
    let delta: number = 0;
    for (let i = 0; i < first.length; i++) { delta += Math.abs(first[i] - second[i]); }
    return delta;
}

function describePixel(pixel: number[]): string { return pixel.join('/'); }

function maxChannel(pixel: number[]): number {
    let max: number = 0;
    for (let i = 0; i < pixel.length; i++) { if (pixel[i] > max) { max = pixel[i]; } }
    return max;
}

function minChannel(pixel: number[]): number {
    if (pixel.length === 0) { return -1; }
    let min: number = pixel[0];
    for (let i = 1; i < pixel.length; i++) { if (pixel[i] < min) { min = pixel[i]; } }
    return min;
}

function isChannelInRange(pixel: number[]): boolean {
    for (let i = 0; i < pixel.length; i++) { if (pixel[i] < 0 || pixel[i] > CHANNEL_MAX) { return false; } }
    return true;
}

function isDominant(pixel: number[], index: number): boolean {
    for (let i = 0; i < pixel.length - 1; i++) { if (i !== index && pixel[index] <= pixel[i]) { return false; } }
    return true;
}

function isRejected(result: PixelProbeResult): boolean {
    return result.code === RESULT_BAD_PARAMETER && result.pixel.length === CHANNEL_COUNT && rgbSum(result.pixel) === 0;
}

export default function nativePixelExtTest() {
    resetYieldCounter();
    describe('NativePixelExtTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0101
         * @tc.name testPixel0101
         * @tc.desc 非法：红通道二百五十六越界，判参数错误且不产生任何渲染分量
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0101 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(256, 0, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.pixel.length).assertEqual(PIXEL_SIZE);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0101 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0102
         * @tc.name testPixel0102
         * @tc.desc 非法：红通道负一越界，四通道回退为全零且两点一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0102 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-1, 0, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(isAllEqual(pixel.pixel)).assertTrue();
            expect(maxChannel(pixel.pixel)).assertEqual(0);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0102 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0103
         * @tc.name testPixel0103
         * @tc.desc 非法：红通道负一百越界，通道和为零且回读值为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0103 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-100, 0, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(channelSum(pixel.pixel)).assertEqual(0);
            expect(pixel.value).assertEqual(0);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0103 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0104
         * @tc.name testPixel0104
         * @tc.desc 非法：红通道一千越界，四通道取值唯一且结构完整
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0104 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(1000, 0, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(distinctValues(pixel.pixel)).assertEqual(1);
            expect(pixel.corner.length).assertEqual(PIXEL_SIZE);
            expect(describePixel(pixel.pixel)).assertEqual('0/0/0/0');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0104 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0105
         * @tc.name testPixel0105
         * @tc.desc 非法：绿通道二百五十六越界，非零通道数为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0105 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 256, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(countAbove(pixel.pixel, 0)).assertEqual(0);
            expect(minChannel(pixel.pixel)).assertEqual(0);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0105 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0106
         * @tc.name testPixel0106
         * @tc.desc 非法：绿通道负一越界，采样与角点同步归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0106 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, -1, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(maxChannel(pixel.corner)).assertEqual(0);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0106 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0107
         * @tc.name testPixel0107
         * @tc.desc 非法：绿通道负一千越界，描述串为四个零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0107 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, -1000, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(describePixel(pixel.pixel)).assertEqual('0/0/0/0');
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0107 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0108
         * @tc.name testPixel0108
         * @tc.desc 非法：蓝通道二百五十六越界，两点差异为零且通道在域内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0108 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 256, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(channelSum(pixel.pixel)).assertEqual(0);
            expect(isChannelInRange(pixel.corner)).assertTrue();
            expect(pixel.corner[2]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0108 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0109
         * @tc.name testPixel0109
         * @tc.desc 非法：蓝通道负五越界，四通道唯一取值且首通道为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0109 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, -5, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(distinctValues(pixel.pixel)).assertEqual(1);
            expect(pixel.pixel[0]).assertEqual(0);
            expect(isAllEqual(pixel.corner)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0109 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0110
         * @tc.name testPixel0110
         * @tc.desc 非法：透明通道二百五十六越界，末通道回读为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0110 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 256);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(pixel.pixel[3]).assertEqual(0);
            expect(maxChannel(pixel.pixel)).assertEqual(0);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0110 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0111
         * @tc.name testPixel0111
         * @tc.desc 非法：透明通道负一越界，回读值与通道和同为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0111 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, -1);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(pixel.value).assertEqual(channelSum(pixel.pixel));
            expect(rgbSum(pixel.corner)).assertEqual(0);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0111 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0112
         * @tc.name testPixel0112
         * @tc.desc 非法：四通道同时越界为二百五十六，整次调用被拒且无部分渲染
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0112 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(256, 256, 256, 256);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(countAbove(pixel.pixel, 0)).assertEqual(0);
            expect(countAbove(pixel.corner, 0)).assertEqual(0);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0112 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0113
         * @tc.name testPixel0113
         * @tc.desc 非法：四通道同时越界为负一，通道和与描述串均为零值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0113 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-1, -1, -1, -1);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(channelSum(pixel.pixel)).assertEqual(0);
            expect(describePixel(pixel.corner)).assertEqual('0/0/0/0');
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0113 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0114
         * @tc.name testPixel0114
         * @tc.desc 非法：仅红通道越界而其余合法，整次拒渲而非局部生效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0114 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(256, 128, 128, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(pixel.pixel[1]).assertEqual(0);
            expect(pixel.pixel[2]).assertEqual(0);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0114 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0115
         * @tc.name testPixel0115
         * @tc.desc 非法：仅绿通道越界而红蓝合法，整次拒渲且回读为空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0115 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 256, 128, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(isAllEqual(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(0);
            expect(pixel.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0115 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0116
         * @tc.name testPixel0116
         * @tc.desc 非法：仅蓝通道越界而红绿合法，拒渲后四通道均零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0116 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 128, 256, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(maxChannel(pixel.pixel)).assertEqual(0);
            expect(distinctValues(pixel.pixel)).assertEqual(1);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0116 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0117
         * @tc.name testPixel0117
         * @tc.desc 非法：仅透明通道越界而 RGB 合法，拒渲后 RGB 也不落地
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0117 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 256);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.pixel[3]).assertEqual(0);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0117 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0118
         * @tc.name testPixel0118
         * @tc.desc 非法：负二越界紧邻合法下界，拒渲且回读全零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0118 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-2, -2, -2, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(channelSum(pixel.pixel)).assertEqual(0);
            expect(minChannel(pixel.pixel)).assertEqual(0);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0118 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0119
         * @tc.name testPixel0119
         * @tc.desc 非法：四通道均为三百越界，角点与采样同为四零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0119 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(300, 300, 300, 300);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(describePixel(pixel.corner)).assertEqual('0/0/0/0');
            expect(isAllEqual(pixel.pixel)).assertTrue();
            expect(pixel.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0119 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0120
         * @tc.name testPixel0120
         * @tc.desc 非法：RGB 满值而透明通道二百五十六越界，仍判参数错误
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0120 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 256);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0120 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0121
         * @tc.name testPixel0121
         * @tc.desc 截断：二百五十五点九向下取整为满值，四通道同为最大
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0121 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255.9, 255.9, 255.9, 255.9);
            expect(pixel.pixel[0]).assertEqual(CHANNEL_MAX);
            expect(maxChannel(pixel.pixel)).assertEqual(CHANNEL_MAX);
            expect(isAllEqual(pixel.pixel)).assertTrue();
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0121 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0122
         * @tc.name testPixel0122
         * @tc.desc 截断：零点九向下取整为零，通道和为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0122 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0.9, 0.9, 0.9, 255);
            expect(pixel.pixel[0]).assertEqual(0);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.value).assertEqual(0);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0122 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0123
         * @tc.name testPixel0123
         * @tc.desc 截断：一百二十八点五向下取整为一百二十八
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0123 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128.5, 128.5, 128.5, 255);
            expect(pixel.pixel[0]).assertEqual(128);
            expect(pixel.pixel[1]).assertEqual(128);
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0123 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0124
         * @tc.name testPixel0124
         * @tc.desc 截断：一百二十七点九九九向下取整为一百二十七
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0124 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(127.999, 127.999, 127.999, 255);
            expect(pixel.pixel[0]).assertEqual(127);
            expect(maxChannel(pixel.pixel)).assertEqual(255);
            expect(pixel.pixel[0] < 128).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0124 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0125
         * @tc.name testPixel0125
         * @tc.desc 截断：负零点五取整为零，不判越界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0125 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-0.5, -0.5, -0.5, 255);
            expect(pixel.code).assertEqual(RESULT_SUCCESS);
            expect(pixel.pixel[0]).assertEqual(0);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0125 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0126
         * @tc.name testPixel0126
         * @tc.desc 截断：一二三点七向下取整为一二三，三通道依次递增
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0126 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(1.7, 2.7, 3.7, 255);
            expect(pixel.pixel[0]).assertEqual(1);
            expect(pixel.pixel[1]).assertEqual(2);
            expect(pixel.pixel[2]).assertEqual(3);
            expect(pixel.pixel[0] < pixel.pixel[2]).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0126 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0127
         * @tc.name testPixel0127
         * @tc.desc 截断：二百四十九点九向下取整为二百四十九
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0127 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(249.9, 0, 0, 255);
            expect(pixel.pixel[0]).assertEqual(249);
            expect(pixel.pixel[0] < 250).assertTrue();
            expect(isDominant(pixel.pixel, 0)).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0127 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0128
         * @tc.name testPixel0128
         * @tc.desc 截断：二百五十五点四仍落在合法域，取整为满值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0128 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255.4, 255.4, 255.4, 255);
            expect(pixel.pixel[0]).assertEqual(CHANNEL_MAX);
            expect(countAbove(pixel.pixel, 254)).assertEqual(4);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0128 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0129
         * @tc.name testPixel0129
         * @tc.desc 截断：一千零二十三点九取整后越过上界，判参数错误
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0129 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(1023.9, 0, 0, 255);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.corner[0]).assertEqual(0);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0129 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0130
         * @tc.name testPixel0130
         * @tc.desc 截断：负零点零零零一取整为零，仍在合法下界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0130 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-0.0001, 0, 0, 255);
            expect(pixel.code).assertEqual(RESULT_SUCCESS);
            expect(pixel.pixel[0]).assertEqual(0);
            expect(minChannel(pixel.pixel)).assertEqual(0);
            expect(pixel.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0130 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0131
         * @tc.name testPixel0131
         * @tc.desc 恢复：红通道越界后立即渲染纯绿，绿通道正常落地
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0131 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(256, 0, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(0, 255, 0, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.code).assertEqual(RESULT_SUCCESS);
            expect(recovered.pixel[1]).assertEqual(CHANNEL_MAX);
            expect(recovered.pixel[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0131 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0132
         * @tc.name testPixel0132
         * @tc.desc 恢复：负值越界后立即渲染纯红，红通道正常落地
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0132 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(-1, 0, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            expect(rejected.pixel[0]).assertEqual(0);
            expect(recovered.code).assertEqual(RESULT_SUCCESS);
            expect(recovered.pixel[0]).assertEqual(CHANNEL_MAX);
            expect(isDominant(recovered.pixel, 0)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0132 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0133
         * @tc.name testPixel0133
         * @tc.desc 恢复：绿通道越界后立即渲染纯蓝，蓝通道正常落地
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0133 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, 300, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
            expect(rejected.pixel[1]).assertEqual(0);
            expect(recovered.code).assertEqual(RESULT_SUCCESS);
            expect(recovered.pixel[2]).assertEqual(CHANNEL_MAX);
            expect(isDominant(recovered.pixel, 2)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0133 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0134
         * @tc.name testPixel0134
         * @tc.desc 恢复：透明通道越界后立即渲染纯白，四通道满值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0134 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 300);
            const recovered: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.code).assertEqual(RESULT_SUCCESS);
            expect(isAllEqual(recovered.pixel)).assertTrue();
            expect(maxChannel(recovered.pixel)).assertEqual(CHANNEL_MAX);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0134 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0135
         * @tc.name testPixel0135
         * @tc.desc 恢复：全通道越界后立即渲染中灰，三通道平衡
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0135 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(999, 999, 999, 999);
            const recovered: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0]).assertEqual(128);
            expect(recovered.pixel[0]).assertEqual(recovered.pixel[2]);
            expect(channelDelta(recovered.pixel, recovered.corner)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0135 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0136
         * @tc.name testPixel0136
         * @tc.desc 恢复：两次连续越界后渲染纯黄，前两通道同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0136 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(256, 0, 0, 255);
            const second: PixelProbeResult = probeRenderSolidPixel(0, 256, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(255, 255, 0, 255);
            expect(first.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(second.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0]).assertEqual(recovered.pixel[1]);
            expect(recovered.pixel[2]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0136 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0137
         * @tc.name testPixel0137
         * @tc.desc 恢复：越界后渲染纯青，后两通道同值且首通道为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0137 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, 0, 999, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(0, 255, 255, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[1]).assertEqual(recovered.pixel[2]);
            expect(recovered.pixel[0]).assertEqual(0);
            expect(isChannelInRange(recovered.pixel)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0137 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0138
         * @tc.name testPixel0138
         * @tc.desc 恢复：越界后渲染品红，首末通道同值且中通道为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0138 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(-9, 0, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(255, 0, 255, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0]).assertEqual(recovered.pixel[2]);
            expect(recovered.pixel[1]).assertEqual(0);
            expect(maxChannel(recovered.pixel)).assertEqual(CHANNEL_MAX);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0138 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0139
         * @tc.name testPixel0139
         * @tc.desc 恢复：越界后渲染递增色，通道严格递增且和可推
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0139 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, -1000, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(10, 20, 30, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0] < recovered.pixel[1]).assertTrue();
            expect(recovered.pixel[1] < recovered.pixel[2]).assertTrue();
            expect(rgbSum(recovered.pixel)).assertEqual(60);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0139 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0140
         * @tc.name testPixel0140
         * @tc.desc 恢复：越界后渲染递减色，通道严格递减且最大值在首通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0140 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(1024, 0, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(30, 20, 10, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0] > recovered.pixel[1]).assertTrue();
            expect(recovered.pixel[1] > recovered.pixel[2]).assertTrue();
            expect(isDominant(recovered.pixel, 0)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0140 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0141
         * @tc.name testPixel0141
         * @tc.desc 恢复：越界后渲染近黑，通道和等于设定值且 RGB 三点一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0141 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, -256);
            const recovered: PixelProbeResult = probeRenderSolidPixel(1, 1, 1, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rgbSum(recovered.pixel)).assertEqual(3);
            expect(recovered.pixel[0]).assertEqual(1);
            expect(isRgbEqual(recovered.corner)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0141 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0142
         * @tc.name testPixel0142
         * @tc.desc 恢复：越界后渲染近白，最小通道不低于二百五十四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0142 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(256, 256, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(254, 254, 254, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0]).assertEqual(254);
            expect(minChannel(recovered.pixel) >= 254).assertTrue();
            expect(isChannelInRange(recovered.pixel)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0142 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0143
         * @tc.name testPixel0143
         * @tc.desc 恢复：越界后渲染深灰，四通道落在合法域且结构完整
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0143 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(-999, 0, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(64, 64, 64, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0]).assertEqual(64);
            expect(recovered.pixel[2]).assertEqual(64);
            expect(recovered.corner.length).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0143 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0144
         * @tc.name testPixel0144
         * @tc.desc 恢复：越界后渲染浅灰，通道差异数不超过二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0144 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, 0, 1000, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(192, 192, 192, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0]).assertEqual(192);
            expect(distinctValues(recovered.pixel) <= 2).assertTrue();
            expect(recovered.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0144 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0145
         * @tc.name testPixel0145
         * @tc.desc 恢复：越界后渲染蓝色阶梯色，首末通道关系保持不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0145 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 257);
            const recovered: PixelProbeResult = probeRenderSolidPixel(32, 64, 128, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[1]).assertEqual(recovered.pixel[0] * 2);
            expect(recovered.pixel[2]).assertEqual(recovered.pixel[0] * 4);
            expect(describePixel(recovered.pixel).indexOf('/') > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0145 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0146
         * @tc.name testPixel0146
         * @tc.desc 恢复：越界后渲染暖色阶梯，递减等差保持不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0146 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(-2, 0, 0, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(128, 64, 32, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0] - recovered.pixel[1]).assertEqual(64);
            expect(recovered.pixel[1] - recovered.pixel[2]).assertEqual(32);
            expect(recovered.pixel[0] > recovered.pixel[2]).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0146 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0147
         * @tc.name testPixel0147
         * @tc.desc 恢复：连续三次越界后仍可渲染，末次颜色完整落地
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0147 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(256, 0, 0, 255);
            const second: PixelProbeResult = probeRenderSolidPixel(0, 256, 0, 255);
            const third: PixelProbeResult = probeRenderSolidPixel(0, 0, 256, 255);
            const recovered: PixelProbeResult = probeRenderSolidPixel(0, 128, 255, 255);
            expect(first.code + second.code + third.code).assertEqual(RESULT_BAD_PARAMETER * 3);
            expect(recovered.pixel[2]).assertEqual(255);
            expect(recovered.pixel[1]).assertEqual(128);
            expect(isDominant(recovered.pixel, 2)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0147 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0148
         * @tc.name testPixel0148
         * @tc.desc 恢复：越界与合法交替四次，末次渲染值仍准确
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0148 begin');
            const a: PixelProbeResult = probeRenderSolidPixel(999, 0, 0, 255);
            const b: PixelProbeResult = probeRenderSolidPixel(100, 100, 100, 255);
            const c: PixelProbeResult = probeRenderSolidPixel(0, -1, 0, 255);
            const d: PixelProbeResult = probeRenderSolidPixel(200, 100, 50, 255);
            expect(a.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(b.pixel[0]).assertEqual(100);
            expect(c.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(d.pixel[0]).assertEqual(200);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0148 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0149
         * @tc.name testPixel0149
         * @tc.desc 恢复：越界不改变 pbuffer 边长，结构层四项在失败时仍成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0149 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(0, 300, 300, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rejected.aux).assertEqual(PIXEL_SIZE);
            expect(rejected.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(rejected.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0149 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0150
         * @tc.name testPixel0150
         * @tc.desc 恢复：越界后渲染的像素两点一致且回读值与首通道同步
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0150 begin');
            const rejected: PixelProbeResult = probeRenderSolidPixel(257, 257, 257, 257);
            const recovered: PixelProbeResult = probeRenderSolidPixel(70, 140, 210, 255);
            expect(rejected.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(recovered.pixel[0]).assertEqual(70);
            expect(channelDelta(recovered.pixel, recovered.corner)).assertEqual(0);
            expect(recovered.value).assertEqual(recovered.pixel[0]);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0150 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0151
         * @tc.name testPixel0151
         * @tc.desc 交错：渲染递增色与尺寸回读，四通道均在合法域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0151 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(12, 24, 36, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(pixel.pixel[0]).assertEqual(12);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0151 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0152
         * @tc.name testPixel0152
         * @tc.desc 交错：渲染递减排色与偏移回读，RGB 最大通道在首通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0152 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(36, 24, 12, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(rgbMax(pixel.pixel)).assertEqual(36);
            expect(pixel.pixel[0]).assertEqual(36);
            expect(Number.isFinite(offset.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0152 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0153
         * @tc.name testPixel0153
         * @tc.desc 交错：渲染冷色阶与标识回读，蓝通道为唯一主导
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0153 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(50, 100, 150, 255);
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(isDominant(pixel.pixel, 2)).assertTrue();
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            expect(identity.value).assertEqual(identity.id.length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0153 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0154
         * @tc.name testPixel0154
         * @tc.desc 交错：渲染暖色阶与器具类型回读，非零通道恰为四个
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0154 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(150, 100, 50, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(countAbove(pixel.pixel, 0)).assertEqual(4);
            expect(pixel.pixel[0]).assertEqual(150);
            expect(toolType.value <= 8).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0154 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0155
         * @tc.name testPixel0155
         * @tc.desc 交错：渲染二三通道色与横倾角回读，RGB 和可推
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0155 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(200, 50, 100, 255);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(rgbSum(pixel.pixel)).assertEqual(350);
            expect(pixel.pixel[0]).assertEqual(200);
            expect(Math.abs(tiltX.value) <= 90).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0155 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0156
         * @tc.name testPixel0156
         * @tc.desc 交错：渲染紫绿色与纵倾角回读，最小通道确定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0156 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(100, 50, 200, 255);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(minChannel(pixel.pixel)).assertEqual(50);
            expect(pixel.pixel[2]).assertEqual(200);
            expect(Math.abs(tiltY.value) <= 90).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0156 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0157
         * @tc.name testPixel0157
         * @tc.desc 交错：渲染三档阶梯色与窗口横坐标回读，通道差异数确定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0157 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(5, 55, 105, 255);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(distinctValues(pixel.pixel)).assertEqual(4);
            expect(pixel.pixel[1] - pixel.pixel[0]).assertEqual(50);
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0157 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0158
         * @tc.name testPixel0158
         * @tc.desc 交错：渲染反向阶梯色与窗口纵坐标回读，两点差异为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0158 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(105, 55, 5, 255);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(105);
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0158 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0159
         * @tc.name testPixel0159
         * @tc.desc 交错：渲染等比色与屏幕横坐标回读，倍比关系成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0159 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(20, 40, 80, 255);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 4);
            expect(displayX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0159 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0160
         * @tc.name testPixel0160
         * @tc.desc 交错：渲染递减等比色与屏幕纵坐标回读，首末倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0160 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(80, 40, 20, 255);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 4);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 2);
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0160 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0161
         * @tc.name testPixel0161
         * @tc.desc 交错：渲染四倍色与事件来源类型回读，蓝通道为唯一最大且两点一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0161 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(9, 18, 36, 255);
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isDominant(pixel.pixel, 2)).assertTrue();
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[1] * 2);
            expect(isResultCode(sourceType.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0161 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0162
         * @tc.name testPixel0162
         * @tc.desc 交错：渲染反向四倍色与历史点回读，首末倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0162 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(36, 18, 9, 255);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 4);
            expect(pixel.pixel[0]).assertEqual(36);
            expect(points.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0162 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0163
         * @tc.name testPixel0163
         * @tc.desc 交错：渲染六倍色与按键事件回读，末首倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0163 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(16, 48, 96, 255);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 6);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 3);
            expect(keyEvent.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0163 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0164
         * @tc.name testPixel0164
         * @tc.desc 交错：渲染反向六倍色与鼠标扩展信息回读，首中倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0164 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(96, 48, 16, 255);
            const extraMouse: ProbeResult = probeGetExtraMouseEventInfo();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1] * 2);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 3);
            expect(extraMouse.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0164 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0165
         * @tc.name testPixel0165
         * @tc.desc 交错：渲染三倍色与修饰键状态回读，两点采样无差异
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0165 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(33, 66, 99, 255);
            const modifier: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(modifier.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0165 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0166
         * @tc.name testPixel0166
         * @tc.desc 交错：渲染反向三倍色与无障碍提供者回读，首末倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0166 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(99, 66, 33, 255);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 3);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 2);
            expect(provider.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0166 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0167
         * @tc.name testPixel0167
         * @tc.desc 交错：渲染三倍冷色与帧率区间回读，RGB 蓝通道取最大且取值互异
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0167 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(17, 51, 85, 255);
            const range: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 120);
            expect(rgbMax(pixel.pixel)).assertEqual(pixel.pixel[2]);
            expect(distinctValues(pixel.pixel) >= 3).assertTrue();
            expect(isResultCode(range.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0167 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0168
         * @tc.name testPixel0168
         * @tc.desc 交错：渲染五倍暖色与软键盘回读，相邻通道等距三十四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0168 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(85, 51, 17, 255);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1] + 34);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] + 34);
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0168 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0169
         * @tc.name testPixel0169
         * @tc.desc 交错：渲染阶梯蓝与基础回调注册，通道差恒为六十四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0169 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(64, 128, 192, 255);
            const base: ProbeResult = probeRegisterCallback();
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[1] + 64);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] + 64);
            expect(isResultCode(base.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0169 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0170
         * @tc.name testPixel0170
         * @tc.desc 交错：渲染反向阶梯色与鼠标回调注册，通道差恒为六十四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0170 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(192, 128, 64, 255);
            const mouse: ProbeResult = probeRegisterMouseEventCallback();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1] + 64);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] + 64);
            expect(isResultCode(mouse.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0170 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0171
         * @tc.name testPixel0171
         * @tc.desc 交错：渲染四倍阶梯色与获焦回调注册，末首倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0171 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(11, 22, 44, 255);
            const focus: ProbeResult = probeRegisterFocusEventCallback();
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 4);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(isResultCode(focus.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0171 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0172
         * @tc.name testPixel0172
         * @tc.desc 交错：渲染反向四倍色与失焦回调注册，首末倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0172 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(44, 22, 11, 255);
            const blur: ProbeResult = probeRegisterBlurEventCallback();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 4);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 2);
            expect(isResultCode(blur.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0172 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0173
         * @tc.name testPixel0173
         * @tc.desc 交错：渲染十倍色与按键回调注册，末首倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0173 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(7, 35, 70, 255);
            const key: ProbeResult = probeRegisterKeyEventCallback();
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 10);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 5);
            expect(isResultCode(key.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0173 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0174
         * @tc.name testPixel0174
         * @tc.desc 交错：渲染反向十倍色与带结果按键回调注册，首末倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0174 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(70, 35, 7, 255);
            const keyResult: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 10);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 5);
            expect(isResultCode(keyResult.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0174 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0175
         * @tc.name testPixel0175
         * @tc.desc 交错：渲染等差色与逐帧回调注册，相邻通道差为二十六
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0175 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(13, 39, 65, 255);
            const onFrame: ProbeResult = probeRegisterOnFrameCallback();
            expect(pixel.pixel[1] - pixel.pixel[0]).assertEqual(26);
            expect(pixel.pixel[2] - pixel.pixel[1]).assertEqual(26);
            expect(isResultCode(onFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0175 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0176
         * @tc.name testPixel0176
         * @tc.desc 交错：渲染反向等差色与逐帧注销，相邻通道差为负二十二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0176 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(65, 39, 13, 255);
            const offFrame: ProbeResult = probeUnregisterOnFrameCallback();
            expect(pixel.pixel[0] - pixel.pixel[1]).assertEqual(26);
            expect(pixel.pixel[1] - pixel.pixel[2]).assertEqual(26);
            expect(isResultCode(offFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0176 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0177
         * @tc.name testPixel0177
         * @tc.desc 交错：渲染四倍冷色与显示回调注册，末首倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0177 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(28, 56, 112, 255);
            const show: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 4);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(isResultCode(show.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0177 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0178
         * @tc.name testPixel0178
         * @tc.desc 交错：渲染反向四倍冷色与隐藏回调注册，首末倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0178 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(112, 56, 28, 255);
            const hide: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 4);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 2);
            expect(isResultCode(hide.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0178 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0179
         * @tc.name testPixel0179
         * @tc.desc 交错：渲染二倍色与触摸拦截注册，中首倍比成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0179 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(45, 90, 135, 255);
            const intercept: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 3);
            expect(isResultCode(intercept.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0179 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0180
         * @tc.name testPixel0180
         * @tc.desc 交错：渲染三倍色与触摸类输入事件注册，末首倍比成立且注册码落在 ArkUI 错误码集合
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0180 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(135, 90, 45, 255);
            const touchReg: ProbeResult = probeRegisterUIInputEventCallback(1);
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 3);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 2);
            expect(isArkuiErrorCode(touchReg.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0180 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0181
         * @tc.name testPixel0181
         * @tc.desc 状态：形状归零后渲染十级灰，形状索引不被渲染改写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0181 begin');
            changeShape(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(10, 10, 10, 255);
            expect(getShapeIndex()).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(10);
            expect(isGrayBalanced(pixel.pixel) || pixel.pixel[0] === pixel.pixel[1]).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0181 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0182
         * @tc.name testPixel0182
         * @tc.desc 状态：形状切到一后渲染二十级灰，形状索引保持一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0182 begin');
            changeShape(1);
            const pixel: PixelProbeResult = probeRenderSolidPixel(20, 20, 20, 255);
            expect(getShapeIndex()).assertEqual(1);
            expect(pixel.pixel[0]).assertEqual(20);
            expect(maxChannel(pixel.pixel)).assertEqual(255);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0182 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0183
         * @tc.name testPixel0183
         * @tc.desc 状态：形状切到二后渲染三十级灰，索引与像素互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0183 begin');
            changeShape(2);
            const pixel: PixelProbeResult = probeRenderSolidPixel(30, 30, 30, 255);
            expect(getShapeIndex()).assertEqual(2);
            expect(pixel.pixel[1]).assertEqual(30);
            expect(minChannel(pixel.pixel)).assertEqual(30);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0183 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0184
         * @tc.name testPixel0184
         * @tc.desc 状态：形状切到三后渲染四十级灰，通道差异数不超二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0184 begin');
            changeShape(3);
            const pixel: PixelProbeResult = probeRenderSolidPixel(40, 40, 40, 255);
            expect(getShapeIndex()).assertEqual(3);
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(pixel.pixel[2]).assertEqual(40);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0184 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0185
         * @tc.name testPixel0185
         * @tc.desc 状态：形状切到四后渲染五十级灰，采样与角点差异为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0185 begin');
            changeShape(4);
            const pixel: PixelProbeResult = probeRenderSolidPixel(50, 50, 50, 255);
            expect(getShapeIndex()).assertEqual(4);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(50);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0185 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0186
         * @tc.name testPixel0186
         * @tc.desc 状态：形状切到五后渲染六十级灰，索引在渲染后仍稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0186 begin');
            changeShape(5);
            probeRenderSolidPixel(60, 60, 60, 255);
            const shape: number = getShapeIndex();
            expect(shape).assertEqual(5);
            expect(Number.isInteger(shape)).assertTrue();
            expect(shape >= 0).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0186 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0187
         * @tc.name testPixel0187
         * @tc.desc 状态：形状切到六后渲染七十级灰，RGB 和可推
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0187 begin');
            changeShape(6);
            const pixel: PixelProbeResult = probeRenderSolidPixel(70, 70, 70, 255);
            expect(getShapeIndex()).assertEqual(6);
            expect(rgbSum(pixel.pixel)).assertEqual(210);
            expect(pixel.pixel[0]).assertEqual(70);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0187 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0188
         * @tc.name testPixel0188
         * @tc.desc 状态：形状切到七后渲染八十级灰，四通道在域内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0188 begin');
            changeShape(7);
            const pixel: PixelProbeResult = probeRenderSolidPixel(80, 80, 80, 255);
            expect(getShapeIndex()).assertEqual(7);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(pixel.corner[0]).assertEqual(80);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0188 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0189
         * @tc.name testPixel0189
         * @tc.desc 状态：形状切到八后渲染九十级灰，采样描述可解析
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0189 begin');
            changeShape(8);
            const pixel: PixelProbeResult = probeRenderSolidPixel(90, 90, 90, 255);
            expect(getShapeIndex()).assertEqual(8);
            expect(describePixel(pixel.pixel).split('/').length).assertEqual(CHANNEL_COUNT);
            expect(pixel.pixel[0]).assertEqual(90);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0189 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0190
         * @tc.name testPixel0190
         * @tc.desc 状态：形状切到九后渲染百级灰，非零通道数为四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0190 begin');
            changeShape(9);
            const pixel: PixelProbeResult = probeRenderSolidPixel(100, 100, 100, 255);
            expect(getShapeIndex()).assertEqual(9);
            expect(countAbove(pixel.pixel, 0)).assertEqual(4);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0190 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0191
         * @tc.name testPixel0191
         * @tc.desc 状态：形状切到十六后渲染灰，大索引不造成像素错位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0191 begin');
            changeShape(16);
            const pixel: PixelProbeResult = probeRenderSolidPixel(110, 110, 110, 255);
            expect(getShapeIndex()).assertEqual(16);
            expect(pixel.pixel[0]).assertEqual(110);
            expect(isGrayBalanced(pixel.pixel) || pixel.pixel[1] === pixel.pixel[2]).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0191 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0192
         * @tc.name testPixel0192
         * @tc.desc 状态：形状切到三十二后渲染灰，索引回显与像素同时成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0192 begin');
            changeShape(32);
            const pixel: PixelProbeResult = probeRenderSolidPixel(120, 120, 120, 255);
            expect(getShapeIndex()).assertEqual(32);
            expect(maxChannel(pixel.pixel)).assertEqual(255);
            expect(pixel.pixel[0]).assertEqual(120);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0192 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0193
         * @tc.name testPixel0193
         * @tc.desc 状态：形状切到六十四后渲染灰，通道差与设定值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0193 begin');
            changeShape(64);
            const pixel: PixelProbeResult = probeRenderSolidPixel(130, 130, 130, 255);
            expect(getShapeIndex()).assertEqual(64);
            expect(pixel.pixel[0]).assertEqual(130);
            expect(minChannel(pixel.pixel)).assertEqual(130);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0193 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0194
         * @tc.name testPixel0194
         * @tc.desc 状态：形状切到一百二十八后渲染灰，形状切换与渲染解耦
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0194 begin');
            changeShape(128);
            const pixel: PixelProbeResult = probeRenderSolidPixel(140, 140, 140, 255);
            expect(getShapeIndex()).assertEqual(128);
            expect(pixel.pixel[0]).assertEqual(140);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0194 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0195
         * @tc.name testPixel0195
         * @tc.desc 状态：形状切到二百五十五后渲染灰，索引上界仍可用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0195 begin');
            changeShape(255);
            const pixel: PixelProbeResult = probeRenderSolidPixel(150, 150, 150, 255);
            expect(getShapeIndex()).assertEqual(255);
            expect(pixel.pixel[0]).assertEqual(150);
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0195 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0196
         * @tc.name testPixel0196
         * @tc.desc 状态：形状两次归零后渲染灰，归零写入幂等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0196 begin');
            changeShape(0);
            changeShape(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(160, 160, 160, 255);
            expect(getShapeIndex()).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(160);
            expect(isChannelInRange(pixel.corner)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0196 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0197
         * @tc.name testPixel0197
         * @tc.desc 状态：形状七切回零后渲染灰，切回操作不残留旧索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0197 begin');
            changeShape(7);
            changeShape(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(170, 170, 170, 255);
            expect(getShapeIndex()).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(170);
            expect(maxChannel(pixel.pixel)).assertEqual(255);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0197 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0198
         * @tc.name testPixel0198
         * @tc.desc 状态：形状一百后渲染灰，索引非零但与渲染互不影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0198 begin');
            changeShape(100);
            const pixel: PixelProbeResult = probeRenderSolidPixel(180, 180, 180, 255);
            expect(getShapeIndex()).assertEqual(100);
            expect(pixel.pixel[0]).assertEqual(180);
            expect(rgbSum(pixel.pixel)).assertEqual(540);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0198 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0199
         * @tc.name testPixel0199
         * @tc.desc 状态：形状切到三并重绘后渲染灰，重绘不重置形状状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0199 begin');
            changeShape(3);
            animate();
            const pixel: PixelProbeResult = probeRenderSolidPixel(190, 190, 190, 255);
            expect(getShapeIndex()).assertEqual(3);
            expect(pixel.pixel[0]).assertEqual(190);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0199 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0200
         * @tc.name testPixel0200
         * @tc.desc 状态：形状归零并渲染二百级灰，收尾处于已知干净状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0200 begin');
            changeShape(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(200, 200, 200, 255);
            expect(getShapeIndex()).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(200);
            expect(pixel.corner.length).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0200 end');
        });

    });
}
