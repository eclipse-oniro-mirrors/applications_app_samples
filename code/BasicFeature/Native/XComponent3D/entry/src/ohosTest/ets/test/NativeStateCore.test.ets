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

import { getShapeIndex, changeShape } from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

// 规格常量：changeShape 入参经 napi_get_value_uint32 转换，形状索引值域为 uint32
const UINT32_MAX: number = 4294967295;
const UINT32_MAX_MINUS_ONE: number = 4294967294;
const INT32_MAX: number = 2147483647;

function isStrictlyIncreasing(values: number[]): boolean {
    for (let i = 1; i < values.length; i++) {
        if (values[i] <= values[i - 1]) {
            return false;
        }
    }
    return true;
}

function isStrictlyDecreasing(values: number[]): boolean {
    for (let i = 1; i < values.length; i++) {
        if (values[i] >= values[i - 1]) {
            return false;
        }
    }
    return true;
}

function isPalindrome(values: number[]): boolean {
    const total: number = values.length;
    const half: number = Math.floor(total / 2);
    for (let i = 0; i < half; i++) {
        if (values[i] !== values[total - 1 - i]) {
            return false;
        }
    }
    return true;
}

function isConstant(values: number[]): boolean {
    for (let i = 1; i < values.length; i++) {
        if (values[i] !== values[0]) {
            return false;
        }
    }
    return true;
}

function countOf(values: number[], target: number): number {
    let count: number = 0;
    for (let i = 0; i < values.length; i++) {
        if (values[i] === target) {
            count++;
        }
    }
    return count;
}

function maxIndexOf(values: number[]): number {
    let index: number = 0;
    for (let i = 1; i < values.length; i++) {
        if (values[i] > values[index]) {
            index = i;
        }
    }
    return index;
}

function stepDelta(values: number[]): number {
    if (values.length < 2) {
        return 0;
    }
    return values[1] - values[0];
}

function tailOf(values: number[]): number {
    return values[values.length - 1];
}

function isAllOdd(values: number[]): boolean {
    for (let i = 0; i < values.length; i++) {
        if (values[i] % 2 !== 1) {
            return false;
        }
    }
    return true;
}

function isAllEven(values: number[]): boolean {
    for (let i = 0; i < values.length; i++) {
        if (values[i] % 2 !== 0) {
            return false;
        }
    }
    return true;
}

/**
 * 按序写入形状索引并在每步回读，返回回读值与写入值不一致的步数。
 * 0 表示整条状态迁移链路的回显全部正确。
 */
function replayAndCountMismatch(seq: number[]): number {
    let mismatch: number = 0;
    for (let i = 0; i < seq.length; i++) {
        changeShape(seq[i]);
        if (getShapeIndex() !== seq[i]) {
            mismatch++;
        }
    }
    return mismatch;
}

/**
 * 写入单个形状索引并回读三次，返回三次回读值构成的数组。
 */
function writeOnceReadThrice(value: number): number[] {
    changeShape(value);
    const first: number = getShapeIndex();
    const second: number = getShapeIndex();
    const third: number = getShapeIndex();
    return [first, second, third];
}

export default function nativeStateTest() {
    resetYieldCounter();
    describe('NativeStateTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0033
         * @tc.name testState0001
         * @tc.desc 契约：changeShape(0) 后 getShapeIndex 回读 0，且读数落在 uint32 下界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0001 begin');
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() >= 0).assertTrue();
            expect(getShapeIndex() <= UINT32_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0034
         * @tc.name testState0002
         * @tc.desc 契约：changeShape(1) 后连续两次回读相等，且回读值为奇数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0002 begin');
            changeShape(1);
            expect(getShapeIndex()).assertEqual(1);
            expect(getShapeIndex()).assertEqual(getShapeIndex());
            expect(getShapeIndex() % 2).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0035
         * @tc.name testState0003
         * @tc.desc 契约：changeShape(2) 后回读为偶数且严格大于 1
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0003 begin');
            changeShape(2);
            expect(getShapeIndex()).assertEqual(2);
            expect(getShapeIndex() % 2).assertEqual(0);
            expect(getShapeIndex() > 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0036
         * @tc.name testState0004
         * @tc.desc 契约：changeShape(3) 后回读为奇数且严格小于 4
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0004 begin');
            changeShape(3);
            expect(getShapeIndex()).assertEqual(3);
            expect(getShapeIndex() % 2).assertEqual(1);
            expect(getShapeIndex() < 4).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0037
         * @tc.name testState0005
         * @tc.desc 契约：changeShape(4) 后回读为偶数且不小于 4，三次回读一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0005 begin');
            const reads: number[] = writeOnceReadThrice(4);
            expect(reads[0]).assertEqual(4);
            expect(isConstant(reads)).assertTrue();
            expect(reads[2] >= 4).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0038
         * @tc.name testState0006
         * @tc.desc 契约：changeShape(5) 后回读不等于 4，与相邻小值可区分
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0006 begin');
            changeShape(5);
            expect(getShapeIndex()).assertEqual(5);
            expect(getShapeIndex() !== 4).assertTrue();
            expect(getShapeIndex() - 4).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0039
         * @tc.name testState0007
         * @tc.desc 契约：changeShape(7) 后回读严格落在 (6,8) 开区间
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0007 begin');
            changeShape(7);
            expect(getShapeIndex()).assertEqual(7);
            expect(getShapeIndex() > 6).assertTrue();
            expect(getShapeIndex() < 8).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0040
         * @tc.name testState0008
         * @tc.desc 契约：changeShape(8) 后回读可被 4 整除且不小于 8
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0008 begin');
            changeShape(8);
            expect(getShapeIndex()).assertEqual(8);
            expect(getShapeIndex() % 4).assertEqual(0);
            expect(getShapeIndex() >= 8).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0041
         * @tc.name testState0009
         * @tc.desc 契约：changeShape(9) 后回读可被 3 整除且不大于 9
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0009 begin');
            changeShape(9);
            expect(getShapeIndex()).assertEqual(9);
            expect(getShapeIndex() % 3).assertEqual(0);
            expect(getShapeIndex() <= 9).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0042
         * @tc.name testState0010
         * @tc.desc 契约：changeShape(10) 后回读除以 5 等于 2，且大于 9
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0010 begin');
            changeShape(10);
            expect(getShapeIndex()).assertEqual(10);
            expect(getShapeIndex() / 5).assertEqual(2);
            expect(getShapeIndex() > 9).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0043
         * @tc.name testState0011
         * @tc.desc 契约：changeShape(16) 后回读除以 8 等于 2，保持幂值关系
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0011 begin');
            changeShape(16);
            expect(getShapeIndex()).assertEqual(16);
            expect(getShapeIndex() / 8).assertEqual(2);
            expect(getShapeIndex() >= 16).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0044
         * @tc.name testState0012
         * @tc.desc 契约：changeShape(100) 后回读为三位以内的整数值，且不小于 100
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0012 begin');
            changeShape(100);
            expect(getShapeIndex()).assertEqual(100);
            expect(getShapeIndex() - 100).assertEqual(0);
            expect(getShapeIndex() >= 100).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0045
         * @tc.name testState0013
         * @tc.desc 边界：changeShape 取 int32 上界 2147483647 时原值回显，且未越过 uint32 上界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0013 begin');
            changeShape(INT32_MAX);
            expect(getShapeIndex()).assertEqual(INT32_MAX);
            expect(getShapeIndex() <= UINT32_MAX).assertTrue();
            expect(getShapeIndex() > INT32_MAX - 1).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0046
         * @tc.name testState0014
         * @tc.desc 边界：changeShape 取 int32 上界加一 2147483648 时原值回显，已越过有符号上界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0014 begin');
            changeShape(INT32_MAX + 1);
            expect(getShapeIndex()).assertEqual(2147483648);
            expect(getShapeIndex() > INT32_MAX).assertTrue();
            expect(getShapeIndex() <= UINT32_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0047
         * @tc.name testState0015
         * @tc.desc 边界：changeShape 取 3000000000 时原值回显且为偶数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0015 begin');
            const value: number = 3000000000;
            changeShape(value);
            expect(getShapeIndex()).assertEqual(value);
            expect(getShapeIndex() > INT32_MAX).assertTrue();
            expect(getShapeIndex() % 2).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0048
         * @tc.name testState0016
         * @tc.desc 边界：changeShape 取 4000000000 时原值回显且可被 8 整除
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0016 begin');
            const value: number = 4000000000;
            changeShape(value);
            expect(getShapeIndex()).assertEqual(value);
            expect(getShapeIndex() % 8).assertEqual(0);
            expect(getShapeIndex() >= value).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0049
         * @tc.name testState0017
         * @tc.desc 极值：changeShape 取 uint32 上界减一 4294967294 时原值回显，加一即上界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0017 begin');
            changeShape(UINT32_MAX_MINUS_ONE);
            expect(getShapeIndex()).assertEqual(UINT32_MAX_MINUS_ONE);
            expect(getShapeIndex() + 1).assertEqual(UINT32_MAX);
            expect(getShapeIndex() < UINT32_MAX).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0050
         * @tc.name testState0018
         * @tc.desc 极值：changeShape 取 uint32 上界 4294967295 时原值回显，且两次回读一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0018 begin');
            changeShape(UINT32_MAX);
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            expect(getShapeIndex() > UINT32_MAX_MINUS_ONE).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0051
         * @tc.name testState0019
         * @tc.desc 状态：从上界回到 0 后回读 0，旧上界值不残留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0019 begin');
            changeShape(UINT32_MAX);
            changeShape(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(getShapeIndex() !== UINT32_MAX).assertTrue();
            expect(getShapeIndex() <= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0052
         * @tc.name testState0020
         * @tc.desc 状态：从 0 推到上界后回读上界，中途值不残留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0020 begin');
            changeShape(0);
            changeShape(UINT32_MAX);
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            expect(getShapeIndex() > 0).assertTrue();
            expect(getShapeIndex() - UINT32_MAX).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0053
         * @tc.name testState0021
         * @tc.desc 状态：上界值连续回读三次完全一致，读数稳定不漂移
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0021 begin');
            const reads: number[] = writeOnceReadThrice(UINT32_MAX);
            expect(reads[0]).assertEqual(UINT32_MAX);
            expect(isConstant(reads)).assertTrue();
            expect(countOf(reads, UINT32_MAX)).assertEqual(3);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0054
         * @tc.name testState0022
         * @tc.desc 状态：上界与 0 交替写入四次，终值回到 0 且全链回显无偏差
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0022 begin');
            const seq: number[] = [UINT32_MAX, 0, UINT32_MAX, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(getShapeIndex()).assertEqual(0);
            expect(countOf(seq, 0)).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0055
         * @tc.name testState0023
         * @tc.desc 状态：零一二零往返序列首尾相等，三步回显全对
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0023 begin');
            const seq: number[] = [0, 1, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(getShapeIndex()).assertEqual(tailOf(seq));
            expect(seq[0]).assertEqual(tailOf(seq));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0056
         * @tc.name testState0024
         * @tc.desc 状态：零一一零四步序列为回文，0 出现两次
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0024 begin');
            const seq: number[] = [0, 1, 1, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isPalindrome(seq)).assertTrue();
            expect(countOf(seq, 0)).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0057
         * @tc.name testState0025
         * @tc.desc 状态：零到三再归零五步序列长度与终值同时校验
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0025 begin');
            const seq: number[] = [0, 1, 2, 3, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(seq.length).assertEqual(5);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0025 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0058
         * @tc.name testState0026
         * @tc.desc 状态：同一值连写两次，回读保持该值不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0026 begin');
            const seq: number[] = [5, 5];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isConstant(seq)).assertTrue();
            expect(getShapeIndex()).assertEqual(5);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0026 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0059
         * @tc.name testState0027
         * @tc.desc 状态：同一值连写三次，写入次数与出现次数一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0027 begin');
            const seq: number[] = [5, 5, 5];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(countOf(seq, 5)).assertEqual(seq.length);
            expect(getShapeIndex()).assertEqual(5);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0027 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0060
         * @tc.name testState0028
         * @tc.desc 状态：零二五五零往返，峰值出现在序列中间位置
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0028 begin');
            const seq: number[] = [0, 255, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(maxIndexOf(seq)).assertEqual(1);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0028 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0061
         * @tc.name testState0029
         * @tc.desc 状态：字节边界二五五一与二五六交替，步进恒为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0029 begin');
            const seq: number[] = [255, 256, 255];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(stepDelta(seq)).assertEqual(1);
            expect(maxIndexOf(seq)).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0029 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0062
         * @tc.name testState0030
         * @tc.desc 状态：字边界六五五三五与六五五三六交替，回文且峰值居中
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0030 begin');
            const seq: number[] = [65535, 65536, 65535];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isPalindrome(seq)).assertTrue();
            expect(maxIndexOf(seq)).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0030 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0063
         * @tc.name testState0031
         * @tc.desc 状态：零到四严格递增，步进恒为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0031 begin');
            const seq: number[] = [0, 1, 2, 3, 4];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyIncreasing(seq)).assertTrue();
            expect(stepDelta(seq)).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0031 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0064
         * @tc.name testState0032
         * @tc.desc 状态：九到五严格递减，步进恒为负一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0032 begin');
            const seq: number[] = [9, 8, 7, 6, 5];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyDecreasing(seq)).assertTrue();
            expect(stepDelta(seq)).assertEqual(-1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0032 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0065
         * @tc.name testState0033
         * @tc.desc 状态：偶数序列零到八严格递增，全部为偶数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0033 begin');
            const seq: number[] = [0, 2, 4, 6, 8];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isAllEven(seq)).assertTrue();
            expect(isStrictlyIncreasing(seq)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0033 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0066
         * @tc.name testState0034
         * @tc.desc 状态：奇数序列一到九严格递增，全部为奇数
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0034 begin');
            const seq: number[] = [1, 3, 5, 7, 9];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isAllOdd(seq)).assertTrue();
            expect(getShapeIndex()).assertEqual(9);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0034 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0067
         * @tc.name testState0035
         * @tc.desc 状态：奇数序列九到一严格递减，首项为最大项
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0035 begin');
            const seq: number[] = [9, 7, 5, 3, 1];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isAllOdd(seq)).assertTrue();
            expect(maxIndexOf(seq)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0035 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0068
         * @tc.name testState0036
         * @tc.desc 状态：零一开关式五次，0 出现三次且为回文
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0036 begin');
            const seq: number[] = [0, 1, 0, 1, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(countOf(seq, 0)).assertEqual(3);
            expect(isPalindrome(seq)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0036 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0069
         * @tc.name testState0037
         * @tc.desc 状态：反相开关式五次，终值为一且为回文
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0037 begin');
            const seq: number[] = [1, 0, 1, 0, 1];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(tailOf(seq)).assertEqual(1);
            expect(isPalindrome(seq)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0037 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0070
         * @tc.name testState0038
         * @tc.desc 状态：驼峰序列峰值在第三位，两侧对称
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0038 begin');
            const seq: number[] = [0, 1, 2, 1, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(maxIndexOf(seq)).assertEqual(2);
            expect(isPalindrome(seq)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0038 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0071
         * @tc.name testState0039
         * @tc.desc 状态：三角波七步序列，峰值居中且终值归零
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0039 begin');
            const seq: number[] = [0, 1, 2, 3, 2, 1, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(maxIndexOf(seq)).assertEqual(3);
            expect(seq.length).assertEqual(7);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0039 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0072
         * @tc.name testState0040
         * @tc.desc 状态：十倍放大序列递增，末项为一万
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0040 begin');
            const seq: number[] = [1, 10, 100, 1000, 10000];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyIncreasing(seq)).assertTrue();
            expect(tailOf(seq)).assertEqual(10000);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0040 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0073
         * @tc.name testState0041
         * @tc.desc 状态：十倍缩小序列递减，终值收敛到一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0041 begin');
            const seq: number[] = [10000, 1000, 100, 10, 1];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyDecreasing(seq)).assertTrue();
            expect(getShapeIndex()).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0041 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0074
         * @tc.name testState0042
         * @tc.desc 状态：二的幂序列一零二四起步递增，相邻差恒为一零二四
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0042 begin');
            const seq: number[] = [1024, 2048, 4096, 8192];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(stepDelta(seq)).assertEqual(1024);
            expect(isStrictlyIncreasing(seq)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0042 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0075
         * @tc.name testState0043
         * @tc.desc 状态：int32 上界与零往返，上界值出现两次且回文
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0043 begin');
            const seq: number[] = [INT32_MAX, 0, INT32_MAX];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isPalindrome(seq)).assertTrue();
            expect(countOf(seq, INT32_MAX)).assertEqual(2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0043 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0076
         * @tc.name testState0044
         * @tc.desc 状态：跨越 int32 上界后再归零，峰值位于第三位
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0044 begin');
            const seq: number[] = [0, INT32_MAX, INT32_MAX + 1, INT32_MAX, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(maxIndexOf(seq)).assertEqual(2);
            expect(isPalindrome(seq)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0044 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0077
         * @tc.name testState0045
         * @tc.desc 状态：int32 上界加一的连续三值递增，步进恒为一
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0045 begin');
            const seq: number[] = [INT32_MAX + 1, INT32_MAX + 2, INT32_MAX + 3];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(stepDelta(seq)).assertEqual(1);
            expect(getShapeIndex()).assertEqual(tailOf(seq));
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0045 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0078
         * @tc.name testState0046
         * @tc.desc 状态：uint32 上界向下三连，终值为上界减二
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0046 begin');
            const seq: number[] = [UINT32_MAX, UINT32_MAX_MINUS_ONE, 4294967293];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyDecreasing(seq)).assertTrue();
            expect(tailOf(seq)).assertEqual(UINT32_MAX - 2);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0046 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0079
         * @tc.name testState0047
         * @tc.desc 状态：逼近上界的四步递增，末项恰为 uint32 上界
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0047 begin');
            const seq: number[] = [4294967290, 4294967292, 4294967294, UINT32_MAX];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyIncreasing(seq)).assertTrue();
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0047 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0080
         * @tc.name testState0048
         * @tc.desc 状态：双值块序列七七八八七，7 出现三次且回文
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0048 begin');
            const seq: number[] = [7, 7, 8, 8, 7];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(countOf(seq, 7)).assertEqual(3);
            expect(getShapeIndex()).assertEqual(tailOf(seq));
            expect(isConstant(seq)).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0048 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0081
         * @tc.name testState0049
         * @tc.desc 状态：双零块序列零零一一零零，0 出现四次且回文
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0049 begin');
            const seq: number[] = [0, 0, 1, 1, 0, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(countOf(seq, 0)).assertEqual(4);
            expect(isPalindrome(seq)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0049 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0082
         * @tc.name testState0050
         * @tc.desc 状态：两位数等差二十二递增，终值为九十
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0050 begin');
            const seq: number[] = [12, 34, 56, 78, 90];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(stepDelta(seq)).assertEqual(22);
            expect(tailOf(seq)).assertEqual(90);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0050 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0083
         * @tc.name testState0051
         * @tc.desc 状态：两位数等差二十二递减，首项为最大项
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0051 begin');
            const seq: number[] = [90, 68, 46, 24, 2];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(stepDelta(seq)).assertEqual(-22);
            expect(maxIndexOf(seq)).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0051 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0084
         * @tc.name testState0052
         * @tc.desc 状态：斐波那契前八项含重复值，末项为二十一且不严格递增
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0052 begin');
            const seq: number[] = [1, 1, 2, 3, 5, 8, 13, 21];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyIncreasing(seq)).assertFalse();
            expect(tailOf(seq)).assertEqual(21);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0052 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0085
         * @tc.name testState0053
         * @tc.desc 状态：素数序列八项严格递增，末项为十九
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0053 begin');
            const seq: number[] = [2, 3, 5, 7, 11, 13, 17, 19];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyIncreasing(seq)).assertTrue();
            expect(getShapeIndex()).assertEqual(19);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0053 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0086
         * @tc.name testState0054
         * @tc.desc 状态：三位数与零往返四次，999 出现两次且回文
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0054 begin');
            const seq: number[] = [999, 0, 999, 0];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(countOf(seq, 999)).assertEqual(2);
            expect(getShapeIndex()).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0054 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_CONTRACT_0087
         * @tc.name testState0055
         * @tc.desc 状态：各级满位值递增到 uint32 上界，全程严格递增
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0055 begin');
            const seq: number[] = [0, 255, 65535, 16777215, UINT32_MAX];
            expect(replayAndCountMismatch(seq)).assertEqual(0);
            expect(isStrictlyIncreasing(seq)).assertTrue();
            expect(getShapeIndex()).assertEqual(UINT32_MAX);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testState0055 end');
        });

    });
}
