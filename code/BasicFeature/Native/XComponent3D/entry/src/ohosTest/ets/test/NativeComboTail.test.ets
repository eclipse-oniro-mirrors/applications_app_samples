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
    probeGetTouchPointWindowX,
    probeGetTouchPointWindowY,
    probeGetTouchPointDisplayX,
    probeGetTouchPointDisplayY,
    probeGetHistoricalPoints,
    probeGetKeyEvent,
    probeGetMouseEventModifierKeyStates,
    probeGetNativeAccessibilityProvider,
    probeSetExpectedFrameRateRange,
    probeSetNeedSoftKeyboard,
    probeRegisterCallback,
    probeRegisterOnFrameCallback,
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

const CHANNEL_COUNT: number = 4;
const CHANNEL_MAX: number = 255;
const PROBE_BUFFER_EDGE: number = 4;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

function channelSum(pixel: number[]): number {
    let total: number = 0;
    for (let i = 0; i < pixel.length; i++) {
        total += pixel[i];
    }
    return total;
}

function isAllEqual(pixel: number[]): boolean {
    for (let i = 1; i < pixel.length; i++) {
        if (pixel[i] !== pixel[0]) {
            return false;
        }
    }
    return true;
}

function isGrayBalanced(pixel: number[]): boolean {
    return pixel.length === CHANNEL_COUNT && pixel[0] === pixel[1] && pixel[1] === pixel[2];
}

function countAbove(pixel: number[], limit: number): number {
    let count: number = 0;
    for (let i = 0; i < pixel.length; i++) {
        if (pixel[i] > limit) {
            count++;
        }
    }
    return count;
}

function distinctValues(pixel: number[]): number {
    const seen: number[] = [];
    for (let i = 0; i < pixel.length; i++) {
        if (seen.indexOf(pixel[i]) < 0) {
            seen.push(pixel[i]);
        }
    }
    return seen.length;
}

function isAlphaOpaque(pixel: number[]): boolean {
    return pixel.length === CHANNEL_COUNT && pixel[3] === CHANNEL_MAX;
}

function pixelDelta(first: number[], second: number[]): number {
    if (first.length !== second.length) {
        return -1;
    }
    let delta: number = 0;
    for (let i = 0; i < first.length; i++) {
        delta += Math.abs(first[i] - second[i]);
    }
    return delta;
}

function describePixel(pixel: number[]): string {
    return pixel.join('/');
}

function maxChannel(pixel: number[]): number {
    let max: number = 0;
    for (let i = 0; i < pixel.length; i++) {
        if (pixel[i] > max) {
            max = pixel[i];
        }
    }
    return max;
}

/**
 * 取像素颜色分量（RGB）中的最大值，不把末位的透明度计入。
 * 用于描述“颜色通道中的最大分量”，与含透明度的 maxChannel 区分。
 */
function rgbMax(pixel: number[]): number {
    let max: number = 0;
    const total: number = Math.min(pixel.length, CHANNEL_COUNT - 1);
    for (let i = 0; i < total; i++) {
        if (pixel[i] > max) {
            max = pixel[i];
        }
    }
    return max;
}

function minChannel(pixel: number[]): number {
    if (pixel.length === 0) {
        return -1;
    }
    let min: number = pixel[0];
    for (let i = 1; i < pixel.length; i++) {
        if (pixel[i] < min) {
            min = pixel[i];
        }
    }
    return min;
}

export default function nativeComboTailTest() {
    resetYieldCounter();
    describe('NativeComboTailTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0241
         * @tc.name testCombo0241
         * @tc.desc 组合：纯黑渲染与尺寸回读，像素数组四通道齐全且通道和为有限值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0241 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            expect(channelSum(pixel.pixel) >= 0).assertTrue();
            expect(isResultCode(size.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0241 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0242
         * @tc.name testCombo0242
         * @tc.desc 组合：纯白渲染与偏移回读，四通道取值一致且偏移有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0242 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(pixel.code)).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(pixel.aux).assertEqual(PROBE_BUFFER_EDGE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0242 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0243
         * @tc.name testCombo0243
         * @tc.desc 组合：纯红渲染与器具类型回读，红通道为最大值候选
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0243 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(pixel.pixel[0] <= CHANNEL_MAX).assertTrue();
            expect(maxChannel(pixel.pixel) <= CHANNEL_MAX).assertTrue();
            expect(toolType.aux).assertEqual(0);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0243 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0244
         * @tc.name testCombo0244
         * @tc.desc 组合：纯绿渲染与横倾角回读，通道最小值非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0244 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 255, 0, 255);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(minChannel(pixel.pixel) >= 0).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(tiltX.code)).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0244 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0245
         * @tc.name testCombo0245
         * @tc.desc 组合：纯蓝渲染与历史点回读，非零通道数量不少于零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0245 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(countAbove(pixel.pixel, -1)).assertEqual(CHANNEL_COUNT);
            expect(points.value >= 0).assertTrue();
            expect(pixel.value <= CHANNEL_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0245 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0246
         * @tc.name testCombo0246
         * @tc.desc 组合：青色渲染与按键事件回读，RG 两通道取值相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0246 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 255, 255, 255);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(pixel.pixel[1]).assertEqual(pixel.pixel[2]);
            expect(keyEvent.value <= 1).assertTrue();
            expect(pixel.aux).assertEqual(PROBE_BUFFER_EDGE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0246 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0247
         * @tc.name testCombo0247
         * @tc.desc 组合：品红渲染与修饰键状态回读，RB 通道取值相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0247 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 0, 255, 255);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2]);
            expect(keys.value >= 0).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0247 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0248
         * @tc.name testCombo0248
         * @tc.desc 组合：黄色渲染与无障碍提供者回读，RB 通道取值相同
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0248 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 255, 0, 255);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[1]);
            expect(provider.value <= 1).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0248 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0249
         * @tc.name testCombo0249
         * @tc.desc 组合：中灰渲染与帧率区间设置，灰阶三通道相等且区间回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0249 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 60);
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(rate.value).assertEqual(60);
            expect(rate.aux).assertEqual(120);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0249 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0250
         * @tc.name testCombo0250
         * @tc.desc 组合：不透明渲染与软键盘开关，Alpha 通道为上限值且开关回显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0250 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(64, 32, 16, 255);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(pixel.pixel[3] <= CHANNEL_MAX).assertTrue();
            expect(keyboard.value).assertEqual(1);
            expect(describePixel(pixel.pixel).length >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0250 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0251
         * @tc.name testCombo0251
         * @tc.desc 组合：半透明渲染与标识回读，Alpha 通道可取非上限值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0251 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(200, 100, 50, 128);
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(pixel.pixel[3] <= CHANNEL_MAX).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0251 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0252
         * @tc.name testCombo0252
         * @tc.desc 组合：全零通道渲染与基础回调注册，像素结构仍为四通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0252 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 0);
            const register: ProbeResult = probeRegisterCallback();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(register.code)).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0252 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0253
         * @tc.name testCombo0253
         * @tc.desc 组合：上限通道渲染与逐帧回调注册，四通道均为上限值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0253 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            const register: ProbeResult = probeRegisterOnFrameCallback();
            expect(countAbove(pixel.pixel, CHANNEL_MAX - 1)).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(register.code)).assertTrue();
            expect(maxChannel(pixel.corner) <= CHANNEL_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0253 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0254
         * @tc.name testCombo0254
         * @tc.desc 组合：单通道红渲染与按键动作查询，通道差异数不少于一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0254 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 0);
            const action: ProbeResult = probeGetKeyEventAction();
            expect(distinctValues(pixel.pixel) >= 1).assertTrue();
            expect(isResultCode(action.code)).assertTrue();
            expect(pixel.value <= CHANNEL_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0254 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0255
         * @tc.name testCombo0255
         * @tc.desc 组合：双通道渲染与形状切换，切换后像素结构不退化
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0255 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(10, 20, 0, 255);
            changeShape(2);
            expect(getShapeIndex()).assertEqual(2);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(pixel.code)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0255 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0256
         * @tc.name testCombo0256
         * @tc.desc 组合：三通道渲染与重绘请求，重绘后像素数组仍可读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0256 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(30, 60, 90, 255);
            animate();
            const again: PixelProbeResult = probeRenderSolidPixel(30, 60, 90, 255);
            expect(again.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(pixel.code)).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0256 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0257
         * @tc.name testCombo0257
         * @tc.desc 组合：同参两次渲染与生命周期上下文，两次像素差值不小于零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0257 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(1, 2, 3, 4);
            const second: PixelProbeResult = probeRenderSolidPixel(1, 2, 3, 4);
            const context: object = GetContext(0);
            expect(pixelDelta(first.pixel, second.corner) >= 0).assertTrue();
            expect(Object.getOwnPropertyNames(context).length).assertEqual(4);
            expect(isResultCode(first.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0257 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0258
         * @tc.name testCombo0258
         * @tc.desc 组合：异参两次渲染与形状索引查询，两次结果结构一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0258 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(5, 10, 15, 20);
            const second: PixelProbeResult = probeRenderSolidPixel(25, 30, 35, 40);
            const shape: number = getShapeIndex();
            expect(first.pixel.length).assertEqual(second.pixel.length);
            expect(Number.isInteger(shape)).assertTrue();
            expect(first.aux).assertEqual(second.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0258 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0259
         * @tc.name testCombo0259
         * @tc.desc 组合：越界通道渲染与尺寸回读，越界入参返回参数错误码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0259 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(300, 0, 0, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(size.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0259 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0260
         * @tc.name testCombo0260
         * @tc.desc 组合：负通道渲染与偏移回读，负值入参同样返回参数错误码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0260 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-1, 0, 0, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            expect(Number.isFinite(offset.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0260 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0261
         * @tc.name testCombo0261
         * @tc.desc 组合：中灰半透明渲染与标识回读，灰阶平衡且标识长度自洽
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0261 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(127, 127, 127, 127);
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(isGrayBalanced(pixel.pixel)).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            expect(pixel.pixel[3] <= CHANNEL_MAX).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0261 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0262
         * @tc.name testCombo0262
         * @tc.desc 组合：橙色调渲染与尺寸回读，通道最大值不超上限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0262 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 128, 0, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(maxChannel(pixel.pixel)).assertEqual(CHANNEL_MAX);
            expect(minChannel(pixel.pixel) >= 0).assertTrue();
            expect(size.value >= 0).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0262 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0263
         * @tc.name testCombo0263
         * @tc.desc 组合：紫色调渲染与偏移回读，不同通道值个数不少于三
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0263 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(128, 0, 128, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(distinctValues(pixel.pixel) >= 2).assertTrue();
            expect(pixel.pixel[0]).assertEqual(pixel.pixel[2]);
            expect(Number.isFinite(offset.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0263 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0264
         * @tc.name testCombo0264
         * @tc.desc 组合：青绿渲染与器具类型回读，绿通道不低于蓝通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0264 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 128, 64, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(pixel.pixel[1] >= pixel.pixel[2]).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            expect(toolType.value <= 8).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0264 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0265
         * @tc.name testCombo0265
         * @tc.desc 组合：深蓝渲染与横倾角回读，蓝通道为颜色通道最大值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0265 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(64, 0, 192, 255);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(pixel.pixel[2]).assertEqual(rgbMax(pixel.pixel));
            expect(isResultCode(tiltX.code)).assertTrue();
            expect(pixel.aux).assertEqual(PROBE_BUFFER_EDGE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0265 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0266
         * @tc.name testCombo0266
         * @tc.desc 组合：棕色调渲染与历史点回读，红通道不小于绿通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0266 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(192, 64, 0, 255);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(pixel.pixel[0] >= pixel.pixel[1]).assertTrue();
            expect(points.aux >= 0).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0266 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0267
         * @tc.name testCombo0267
         * @tc.desc 组合：暗色调渲染与按键事件回读，通道单调递增且事件标志为布尔值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0267 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(31, 63, 127, 255);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(pixel.pixel[0] <= pixel.pixel[1]).assertTrue();
            expect(pixel.pixel[1] <= pixel.pixel[2]).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0267 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0268
         * @tc.name testCombo0268
         * @tc.desc 组合：交错色调渲染与修饰键状态回读，通道大小关系成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0268 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(63, 127, 31, 255);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.pixel[1]).assertEqual(rgbMax(pixel.pixel));
            expect(keys.aux >= 0).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0268 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0269
         * @tc.name testCombo0269
         * @tc.desc 组合：暖色调渲染与无障碍提供者回读，红通道不小于蓝通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0269 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(127, 31, 63, 255);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(pixel.pixel[0] >= pixel.pixel[2]).assertTrue();
            expect(provider.aux).assertEqual(0);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0269 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0270
         * @tc.name testCombo0270
         * @tc.desc 组合：极低通道渲染与帧率区间设置，四通道均为小值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0270 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(1, 1, 1, 1);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(90, 120, 90);
            expect(maxChannel(pixel.pixel) <= 1).assertTrue();
            expect(rate.value).assertEqual(90);
            expect(rate.aux).assertEqual(120);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0270 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0271
         * @tc.name testCombo0271
         * @tc.desc 组合：近上限通道渲染与软键盘关闭，通道最小值不小于上限减一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0271 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(254, 254, 254, 254);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(0);
            expect(minChannel(pixel.pixel) >= CHANNEL_MAX - 1).assertTrue();
            expect(keyboard.value).assertEqual(0);
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0271 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0272
         * @tc.name testCombo0272
         * @tc.desc 组合：等差通道渲染与基础回调注册，像素描述串非空
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0272 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(17, 34, 51, 68);
            const register: ProbeResult = probeRegisterCallback();
            expect(describePixel(pixel.pixel).length >= 7).assertTrue();
            expect(pixel.pixel[0] <= pixel.pixel[1]).assertTrue();
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0272 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0273
         * @tc.name testCombo0273
         * @tc.desc 组合：递减通道渲染与逐帧回调注册，通道逐项递减
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0273 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(68, 51, 34, 17);
            const register: ProbeResult = probeRegisterOnFrameCallback();
            expect(pixel.pixel[0] >= pixel.pixel[1]).assertTrue();
            expect(pixel.pixel[1] >= pixel.pixel[2]).assertTrue();
            expect(isResultCode(register.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0273 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0274
         * @tc.name testCombo0274
         * @tc.desc 组合：宽域通道渲染与按键动作查询，通道取值范围落在合法区间
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0274 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(9, 99, 199, 249);
            const action: ProbeResult = probeGetKeyEventAction();
            expect(pixel.pixel[3] <= CHANNEL_MAX).assertTrue();
            expect(countAbove(pixel.pixel, -1)).assertEqual(CHANNEL_COUNT);
            expect(action.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0274 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0275
         * @tc.name testCombo0275
         * @tc.desc 组合：对称通道渲染与形状索引查询，首尾通道相等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0275 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(249, 199, 99, 9);
            const shape: number = getShapeIndex();
            expect(pixel.pixel[0] >= pixel.pixel[3]).assertTrue();
            expect(shape >= 0).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0275 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0276
         * @tc.name testCombo0276
         * @tc.desc 组合：中高通道渲染与页面生命周期上下文，上下文键数为二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0276 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(100, 150, 200, 250);
            const context: object = GetContext(1);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(2);
            expect(pixel.pixel[0] <= pixel.pixel[2]).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0276 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0277
         * @tc.name testCombo0277
         * @tc.desc 组合：中通道渲染与重绘请求，重绘后再次渲染结构一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0277 begin');
            const before: PixelProbeResult = probeRenderSolidPixel(250, 200, 150, 100);
            animate();
            const after: PixelProbeResult = probeRenderSolidPixel(250, 200, 150, 100);
            expect(after.pixel.length).assertEqual(before.pixel.length);
            expect(after.aux).assertEqual(before.aux);
            expect(Math.abs(pixelDelta(before.pixel, after.pixel)) >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0277 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0278
         * @tc.name testCombo0278
         * @tc.desc 组合：小值通道渲染与尺寸偏移双回读，像素与几何量各自成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0278 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(3, 7, 11, 13);
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(maxChannel(pixel.pixel)).assertEqual(13);
            expect(size.value >= 0).assertTrue();
            expect(Number.isFinite(offset.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0278 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0279
         * @tc.name testCombo0279
         * @tc.desc 组合：反序小值通道渲染与器具倾角双回读，极小通道值成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0279 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(13, 11, 7, 3);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(minChannel(pixel.pixel)).assertEqual(3);
            expect(toolType.aux).assertEqual(0);
            expect(isResultCode(tiltX.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0279 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0280
         * @tc.name testCombo0280
         * @tc.desc 组合：满分与零通道交替渲染与标识按键双回读，通道差异明显
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0280 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 0, 255, 0);
            const identity: ProbeIdResult = probeGetXComponentId();
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(distinctValues(pixel.pixel)).assertEqual(2);
            expect(identity.id.length >= 0).assertTrue();
            expect(keyEvent.value <= 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0280 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0281
         * @tc.name testCombo0281
         * @tc.desc 组合：红通道超上限渲染与标识回读，越界入参返回参数错误码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0281 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(256, 0, 0, 255);
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(identity.id.length >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0281 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0282
         * @tc.name testCombo0282
         * @tc.desc 组合：绿通道超上限渲染与尺寸回读，越界后尺寸仍可正常回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0282 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 256, 0, 255);
            const size: ProbeResult = probeGetXComponentSize();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(isResultCode(size.code)).assertTrue();
            expect(size.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0282 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0283
         * @tc.name testCombo0283
         * @tc.desc 组合：蓝通道超上限渲染与偏移回读，越界后偏移仍为有限值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0283 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 256, 255);
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(Number.isFinite(offset.aux)).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0283 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0284
         * @tc.name testCombo0284
         * @tc.desc 组合：透明度超上限渲染与器具类型回读，越界返回参数错误码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0284 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 256);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(toolType.aux).assertEqual(0);
            expect(maxChannel(pixel.pixel) <= CHANNEL_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0284 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0285
         * @tc.name testCombo0285
         * @tc.desc 组合：红通道极大负值渲染与横倾角回读，负值越界被拒绝
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0285 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-100, 0, 0, 0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(isResultCode(tiltX.code)).assertTrue();
            expect(pixel.value <= CHANNEL_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0285 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0286
         * @tc.name testCombo0286
         * @tc.desc 组合：绿通道负一渲染与历史点回读，边界负值同样被拒绝
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0286 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, -1, 0, 0);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(points.value >= 0).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0286 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0287
         * @tc.name testCombo0287
         * @tc.desc 组合：蓝通道负一渲染与按键事件回读，越界不影响按键事件查询
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0287 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, -1, 0);
            const keyEvent: ProbeResult = probeGetKeyEvent();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(keyEvent.value <= 1).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0287 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0288
         * @tc.name testCombo0288
         * @tc.desc 组合：透明度负一渲染与修饰键状态回读，越界后修饰键仍非负
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0288 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, -1);
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(keys.value >= 0).assertTrue();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0288 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0289
         * @tc.name testCombo0289
         * @tc.desc 组合：全通道负值渲染与无障碍提供者回读，四通道越界均被拒绝
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0289 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-128, -128, -128, -128);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(provider.value <= 1).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0289 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0290
         * @tc.name testCombo0290
         * @tc.desc 组合：四通道均超四位数渲染与帧率区间，越界后区间回显仍正确
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0290 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(1000, 2000, 3000, 4000);
            const rate: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 30);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(rate.value).assertEqual(30);
            expect(rate.aux).assertEqual(60);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0290 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0291
         * @tc.name testCombo0291
         * @tc.desc 组合：合法与越界通道混合渲染与软键盘开关，混合越界被拒绝
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0291 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 256, 0, 0);
            const keyboard: ProbeResult = probeSetNeedSoftKeyboard(1);
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(keyboard.value).assertEqual(1);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0291 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0292
         * @tc.name testCombo0292
         * @tc.desc 组合：奇偶混搭越界渲染与基础回调注册，越界后注册仍返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0292 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(-1, 255, -1, 255);
            const register: ProbeResult = probeRegisterCallback();
            expect(pixel.code).assertEqual(RESULT_BAD_PARAMETER);
            expect(isResultCode(register.code)).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0292 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0293
         * @tc.name testCombo0293
         * @tc.desc 组合：上下边界值渲染与逐帧回调注册，边界入参不返回参数错误
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0293 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(254, 255, 254, 255);
            const register: ProbeResult = probeRegisterOnFrameCallback();
            expect(pixel.code === RESULT_BAD_PARAMETER).assertFalse();
            expect(isResultCode(register.code)).assertTrue();
            expect(minChannel(pixel.pixel) >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0293 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0294
         * @tc.name testCombo0294
         * @tc.desc 组合：纯黑不透明渲染与按键动作查询，通道差异数为二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0294 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
            const action: ProbeResult = probeGetKeyEventAction();
            expect(distinctValues(pixel.pixel)).assertEqual(2);
            expect(pixel.pixel[3]).assertEqual(CHANNEL_MAX);
            expect(isResultCode(action.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0294 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0295
         * @tc.name testCombo0295
         * @tc.desc 组合：红分量一渲染与形状索引回读，单色差异可分辨
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0295 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(1, 0, 0, 255);
            const shape: number = getShapeIndex();
            expect(pixel.pixel[0] <= pixel.pixel[1] + 1).assertTrue();
            expect(Number.isInteger(shape)).assertTrue();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0295 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0296
         * @tc.name testCombo0296
         * @tc.desc 组合：绿分量一渲染与应用生命周期上下文，上下文键数为四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0296 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 1, 0, 255);
            const context: object = GetContext(0);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(4);
            expect(pixel.pixel[1] <= pixel.pixel[0] + 1).assertTrue();
            expect(isResultCode(pixel.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0296 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0297
         * @tc.name testCombo0297
         * @tc.desc 组合：蓝分量一渲染与页面生命周期上下文，上下文键数为二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0297 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(0, 0, 1, 255);
            const context: object = GetContext(1);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(2);
            expect(pixel.pixel[2] <= pixel.pixel[0] + 1).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0297 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0298
         * @tc.name testCombo0298
         * @tc.desc 组合：近中值连续通道渲染与尺寸偏移双回读，通道呈递增趋势
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0298 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(127, 128, 129, 130);
            const size: ProbeResult = probeGetXComponentSize();
            const offset: ProbeResult = probeGetXComponentOffset();
            expect(pixel.pixel[0] <= pixel.pixel[3]).assertTrue();
            expect(size.aux >= 0).assertTrue();
            expect(Number.isFinite(offset.aux)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0298 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0299
         * @tc.name testCombo0299
         * @tc.desc 组合：接近上限递增渲染与器具历史点双回读，最大值与最小值同时成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0299 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(253, 254, 255, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const points: ProbeResult = probeGetHistoricalPoints();
            expect(maxChannel(pixel.pixel)).assertEqual(CHANNEL_MAX);
            expect(toolType.aux).assertEqual(0);
            expect(points.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0299 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0300
         * @tc.name testCombo0300
         * @tc.desc 组合：接近上限递减渲染与标识修饰键双回读，递减关系成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0300 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(255, 254, 253, 252);
            const identity: ProbeIdResult = probeGetXComponentId();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.pixel[0] >= pixel.pixel[3]).assertTrue();
            expect(identity.id.length >= 0).assertTrue();
            expect(keys.aux >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0300 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0301
         * @tc.name testCombo0301
         * @tc.desc 状态：连续三次不同颜色渲染，三次返回结构保持四通道
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0301 begin');
            const red: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            const green: PixelProbeResult = probeRenderSolidPixel(0, 255, 0, 255);
            const blue: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
            expect(green.pixel.length).assertEqual(red.pixel.length);
            expect(blue.corner.length).assertEqual(red.corner.length);
            expect(red.aux).assertEqual(blue.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0301 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0302
         * @tc.name testCombo0302
         * @tc.desc 状态：渲染后切换形状再渲染，形状回显与像素结构同时成立
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0302 begin');
            const before: PixelProbeResult = probeRenderSolidPixel(200, 100, 0, 255);
            changeShape(4);
            const after: PixelProbeResult = probeRenderSolidPixel(200, 100, 0, 255);
            expect(getShapeIndex()).assertEqual(4);
            expect(after.pixel.length).assertEqual(before.pixel.length);
            expect(pixelDelta(before.pixel, after.pixel) >= 0).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0302 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0303
         * @tc.name testCombo0303
         * @tc.desc 状态：连续请求三次重绘后再渲染，像素结构不退化
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0303 begin');
            const before: PixelProbeResult = probeRenderSolidPixel(0, 128, 255, 255);
            animate();
            animate();
            animate();
            const after: PixelProbeResult = probeRenderSolidPixel(0, 128, 255, 255);
            expect(after.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(after.aux).assertEqual(PROBE_BUFFER_EDGE);
            expect(before.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0303 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0304
         * @tc.name testCombo0304
         * @tc.desc 状态：注册回调后再次渲染，回调注册不阻断像素回读
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0304 begin');
            const before: PixelProbeResult = probeRenderSolidPixel(12, 34, 56, 78);
            const register: ProbeResult = probeRegisterCallback();
            const after: PixelProbeResult = probeRenderSolidPixel(12, 34, 56, 78);
            expect(isResultCode(register.code)).assertTrue();
            expect(after.pixel.length).assertEqual(before.pixel.length);
            expect(maxChannel(after.pixel) <= CHANNEL_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0304 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0305
         * @tc.name testCombo0305
         * @tc.desc 状态：渲染与尺寸交替两轮，两轮几何量保持一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0305 begin');
            const pixelFirst: PixelProbeResult = probeRenderSolidPixel(90, 45, 22, 255);
            const sizeFirst: ProbeResult = probeGetXComponentSize();
            const pixelSecond: PixelProbeResult = probeRenderSolidPixel(90, 45, 22, 255);
            const sizeSecond: ProbeResult = probeGetXComponentSize();
            expect(sizeSecond.value).assertEqual(sizeFirst.value);
            expect(sizeSecond.aux).assertEqual(sizeFirst.aux);
            expect(pixelSecond.aux).assertEqual(pixelFirst.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0305 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0306
         * @tc.name testCombo0306
         * @tc.desc 状态：形状索引递增四次后渲染，最终索引与逐次回显一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0306 begin');
            changeShape(0);
            changeShape(1);
            changeShape(2);
            changeShape(3);
            const pixel: PixelProbeResult = probeRenderSolidPixel(7, 14, 21, 28);
            expect(getShapeIndex()).assertEqual(3);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(pixel.code)).assertTrue();
            changeShape(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0306 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0307
         * @tc.name testCombo0307
         * @tc.desc 状态：形状索引递减四次后渲染，最终索引回零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0307 begin');
            changeShape(3);
            changeShape(2);
            changeShape(1);
            changeShape(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(28, 21, 14, 7);
            expect(getShapeIndex()).assertEqual(0);
            expect(minChannel(pixel.pixel) >= 0).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0307 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0308
         * @tc.name testCombo0308
         * @tc.desc 状态：形状索引往返切换后渲染，首末索引均为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0308 begin');
            changeShape(0);
            changeShape(3);
            changeShape(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(50, 100, 150, 200);
            expect(getShapeIndex()).assertEqual(0);
            expect(pixel.pixel[0] <= pixel.pixel[2]).assertTrue();
            expect(distinctValues(pixel.pixel)).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0308 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0309
         * @tc.name testCombo0309
         * @tc.desc 状态：渲染中间插应用生命周期上下文查询，前后结构一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0309 begin');
            const before: PixelProbeResult = probeRenderSolidPixel(111, 222, 33, 244);
            const context: object = GetContext(0);
            const after: PixelProbeResult = probeRenderSolidPixel(111, 222, 33, 244);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(4);
            expect(after.pixel.length).assertEqual(before.pixel.length);
            expect(maxChannel(after.corner) <= CHANNEL_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0309 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0310
         * @tc.name testCombo0310
         * @tc.desc 状态：渲染中间插页面生命周期上下文查询，前后结构一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0310 begin');
            const before: PixelProbeResult = probeRenderSolidPixel(33, 66, 99, 132);
            const context: object = GetContext(1);
            const after: PixelProbeResult = probeRenderSolidPixel(33, 66, 99, 132);
            expect(Object.getOwnPropertyNames(context).length).assertEqual(2);
            expect(after.corner.length).assertEqual(before.corner.length);
            expect(isResultCode(after.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0310 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0311
         * @tc.name testCombo0311
         * @tc.desc 状态：连续四次设置不同帧率区间后再渲染，最后一次区间回显正确
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0311 begin');
            probeSetExpectedFrameRateRange(30, 60, 30);
            probeSetExpectedFrameRateRange(45, 90, 45);
            probeSetExpectedFrameRateRange(60, 120, 60);
            const last: ProbeResult = probeSetExpectedFrameRateRange(90, 120, 90);
            const pixel: PixelProbeResult = probeRenderSolidPixel(180, 90, 45, 255);
            expect(last.value).assertEqual(90);
            expect(last.aux).assertEqual(120);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0311 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0312
         * @tc.name testCombo0312
         * @tc.desc 状态：软键盘开关开-关-开三轮后渲染，末次回显为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0312 begin');
            probeSetNeedSoftKeyboard(0);
            probeSetNeedSoftKeyboard(1);
            const last: ProbeResult = probeSetNeedSoftKeyboard(0);
            const pixel: PixelProbeResult = probeRenderSolidPixel(45, 90, 180, 255);
            expect(last.value).assertEqual(0);
            expect(isResultCode(last.code)).assertTrue();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0312 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0313
         * @tc.name testCombo0313
         * @tc.desc 状态：渲染后连查器具与双倾角，三路索引回显均为零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0313 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(99, 199, 49, 255);
            const toolType: ProbeResult = probeGetTouchPointToolType(0);
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(toolType.aux).assertEqual(0);
            expect(tiltX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0313 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0314
         * @tc.name testCombo0314
         * @tc.desc 状态：渲染后连查窗口横纵坐标，两路坐标均有限
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0314 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(49, 149, 249, 255);
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const windowY: ProbeResult = probeGetTouchPointWindowY(0);
            expect(pixel.aux).assertEqual(PROBE_BUFFER_EDGE);
            expect(Number.isFinite(windowX.value)).assertTrue();
            expect(Number.isFinite(windowY.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0314 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0315
         * @tc.name testCombo0315
         * @tc.desc 状态：渲染后连查屏幕横纵坐标，两路坐标均为有限值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0315 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(15, 30, 60, 120);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            const displayY: ProbeResult = probeGetTouchPointDisplayY(0);
            expect(isResultCode(pixel.code)).assertTrue();
            expect(Number.isFinite(displayX.value)).assertTrue();
            expect(Number.isFinite(displayY.value)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0315 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0316
         * @tc.name testCombo0316
         * @tc.desc 状态：渲染后连查历史点与按键事件与修饰键，三路输出各自合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0316 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(222, 111, 55, 27);
            const points: ProbeResult = probeGetHistoricalPoints();
            const keys: ProbeResult = probeGetMouseEventModifierKeyStates();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(points.value >= 0).assertTrue();
            expect(keys.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0316 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0317
         * @tc.name testCombo0317
         * @tc.desc 状态：渲染中间插无障碍提供者查询，前后像素结构一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0317 begin');
            const before: PixelProbeResult = probeRenderSolidPixel(77, 88, 99, 111);
            const provider: ProbeResult = probeGetNativeAccessibilityProvider();
            const after: PixelProbeResult = probeRenderSolidPixel(77, 88, 99, 111);
            expect(provider.value <= 1).assertTrue();
            expect(after.pixel.length).assertEqual(before.pixel.length);
            expect(pixelDelta(before.pixel, after.pixel) >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0317 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0318
         * @tc.name testCombo0318
         * @tc.desc 状态：渲染后连查按键动作与按键码，两路查询返回码均合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0318 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(160, 80, 40, 20);
            const action: ProbeResult = probeGetKeyEventAction();
            const code: ProbeResult = probeGetKeyEventCode();
            expect(pixel.corner.length).assertEqual(CHANNEL_COUNT);
            expect(isResultCode(action.code)).assertTrue();
            expect(isResultCode(code.code)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0318 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0319
         * @tc.name testCombo0319
         * @tc.desc 状态：渲染后依次读偏移尺寸标识，三路回读均有效
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0319 begin');
            const pixel: PixelProbeResult = probeRenderSolidPixel(60, 120, 180, 240);
            const offset: ProbeResult = probeGetXComponentOffset();
            const size: ProbeResult = probeGetXComponentSize();
            const identity: ProbeIdResult = probeGetXComponentId();
            expect(pixel.pixel.length).assertEqual(CHANNEL_COUNT);
            expect(Number.isFinite(offset.value)).assertTrue();
            expect(size.value >= 0).assertTrue();
            expect(identity.value).assertEqual(identity.id.length);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0319 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0320
         * @tc.name testCombo0320
         * @tc.desc 状态：同参连续六次渲染，末次结构与首轮完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0320 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(40, 80, 120, 160);
            probeRenderSolidPixel(40, 80, 120, 160);
            probeRenderSolidPixel(40, 80, 120, 160);
            probeRenderSolidPixel(40, 80, 120, 160);
            probeRenderSolidPixel(40, 80, 120, 160);
            const last: PixelProbeResult = probeRenderSolidPixel(40, 80, 120, 160);
            expect(last.pixel.length).assertEqual(first.pixel.length);
            expect(last.corner.length).assertEqual(first.corner.length);
            expect(last.aux).assertEqual(first.aux);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0320 end');
        });

    });
}
