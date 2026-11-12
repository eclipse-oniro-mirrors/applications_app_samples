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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { truncateMiddle } from '../../../main/ets/utils/FormatUtil';

/**
 * 中间省略网格：4 个字符串 × maxLength 0–20，覆盖「不截断 / 只剩省略号 / 头长尾短」三种形态。
 * 设备名与 UUID 在列表里都走这个函数，长尾算错会导致两行显示成同一串。
 */
export default function distributedTruncateGridTest() {
  describe('DistributedTruncateGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0001
     * @tc.name testTruncate0001
     * @tc.desc Verify ten ASCII letters truncated to 0 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0001', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 0)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 0).length).assertEqual(10);
      expect(truncateMiddle(text, 0).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0002
     * @tc.name testTruncate0002
     * @tc.desc Verify ten ASCII letters truncated to 1 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0002', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 1)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 1).length).assertEqual(10);
      expect(truncateMiddle(text, 1).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0003
     * @tc.name testTruncate0003
     * @tc.desc Verify ten ASCII letters truncated to 2 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0003', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 2)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 2).length).assertEqual(10);
      expect(truncateMiddle(text, 2).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0004
     * @tc.name testTruncate0004
     * @tc.desc Verify ten ASCII letters truncated to 3 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0004', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 3)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 3).length).assertEqual(10);
      expect(truncateMiddle(text, 3).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0005
     * @tc.name testTruncate0005
     * @tc.desc Verify ten ASCII letters truncated to 4 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0005', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 4)).assertEqual('AB…J');
      expect(truncateMiddle(text, 4).length).assertEqual(4);
      expect(truncateMiddle(text, 4).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0006
     * @tc.name testTruncate0006
     * @tc.desc Verify ten ASCII letters truncated to 5 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0006', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 5)).assertEqual('AB…IJ');
      expect(truncateMiddle(text, 5).length).assertEqual(5);
      expect(truncateMiddle(text, 5).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0007
     * @tc.name testTruncate0007
     * @tc.desc Verify ten ASCII letters truncated to 6 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0007', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 6)).assertEqual('ABC…IJ');
      expect(truncateMiddle(text, 6).length).assertEqual(6);
      expect(truncateMiddle(text, 6).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0008
     * @tc.name testTruncate0008
     * @tc.desc Verify ten ASCII letters truncated to 7 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0008', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 7)).assertEqual('ABC…HIJ');
      expect(truncateMiddle(text, 7).length).assertEqual(7);
      expect(truncateMiddle(text, 7).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0009
     * @tc.name testTruncate0009
     * @tc.desc Verify ten ASCII letters truncated to 8 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0009', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 8)).assertEqual('ABCD…HIJ');
      expect(truncateMiddle(text, 8).length).assertEqual(8);
      expect(truncateMiddle(text, 8).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0010
     * @tc.name testTruncate0010
     * @tc.desc Verify ten ASCII letters truncated to 9 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0010', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 9)).assertEqual('ABCD…GHIJ');
      expect(truncateMiddle(text, 9).length).assertEqual(9);
      expect(truncateMiddle(text, 9).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0011
     * @tc.name testTruncate0011
     * @tc.desc Verify ten ASCII letters truncated to 10 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0011', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 10)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 10).length).assertEqual(10);
      expect(truncateMiddle(text, 10).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0012
     * @tc.name testTruncate0012
     * @tc.desc Verify ten ASCII letters truncated to 11 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0012', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 11)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 11).length).assertEqual(10);
      expect(truncateMiddle(text, 11).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0013
     * @tc.name testTruncate0013
     * @tc.desc Verify ten ASCII letters truncated to 12 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0013', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 12)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 12).length).assertEqual(10);
      expect(truncateMiddle(text, 12).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0014
     * @tc.name testTruncate0014
     * @tc.desc Verify ten ASCII letters truncated to 13 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0014', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 13)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 13).length).assertEqual(10);
      expect(truncateMiddle(text, 13).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0015
     * @tc.name testTruncate0015
     * @tc.desc Verify ten ASCII letters truncated to 14 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0015', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 14)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 14).length).assertEqual(10);
      expect(truncateMiddle(text, 14).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0016
     * @tc.name testTruncate0016
     * @tc.desc Verify ten ASCII letters truncated to 15 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0016', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 15)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 15).length).assertEqual(10);
      expect(truncateMiddle(text, 15).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0017
     * @tc.name testTruncate0017
     * @tc.desc Verify ten ASCII letters truncated to 16 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0017', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 16)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 16).length).assertEqual(10);
      expect(truncateMiddle(text, 16).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0018
     * @tc.name testTruncate0018
     * @tc.desc Verify ten ASCII letters truncated to 17 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0018', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 17)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 17).length).assertEqual(10);
      expect(truncateMiddle(text, 17).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0019
     * @tc.name testTruncate0019
     * @tc.desc Verify ten ASCII letters truncated to 18 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0019', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 18)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 18).length).assertEqual(10);
      expect(truncateMiddle(text, 18).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0020
     * @tc.name testTruncate0020
     * @tc.desc Verify ten ASCII letters truncated to 19 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0020', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 19)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 19).length).assertEqual(10);
      expect(truncateMiddle(text, 19).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0021
     * @tc.name testTruncate0021
     * @tc.desc Verify ten ASCII letters truncated to 20 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0021', 0, () => {
      const text: string = 'ABCDEFGHIJ';
      expect(truncateMiddle(text, 20)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle(text, 20).length).assertEqual(10);
      expect(truncateMiddle(text, 20).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0022
     * @tc.name testTruncate0022
     * @tc.desc Verify the lowercase alphabet truncated to 0 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0022', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 0)).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(truncateMiddle(text, 0).length).assertEqual(26);
      expect(truncateMiddle(text, 0).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0023
     * @tc.name testTruncate0023
     * @tc.desc Verify the lowercase alphabet truncated to 1 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0023', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 1)).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(truncateMiddle(text, 1).length).assertEqual(26);
      expect(truncateMiddle(text, 1).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0024
     * @tc.name testTruncate0024
     * @tc.desc Verify the lowercase alphabet truncated to 2 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0024', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 2)).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(truncateMiddle(text, 2).length).assertEqual(26);
      expect(truncateMiddle(text, 2).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0025
     * @tc.name testTruncate0025
     * @tc.desc Verify the lowercase alphabet truncated to 3 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0025', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 3)).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(truncateMiddle(text, 3).length).assertEqual(26);
      expect(truncateMiddle(text, 3).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0026
     * @tc.name testTruncate0026
     * @tc.desc Verify the lowercase alphabet truncated to 4 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0026', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 4)).assertEqual('ab…z');
      expect(truncateMiddle(text, 4).length).assertEqual(4);
      expect(truncateMiddle(text, 4).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0027
     * @tc.name testTruncate0027
     * @tc.desc Verify the lowercase alphabet truncated to 5 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0027', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 5)).assertEqual('ab…yz');
      expect(truncateMiddle(text, 5).length).assertEqual(5);
      expect(truncateMiddle(text, 5).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0028
     * @tc.name testTruncate0028
     * @tc.desc Verify the lowercase alphabet truncated to 6 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0028', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 6)).assertEqual('abc…yz');
      expect(truncateMiddle(text, 6).length).assertEqual(6);
      expect(truncateMiddle(text, 6).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0029
     * @tc.name testTruncate0029
     * @tc.desc Verify the lowercase alphabet truncated to 7 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0029', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 7)).assertEqual('abc…xyz');
      expect(truncateMiddle(text, 7).length).assertEqual(7);
      expect(truncateMiddle(text, 7).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0030
     * @tc.name testTruncate0030
     * @tc.desc Verify the lowercase alphabet truncated to 8 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0030', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 8)).assertEqual('abcd…xyz');
      expect(truncateMiddle(text, 8).length).assertEqual(8);
      expect(truncateMiddle(text, 8).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0031
     * @tc.name testTruncate0031
     * @tc.desc Verify the lowercase alphabet truncated to 9 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0031', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 9)).assertEqual('abcd…wxyz');
      expect(truncateMiddle(text, 9).length).assertEqual(9);
      expect(truncateMiddle(text, 9).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0032
     * @tc.name testTruncate0032
     * @tc.desc Verify the lowercase alphabet truncated to 10 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0032', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 10)).assertEqual('abcde…wxyz');
      expect(truncateMiddle(text, 10).length).assertEqual(10);
      expect(truncateMiddle(text, 10).indexOf('…')).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0033
     * @tc.name testTruncate0033
     * @tc.desc Verify the lowercase alphabet truncated to 11 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0033', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 11)).assertEqual('abcde…vwxyz');
      expect(truncateMiddle(text, 11).length).assertEqual(11);
      expect(truncateMiddle(text, 11).indexOf('…')).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0034
     * @tc.name testTruncate0034
     * @tc.desc Verify the lowercase alphabet truncated to 12 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0034', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 12)).assertEqual('abcdef…vwxyz');
      expect(truncateMiddle(text, 12).length).assertEqual(12);
      expect(truncateMiddle(text, 12).indexOf('…')).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0035
     * @tc.name testTruncate0035
     * @tc.desc Verify the lowercase alphabet truncated to 13 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0035', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 13)).assertEqual('abcdef…uvwxyz');
      expect(truncateMiddle(text, 13).length).assertEqual(13);
      expect(truncateMiddle(text, 13).indexOf('…')).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0036
     * @tc.name testTruncate0036
     * @tc.desc Verify the lowercase alphabet truncated to 14 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0036', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 14)).assertEqual('abcdefg…uvwxyz');
      expect(truncateMiddle(text, 14).length).assertEqual(14);
      expect(truncateMiddle(text, 14).indexOf('…')).assertEqual(7);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0037
     * @tc.name testTruncate0037
     * @tc.desc Verify the lowercase alphabet truncated to 15 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0037', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 15)).assertEqual('abcdefg…tuvwxyz');
      expect(truncateMiddle(text, 15).length).assertEqual(15);
      expect(truncateMiddle(text, 15).indexOf('…')).assertEqual(7);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0038
     * @tc.name testTruncate0038
     * @tc.desc Verify the lowercase alphabet truncated to 16 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0038', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 16)).assertEqual('abcdefgh…tuvwxyz');
      expect(truncateMiddle(text, 16).length).assertEqual(16);
      expect(truncateMiddle(text, 16).indexOf('…')).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0039
     * @tc.name testTruncate0039
     * @tc.desc Verify the lowercase alphabet truncated to 17 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0039', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 17)).assertEqual('abcdefgh…stuvwxyz');
      expect(truncateMiddle(text, 17).length).assertEqual(17);
      expect(truncateMiddle(text, 17).indexOf('…')).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0040
     * @tc.name testTruncate0040
     * @tc.desc Verify the lowercase alphabet truncated to 18 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0040', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 18)).assertEqual('abcdefghi…stuvwxyz');
      expect(truncateMiddle(text, 18).length).assertEqual(18);
      expect(truncateMiddle(text, 18).indexOf('…')).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0041
     * @tc.name testTruncate0041
     * @tc.desc Verify the lowercase alphabet truncated to 19 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0041', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 19)).assertEqual('abcdefghi…rstuvwxyz');
      expect(truncateMiddle(text, 19).length).assertEqual(19);
      expect(truncateMiddle(text, 19).indexOf('…')).assertEqual(9);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0042
     * @tc.name testTruncate0042
     * @tc.desc Verify the lowercase alphabet truncated to 20 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0042', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      expect(truncateMiddle(text, 20)).assertEqual('abcdefghij…rstuvwxyz');
      expect(truncateMiddle(text, 20).length).assertEqual(20);
      expect(truncateMiddle(text, 20).indexOf('…')).assertEqual(10);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0043
     * @tc.name testTruncate0043
     * @tc.desc Verify a Chinese caption truncated to 0 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0043', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 0)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 0).length).assertEqual(12);
      expect(truncateMiddle(text, 0).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0044
     * @tc.name testTruncate0044
     * @tc.desc Verify a Chinese caption truncated to 1 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0044', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 1)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 1).length).assertEqual(12);
      expect(truncateMiddle(text, 1).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0045
     * @tc.name testTruncate0045
     * @tc.desc Verify a Chinese caption truncated to 2 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0045', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 2)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 2).length).assertEqual(12);
      expect(truncateMiddle(text, 2).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0046
     * @tc.name testTruncate0046
     * @tc.desc Verify a Chinese caption truncated to 3 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0046', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 3)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 3).length).assertEqual(12);
      expect(truncateMiddle(text, 3).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0047
     * @tc.name testTruncate0047
     * @tc.desc Verify a Chinese caption truncated to 4 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0047', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 4)).assertEqual('分布…例');
      expect(truncateMiddle(text, 4).length).assertEqual(4);
      expect(truncateMiddle(text, 4).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0048
     * @tc.name testTruncate0048
     * @tc.desc Verify a Chinese caption truncated to 5 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0048', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 5)).assertEqual('分布…示例');
      expect(truncateMiddle(text, 5).length).assertEqual(5);
      expect(truncateMiddle(text, 5).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0049
     * @tc.name testTruncate0049
     * @tc.desc Verify a Chinese caption truncated to 6 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0049', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 6)).assertEqual('分布式…示例');
      expect(truncateMiddle(text, 6).length).assertEqual(6);
      expect(truncateMiddle(text, 6).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0050
     * @tc.name testTruncate0050
     * @tc.desc Verify a Chinese caption truncated to 7 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0050', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 7)).assertEqual('分布式…强示例');
      expect(truncateMiddle(text, 7).length).assertEqual(7);
      expect(truncateMiddle(text, 7).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0051
     * @tc.name testTruncate0051
     * @tc.desc Verify a Chinese caption truncated to 8 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0051', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 8)).assertEqual('分布式扩…强示例');
      expect(truncateMiddle(text, 8).length).assertEqual(8);
      expect(truncateMiddle(text, 8).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0052
     * @tc.name testTruncate0052
     * @tc.desc Verify a Chinese caption truncated to 9 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0052', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 9)).assertEqual('分布式扩…增强示例');
      expect(truncateMiddle(text, 9).length).assertEqual(9);
      expect(truncateMiddle(text, 9).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0053
     * @tc.name testTruncate0053
     * @tc.desc Verify a Chinese caption truncated to 10 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0053', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 10)).assertEqual('分布式扩展…增强示例');
      expect(truncateMiddle(text, 10).length).assertEqual(10);
      expect(truncateMiddle(text, 10).indexOf('…')).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0054
     * @tc.name testTruncate0054
     * @tc.desc Verify a Chinese caption truncated to 11 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0054', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 11)).assertEqual('分布式扩展…路增强示例');
      expect(truncateMiddle(text, 11).length).assertEqual(11);
      expect(truncateMiddle(text, 11).indexOf('…')).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0055
     * @tc.name testTruncate0055
     * @tc.desc Verify a Chinese caption truncated to 12 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0055', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 12)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 12).length).assertEqual(12);
      expect(truncateMiddle(text, 12).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0056
     * @tc.name testTruncate0056
     * @tc.desc Verify a Chinese caption truncated to 13 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0056', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 13)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 13).length).assertEqual(12);
      expect(truncateMiddle(text, 13).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0057
     * @tc.name testTruncate0057
     * @tc.desc Verify a Chinese caption truncated to 14 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0057', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 14)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 14).length).assertEqual(12);
      expect(truncateMiddle(text, 14).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0058
     * @tc.name testTruncate0058
     * @tc.desc Verify a Chinese caption truncated to 15 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0058', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 15)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 15).length).assertEqual(12);
      expect(truncateMiddle(text, 15).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0059
     * @tc.name testTruncate0059
     * @tc.desc Verify a Chinese caption truncated to 16 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0059', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 16)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 16).length).assertEqual(12);
      expect(truncateMiddle(text, 16).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0060
     * @tc.name testTruncate0060
     * @tc.desc Verify a Chinese caption truncated to 17 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0060', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 17)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 17).length).assertEqual(12);
      expect(truncateMiddle(text, 17).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0061
     * @tc.name testTruncate0061
     * @tc.desc Verify a Chinese caption truncated to 18 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0061', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 18)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 18).length).assertEqual(12);
      expect(truncateMiddle(text, 18).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0062
     * @tc.name testTruncate0062
     * @tc.desc Verify a Chinese caption truncated to 19 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0062', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 19)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 19).length).assertEqual(12);
      expect(truncateMiddle(text, 19).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0063
     * @tc.name testTruncate0063
     * @tc.desc Verify a Chinese caption truncated to 20 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0063', 0, () => {
      const text: string = '分布式扩展与链路增强示例';
      expect(truncateMiddle(text, 20)).assertEqual('分布式扩展与链路增强示例');
      expect(truncateMiddle(text, 20).length).assertEqual(12);
      expect(truncateMiddle(text, 20).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0064
     * @tc.name testTruncate0064
     * @tc.desc Verify the default peer MAC truncated to 0 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0064', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 0)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 0).length).assertEqual(17);
      expect(truncateMiddle(text, 0).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0065
     * @tc.name testTruncate0065
     * @tc.desc Verify the default peer MAC truncated to 1 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0065', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 1)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 1).length).assertEqual(17);
      expect(truncateMiddle(text, 1).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0066
     * @tc.name testTruncate0066
     * @tc.desc Verify the default peer MAC truncated to 2 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0066', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 2)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 2).length).assertEqual(17);
      expect(truncateMiddle(text, 2).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0067
     * @tc.name testTruncate0067
     * @tc.desc Verify the default peer MAC truncated to 3 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0067', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 3)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 3).length).assertEqual(17);
      expect(truncateMiddle(text, 3).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0068
     * @tc.name testTruncate0068
     * @tc.desc Verify the default peer MAC truncated to 4 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0068', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 4)).assertEqual('12…C');
      expect(truncateMiddle(text, 4).length).assertEqual(4);
      expect(truncateMiddle(text, 4).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0069
     * @tc.name testTruncate0069
     * @tc.desc Verify the default peer MAC truncated to 5 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0069', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 5)).assertEqual('12…BC');
      expect(truncateMiddle(text, 5).length).assertEqual(5);
      expect(truncateMiddle(text, 5).indexOf('…')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0070
     * @tc.name testTruncate0070
     * @tc.desc Verify the default peer MAC truncated to 6 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0070', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 6)).assertEqual('12:…BC');
      expect(truncateMiddle(text, 6).length).assertEqual(6);
      expect(truncateMiddle(text, 6).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0071
     * @tc.name testTruncate0071
     * @tc.desc Verify the default peer MAC truncated to 7 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0071', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 7)).assertEqual('12:…:BC');
      expect(truncateMiddle(text, 7).length).assertEqual(7);
      expect(truncateMiddle(text, 7).indexOf('…')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0072
     * @tc.name testTruncate0072
     * @tc.desc Verify the default peer MAC truncated to 8 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0072', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 8)).assertEqual('12:3…:BC');
      expect(truncateMiddle(text, 8).length).assertEqual(8);
      expect(truncateMiddle(text, 8).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0073
     * @tc.name testTruncate0073
     * @tc.desc Verify the default peer MAC truncated to 9 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0073', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 9)).assertEqual('12:3…A:BC');
      expect(truncateMiddle(text, 9).length).assertEqual(9);
      expect(truncateMiddle(text, 9).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0074
     * @tc.name testTruncate0074
     * @tc.desc Verify the default peer MAC truncated to 10 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0074', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 10)).assertEqual('12:34…A:BC');
      expect(truncateMiddle(text, 10).length).assertEqual(10);
      expect(truncateMiddle(text, 10).indexOf('…')).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0075
     * @tc.name testTruncate0075
     * @tc.desc Verify the default peer MAC truncated to 11 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0075', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 11)).assertEqual('12:34…9A:BC');
      expect(truncateMiddle(text, 11).length).assertEqual(11);
      expect(truncateMiddle(text, 11).indexOf('…')).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0076
     * @tc.name testTruncate0076
     * @tc.desc Verify the default peer MAC truncated to 12 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0076', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 12)).assertEqual('12:34:…9A:BC');
      expect(truncateMiddle(text, 12).length).assertEqual(12);
      expect(truncateMiddle(text, 12).indexOf('…')).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0077
     * @tc.name testTruncate0077
     * @tc.desc Verify the default peer MAC truncated to 13 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0077', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 13)).assertEqual('12:34:…:9A:BC');
      expect(truncateMiddle(text, 13).length).assertEqual(13);
      expect(truncateMiddle(text, 13).indexOf('…')).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0078
     * @tc.name testTruncate0078
     * @tc.desc Verify the default peer MAC truncated to 14 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0078', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 14)).assertEqual('12:34:5…:9A:BC');
      expect(truncateMiddle(text, 14).length).assertEqual(14);
      expect(truncateMiddle(text, 14).indexOf('…')).assertEqual(7);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0079
     * @tc.name testTruncate0079
     * @tc.desc Verify the default peer MAC truncated to 15 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0079', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 15)).assertEqual('12:34:5…8:9A:BC');
      expect(truncateMiddle(text, 15).length).assertEqual(15);
      expect(truncateMiddle(text, 15).indexOf('…')).assertEqual(7);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0080
     * @tc.name testTruncate0080
     * @tc.desc Verify the default peer MAC truncated to 16 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0080', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 16)).assertEqual('12:34:56…8:9A:BC');
      expect(truncateMiddle(text, 16).length).assertEqual(16);
      expect(truncateMiddle(text, 16).indexOf('…')).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0081
     * @tc.name testTruncate0081
     * @tc.desc Verify the default peer MAC truncated to 17 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0081', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 17)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 17).length).assertEqual(17);
      expect(truncateMiddle(text, 17).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0082
     * @tc.name testTruncate0082
     * @tc.desc Verify the default peer MAC truncated to 18 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0082', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 18)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 18).length).assertEqual(17);
      expect(truncateMiddle(text, 18).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0083
     * @tc.name testTruncate0083
     * @tc.desc Verify the default peer MAC truncated to 19 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0083', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 19)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 19).length).assertEqual(17);
      expect(truncateMiddle(text, 19).indexOf('…')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TRUNCATE_0084
     * @tc.name testTruncate0084
     * @tc.desc Verify the default peer MAC truncated to 20 keeps both ends.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTruncate0084', 0, () => {
      const text: string = '12:34:56:78:9A:BC';
      expect(truncateMiddle(text, 20)).assertEqual('12:34:56:78:9A:BC');
      expect(truncateMiddle(text, 20).length).assertEqual(17);
      expect(truncateMiddle(text, 20).indexOf('…')).assertEqual(-1);
    });

  });
}
