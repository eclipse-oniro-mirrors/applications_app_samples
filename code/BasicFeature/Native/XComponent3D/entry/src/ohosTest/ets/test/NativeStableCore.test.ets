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
const PROBE_SURFACE_SIZE: number = 4;

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

function isAllEqual(pixel: number[]): boolean {
    for (let i = 1; i < pixel.length; i++) {
        if (pixel[i] !== pixel[0]) { return false; }
    }
    return true;
}

function maxChannel(pixel: number[]): number {
    let max: number = 0;
    for (let i = 0; i < pixel.length; i++) {
        if (pixel[i] > max) { max = pixel[i]; }
    }
    return max;
}

// 采样与角点都是 RGBA 四通道，末位 alpha 恒为 255，
// 色彩最值只能看前三通道，否则 alpha 会掩盖真实色彩最值
function rgbMax(pixel: number[]): number {
    let max: number = 0;
    for (let i = 0; i < 3 && i < pixel.length; i++) {
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

function sameId(first: ProbeIdResult, second: ProbeIdResult): boolean {
    return first.code === second.code && first.value === second.value && first.aux === second.aux &&
        first.id === second.id;
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

function renderTimes(red: number, green: number, blue: number, alpha: number, times: number): PixelProbeResult {
    let last: PixelProbeResult = probeRenderSolidPixel(red, green, blue, alpha);
    for (let i = 1; i < times; i++) {
        last = probeRenderSolidPixel(red, green, blue, alpha);
    }
    return last;
}

function shapeAfter(value: number, times: number): number {
    for (let i = 0; i < times; i++) {
        changeShape(value);
    }
    return getShapeIndex();
}

export default function nativeStableCoreTest() {
    resetYieldCounter();
    describe('NativeStableCoreTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0001
         * @tc.name testStable0001
         * @tc.desc 稳定：同色连续两次渲染，返回结构与四个通道逐项相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0001 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(32, 64, 128, 255);
            const second: PixelProbeResult = probeRenderSolidPixel(32, 64, 128, 255);
            expect(samePixel(first, second)).assertTrue();
            expect(second.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(second.aux).assertEqual(PROBE_SURFACE_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0002
         * @tc.name testStable0002
         * @tc.desc 稳定：同色连续三次渲染，末次与首轮通道和一致且判定码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0002 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(10, 20, 30, 255);
            const last: PixelProbeResult = renderTimes(10, 20, 30, 255, 3);
            expect(samePixel(first, last)).assertTrue();
            expect(channelSum(last.pixel)).assertEqual(channelSum(first.pixel));
            expect(isResultCode(last.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0003
         * @tc.name testStable0003
         * @tc.desc 稳定：同色连续五次渲染，回读值与角点采样同时保持不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0003 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(96, 48, 24, 255);
            const last: PixelProbeResult = renderTimes(96, 48, 24, 255, 5);
            expect(last.value).assertEqual(first.value);
            expect(channelDelta(first.corner, last.corner)).assertEqual(0);
            expect(last.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0004
         * @tc.name testStable0004
         * @tc.desc 稳定：同色连续十次渲染，结构层与颜色层均无漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0004 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(7, 77, 177, 255);
            const last: PixelProbeResult = renderTimes(7, 77, 177, 255, 10);
            expect(samePixel(first, last)).assertTrue();
            expect(maxChannel(last.pixel)).assertEqual(maxChannel(first.pixel));
            expect(last.aux).assertEqual(first.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0005
         * @tc.name testStable0005
         * @tc.desc 稳定：甲色渲染后插入乙色，再回甲色时与基线逐通道一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0005 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(64, 128, 192, 255);
            probeRenderSolidPixel(192, 128, 64, 255);
            const back: PixelProbeResult = probeRenderSolidPixel(64, 128, 192, 255);
            expect(samePixel(baseline, back)).assertTrue();
            expect(channelDelta(baseline.pixel, back.pixel)).assertEqual(0);
            expect(back.value).assertEqual(baseline.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0006
         * @tc.name testStable0006
         * @tc.desc 稳定：甲乙交替六轮后回到甲色，两次甲色结果相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0006 begin');
            const baseline: PixelProbeResult = probeRenderSolidPixel(12, 24, 48, 255);
            for (let i = 0; i < 6; i++) {
                probeRenderSolidPixel(48, 24, 12, 255);
                probeRenderSolidPixel(12, 24, 48, 255);
            }
            const last: PixelProbeResult = probeRenderSolidPixel(12, 24, 48, 255);
            expect(samePixel(baseline, last)).assertTrue();
            expect(channelSum(last.pixel)).assertEqual(channelSum(baseline.pixel));
            expect(isAllEqual(last.corner) === isAllEqual(baseline.corner)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0007
         * @tc.name testStable0007
         * @tc.desc 稳定：同色连续二十次渲染，末次与首轮完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0007 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(200, 100, 50, 255);
            const last: PixelProbeResult = renderTimes(200, 100, 50, 255, 20);
            expect(samePixel(first, last)).assertTrue();
            expect(last.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(last.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0008
         * @tc.name testStable0008
         * @tc.desc 稳定：同色连续五十次渲染，表面边长恒为四且通道和不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0008 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(3, 5, 7, 255);
            const last: PixelProbeResult = renderTimes(3, 5, 7, 255, 50);
            expect(last.aux).assertEqual(PROBE_SURFACE_SIZE);
            expect(last.value).assertEqual(first.value);
            expect(channelSum(last.pixel)).assertEqual(channelSum(first.pixel));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0009
         * @tc.name testStable0009
         * @tc.desc 稳定：中灰重复六次渲染，主采样与角点采样始终一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0009 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
            const last: PixelProbeResult = renderTimes(128, 128, 128, 255, 6);
            expect(channelDelta(last.pixel, last.corner)).assertEqual(0);
            expect(channelDelta(first.pixel, last.pixel)).assertEqual(0);
            expect(last.pixel.length).assertEqual(last.corner.length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0010
         * @tc.name testStable0010
         * @tc.desc 稳定：纯白重复十六次渲染，最大通道取值不漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0010 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            const last: PixelProbeResult = renderTimes(255, 255, 255, 255, 16);
            expect(maxChannel(last.pixel)).assertEqual(maxChannel(first.pixel));
            expect(samePixel(first, last)).assertTrue();
            expect(last.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0011
         * @tc.name testStable0011
         * @tc.desc 稳定：全黑重复十二次渲染，RGB 通道和恒为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0011 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
            const last: PixelProbeResult = renderTimes(0, 0, 0, 255, 12);
            expect(rgbSum(last.pixel)).assertEqual(0);
            expect(rgbSum(first.pixel)).assertEqual(rgbSum(last.pixel));
            expect(rgbMax(last.pixel)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0012
         * @tc.name testStable0012
         * @tc.desc 稳定：越界参数重复五次调用，每次均以参数错误幂等拒绝
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0012 begin');
            let allRejected: boolean = true;
            let allEmpty: boolean = true;
            for (let i = 0; i < 5; i++) {
                const attempt: PixelProbeResult = probeRenderSolidPixel(300, 0, 0, 255);
                if (attempt.code !== RESULT_BAD_PARAMETER) { allRejected = false; }
                if (rgbSum(attempt.pixel) !== 0) { allEmpty = false; }
            }
            expect(allRejected).assertTrue();
            expect(allEmpty).assertTrue();
            expect(probeRenderSolidPixel(300, 0, 0, 255).aux).assertEqual(PROBE_SURFACE_SIZE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0013
         * @tc.name testStable0013
         * @tc.desc 稳定：形状设为一连续两次，索引回读恒为一并在末位复位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0013 begin');
            changeShape(1);
            const first: number = getShapeIndex();
            changeShape(1);
            const second: number = getShapeIndex();
            expect(first).assertEqual(1);
            expect(second).assertEqual(first);
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0014
         * @tc.name testStable0014
         * @tc.desc 稳定：形状设为一连续五次，索引回读仍为一且不累加
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0014 begin');
            const value: number = shapeAfter(1, 5);
            const again: number = getShapeIndex();
            expect(value).assertEqual(1);
            expect(again).assertEqual(value);
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0015
         * @tc.name testStable0015
         * @tc.desc 稳定：形状由零逐档推进到五后再回零，终点索引精确归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0015 begin');
            let lastSet: number = -1;
            for (let i = 0; i <= 5; i++) {
                changeShape(i);
                lastSet = getShapeIndex();
            }
            expect(lastSet).assertEqual(5);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(lastSet !== getShapeIndex()).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0016
         * @tc.name testStable0016
         * @tc.desc 稳定：形状连续十次置零，索引回读恒为零值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0016 begin');
            const value: number = shapeAfter(0, 10);
            expect(value).assertEqual(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(Number.isFinite(value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0017
         * @tc.name testStable0017
         * @tc.desc 稳定：形状设为九连续三次，索引回读为九且两次读取相等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0017 begin');
            const value: number = shapeAfter(9, 3);
            const again: number = getShapeIndex();
            expect(value).assertEqual(9);
            expect(again).assertEqual(9);
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0018
         * @tc.name testStable0018
         * @tc.desc 稳定：形状设定与动画交替推进，动画不篡改形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0018 begin');
            changeShape(2);
            animate();
            const afterAnimate: number = getShapeIndex();
            animate();
            const afterSecond: number = getShapeIndex();
            expect(afterAnimate).assertEqual(2);
            expect(afterSecond).assertEqual(afterAnimate);
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0019
         * @tc.name testStable0019
         * @tc.desc 稳定：形状设为三后执行渲染，形状索引不被渲染路径改写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0019 begin');
            changeShape(3);
            const pixel: PixelProbeResult = probeRenderSolidPixel(9, 9, 9, 255);
            const shape: number = getShapeIndex();
            expect(shape).assertEqual(3);
            expect(isResultCode(pixel.code)).assertTrue();
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0020
         * @tc.name testStable0020
         * @tc.desc 稳定：形状设为一百连续两次，越界档位原值回读且不截断
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0020 begin');
            const value: number = shapeAfter(100, 2);
            const again: number = getShapeIndex();
            expect(value).assertEqual(100);
            expect(again).assertEqual(value);
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0021
         * @tc.name testStable0021
         * @tc.desc 稳定：形状取无符号单字节上界二百五十五，回读值与入参一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0021 begin');
            changeShape(255);
            const value: number = getShapeIndex();
            expect(value).assertEqual(255);
            expect(value > 100).assertTrue();
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0022
         * @tc.name testStable0022
         * @tc.desc 稳定：零到九共十档逐档设定两轮，末轮各档回读与设定值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0022 begin');
            let matched: number = 0;
            for (let round = 0; round < 2; round++) {
                for (let i = 0; i < 10; i++) {
                    changeShape(i);
                    if (getShapeIndex() === i) { matched++; }
                }
            }
            expect(matched).assertEqual(20);
            expect(getShapeIndex()).assertEqual(9);
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0023
         * @tc.name testStable0023
         * @tc.desc 稳定：幂等设定后切换新档位，索引按新值生效而非停留在旧值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0023 begin');
            const repeated: number = shapeAfter(4, 3);
            changeShape(7);
            const switched: number = getShapeIndex();
            expect(repeated).assertEqual(4);
            expect(switched).assertEqual(7);
            expect(switched !== repeated).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0024
         * @tc.name testStable0024
         * @tc.desc 稳定：复位为零后连续三次读取，索引恒零且取值有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0024 begin');
            shapeAfter(0, 1);
            const first: number = getShapeIndex();
            const second: number = getShapeIndex();
            const third: number = getShapeIndex();
            expect(first).assertEqual(0);
            expect(second).assertEqual(first);
            expect(third).assertEqual(first);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0025
         * @tc.name testStable0025
         * @tc.desc 稳定：表面尺寸连续两次查询，判定码与宽高三元组完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0025 begin');
            const first: ProbeResult = probeGetXComponentSize();
            const second: ProbeResult = probeGetXComponentSize();
            expect(sameProbe(first, second)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(second.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0025 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0026
         * @tc.name testStable0026
         * @tc.desc 稳定：表面尺寸连续五次查询，宽高与判定码均无变化
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0026 begin');
            const baseline: ProbeResult = probeGetXComponentSize();
            let stable: number = 0;
            for (let i = 0; i < 4; i++) {
                if (sameProbe(baseline, probeGetXComponentSize())) { stable++; }
            }
            expect(stable).assertEqual(4);
            expect(probeGetXComponentSize().aux).assertEqual(baseline.aux);
            expect(isResultCode(baseline.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0026 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0027
         * @tc.name testStable0027
         * @tc.desc 稳定：表面偏移连续两次查询，横纵坐标与判定码完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0027 begin');
            const first: ProbeResult = probeGetXComponentOffset();
            const second: ProbeResult = probeGetXComponentOffset();
            expect(sameProbe(first, second)).assertTrue();
            expect(Number.isFinite(second.value)).assertTrue();
            expect(Number.isFinite(second.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0027 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0028
         * @tc.name testStable0028
         * @tc.desc 稳定：表面偏移连续五次查询，横坐标始终不漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0028 begin');
            const baseline: ProbeResult = probeGetXComponentOffset();
            let stable: number = 0;
            for (let i = 0; i < 4; i++) {
                if (probeGetXComponentOffset().value === baseline.value) { stable++; }
            }
            expect(stable).assertEqual(4);
            expect(probeGetXComponentOffset().aux).assertEqual(baseline.aux);
            expect(isResultCode(baseline.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0028 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0029
         * @tc.name testStable0029
         * @tc.desc 稳定：组件标识连续两次查询，标识串与三元组均完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testStable0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0029 begin');
            const first: ProbeIdResult = probeGetXComponentId();
            const second: ProbeIdResult = probeGetXComponentId();
            expect(sameId(first, second)).assertTrue();
            expect(second.value).assertEqual(first.value);
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0029 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0030
         * @tc.name testStable0030
         * @tc.desc 稳定：尺寸查询与渲染交错后重查，宽高与插入前完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0030 begin');
            const before: ProbeResult = probeGetXComponentSize();
            probeRenderSolidPixel(120, 60, 30, 255);
            const after: ProbeResult = probeGetXComponentSize();
            expect(sameProbe(before, after)).assertTrue();
            expect(after.aux).assertEqual(before.aux);
            expect(after.value).assertEqual(before.value);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0030 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0031
         * @tc.name testStable0031
         * @tc.desc 稳定：偏移查询与形状切换交错后重查，横纵坐标不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0031 begin');
            const before: ProbeResult = probeGetXComponentOffset();
            changeShape(6);
            const after: ProbeResult = probeGetXComponentOffset();
            expect(sameProbe(before, after)).assertTrue();
            expect(after.value).assertEqual(before.value);
            expect(shapeAfter(0, 1)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0031 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0032
         * @tc.name testStable0032
         * @tc.desc 稳定：尺寸两返回值均非负，且高度值两次查询完全相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0032 begin');
            const first: ProbeResult = probeGetXComponentSize();
            const second: ProbeResult = probeGetXComponentSize();
            expect(first.aux >= 0).assertTrue();
            expect(second.aux).assertEqual(first.aux);
            expect(first.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0032 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0033
         * @tc.name testStable0033
         * @tc.desc 稳定：标识查询四次连调，长度字段与标识串长度始终相等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0033 begin');
            let matched: number = 0;
            for (let i = 0; i < 4; i++) {
                const identity: ProbeIdResult = probeGetXComponentId();
                if (identity.id.length === identity.value) { matched++; }
            }
            expect(matched).assertEqual(4);
            expect(probeGetXComponentId().id.length).assertEqual(probeGetXComponentId().id.length);
            expect(isResultCode(probeGetXComponentId().code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0033 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0034
         * @tc.name testStable0034
         * @tc.desc 稳定：尺寸与偏移交替六轮，两类返回值各自始终不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0034 begin');
            const sizeBase: ProbeResult = probeGetXComponentSize();
            const offsetBase: ProbeResult = probeGetXComponentOffset();
            let stable: number = 0;
            for (let i = 0; i < 6; i++) {
                const sizeSame: boolean = sameProbe(sizeBase, probeGetXComponentSize());
                const offsetSame: boolean = sameProbe(offsetBase, probeGetXComponentOffset());
                if (sizeSame && offsetSame) {
                    stable++;
                }
            }
            expect(stable).assertEqual(6);
            expect(sizeBase.value >= 0).assertTrue();
            expect(offsetBase.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0034 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0035
         * @tc.name testStable0035
         * @tc.desc 稳定：基础回调连续三次注册，返回码每次都相同且属于合法域
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0035 begin');
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterCallback();
            const third: ProbeResult = probeRegisterCallback();
            expect(second.code).assertEqual(first.code);
            expect(third.code).assertEqual(first.code);
            expect(isResultCode(first.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0035 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0036
         * @tc.name testStable0036
         * @tc.desc 稳定：鼠标回调两次注册，判定码与附加字段保持一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0036 begin');
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterMouseEventCallback();
            expect(sameProbe(first, second)).assertTrue();
            expect(second.value).assertEqual(0);
            expect(second.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0036 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0037
         * @tc.name testStable0037
         * @tc.desc 稳定：获焦回调三次注册，判定码恒同且附加字段为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0037 begin');
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterFocusEventCallback();
            const third: ProbeResult = probeRegisterFocusEventCallback();
            expect(second.code).assertEqual(first.code);
            expect(third.value).assertEqual(0);
            expect(isResultCode(third.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0037 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0038
         * @tc.name testStable0038
         * @tc.desc 稳定：失焦回调两次注册，两次调用返回结构完全相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0038 begin');
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterBlurEventCallback();
            expect(sameProbe(first, second)).assertTrue();
            expect(second.aux).assertEqual(0);
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0038 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0039
         * @tc.name testStable0039
         * @tc.desc 稳定：按键回调两次注册，返回码与两个附加字段均不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0039 begin');
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallback();
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(first.value);
            expect(second.aux).assertEqual(first.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0039 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0040
         * @tc.name testStable0040
         * @tc.desc 稳定：带返回值按键回调两次注册，判定码保持同一取值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0040 begin');
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(sameProbe(first, second)).assertTrue();
            expect(second.value).assertEqual(0);
            expect(isResultCode(first.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0040 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0041
         * @tc.name testStable0041
         * @tc.desc 稳定：帧回调两次注册，判定码与附加字段均保持稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0041 begin');
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeRegisterOnFrameCallback();
            expect(sameProbe(first, second)).assertTrue();
            expect(second.aux).assertEqual(0);
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0041 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0042
         * @tc.name testStable0042
         * @tc.desc 稳定：帧回调注销两次调用，返回码恒同且不因重复注销改变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0042 begin');
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(0);
            expect(isResultCode(second.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0042 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0043
         * @tc.name testStable0043
         * @tc.desc 稳定：表面显示与隐藏回调各注册两次，四组返回码两两一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0043 begin');
            const showFirst: ProbeResult = probeRegisterSurfaceShowCallback();
            const hideFirst: ProbeResult = probeRegisterSurfaceHideCallback();
            const showSecond: ProbeResult = probeRegisterSurfaceShowCallback();
            const hideSecond: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(showSecond.code).assertEqual(showFirst.code);
            expect(hideSecond.code).assertEqual(hideFirst.code);
            expect(isResultCode(showFirst.code) && isResultCode(hideFirst.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0043 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0044
         * @tc.name testStable0044
         * @tc.desc 稳定：触摸拦截与输入事件回调各注册两次，返回码保持稳定
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0044 begin');
            const interceptFirst: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const inputFirst: ProbeResult = probeRegisterUIInputEventCallback(1);
            const interceptSecond: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const inputSecond: ProbeResult = probeRegisterUIInputEventCallback(1);
            expect(interceptSecond.code).assertEqual(interceptFirst.code);
            expect(inputSecond.code).assertEqual(inputFirst.code);
            expect(inputSecond.value).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0044 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0045
         * @tc.name testStable0045
         * @tc.desc 稳定：期望帧率区间同参设两次，返回码一致且下界回读三十
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0045 begin');
            const first: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 120);
            const second: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 120);
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(30);
            expect(second.aux).assertEqual(60);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0045 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0046
         * @tc.name testStable0046
         * @tc.desc 稳定：帧率区间改取全区间两次，上界回读一百二十且码不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0046 begin');
            const first: ProbeResult = probeSetExpectedFrameRateRange(0, 120, 60);
            const second: ProbeResult = probeSetExpectedFrameRateRange(0, 120, 60);
            expect(sameProbe(first, second)).assertTrue();
            expect(second.aux).assertEqual(120);
            expect(second.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0046 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0047
         * @tc.name testStable0047
         * @tc.desc 稳定：软键盘需求置一两次，入参回显恒为一且码相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0047 begin');
            const first: ProbeResult = probeSetNeedSoftKeyboard(1);
            const second: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(second.code).assertEqual(first.code);
            expect(second.value).assertEqual(1);
            expect(second.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0047 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0048
         * @tc.name testStable0048
         * @tc.desc 稳定：软键盘需求置零两次，入参回显恒为零且结构一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testStable0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0048 begin');
            const first: ProbeResult = probeSetNeedSoftKeyboard(0);
            const second: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(sameProbe(first, second)).assertTrue();
            expect(second.value).assertEqual(0);
            expect(second.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0048 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0049
         * @tc.name testStable0049
         * @tc.desc 稳定：应用上下文两次获取，键数量相同且非空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0049 begin');
            const first: object = GetContext(0);
            const second: object = GetContext(0);
            const firstKeys: number = Object.getOwnPropertyNames(first).length;
            const secondKeys: number = Object.getOwnPropertyNames(second).length;
            expect(secondKeys).assertEqual(firstKeys);
            expect(firstKeys > 0).assertTrue();
            expect(Object.getOwnPropertyNames(first).length).assertEqual(Object.getOwnPropertyNames(second).length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0049 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_STABLE_0050
         * @tc.name testStable0050
         * @tc.desc 稳定：页面上下文两次获取，键数量相同且不超过应用上下文键数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testStable0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0050 begin');
            const first: object = GetContext(1);
            const second: object = GetContext(1);
            const pageKeys: number = Object.getOwnPropertyNames(first).length;
            const appKeys: number = Object.getOwnPropertyNames(GetContext(0)).length;
            expect(Object.getOwnPropertyNames(second).length).assertEqual(pageKeys);
            expect(pageKeys > 0).assertTrue();
            expect(pageKeys <= appKeys).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testStable0050 end');
        });
    });
}
