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
    ProbeResult,
    probeGetTouchPointWindowX,
    probeGetTouchPointWindowY,
    probeGetTouchPointDisplayX,
    probeGetTouchPointDisplayY
} from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 触点索引延伸段的配对点缀套件：volume 桶逐索引比对两条坐标探针，
 * 这里手写零点、四探针齐读与重复读取三类语义。
 */
export default function nativeVolumeUiExtReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeUiExtReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeUiExtReal0001
         * @tc.number SUB_XCOMPONENT3D_UIEXTREAL_0001
         * @tc.desc   index zero and the first extended index share one code path
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeUiExtReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExtReal0001 begin');
            const zero: ProbeResult = probeGetTouchPointWindowX(0);
            const first: ProbeResult = probeGetTouchPointWindowX(16);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(zero.aux), String(0));
            expect(zero.aux).assertEqual(0);
            expect(first.aux).assertEqual(16);
            expect(zero.code).assertEqual(first.code);
            expect(first.value >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExtReal0001 end');
        })

        /**
         * @tc.name   testVolumeUiExtReal0002
         * @tc.number SUB_XCOMPONENT3D_UIEXTREAL_0002
         * @tc.desc   all four coordinate probes agree on the code for one extended index
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeUiExtReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExtReal0002 begin');
            const wx: ProbeResult = probeGetTouchPointWindowX(64);
            const wy: ProbeResult = probeGetTouchPointWindowY(64);
            const dx: ProbeResult = probeGetTouchPointDisplayX(64);
            const dy: ProbeResult = probeGetTouchPointDisplayY(64);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(dx.code), String(wx.code));
            expect(wx.code).assertEqual(wy.code);
            expect(wy.code).assertEqual(dx.code);
            expect(dx.code).assertEqual(dy.code);
            expect(wx.aux).assertEqual(64);
            expect(dy.aux).assertEqual(64);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExtReal0002 end');
        })

        /**
         * @tc.name   testVolumeUiExtReal0003
         * @tc.number SUB_XCOMPONENT3D_UIEXTREAL_0003
         * @tc.desc   reading the same extended index twice returns an identical aux and value
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeUiExtReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExtReal0003 begin');
            const first: ProbeResult = probeGetTouchPointDisplayY(143);
            const again: ProbeResult = probeGetTouchPointDisplayY(143);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(again.aux), String(first.aux));
            expect(again.aux).assertEqual(first.aux);
            expect(again.value).assertEqual(first.value);
            expect(again.code).assertEqual(first.code);
            expect(first.aux).assertEqual(143);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExtReal0003 end');
        })

    })
}
