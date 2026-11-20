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
import {
    ProbeResult, probeGetTouchPointToolType, probeGetTouchPointWindowX, probeGetTouchPointDisplayX
} from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 触点桶的配对点缀套件：volume 桶逐个扫触点索引，这里不改索引，
 * 只验证同一设备状态下不同索引或不同坐标口径之间的返回码一致性。
 */
export default function nativeVolumeTouchReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeTouchReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeTouchReal0001
         * @tc.number SUB_XCOMPONENT3D_TOUCHREAL_0001
         * @tc.desc   Real: tool type reads echo their own point index and agree on the code
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeTouchReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouchReal0001 begin');
            const third: ProbeResult = probeGetTouchPointToolType(3);
            const fourth: ProbeResult = probeGetTouchPointToolType(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(third.aux), String(3));
            expect(third.aux).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fourth.aux), String(4));
            expect(fourth.aux).assertEqual(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(third.code), String(fourth.code));
            expect(third.code).assertEqual(fourth.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouchReal0001 end');
        })

        /**
         * @tc.name   testVolumeTouchReal0002
         * @tc.number SUB_XCOMPONENT3D_TOUCHREAL_0002
         * @tc.desc   Real: window and display x share the same index echo and return code
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeTouchReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouchReal0002 begin');
            const windowX: ProbeResult = probeGetTouchPointWindowX(0);
            const displayX: ProbeResult = probeGetTouchPointDisplayX(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(windowX.aux), String(0));
            expect(windowX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(displayX.aux), String(0));
            expect(displayX.aux).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(windowX.code), String(displayX.code));
            expect(windowX.code).assertEqual(displayX.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouchReal0002 end');
        })

    })
}