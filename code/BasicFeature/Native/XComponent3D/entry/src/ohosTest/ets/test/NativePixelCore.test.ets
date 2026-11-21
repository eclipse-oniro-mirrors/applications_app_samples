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
    ProbeResult, ProbeIdResult, PixelProbeResult, GetContext, animate, getShapeIndex,
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
    probeRegisterOnTouchInterceptCallback, probeGetKeyEventAction, probeGetKeyEventCode
} from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

const RESULT_SUCCESS: number = 0;
const RESULT_FAILED: number = -1;
const RESULT_BAD_PARAMETER: number = -2;

const CHANNEL_COUNT: number = 4;
const CHANNEL_MAX: number = 255;
const PIXEL_SIZE: number = 4;
const DARK_LIMIT: number = 64;
const BRIGHT_LIMIT: number = 192;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
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

/**
 * 取像素的颜色分量（RGB），剔除末位的透明度通道。
 * 最大通道、最小通道、取值种数等语义只针对颜色分量，不把透明度计入。
 */
function rgbOf(pixel: number[]): number[] {
    const rgb: number[] = [];
    const total: number = Math.min(pixel.length, CHANNEL_COUNT - 1);
    for (let i = 0; i < total; i++) { rgb.push(pixel[i]); }
    return rgb;
}

function distinctValues(pixel: number[]): number {
    const rgb: number[] = rgbOf(pixel);
    const seen: number[] = [];
    for (let i = 0; i < rgb.length; i++) { if (seen.indexOf(rgb[i]) < 0) { seen.push(rgb[i]); } }
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
    const rgb: number[] = rgbOf(pixel);
    let max: number = 0;
    for (let i = 0; i < rgb.length; i++) { if (rgb[i] > max) { max = rgb[i]; } }
    return max;
}

function minChannel(pixel: number[]): number {
    const rgb: number[] = rgbOf(pixel);
    if (rgb.length === 0) { return -1; }
    let min: number = rgb[0];
    for (let i = 1; i < rgb.length; i++) { if (rgb[i] < min) { min = rgb[i]; } }
    return min;
}

function isChannelInRange(pixel: number[]): boolean {
    for (let i = 0; i < pixel.length; i++) { if (pixel[i] < 0 || pixel[i] > CHANNEL_MAX) { return false; } }
    return true;
}

function isDarkPixel(pixel: number[]): boolean { return maxChannel(pixel) <= DARK_LIMIT; }

function isBrightPixel(pixel: number[]): boolean { return minChannel(pixel) >= BRIGHT_LIMIT; }

function isDominant(pixel: number[], index: number): boolean {
    for (let i = 0; i < pixel.length - 1; i++) { if (i !== index && pixel[index] <= pixel[i]) { return false; } }
    return true;
}

function alphaValue(pixel: number[]): number { return pixel.length === CHANNEL_COUNT ? pixel[3] : -1; }

export default function nativePixelCoreTest() {
    resetYieldCounter();
    describe('NativePixelCoreTest', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0001
         * @tc.name testPixel0001
         * @tc.desc 像素：全黑清屏，四通道齐全、RGB 通道和为零、pbuffer 边长为四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0001 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            expect(isResultCode(size.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0002
         * @tc.name testPixel0002
         * @tc.desc 像素：纯白清屏，四通道取值一致且回读值与首通道同步
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0002 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(isAllEqual(pixel.pixel)).assertTrue();
            expect(pixel.value).assertEqual(pixel.pixel[0]);
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            expect(Number.isFinite(offset.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0003
         * @tc.name testPixel0003
         * @tc.desc 像素：纯红清屏，红通道为四通道唯一最大且绿蓝归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0003 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(isDominant(pixel.pixel, 0)).assertTrue();
            expect(pixel.pixel[1]).assertEqual(0);
            expect(pixel.pixel[2]).assertEqual(0);
            expect(identity.id.length).assertEqual(identity.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0004
         * @tc.name testPixel0004
         * @tc.desc 像素：纯绿清屏，绿通道为唯一最大且采样描述可序列化
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0004 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 255, 0, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(isDominant(pixel.pixel, 1)).assertTrue();
            expect(describePixel(pixel.pixel).indexOf('/') > 0).assertTrue();
            expect(pixel.pixel[0]).assertEqual(0);
            expect(toolType.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0005
         * @tc.name testPixel0005
         * @tc.desc 像素：纯蓝清屏，最大通道取满值且红绿归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0005 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(pixel.pixel[2]).assertEqual(CHANNEL_MAX);
            expect(maxChannel(pixel.pixel)).assertEqual(CHANNEL_MAX);
            expect(pixel.pixel[0]).assertEqual(0);
            expect(tiltX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0006
         * @tc.name testPixel0006
         * @tc.desc 像素：青色清屏，绿蓝两通道等值且角点采样与主采样一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0006 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 255, 255, 255);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2]);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(0);
            expect(tiltY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0007
         * @tc.name testPixel0007
         * @tc.desc 像素：品红清屏，红蓝两通道等值且通道差异数不小于二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0007 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 0, 255, 255);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2]);
            expect(distinctValues(pixel.pixel) >= 2).assertTrue();
            expect(pixel.pixel[1]).assertEqual(0);
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0008
         * @tc.name testPixel0008
         * @tc.desc 像素：黄色清屏，红绿两通道等值且非零通道不少于三个
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0008 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 255, 0, 255);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1]);
            expect(countAbove(pixel.pixel, 0) >= 3).assertTrue();
            expect(pixel.pixel[2]).assertEqual(0);
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0009
         * @tc.name testPixel0009
         * @tc.desc 像素：中灰清屏，RGB 三通道平衡且首通道等于设定值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0009 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(128);
            expect(pixel.corner[0]).assertEqual(128);
            expect(displayX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0010
         * @tc.name testPixel0010
         * @tc.desc 像素：深灰清屏，整像素落在暗档且通道差异不超过二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0010 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(64, 64, 64, 255);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(isDarkPixel(pixel.pixel)).assertTrue();
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(pixel.pixel[0]).assertEqual(DARK_LIMIT);
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0011
         * @tc.name testPixel0011
         * @tc.desc 像素：浅灰清屏，整像素落在亮档且三通道与设定值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0011 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(192, 192, 192, 255);
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(isBrightPixel(pixel.pixel)).assertTrue();
            expect(pixel.pixel[1]).assertEqual(BRIGHT_LIMIT);
            expect(pixel.pixel[2]).assertEqual(BRIGHT_LIMIT);
            expect(isResultCode(sourceType.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0012
         * @tc.name testPixel0012
         * @tc.desc 像素：近黑清屏，通道值仅为设定的一且通道和可控
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0012 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(1, 1, 1, 255);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(pixel.pixel[0]).assertEqual(1);
            expect(rgbSum(pixel.pixel)).assertEqual(3);
            expect(channelSum(pixel.pixel) >= 3).assertTrue();
            expect(points.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0013
         * @tc.name testPixel0013
         * @tc.desc 像素：近白清屏，最小通道不低于二百五十四且角点同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0013 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(254, 254, 254, 255);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(pixel.pixel[0]).assertEqual(254);
            expect(minChannel(pixel.pixel) >= 254).assertTrue();
            expect(pixel.corner[0]).assertEqual(pixel.pixel[0]);
            expect(keyEvent.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0014
         * @tc.name testPixel0014
         * @tc.desc 像素：通道递增色清屏，RGB 严格递增且三通道和不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0014 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(10, 20, 30, 255);
            const extraMouse: ProbeResult = probeGetExtraMouseEventInfo();
            expect(pixel.pixel[0] < pixel.pixel[1]).assertTrue();
            expect(pixel.pixel[1] < pixel.pixel[2]).assertTrue();
            expect(rgbSum(pixel.pixel)).assertEqual(60);
            expect(extraMouse.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0015
         * @tc.name testPixel0015
         * @tc.desc 像素：通道递减色清屏，RGB 严格递减且通道和与递增色相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0015 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(30, 20, 10, 255);
            const modifier: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.pixel[0] > pixel.pixel[1]).assertTrue();
            expect(pixel.pixel[1] > pixel.pixel[2]).assertTrue();
            expect(channelSum(pixel.pixel) - alphaValue(pixel.pixel)).assertEqual(60);
            expect(modifier.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0016
         * @tc.name testPixel0016
         * @tc.desc 像素：透明黑清屏，RGB 归零且结构层四项全成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0016 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 0);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(pixel.pixel.length).assertEqual(PIXEL_SIZE);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(provider.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0017
         * @tc.name testPixel0017
         * @tc.desc 像素：透明白清屏，RGB 通道和取满且三角点同值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0017 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 0);
            const range: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 120);
            expect(rgbSum(pixel.pixel)).assertEqual(765);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(pixel.corner[1]).assertEqual(CHANNEL_MAX);
            expect(isResultCode(range.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0018
         * @tc.name testPixel0018
         * @tc.desc 像素：红通道二十六清屏，首通道回显且最大通道为它
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0018 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(26, 0, 0, 255);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(pixel.pixel[0]).assertEqual(26);
            expect(maxChannel(pixel.pixel)).assertEqual(channelSum([26, 0, 0, 255]) - 255);
            expect(pixel.pixel[1]).assertEqual(0);
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0019
         * @tc.name testPixel0019
         * @tc.desc 像素：红通道五十二清屏，首通道回显且最小通道为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0019 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(52, 0, 0, 255);
            const base: ProbeResult = probeRegisterCallback();
            expect(pixel.pixel[0]).assertEqual(52);
            expect(minChannel(pixel.pixel)).assertEqual(0);
            expect(pixel.corner[2]).assertEqual(0);
            expect(isResultCode(base.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0020
         * @tc.name testPixel0020
         * @tc.desc 像素：红通道七十八清屏，非零通道数可控且回读可复现
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0020 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(78, 0, 0, 255);
            const mouse: ProbeResult = probeRegisterMouseEventCallback();
            expect(pixel.pixel[0]).assertEqual(78);
            expect(countAbove(pixel.pixel, 0)).assertEqual(2);
            expect(pixel.value).assertEqual(pixel.pixel[0]);
            expect(isResultCode(mouse.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0021
         * @tc.name testPixel0021
         * @tc.desc 像素：红通道一百零四清屏，通道差异数不超过二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0021 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(104, 0, 0, 255);
            const focus: ProbeResult = probeRegisterFocusEventCallback();
            expect(pixel.pixel[0]).assertEqual(104);
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(pixel.corner[0]).assertEqual(104);
            expect(isResultCode(focus.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0022
         * @tc.name testPixel0022
         * @tc.desc 像素：红通道一百三十清屏，两采样点差异为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0022 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(130, 0, 0, 255);
            const blur: ProbeResult = probeRegisterBlurEventCallback();
            expect(pixel.pixel[0]).assertEqual(130);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[2]).assertEqual(0);
            expect(isResultCode(blur.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0023
         * @tc.name testPixel0023
         * @tc.desc 像素：红通道一百五十六清屏，整像素已越过暗档上界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0023 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(156, 0, 0, 255);
            const key: ProbeResult = probeRegisterKeyEventCallback();
            expect(pixel.pixel[0]).assertEqual(156);
            expect(isDarkPixel(pixel.pixel)).assertFalse();
            expect(maxChannel(pixel.pixel)).assertEqual(156);
            expect(isResultCode(key.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0024
         * @tc.name testPixel0024
         * @tc.desc 像素：红通道一百八十二清屏，未达亮档下界但高于暗档
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0024 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(182, 0, 0, 255);
            const keyResult: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(pixel.pixel[0]).assertEqual(182);
            expect(isBrightPixel(pixel.pixel)).assertFalse();
            expect(minChannel(pixel.pixel)).assertEqual(0);
            expect(isResultCode(keyResult.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0025
         * @tc.name testPixel0025
         * @tc.desc 像素：红通道二百零八清屏，首通道为唯一主导通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0025 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(208, 0, 0, 255);
            const onFrame: ProbeResult = probeRegisterOnFrameCallback();
            expect(pixel.pixel[0]).assertEqual(208);
            expect(isDominant(pixel.pixel, 0)).assertTrue();
            expect(pixel.corner[1]).assertEqual(0);
            expect(isResultCode(onFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0025 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0026
         * @tc.name testPixel0026
         * @tc.desc 像素：红通道二百三十四清屏，低于上界的通道计数可控
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0026 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(234, 0, 0, 255);
            const offFrame: ProbeResult = probeUnregisterOnFrameCallback();
            expect(pixel.pixel[0]).assertEqual(234);
            expect(countAbove(rgbOf(pixel.pixel), 234)).assertEqual(0);
            expect(pixel.pixel[0] <= CHANNEL_MAX).assertTrue();
            expect(isResultCode(offFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0026 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0027
         * @tc.name testPixel0027
         * @tc.desc 像素：绿通道二十六清屏，中通道回显且通道和等于两百八十一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0027 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 26, 0, 255);
            const show: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(pixel.pixel[1]).assertEqual(26);
            expect(channelSum(pixel.pixel)).assertEqual(281);
            expect(pixel.pixel[0]).assertEqual(0);
            expect(isResultCode(show.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0027 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0028
         * @tc.name testPixel0028
         * @tc.desc 像素：绿通道五十二清屏，四通道全部落在合法值域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0028 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 52, 0, 255);
            const hide: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(pixel.pixel[1]).assertEqual(52);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(pixel.pixel[2]).assertEqual(0);
            expect(isResultCode(hide.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0028 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0029
         * @tc.name testPixel0029
         * @tc.desc 像素：绿通道七十八清屏，末通道与设定值一致且差异为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0029 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 78, 0, 255);
            const intercept: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(pixel.pixel[1]).assertEqual(78);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[3]).assertEqual(pixel.corner[3]);
            expect(isResultCode(intercept.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0029 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0030
         * @tc.name testPixel0030
         * @tc.desc 像素：绿通道一百零四清屏，采样描述含四个分量且最大值在中通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0030 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 104, 0, 255);
            const action: ProbeResult = probeGetKeyEventAction();
            expect(pixel.pixel[1]).assertEqual(104);
            expect(describePixel(pixel.pixel).split('/').length).assertEqual(CHANNEL_COUNT);
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2]);
            expect(isResultCode(action.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0030 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0031
         * @tc.name testPixel0031
         * @tc.desc 像素：绿通道一百三十清屏，最大通道为中通道且首末通道相等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0031 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 130, 0, 255);
            const code: ProbeResult = probeGetKeyEventCode();
            expect(pixel.pixel[1]).assertEqual(130);
            expect(maxChannel(pixel.pixel)).assertEqual(130);
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2]);
            expect(isResultCode(code.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0031 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0032
         * @tc.name testPixel0032
         * @tc.desc 像素：绿通道一百五十六清屏，未归零通道恰有两个
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0032 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 156, 0, 255);
            const context: object = GetContext(1);
            expect(pixel.pixel[1]).assertEqual(156);
            expect(countAbove(pixel.pixel, 0)).assertEqual(2);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(2);
            expect(pixel.pixel[2]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0032 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0033
         * @tc.name testPixel0033
         * @tc.desc 像素：绿通道一百八十二清屏，通道差异数不超过二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0033 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 182, 0, 255);
            const shape: number = getShapeIndex();
            expect(pixel.pixel[1]).assertEqual(182);
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(Number.isInteger(shape)).assertTrue();
            expect(pixel.corner[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0033 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0034
         * @tc.name testPixel0034
         * @tc.desc 像素：绿通道二百零八清屏，主导通道判定落在中通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0034 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 208, 0, 255);
            animate();
            expect(pixel.pixel[1]).assertEqual(208);
            expect(isDominant(pixel.pixel, 1)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(0);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0034 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0035
         * @tc.name testPixel0035
         * @tc.desc 像素：绿通道二百三十四清屏，最小值仍为零且结构完整
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0035 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 234, 0, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(pixel.pixel[1]).assertEqual(234);
            expect(minChannel(pixel.pixel)).assertEqual(0);
            expect(pixel.corner.length).assertEqual(PIXEL_SIZE);
            expect(size.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0035 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0036
         * @tc.name testPixel0036
         * @tc.desc 像素：蓝通道二十六清屏，末通道回显且通道和等于两百八十一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0036 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 26, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(pixel.pixel[2]).assertEqual(26);
            expect(rgbSum(pixel.pixel)).assertEqual(26);
            expect(channelSum(pixel.pixel)).assertEqual(281);
            expect(Number.isFinite(offset.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0036 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0037
         * @tc.name testPixel0037
         * @tc.desc 像素：蓝通道五十二清屏，RGB 通道和恰为中通道值之外的两倍关系
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0037 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 52, 255);
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(pixel.pixel[2]).assertEqual(52);
            expect(rgbSum(pixel.pixel)).assertEqual(pixel.pixel[2]);
            expect(isBrightPixel(pixel.pixel)).assertFalse();
            expect(identity.value).assertEqual(identity.id.length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0037 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0038
         * @tc.name testPixel0038
         * @tc.desc 像素：蓝通道七十八清屏，主导通道判定落在末通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0038 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 78, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(pixel.pixel[2]).assertEqual(78);
            expect(isDominant(pixel.pixel, 2)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1]);
            expect(toolType.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0038 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0039
         * @tc.name testPixel0039
         * @tc.desc 像素：蓝通道一百零四清屏，两采样点差异为零且通道在域内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0039 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 104, 255);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(pixel.pixel[2]).assertEqual(104);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(isChannelInRange(pixel.corner)).assertTrue();
            expect(Math.abs(tiltX.value) <= 90).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0039 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0040
         * @tc.name testPixel0040
         * @tc.desc 像素：蓝通道一百三十清屏，回读值与首通道解耦且非零通道两个
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0040 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 130, 255);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(pixel.pixel[2]).assertEqual(130);
            expect(countAbove(pixel.pixel, 0)).assertEqual(2);
            expect(pixel.value).assertEqual(pixel.pixel[0]);
            expect(Math.abs(tiltY.value) <= 90).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0040 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0041
         * @tc.name testPixel0041
         * @tc.desc 像素：蓝通道一百五十六清屏，采样描述可解析出四个分量
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0041 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 156, 255);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(pixel.pixel[2]).assertEqual(156);
            expect(describePixel(pixel.corner).split('/').length).assertEqual(CHANNEL_COUNT);
            expect(isDarkPixel(pixel.pixel)).assertFalse();
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0041 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0042
         * @tc.name testPixel0042
         * @tc.desc 像素：蓝通道一百八十二清屏，最大通道等于设定值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0042 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 182, 255);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(pixel.pixel[2]).assertEqual(182);
            expect(maxChannel(pixel.pixel)).assertEqual(182);
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0042 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0043
         * @tc.name testPixel0043
         * @tc.desc 像素：蓝通道二百零八清屏，最小通道为零且角点一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0043 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 208, 255);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(pixel.pixel[2]).assertEqual(208);
            expect(minChannel(pixel.pixel)).assertEqual(0);
            expect(pixel.corner[2]).assertEqual(208);
            expect(displayX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0043 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0044
         * @tc.name testPixel0044
         * @tc.desc 像素：蓝通道二百三十四清屏，越界前的最大合法邻近值可回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0044 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 234, 255);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(pixel.pixel[2]).assertEqual(234);
            expect(pixel.pixel[2] < CHANNEL_MAX).assertTrue();
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0044 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0045
         * @tc.name testPixel0045
         * @tc.desc 像素：十五级灰清屏，三通道平衡且落在暗档内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0045 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(15, 15, 15, 255);
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(pixel.pixel[0]).assertEqual(15);
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(isDarkPixel(pixel.pixel)).assertTrue();
            expect(isResultCode(sourceType.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0045 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0046
         * @tc.name testPixel0046
         * @tc.desc 像素：四十五级灰清屏，通道差异数为二以内且和可推
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0046 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(45, 45, 45, 255);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(pixel.pixel[0]).assertEqual(45);
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(rgbSum(pixel.pixel)).assertEqual(135);
            expect(points.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0046 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0047
         * @tc.name testPixel0047
         * @tc.desc 像素：七十五级灰清屏，两采样点差异为零且四通道在域内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0047 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(75, 75, 75, 255);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(pixel.pixel[0]).assertEqual(75);
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(keyEvent.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0047 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0048
         * @tc.name testPixel0048
         * @tc.desc 像素：一百零五级灰清屏，采样描述四段且非主导单通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0048 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(105, 105, 105, 255);
            const extraMouse: ProbeResult = probeGetExtraMouseEventInfo();
            expect(pixel.pixel[0]).assertEqual(105);
            expect(describePixel(pixel.pixel).split('/').length).assertEqual(CHANNEL_COUNT);
            expect(isDominant(pixel.pixel, 0)).assertFalse();
            expect(extraMouse.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0048 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0049
         * @tc.name testPixel0049
         * @tc.desc 像素：一百三十五级灰清屏，最大通道等于设定值且未达亮档
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0049 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(135, 135, 135, 255);
            const modifier: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.pixel[0]).assertEqual(135);
            expect(maxChannel(pixel.pixel)).assertEqual(135);
            expect(isBrightPixel(pixel.pixel)).assertFalse();
            expect(modifier.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0049 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0050
         * @tc.name testPixel0050
         * @tc.desc 像素：一百六十五级灰清屏，通道和可推且最小通道为设定值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0050 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(165, 165, 165, 255);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(pixel.pixel[0]).assertEqual(165);
            expect(rgbSum(pixel.pixel)).assertEqual(495);
            expect(minChannel(pixel.pixel)).assertEqual(165);
            expect(isResultCode(provider.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0050 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0051
         * @tc.name testPixel0051
         * @tc.desc 像素：一百九十五级灰处于亮档下沿上方，帧率区间设置不干扰回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0051 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(195, 195, 195, 255);
            const range: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            expect(pixel.pixel[0]).assertEqual(195);
            expect(isBrightPixel(pixel.pixel)).assertTrue();
            expect(isResultCode(range.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0051 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0052
         * @tc.name testPixel0052
         * @tc.desc 像素：二百二十五级灰的最小通道等于设定值，软键盘设置不影响像素
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0052 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(225, 225, 225, 255);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(pixel.pixel[0]).assertEqual(225);
            expect(minChannel(pixel.pixel)).assertEqual(225);
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0052 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0053
         * @tc.name testPixel0053
         * @tc.desc 像素：二百四十七级灰接近满值，基础回调注册后像素仍可回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0053 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(247, 247, 247, 255);
            const base: ProbeResult = probeRegisterCallback();
            expect(pixel.pixel[0]).assertEqual(247);
            expect(pixel.pixel[0] < CHANNEL_MAX).assertTrue();
            expect(isResultCode(base.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0053 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0054
         * @tc.name testPixel0054
         * @tc.desc 像素：零级灰的 RGB 通道和为零，鼠标回调注册不污染采样
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0054 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
            const mouse: ProbeResult = probeRegisterMouseEventCallback();
            expect(rgbSum(pixel.pixel)).assertEqual(0);
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(isResultCode(mouse.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0054 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0055
         * @tc.name testPixel0055
         * @tc.desc 像素：三十级灰三通道平衡，获焦回调注册后通道关系不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0055 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(30, 30, 30, 255);
            const focus: ProbeResult = probeRegisterFocusEventCallback();
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(30);
            expect(isResultCode(focus.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0055 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0056
         * @tc.name testPixel0056
         * @tc.desc 像素：六十级灰落在暗档内，失焦回调注册不改变暗档判定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0056 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(60, 60, 60, 255);
            const blur: ProbeResult = probeRegisterBlurEventCallback();
            expect(isDarkPixel(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(60);
            expect(isResultCode(blur.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0056 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0057
         * @tc.name testPixel0057
         * @tc.desc 像素：九十级灰的首通道回显，按键回调注册后回读一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0057 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(90, 90, 90, 255);
            const key: ProbeResult = probeRegisterKeyEventCallback();
            expect(pixel.pixel[0]).assertEqual(90);
            expect(pixel.corner[0]).assertEqual(90);
            expect(isResultCode(key.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0057 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0058
         * @tc.name testPixel0058
         * @tc.desc 像素：一百二十级灰的非零通道计数，带结果按键回调不干扰采样
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0058 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(120, 120, 120, 255);
            const keyResult: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(countAbove(pixel.pixel, 0)).assertEqual(4);
            expect(pixel.pixel[0]).assertEqual(120);
            expect(isResultCode(keyResult.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0058 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0059
         * @tc.name testPixel0059
         * @tc.desc 像素：一百五十级灰的通道差异数，逐帧回调注册后仍不超过二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0059 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(150, 150, 150, 255);
            const onFrame: ProbeResult = probeRegisterOnFrameCallback();
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(pixel.pixel[0]).assertEqual(150);
            expect(isResultCode(onFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0059 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0060
         * @tc.name testPixel0060
         * @tc.desc 像素：一百八十级灰的两点差异为零，逐帧注销后采样结构不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0060 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(180, 180, 180, 255);
            const offFrame: ProbeResult = probeUnregisterOnFrameCallback();
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[0]).assertEqual(180);
            expect(isResultCode(offFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0060 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0061
         * @tc.name testPixel0061
         * @tc.desc 像素：二百一十级灰的最大通道回显，显示回调注册不改变亮度
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0061 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(210, 210, 210, 255);
            const show: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(maxChannel(pixel.pixel)).assertEqual(210);
            expect(pixel.pixel[0]).assertEqual(210);
            expect(isResultCode(show.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0061 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0062
         * @tc.name testPixel0062
         * @tc.desc 像素：二百四十级灰的最小通道回显，隐藏回调注册后采样完整
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0062 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(240, 240, 240, 255);
            const hide: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(minChannel(pixel.pixel)).assertEqual(240);
            expect(pixel.corner.length).assertEqual(PIXEL_SIZE);
            expect(isResultCode(hide.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0062 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0063
         * @tc.name testPixel0063
         * @tc.desc 像素：纯红连续两次渲染，回读逐通道一致且触摸拦截注册不受影响
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0063 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            const second: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            const intercept: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(channelDelta(first.pixel, second.pixel)).assertEqual(0);
            expect(second.pixel[0]).assertEqual(first.pixel[0]);
            expect(isResultCode(intercept.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0063 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0064
         * @tc.name testPixel0064
         * @tc.desc 像素：纯绿连续两次渲染幂等，按键动作查询返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0064 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(0, 255, 0, 255);
            const second: PixelProbeResult = probeRenderSolidPixel(0, 255, 0, 255);
            const action: ProbeResult = probeGetKeyEventAction();
            expect(second.pixel[1]).assertEqual(first.pixel[1]);
            expect(second.corner[1]).assertEqual(255);
            expect(isResultCode(action.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0064 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0065
         * @tc.name testPixel0065
         * @tc.desc 像素：纯蓝连续两次渲染幂等，按键码查询返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testPixel0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0065 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
            const second: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
            const code: ProbeResult = probeGetKeyEventCode();
            expect(second.pixel[2]).assertEqual(first.pixel[2]);
            expect(second.aux).assertEqual(first.aux);
            expect(isResultCode(code.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0065 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0066
         * @tc.name testPixel0066
         * @tc.desc 像素：十七/三十四/五十一阶跃色回读，页面上下文键数保持为二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0066 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(17, 34, 51, 255);
            const context: object = GetContext(1);
            expect(pixel.pixel[0]).assertEqual(17);
            expect(pixel.pixel[1]).assertEqual(34);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0066 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0067
         * @tc.name testPixel0067
         * @tc.desc 像素：五十一/三十四/十七阶跃色回读，形状索引保持非负整数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0067 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(51, 34, 17, 255);
            const shape: number = getShapeIndex();
            expect(pixel.pixel[0]).assertEqual(51);
            expect(pixel.pixel[2]).assertEqual(17);
            expect(shape >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0067 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0068
         * @tc.name testPixel0068
         * @tc.desc 像素：一零零/一五零/二零零冷色回读，重绘后通道大小关系保持
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0068 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(100, 150, 200, 255);
            animate();
            expect(pixel.pixel[0] < pixel.pixel[2]).assertTrue();
            expect(pixel.pixel[2]).assertEqual(200);
            expect(pixel.aux).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0068 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0069
         * @tc.name testPixel0069
         * @tc.desc 像素：二零零/一五零/一零零暖色回读，尺寸回读仍合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0069 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(200, 150, 100, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(pixel.pixel[0] > pixel.pixel[2]).assertTrue();
            expect(pixel.pixel[0]).assertEqual(200);
            expect(size.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0069 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0070
         * @tc.name testPixel0070
         * @tc.desc 像素：五/十/十五低亮度色回读，偏移回读仍有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0070 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(5, 10, 15, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(isDarkPixel(pixel.pixel)).assertTrue();
            expect(pixel.pixel[2]).assertEqual(15);
            expect(Number.isFinite(offset.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0070 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0071
         * @tc.name testPixel0071
         * @tc.desc 像素：二五零/二四五/二四零近满色回读，组件标识长度一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0071 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(250, 245, 240, 255);
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(isBrightPixel(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(250);
            expect(identity.id.length).assertEqual(identity.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0071 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0072
         * @tc.name testPixel0072
         * @tc.desc 像素：二四零/二四五/二五零反向近满色回读，器具类型在合法域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0072 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(240, 245, 250, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(pixel.pixel[2]).assertEqual(250);
            expect(minChannel(pixel.pixel) >= 240).assertTrue();
            expect(toolType.value <= 8).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0072 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0073
         * @tc.name testPixel0073
         * @tc.desc 像素：一二七级灰位于中值下侧，横倾角仍在正负九十内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0073 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(127, 127, 127, 255);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(127);
            expect(Math.abs(tiltX.value) <= 90).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0073 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0074
         * @tc.name testPixel0074
         * @tc.desc 像素：一二九级灰位于中值上侧，纵倾角仍在正负九十内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0074 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(129, 129, 129, 255);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            expect(pixel.pixel[0]).assertEqual(129);
            expect(pixel.pixel[0] > 127).assertTrue();
            expect(Math.abs(tiltY.value) <= 90).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0074 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0075
         * @tc.name testPixel0075
         * @tc.desc 像素：一九一级灰在亮档下侧，窗口横坐标查询索引为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0075 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(191, 191, 191, 255);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            expect(pixel.pixel[0]).assertEqual(191);
            expect(isBrightPixel(pixel.pixel)).assertFalse();
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0075 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0076
         * @tc.name testPixel0076
         * @tc.desc 像素：一九三级灰在亮档上侧，窗口纵坐标查询索引为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0076 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(193, 193, 193, 255);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(pixel.pixel[0]).assertEqual(193);
            expect(isBrightPixel(pixel.pixel)).assertTrue();
            expect(windowY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0076 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0077
         * @tc.name testPixel0077
         * @tc.desc 像素：六三级灰恰在暗档内，屏幕横坐标查询索引为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0077 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(63, 63, 63, 255);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            expect(isDarkPixel(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(63);
            expect(displayX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0077 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0078
         * @tc.name testPixel0078
         * @tc.desc 像素：六五级灰越过暗档上界，屏幕纵坐标查询索引为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0078 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(65, 65, 65, 255);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(isDarkPixel(pixel.pixel)).assertFalse();
            expect(pixel.pixel[0]).assertEqual(65);
            expect(displayY.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0078 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0079
         * @tc.name testPixel0079
         * @tc.desc 像素：三二/六四/一二八等比色回读，事件来源类型返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0079 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(32, 64, 128, 255);
            const sourceType: ProbeResult = probeGetTouchEventSourceType(0);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 4);
            expect(isResultCode(sourceType.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0079 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0080
         * @tc.name testPixel0080
         * @tc.desc 像素：一二八/六四/三二等比递减色回读，历史点数量非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0080 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 64, 32, 255);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1] * 2);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 2);
            expect(points.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0080 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0081
         * @tc.name testPixel0081
         * @tc.desc 像素：十六/三二/四八等距色回读，按键事件指针标志在零一同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0081 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(16, 32, 48, 255);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(pixel.pixel[1] - pixel.pixel[0]).assertEqual(16);
            expect(pixel.pixel[2] - pixel.pixel[1]).assertEqual(16);
            expect(keyEvent.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0081 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0082
         * @tc.name testPixel0082
         * @tc.desc 像素：四八/三二/十六反向等距色回读，鼠标扩展信息标志在零一同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0082 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(48, 32, 16, 255);
            const extraMouse: ProbeResult = probeGetExtraMouseEventInfo();
            expect(pixel.pixel[0] - pixel.pixel[1]).assertEqual(16);
            expect(pixel.pixel[1] - pixel.pixel[2]).assertEqual(16);
            expect(extraMouse.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0082 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0083
         * @tc.name testPixel0083
         * @tc.desc 像素：七/十四/二一倍增色回读，修饰键状态位图非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0083 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(7, 14, 21, 255);
            const modifier: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 3);
            expect(modifier.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0083 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0084
         * @tc.name testPixel0084
         * @tc.desc 像素：二一/十四/七递减色回读，无障碍提供者标志在零一同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0084 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(21, 14, 7, 255);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1] + pixel.pixel[2]);
            expect(pixel.pixel[0] > pixel.pixel[2]).assertTrue();
            expect(provider.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0084 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0085
         * @tc.name testPixel0085
         * @tc.desc 像素：三/六/九三倍色回读，帧率区间回显入参下上限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0085 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(3, 6, 9, 255);
            const range: ProbeResult = probeSetExpectedFrameRateRange(30, 90, 60);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[0] * 2);
            expect(pixel.pixel[2]).assertEqual(pixel.pixel[0] * 3);
            expect(isResultCode(range.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0085 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0086
         * @tc.name testPixel0086
         * @tc.desc 像素：九/六/三反向三倍色回读，软键盘回显入参
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0086 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(9, 6, 3, 255);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2] * 3);
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2] * 2);
            expect(isResultCode(keyboard.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0086 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0087
         * @tc.name testPixel0087
         * @tc.desc 像素：九十九级灰在暗档外，基础回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0087 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(99, 99, 99, 255);
            const base: ProbeResult = probeRegisterCallback();
            expect(pixel.pixel[0]).assertEqual(99);
            expect(isDarkPixel(pixel.pixel)).assertFalse();
            expect(isResultCode(base.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0087 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0088
         * @tc.name testPixel0088
         * @tc.desc 像素：一百零一级灰的通道差异数，鼠标回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0088 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(101, 101, 101, 255);
            const mouse: ProbeResult = probeRegisterMouseEventCallback();
            expect(distinctValues(pixel.pixel) <= 2).assertTrue();
            expect(pixel.pixel[0]).assertEqual(101);
            expect(isResultCode(mouse.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0088 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0089
         * @tc.name testPixel0089
         * @tc.desc 像素：一百九十九级灰的角点回读，获焦回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0089 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(199, 199, 199, 255);
            const focus: ProbeResult = probeRegisterFocusEventCallback();
            expect(pixel.corner[0]).assertEqual(199);
            expect(pixel.pixel[0]).assertEqual(199);
            expect(isResultCode(focus.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0089 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0090
         * @tc.name testPixel0090
         * @tc.desc 像素：二百零一级灰的两点差异，失焦回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0090 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(201, 201, 201, 255);
            const blur: ProbeResult = probeRegisterBlurEventCallback();
            expect(channelDelta(pixel.pixel, pixel.corner)).assertEqual(0);
            expect(pixel.pixel[0] > 200).assertTrue();
            expect(isResultCode(blur.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0090 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0091
         * @tc.name testPixel0091
         * @tc.desc 像素：二百二十二级灰的最大最小通道，按键回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0091 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(222, 222, 222, 255);
            const key: ProbeResult = probeRegisterKeyEventCallback();
            expect(maxChannel(pixel.pixel)).assertEqual(minChannel(pixel.pixel));
            expect(pixel.pixel[0]).assertEqual(222);
            expect(isResultCode(key.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0091 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0092
         * @tc.name testPixel0092
         * @tc.desc 像素：三十三级灰的三通道平衡，带结果按键回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0092 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(33, 33, 33, 255);
            const keyResult: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(33);
            expect(isResultCode(keyResult.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0092 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0093
         * @tc.name testPixel0093
         * @tc.desc 像素：四十四级灰的 RGB 通道和，逐帧回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0093 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(44, 44, 44, 255);
            const onFrame: ProbeResult = probeRegisterOnFrameCallback();
            expect(rgbSum(pixel.pixel)).assertEqual(132);
            expect(pixel.pixel[0]).assertEqual(44);
            expect(isResultCode(onFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0093 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0094
         * @tc.name testPixel0094
         * @tc.desc 像素：五十五级灰的四通道域，逐帧注销重复调用返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0094 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(55, 55, 55, 255);
            const offFrame: ProbeResult = probeUnregisterOnFrameCallback();
            expect(isChannelInRange(pixel.pixel)).assertTrue();
            expect(pixel.pixel[0]).assertEqual(55);
            expect(isResultCode(offFrame.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0094 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0095
         * @tc.name testPixel0095
         * @tc.desc 像素：六十六级灰的采样描述段数，显示回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0095 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(66, 66, 66, 255);
            const show: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(describePixel(pixel.pixel).split('/').length).assertEqual(CHANNEL_COUNT);
            expect(pixel.pixel[0]).assertEqual(66);
            expect(isResultCode(show.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0095 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0096
         * @tc.name testPixel0096
         * @tc.desc 像素：七十七级灰的非零通道数，隐藏回调重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0096 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(77, 77, 77, 255);
            const hide: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(countAbove(pixel.pixel, 0)).assertEqual(4);
            expect(pixel.pixel[0]).assertEqual(77);
            expect(isResultCode(hide.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0096 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0097
         * @tc.name testPixel0097
         * @tc.desc 像素：八十八级灰的亮暗判定，触摸拦截重复注册返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0097 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(88, 88, 88, 255);
            const intercept: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(isDarkPixel(pixel.pixel)).assertFalse();
            expect(isBrightPixel(pixel.pixel)).assertFalse();
            expect(isResultCode(intercept.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0097 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0098
         * @tc.name testPixel0098
         * @tc.desc 像素：一百一十级灰的最小通道，按键动作在无事件时返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0098 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(110, 110, 110, 255);
            const action: ProbeResult = probeGetKeyEventAction();
            expect(minChannel(pixel.pixel)).assertEqual(110);
            expect(pixel.pixel[0]).assertEqual(110);
            expect(isResultCode(action.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0098 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0099
         * @tc.name testPixel0099
         * @tc.desc 像素：一百二十级灰的最大通道，按键码在无事件时返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testPixel0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0099 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(120, 120, 120, 255);
            const code: ProbeResult = probeGetKeyEventCode();
            expect(maxChannel(pixel.pixel)).assertEqual(120);
            expect(pixel.pixel[0]).assertEqual(120);
            expect(isResultCode(code.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0099 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_PIXEL_0100
         * @tc.name testPixel0100
         * @tc.desc 像素：一百四十级灰的应用上下文联动，键数保持为四且像素回读完整
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testPixel0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0100 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(140, 140, 140, 255);
            const context: object = GetContext(0);
            expect(pixel.pixel[0]).assertEqual(140);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(4);
            expect(pixel.corner.length).assertEqual(PIXEL_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testPixel0100 end');
        });

    });
}
