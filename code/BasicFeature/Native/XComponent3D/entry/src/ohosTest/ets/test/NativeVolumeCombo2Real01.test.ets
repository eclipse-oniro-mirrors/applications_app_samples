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
    PixelProbeResult,
    ProbeResult,
    probeRenderSolidPixel,
    probeSetExpectedFrameRateRange,
    changeShape,
    getShapeIndex
} from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 三接口串联桶的配对点缀套件：volume 桶逐组合回读三处状态，
 * 这里手写饱和色、串联一致性与连续切换残留三类语义。
 */
export default function nativeVolumeCombo2Real01Test() {
    resetYieldCounter();
    describe('NativeVolumeCombo2Real01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeCombo2Real0001
         * @tc.number SUB_XCOMPONENT3D_COMBO2REAL_0001
         * @tc.desc   shape 128 with a saturated color keeps both states readable
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCombo2Real0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo2Real0001 begin');
            changeShape(128);
            const px: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
            const idx: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
            expect(idx).assertEqual(128);
            expect(px.pixel[0]).assertEqual(255);
            expect(px.pixel[1]).assertEqual(255);
            expect(px.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo2Real0001 end');
        })

        /**
         * @tc.name   testVolumeCombo2Real0002
         * @tc.number SUB_XCOMPONENT3D_COMBO2REAL_0002
         * @tc.desc   a chained shape-color-fps call leaves all three readbacks consistent
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCombo2Real0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo2Real0002 begin');
            changeShape(136);
            const px: PixelProbeResult = probeRenderSolidPixel(64, 128, 192, 255);
            const fps: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 90);
            const idx: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
            expect(idx).assertEqual(136);
            expect(px.pixel[1]).assertEqual(128);
            expect(px.pixel[2]).assertEqual(192);
            expect(fps.value).assertEqual(60);
            expect(fps.code).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo2Real0002 end');
        })

        /**
         * @tc.name   testVolumeCombo2Real0003
         * @tc.number SUB_XCOMPONENT3D_COMBO2REAL_0003
         * @tc.desc   two consecutive switches leave the last shape index in place
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCombo2Real0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo2Real0003 begin');
            changeShape(140);
            const first: number = getShapeIndex();
            changeShape(143);
            const second: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(second), String(143));
            expect(first).assertEqual(140);
            expect(second).assertEqual(143);
            expect(second - first).assertEqual(3);
            expect(second).assertEqual(getShapeIndex());
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo2Real0003 end');
        })

    })
}
