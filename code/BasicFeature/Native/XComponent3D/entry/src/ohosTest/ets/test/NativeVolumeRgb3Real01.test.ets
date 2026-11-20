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
 * 三值互异桶的配对点缀套件：volume 桶逐例断言回读等于入参，
 * 这里改用手写语义断言（通道序关系、饱和、退化）验证同一不变量。
 */
export default function nativeVolumeRgb3Real01Test() {
    resetYieldCounter();
    describe('NativeVolumeRgb3Real01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeRgb3Real0001
         * @tc.number SUB_XCOMPONENT3D_RGB3REAL_0001
         * @tc.desc   an all-zero triple collapses every channel to the same level
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgb3Real0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb3Real0001 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
            const px: number[] = result.pixel;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(0));
            expect(px[0]).assertEqual(0);
            expect(px[1]).assertEqual(px[0]);
            expect(px[2]).assertEqual(px[0]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb3Real0001 end');
        })

        /**
         * @tc.name   testVolumeRgb3Real0002
         * @tc.number SUB_XCOMPONENT3D_RGB3REAL_0002
         * @tc.desc   three ascending levels land in their own slots without cross-channel swap
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgb3Real0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb3Real0002 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 224, 255);
            const px: number[] = result.pixel;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
            expect(px[0]).assertEqual(32);
            expect(px[1]).assertEqual(160);
            expect(px[2]).assertEqual(224);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(px[0] < px[1] && px[1] < px[2]), String(true));
            expect(px[0] < px[1] && px[1] < px[2]).assertTrue();
            expect(result.corner[0]).assertEqual(32);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb3Real0002 end');
        })

        /**
         * @tc.name   testVolumeRgb3Real0003
         * @tc.number SUB_XCOMPONENT3D_RGB3REAL_0003
         * @tc.desc   a full-white triple saturates all three channels and both sample points
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeRgb3Real0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb3Real0003 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            const cn: number[] = result.corner;
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
            expect(cn[0]).assertEqual(255);
            expect(cn[1]).assertEqual(255);
            expect(cn[2]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.pixel[2]), String(255));
            expect(result.pixel[2]).assertEqual(255);
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb3Real0003 end');
        })

    })
}
