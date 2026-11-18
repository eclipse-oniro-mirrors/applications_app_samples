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

import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PixelProbeResult, probeRenderSolidPixel } from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * RGB 五桶的配对点缀套件：不复用 volume 模板，每例都从入参出发验证
 * 三通道组合、双采样点一致性与 alpha 端点，与模板的逐值扫描互补。
 */
export default function nativeVolumeRgbReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeRgbReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeRgbReal0001
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0001
         * @tc.desc   Real: pure white keeps all three channels saturated
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0001 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(255));
            expect(result.pixel[0]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(255));
            expect(result.pixel[1]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(255));
            expect(result.pixel[2]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0001 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0002
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0002
         * @tc.desc   Real: black keeps all three channels at zero
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0002 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
            expect(result.pixel[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
            expect(result.pixel[1]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
            expect(result.pixel[2]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0002 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0003
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0003
         * @tc.desc   Real: yellow mixes red and green while blue stays zero
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0003 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(255, 255, 0, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(255));
            expect(result.pixel[0]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(255));
            expect(result.pixel[1]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
            expect(result.pixel[2]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0003 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0004
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0004
         * @tc.desc   Real: cyan mixes green and blue while red stays zero
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0004 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(0, 255, 255, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
            expect(result.pixel[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(255));
            expect(result.pixel[1]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(255));
            expect(result.pixel[2]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0004 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0005
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0005
         * @tc.desc   Real: magenta mixes red and blue while green stays zero
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0005 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 255, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(255));
            expect(result.pixel[0]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
            expect(result.pixel[1]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(255));
            expect(result.pixel[2]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0005 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0006
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0006
         * @tc.desc   Real: mid grey reaches both sample points with the same value
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0006 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(128));
            expect(result.pixel[0]).assertEqual(128);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(128));
            expect(result.pixel[1]).assertEqual(128);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(128));
            expect(result.pixel[2]).assertEqual(128);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(128));
            expect(result.corner[0]).assertEqual(128);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0006 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0007
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0007
         * @tc.desc   Real: low ramp keeps each channel on its own slot
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0007 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(1, 2, 3, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(1));
            expect(result.pixel[0]).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(2));
            expect(result.pixel[1]).assertEqual(2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(3));
            expect(result.pixel[2]).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0007 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0008
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0008
         * @tc.desc   Real: descending values are not reordered between channels
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0008 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(200, 100, 50, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(200));
            expect(result.pixel[0]).assertEqual(200);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(100));
            expect(result.pixel[1]).assertEqual(100);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(50));
            expect(result.pixel[2]).assertEqual(50);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0008 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0009
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0009
         * @tc.desc   Real: pure red leaves green at zero on the opposite sample point
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0009 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(255));
            expect(result.pixel[0]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(255));
            expect(result.corner[0]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[1]), String(0));
            expect(result.corner[1]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0009 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0010
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0010
         * @tc.desc   Real: pure blue keeps red at zero on the opposite sample point
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0010 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(255));
            expect(result.pixel[2]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[2]), String(255));
            expect(result.corner[2]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(0));
            expect(result.corner[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0010 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0011
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0011
         * @tc.desc   Real: zero alpha keeps the alpha channel at zero on both samples
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0011 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(99, 88, 77, 0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[3]), String(0));
            expect(result.pixel[3]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[3]), String(0));
            expect(result.corner[3]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
            expect(result.aux).assertEqual(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0011 end');
        })

        /**
         * @tc.name   testVolumeRgbReal0012
         * @tc.number SUB_XCOMPONENT3D_RGBREAL_0012
         * @tc.desc   Real: alpha 256 is rejected and no channel is written
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgbReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0012 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 256);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(-2));
            expect(result.code).assertEqual(-2);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
            expect(result.pixel[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[3]), String(0));
            expect(result.pixel[3]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(0));
            expect(result.corner[0]).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgbReal0012 end');
        })

    })
}