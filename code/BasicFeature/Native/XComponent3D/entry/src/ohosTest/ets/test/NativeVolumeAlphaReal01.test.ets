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
 * alpha 桶的配对点缀套件：只验证两个已确认的端点（0 与 255），
 * 中间值在 pbuffer 回读上不可确定，交给 volume 桶保持只读不写。
 */
export default function nativeVolumeAlphaReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeAlphaReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeAlphaReal0001
         * @tc.number SUB_XCOMPONENT3D_ALPHAREAL_0001
         * @tc.desc   Real: opaque alpha reaches both sample points together with red
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeAlphaReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlphaReal0001 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[3]), String(255));
            expect(result.pixel[3]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[3]), String(255));
            expect(result.corner[3]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(255));
            expect(result.pixel[0]).assertEqual(255);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlphaReal0001 end');
        })

        /**
         * @tc.name   testVolumeAlphaReal0002
         * @tc.number SUB_XCOMPONENT3D_ALPHAREAL_0002
         * @tc.desc   Real: transparent alpha keeps the buffer layout and clears the alpha slot
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeAlphaReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlphaReal0002 begin');
            const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[3]), String(0));
            expect(result.pixel[3]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
            expect(result.pixel.length).assertEqual(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[3]), String(0));
            expect(result.corner[3]).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlphaReal0002 end');
        })

    })
}