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
import { ProbeResult, probeGetTouchPointTiltX, probeGetTouchPointTiltY } from 'libnativerender.so';
import { probeGetTouchEventSourceType } from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 触点倾角桶的点缀套件：volume 桶按接口 × index 逐格断言，
 * 这里改成三接口交叉一致与同索引重复调用的稳定性断言。
 */
export default function nativeVolumeTiltReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeTiltReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeTiltReal0001
         * @tc.number SUB_XCOMPONENT3D_TILTREAL_0001
         * @tc.desc   Real: index 0 echoes on all three probes and keeps the tilt pair in one code domain
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeTiltReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTiltReal0001 begin');
            const tiltX: ProbeResult = probeGetTouchPointTiltX(0);
            const tiltY: ProbeResult = probeGetTouchPointTiltY(0);
            const source: ProbeResult = probeGetTouchEventSourceType(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(tiltX.aux), String(0));
            expect(tiltX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(tiltX.aux), String(tiltY.aux));
            expect(tiltX.aux).assertEqual(tiltY.aux);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(tiltY.aux), String(source.aux));
            expect(tiltY.aux).assertEqual(source.aux);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(tiltX.code), String(tiltY.code));
            expect(tiltX.code).assertEqual(tiltY.code);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(source.code), String(tiltX.code));
            expect(source.code >= -2 && source.code <= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTiltReal0001 end');
        })

        /**
         * @tc.name   testVolumeTiltReal0002
         * @tc.number SUB_XCOMPONENT3D_TILTREAL_0002
         * @tc.desc   Real: index 15 echoes on every interface and stays stable when repeated
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeTiltReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTiltReal0002 begin');
            const first: ProbeResult = probeGetTouchPointTiltX(15);
            const second: ProbeResult = probeGetTouchPointTiltX(15);
            const source: ProbeResult = probeGetTouchEventSourceType(15);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux), String(15));
            expect(first.aux).assertEqual(15);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(source.aux), String(15));
            expect(source.aux).assertEqual(15);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(second.value), String(first.value));
            expect(second.value).assertEqual(first.value);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(second.code), String(first.code));
            expect(second.code).assertEqual(first.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTiltReal0002 end');
        })

    })
}
