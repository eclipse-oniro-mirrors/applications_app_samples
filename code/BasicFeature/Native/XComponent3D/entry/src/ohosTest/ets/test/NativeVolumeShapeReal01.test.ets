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
const SHAPE_DEFAULT: number = 0;

/**
 * changeShape 桶的配对点缀套件：volume 桶逐个验证 2^k 邻域，这里验证
 * 连续切换的先后不粘连，并且每条用例收尾都切回默认形状，不把状态留给后续套件。
 */
export default function nativeVolumeShapeReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeShapeReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeShapeReal0001
         * @tc.number SUB_XCOMPONENT3D_SHAPEREAL_0001
         * @tc.desc   Real: two consecutive switches are reported back in order
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeShapeReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeReal0001 begin');
            changeShape(3);
            const first: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first), String(3));
            expect(first).assertEqual(3);
            changeShape(5);
            const second: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(second), String(5));
            expect(second).assertEqual(5);
            changeShape(SHAPE_DEFAULT);
            const restored: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(restored), String(0));
            expect(restored).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeReal0001 end');
        })

        /**
         * @tc.name   testVolumeShapeReal0002
         * @tc.number SUB_XCOMPONENT3D_SHAPEREAL_0002
         * @tc.desc   Real: reading the shape twice without switching returns the same index
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeShapeReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeReal0002 begin');
            changeShape(7);
            const first: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first), String(7));
            expect(first).assertEqual(7);
            const again: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again), String(7));
            expect(again).assertEqual(7);
            changeShape(SHAPE_DEFAULT);
            const restored: number = getShapeIndex();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(restored), String(0));
            expect(restored).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeReal0002 end');
        })

    })
}