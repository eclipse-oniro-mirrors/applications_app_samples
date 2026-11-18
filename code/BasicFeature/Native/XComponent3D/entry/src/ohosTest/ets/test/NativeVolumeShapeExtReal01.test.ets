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
import { changeShape, getShapeIndex } from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 形状索引延伸段的配对点缀套件：volume 桶逐例回读单个索引，
 * 这里手写边界往返、默认态回归与切换残留三类语义。
 */
export default function nativeVolumeShapeExtReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeShapeExtReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeShapeExtReal0001
         * @tc.number SUB_XCOMPONENT3D_SHAPEEXTREAL_0001
         * @tc.desc   both segment bounds 128 and 255 round-trip through the shape index
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeShapeExtReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExtReal0001 begin');
            changeShape(128);
            const low: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(low), String(128));
            expect(low).assertEqual(128);
            changeShape(255);
            const high: number = getShapeIndex();
            expect(high).assertEqual(255);
            expect(high - low).assertEqual(127);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExtReal0001 end');
        })

        /**
         * @tc.name   testVolumeShapeExtReal0002
         * @tc.number SUB_XCOMPONENT3D_SHAPEEXTREAL_0002
         * @tc.desc   switching back to zero restores the default cube index from the extended segment
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeShapeExtReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExtReal0002 begin');
            changeShape(200);
            const before: number = getShapeIndex();
            expect(before).assertEqual(200);
            changeShape(0);
            const back: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(back), String(0));
            expect(back).assertEqual(0);
            expect(back).assertEqual(getShapeIndex());
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExtReal0002 end');
        })

        /**
         * @tc.name   testVolumeShapeExtReal0003
         * @tc.number SUB_XCOMPONENT3D_SHAPEEXTREAL_0003
         * @tc.desc   a visit to 200 leaves no residue after switching back to 128
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeShapeExtReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExtReal0003 begin');
            changeShape(128);
            const first: number = getShapeIndex();
            changeShape(200);
            changeShape(128);
            const restored: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(restored), String(first));
            expect(restored).assertEqual(first);
            expect(restored).assertEqual(128);
            expect(restored >= 128).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExtReal0003 end');
        })

    })
}
