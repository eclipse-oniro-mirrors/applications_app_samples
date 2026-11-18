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
 * 帧率三元组的配对点缀套件：volume 桶逐例铺三元组，
 * 这里手写倒置边界、常规档位与负数入参三类语义。
 */
export default function nativeVolumeFps3Real01Test() {
    resetYieldCounter();
    describe('NativeVolumeFps3Real01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeFps3Real0001
         * @tc.number SUB_XCOMPONENT3D_FPS3REAL_0001
         * @tc.desc   inverted bounds 120/30 are still echoed field by field
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeFps3Real0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps3Real0001 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(120, 30, 60);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.value), String(120));
            expect(result.value).assertEqual(120);
            expect(result.aux).assertEqual(30);
            expect(result.value > result.aux).assertTrue();
            expect(result.code <= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps3Real0001 end');
        })

        /**
         * @tc.name   testVolumeFps3Real0002
         * @tc.number SUB_XCOMPONENT3D_FPS3REAL_0002
         * @tc.desc   the common 30/120/60 triple keeps min and max on the echo fields
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeFps3Real0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps3Real0002 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.aux), String(120));
            expect(result.value).assertEqual(30);
            expect(result.aux).assertEqual(120);
            expect(result.value <= 60 && 60 <= result.aux).assertTrue();
            expect(result.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps3Real0002 end');
        })

        /**
         * @tc.name   testVolumeFps3Real0003
         * @tc.number SUB_XCOMPONENT3D_FPS3REAL_0003
         * @tc.desc   a negative lower bound stays inside the reported code domain
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeFps3Real0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps3Real0003 begin');
            const result: ProbeResult = probeSetExpectedFrameRateRange(-1, 60, 30);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(result.code >= -2), String(true));
            expect(result.code >= -2).assertTrue();
            expect(result.code <= 0).assertTrue();
            expect(result.value).assertEqual(-1);
            expect(result.aux).assertEqual(60);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps3Real0003 end');
        })

    })
}
