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

// Hand-written interval loops: one 'it' covers a whole range, every round asserts
// the invariant and logs the failing round index before the assertion fires.
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PixelProbeResult, changeShape, getShapeIndex, probeRenderSolidPixel } from 'libnativerender.so';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

const CHANNEL_MAX: number = 255;
const SHAPE_WALK_MAX: number = 31;
const ALTERNATE_ROUNDS: number = 12;

export default function nativeVolumeCycle01Test() {
    resetYieldCounter();
    describe('NativeVolumeCycle01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });
        /**
         * @tc.name   testVolumeCycle0001
         * @tc.number SUB_XCOMPONENT3D_VOLCYCLE_0001
         * @tc.desc   Cycle: changeShape walks 0..31 and every round reads back the same index
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCycle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0001 begin');
            for (let round: number = 0; round <= SHAPE_WALK_MAX; round++) {
                changeShape(round);
                const actual: number = getShapeIndex();
                if (actual !== round) {
                    hilog.error(DOMAIN, TAG, 'shape mismatch at round %{public}d', round);
                }
                expect(actual).assertEqual(round);
            }
            expect(getShapeIndex()).assertEqual(SHAPE_WALK_MAX);
            expect(getShapeIndex() >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0001 end');
        })

        /**
         * @tc.name   testVolumeCycle0002
         * @tc.number SUB_XCOMPONENT3D_VOLCYCLE_0002
         * @tc.desc   Cycle: alpha walks 0..255 and never leaks into the red channel
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCycle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0002 begin');
            for (let alpha: number = 0; alpha <= CHANNEL_MAX; alpha++) {
                const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, alpha);
                if (result.pixel[0] !== 0) {
                    hilog.error(DOMAIN, TAG, 'alpha %{public}d polluted red channel', alpha);
                }
                expect(result.pixel[0]).assertEqual(0);
                expect(result.code).assertEqual(0);
            }
            const boundary: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, CHANNEL_MAX);
            expect(boundary.aux).assertEqual(4);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0002 end');
        })

        /**
         * @tc.name   testVolumeCycle0003
         * @tc.number SUB_XCOMPONENT3D_VOLCYCLE_0003
         * @tc.desc   Cycle: grey level walks 0..255 and readback matches every step
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCycle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0003 begin');
            for (let level: number = 0; level <= CHANNEL_MAX; level++) {
                const result: PixelProbeResult = probeRenderSolidPixel(level, level, level, CHANNEL_MAX);
                if (result.pixel[0] !== level) {
                    hilog.error(DOMAIN, TAG, 'grey %{public}d readback mismatch', level);
                }
                expect(result.pixel[0]).assertEqual(level);
            }
            const white: PixelProbeResult = probeRenderSolidPixel(CHANNEL_MAX, CHANNEL_MAX, CHANNEL_MAX, CHANNEL_MAX);
            expect(white.pixel[2]).assertEqual(CHANNEL_MAX);
            expect(white.corner[2]).assertEqual(CHANNEL_MAX);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0003 end');
        })

        /**
         * @tc.name   testVolumeCycle0004
         * @tc.number SUB_XCOMPONENT3D_VOLCYCLE_0004
         * @tc.desc   Cycle: alternating shape 0 and 1 keeps index independent between rounds
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCycle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0004 begin');
            for (let round: number = 0; round < ALTERNATE_ROUNDS; round++) {
                changeShape(0);
                expect(getShapeIndex()).assertEqual(0);
                changeShape(1);
                expect(getShapeIndex()).assertEqual(1);
            }
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex() % 1).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCycle0004 end');
        })
    })
}
