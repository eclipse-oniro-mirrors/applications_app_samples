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
 * 绿-蓝互补桶的点缀套件：volume 桶逐个断言三通道等于扫描值，
 * 这里改用通道和恒为 255、以及互换往返后不残留的关系断言，验证互补关系本身。
 */
export default function nativeVolumeGbReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeGbReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeGbReal0001
         * @tc.number SUB_XCOMPONENT3D_GBREAL_0001
         * @tc.desc   Real: green 128 and blue 127 keep their own channels on both sample points
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeGbReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGbReal0001 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(0, 128, 127, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(128));
            expect(result.pixel[1]).assertEqual(128);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(127));
            expect(result.pixel[2]).assertEqual(127);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.pixel[1] + result.pixel[2]), String(255));
            expect(result.pixel[1] + result.pixel[2]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[1]), String(128));
            expect(result.corner[1]).assertEqual(128);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[2]), String(127));
            expect(result.corner[2]).assertEqual(127);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGbReal0001 end');
        })

        /**
         * @tc.name   testVolumeGbReal0002
         * @tc.number SUB_XCOMPONENT3D_GBREAL_0002
         * @tc.desc   Real: swapping 200 and 55 twice round-trips without leaving residue
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeGbReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGbReal0002 begin');
            const first: PixelProbeResult = probeRenderSolidPixel(0, 200, 55, 255);
            const swapped: PixelProbeResult = probeRenderSolidPixel(0, 55, 200, 255);
            const restored: PixelProbeResult = probeRenderSolidPixel(0, 200, 55, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.pixel[1]), String(200));
            expect(first.pixel[1]).assertEqual(200);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(swapped.pixel[1]), String(55));
            expect(swapped.pixel[1]).assertEqual(55);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(first.pixel[1]), String(swapped.pixel[2]));
            expect(first.pixel[1]).assertEqual(swapped.pixel[2]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(restored.pixel[2]), String(first.pixel[2]));
            expect(restored.pixel[2]).assertEqual(first.pixel[2]);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGbReal0002 end');
        })

    })
}
