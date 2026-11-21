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
 * 灰阶桶的配对点缀套件：volume 桶逐个断言三通道等于扫描值，
 * 这里改用通道间相等关系断言，验证三通道同值这一不变量本身。
 */
export default function nativeVolumeGreyReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeGreyReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeGreyReal0001
         * @tc.number SUB_XCOMPONENT3D_GREYREAL_0001
         * @tc.desc   Real: grey 64 makes all three channels equal at both sample points
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeGreyReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreyReal0001 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(64, 64, 64, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(64));
            expect(result.pixel[0]).assertEqual(64);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.pixel[0]), String(result.pixel[1]));
            expect(result.pixel[0]).assertEqual(result.pixel[1]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.pixel[1]), String(result.pixel[2]));
            expect(result.pixel[1]).assertEqual(result.pixel[2]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(64));
            expect(result.corner[0]).assertEqual(64);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreyReal0001 end');
        })

        /**
         * @tc.name   testVolumeGreyReal0002
         * @tc.number SUB_XCOMPONENT3D_GREYREAL_0002
         * @tc.desc   Real: grey 200 stays uniform on the opposite sample point
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeGreyReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreyReal0002 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(200, 200, 200, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(200));
            expect(result.pixel[2]).assertEqual(200);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.pixel[0]), String(result.pixel[2]));
            expect(result.pixel[0]).assertEqual(result.pixel[2]);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[2]), String(200));
            expect(result.corner[2]).assertEqual(200);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.corner[1]), String(result.corner[2]));
            expect(result.corner[1]).assertEqual(result.corner[2]);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreyReal0002 end');
        })

    })
}