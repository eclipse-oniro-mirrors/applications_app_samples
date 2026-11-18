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

import { animate, changeShape, getShapeIndex } from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';
const UINT32_MAX: number = 4294967295;

export default function xComponentShapeTest() {
    resetYieldCounter();
    describe('XComponentShapeTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0001
         * @tc.name testXComponentShape0001
         * @tc.desc 合法值：切到 0（立方体）后索引回读为 0，且不等于上一档 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testXComponentShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0001 begin');
            changeShape(1);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() === 1).assertFalse();
            expect(getShapeIndex() === 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0002
         * @tc.name testXComponentShape0002
         * @tc.desc 合法值：切到 1（矩形）后索引回读为 1，且为正数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testXComponentShape0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0002 begin');
            changeShape(0);
            changeShape(1);
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex() === 0).assertFalse();
            expect(getShapeIndex() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0003
         * @tc.name testXComponentShape0003
         * @tc.desc 合法值：changeShape 声明为 void，返回值恒为 undefined 且索引同步更新
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0003 begin');
            changeShape(0);
            expect(changeShape(1)).assertUndefined();
            expect(getShapeIndex()).assertEqual(1);
            expect(changeShape(0)).assertUndefined();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0004
         * @tc.name testXComponentShape0004
         * @tc.desc 合法值：animate 声明为 void，返回值恒为 undefined 且不覆盖已有索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0004 begin');
            changeShape(1);
            expect(animate()).assertUndefined();
            expect(getShapeIndex()).assertEqual(1);
            expect(animate()).assertUndefined();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0005
         * @tc.name testXComponentShape0005
         * @tc.desc 边界值：小数入参按 uint32 转换向零截断，0.9 与 1.9 分别落 0 与 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0005 begin');
            changeShape(0.9);
            expect(getShapeIndex()).assertEqual(0);
            changeShape(1.9);
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex() === 2).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0006
         * @tc.name testXComponentShape0006
         * @tc.desc 边界值：负零与正零等价，回读均为 0 且符号位不残留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0006 begin');
            changeShape(-0);
            expect(getShapeIndex()).assertEqual(0);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(Math.sign(getShapeIndex())).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0007
         * @tc.name testXComponentShape0007
         * @tc.desc 边界值：uint32 上界 4294967295 原样回显，不溢出为 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0007 begin');
            changeShape(UINT32_MAX);
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            expect(getShapeIndex() > 4294967294).assertTrue();
            expect(getShapeIndex() === 4294967296).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0008
         * @tc.name testXComponentShape0008
         * @tc.desc 边界值：2^32 与 2^32+1 按模 2^32 回绕为 0 与 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0008 begin');
            changeShape(4294967296);
            expect(getShapeIndex()).assertEqual(0);
            changeShape(4294967297);
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex() > 1).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0009
         * @tc.name testXComponentShape0009
         * @tc.desc 非法值：NaN 归一为 0，回读既不是 NaN 也不保持上一档
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0009 begin');
            changeShape(1);
            changeShape(NaN);
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() === getShapeIndex()).assertTrue();
            expect(Number.isNaN(getShapeIndex())).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0010
         * @tc.name testXComponentShape0010
         * @tc.desc 非法值：正无穷与负无穷均归一为 0，回读为有限值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0010 begin');
            changeShape(1);
            changeShape(Infinity);
            expect(getShapeIndex()).assertEqual(0);
            changeShape(-Infinity);
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() === Infinity).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0011
         * @tc.name testXComponentShape0011
         * @tc.desc 非法值：-1 按 uint32 语义映射为 0xFFFFFFFF，而不是保留负号
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0011 begin');
            changeShape(-1);
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            expect(getShapeIndex() > 0).assertTrue();
            expect(getShapeIndex() === -1).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0012
         * @tc.name testXComponentShape0012
         * @tc.desc 非法值：int32 下界 -2147483648 映射为 0x80000000
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0012 begin');
            changeShape(-2147483648);
            expect(getShapeIndex()).assertEqual(2147483648);
            expect(getShapeIndex() > 0).assertTrue();
            expect(getShapeIndex() === -2147483648).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0013
         * @tc.name testXComponentShape0013
         * @tc.desc 极值：1e10 按模 2^32 回绕为 1410065408，仍落在 uint32 区间内
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0013 begin');
            changeShape(1e10);
            expect(getShapeIndex()).assertEqual(1410065408);
            expect(getShapeIndex() < 4294967296).assertTrue();
            expect(getShapeIndex() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0014
         * @tc.name testXComponentShape0014
         * @tc.desc 极值：MAX_SAFE_INTEGER 按模 2^32 回绕为 4294967295
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0014 begin');
            changeShape(Number.MAX_SAFE_INTEGER);
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            expect(getShapeIndex() < Number.MAX_SAFE_INTEGER).assertTrue();
            expect(getShapeIndex() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0015
         * @tc.name testXComponentShape0015
         * @tc.desc 极值：连续 30 次切换后索引等于末次入参，不累积偏移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0015 begin');
            for (let i = 0; i < 30; i++) {
                changeShape(i);
            }
            expect(getShapeIndex()).assertEqual(29);
            changeShape(30);
            expect(getShapeIndex()).assertEqual(30);
            expect(getShapeIndex() === 29).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0016
         * @tc.name testXComponentShape0016
         * @tc.desc 组合：changeShape 之后连续 animate 不覆盖索引，绘制与切换互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0016 begin');
            changeShape(1);
            animate();
            animate();
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex() === 0).assertFalse();
            expect(getShapeIndex() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0017
         * @tc.name testXComponentShape0017
         * @tc.desc 组合：animate 与 changeShape 交替 5 轮后，索引等于最后一次切换的入参
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0017 begin');
            for (let i = 0; i < 5; i++) {
                animate();
                changeShape(i % 2);
            }
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() === 1).assertFalse();
            expect(animate()).assertUndefined();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0018
         * @tc.name testXComponentShape0018
         * @tc.desc 组合：先 animate 再切到中间档 2，索引按 changeShape 入参更新
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0018 begin');
            animate();
            changeShape(2);
            animate();
            expect(getShapeIndex()).assertEqual(2);
            expect(getShapeIndex() === 1).assertFalse();
            expect(getShapeIndex() > 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0019
         * @tc.name testXComponentShape0019
         * @tc.desc 状态：同参连续两次调用幂等，两次回读结果完全一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0019 begin');
            changeShape(1);
            changeShape(1);
            const first: number = getShapeIndex();
            const second: number = getShapeIndex();
            expect(first).assertEqual(second);
            expect(first).assertEqual(1);
            expect(second === 0).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0020
         * @tc.name testXComponentShape0020
         * @tc.desc 状态：非 0/1 的索引原样回显，并可回退到 0
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0020 begin');
            changeShape(3);
            expect(getShapeIndex()).assertEqual(3);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() === 3).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0021
         * @tc.name testXComponentShape0021
         * @tc.desc 状态：0→1→0→1 序列切换后稳定在 1，不残留历史值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testXComponentShape0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0021 begin');
            changeShape(0);
            changeShape(1);
            changeShape(0);
            changeShape(1);
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex() === 0).assertFalse();
            expect(getShapeIndex() > 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0022
         * @tc.name testXComponentShape0022
         * @tc.desc 状态：24 次同值切换后索引恒定，不随调用次数漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0022 begin');
            for (let i = 0; i < 24; i++) {
                changeShape(1);
            }
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex()).assertEqual(getShapeIndex());
            expect(getShapeIndex() === 2).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0023
         * @tc.name testXComponentShape0023
         * @tc.desc 状态：切换与绘制来回调用后仍可正常 animate，绘制链路不被破坏
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0023 begin');
            changeShape(1);
            animate();
            changeShape(0);
            animate();
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() === 1).assertFalse();
            expect(animate()).assertUndefined();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_SHAPE_0024
         * @tc.name testXComponentShape0024
         * @tc.desc 状态：30 次 0/1/2 轮转切换后索引等于末次入参
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testXComponentShape0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0024 begin');
            for (let i = 0; i < 30; i++) {
                changeShape(i % 3);
            }
            expect(getShapeIndex()).assertEqual(2);
            expect(getShapeIndex() < 3).assertTrue();
            expect(getShapeIndex() === 1).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testXComponentShape0024 end');
        });
    });
}
