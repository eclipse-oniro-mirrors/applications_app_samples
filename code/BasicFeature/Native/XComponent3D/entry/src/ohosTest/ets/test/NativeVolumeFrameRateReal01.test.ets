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
import { ProbeResult, probeSetExpectedFrameRateRange } from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 帧率桶的配对点缀套件：volume 桶扫 min/max 组合，这里验证宽区间与
 * 退化区间（min 等于 max）两种情况下的回显与返回码。
 */
export default function nativeVolumeFrameRateReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeFrameRateReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeFrameRateReal0001
         * @tc.number SUB_XCOMPONENT3D_FPSREAL_0001
         * @tc.desc   Real: wide range echoes its min and max bounds
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeFrameRateReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRateReal0001 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
            expect(result.value).assertEqual(30);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
            expect(result.aux).assertEqual(120);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRateReal0001 end');
        })

        /**
         * @tc.name   testVolumeFrameRateReal0002
         * @tc.number SUB_XCOMPONENT3D_FPSREAL_0002
         * @tc.desc   Real: degenerate range keeps min and max on the same value
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeFrameRateReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRateReal0002 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(60, 60, 60);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
            expect(result.value).assertEqual(60);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
            expect(result.aux).assertEqual(60);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRateReal0002 end');
        })

    })
}