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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RandomUtils } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * RandomUtils 随机工具类测试套件。
 * 覆盖 nextInt/nextFloat/nextBoolean/nextString/nextHex/nextUuid/nextColor/
 * nextElement/shuffle/nextInRange/weightedRandom 等全部公开方法。
 */
export default function RandomUtilsTest(): void {
  describe('RandomUtilsTest', () => {

    // ========================================
    // nextInt
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0100
     * @tc.name testUtilsRandomUtils0001
     * @tc.desc 正向: nextInt 返回值在 [min, max) 范围内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0001 begin');
      for (let i: number = 0; i < 20; i++) {
        const val: number = RandomUtils.nextInt(0, 100);
        expect(val).assertLarger(-1);
        expect(val).assertLess(100);
        expect(Math.floor(val)).assertEqual(val);
      }
    });

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0200
     * @tc.name testUtilsRandomUtils0002
     * @tc.desc 边界: min >= max 时返回 min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsRandomUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0002 begin');
      expect(RandomUtils.nextInt(5, 5)).assertEqual(5);
      expect(RandomUtils.nextInt(10, 3)).assertEqual(10);
      expect(RandomUtils.nextInt(-1, -1)).assertEqual(-1);
    });

    // ========================================
    // nextFloat
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0300
     * @tc.name testUtilsRandomUtils0003
     * @tc.desc 正向: nextFloat 返回值在 [min, max] 范围内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0003 begin');
      const samples: number[] = [];
      for (let i: number = 0; i < 20; i++) {
        const val: number = RandomUtils.nextFloat(0.0, 1.0);
        expect(val).assertLarger(-0.001);
        expect(val).assertLess(1.001);
        samples.push(val);
      }
      const uniqueValues: Set<number> = new Set<number>(samples);
      expect(uniqueValues.size).assertLarger(1);
      expect(RandomUtils.nextFloat(3, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0400
     * @tc.name testUtilsRandomUtils0004
     * @tc.desc 边界: min > max 时自动交换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsRandomUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0004 begin');
      const samples: number[] = [];
      for (let i: number = 0; i < 10; i++) {
        const val: number = RandomUtils.nextFloat(10.0, 5.0);
        expect(val).assertLarger(4.999);
        expect(val).assertLess(10.001);
        samples.push(val);
      }
      const uniqueValues: Set<number> = new Set<number>(samples);
      expect(uniqueValues.size).assertLarger(1);
      const forward: number = RandomUtils.nextFloat(5.0, 10.0);
      expect(forward).assertLarger(4.999);
      expect(forward).assertLess(10.001);
    });

    // ========================================
    // nextBoolean
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0500
     * @tc.name testUtilsRandomUtils0005
     * @tc.desc 正向: nextBoolean 50 次采样同时出现 true 与 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0005 begin');
      let trueCount: number = 0;
      let falseCount: number = 0;
      for (let i: number = 0; i < 50; i++) {
        const val: boolean = RandomUtils.nextBoolean();
        if (val) {
          trueCount += 1;
        } else {
          falseCount += 1;
        }
      }
      expect(trueCount).assertLarger(0);
      expect(falseCount).assertLarger(0);
      expect(trueCount).assertLess(46);
      expect(falseCount).assertLess(46);
    });

    // ========================================
    // nextString
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0600
     * @tc.name testUtilsRandomUtils0006
     * @tc.desc 正向: nextString 返回指定长度的字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0006 begin');
      const s1: string = RandomUtils.nextString(10);
      expect(s1.length).assertEqual(10);
      const s2: string = RandomUtils.nextString(0);
      expect(s2).assertEqual('');
      const fixed: string = RandomUtils.nextString(5, 'X');
      expect(fixed).assertEqual('XXXXX');
      const s3: string = RandomUtils.nextString(10);
      expect(s3 === s1).assertFalse();
    });

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0700
     * @tc.name testUtilsRandomUtils0007
     * @tc.desc 正向: 自定义字符集生成字符串仅包含指定字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsRandomUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0007 begin');
      const chars: string = 'ABC';
      const result: string = RandomUtils.nextString(20, chars);
      expect(result.length).assertEqual(20);
      for (let i: number = 0; i < result.length; i++) {
        const ch: string = result.charAt(i);
        expect(chars.indexOf(ch)).assertLarger(-1);
      }
      expect(result.indexOf('D')).assertEqual(-1);
    });

    // ========================================
    // nextHex
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0800
     * @tc.name testUtilsRandomUtils0008
     * @tc.desc 正向: nextHex 返回指定长度的十六进制字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0008 begin');
      const hex: string = RandomUtils.nextHex(8);
      expect(hex.length).assertEqual(8);
      const hexPattern: RegExp = /^[0-9a-f]+$/;
      expect(hexPattern.test(hex)).assertTrue();
      const hex4: string = RandomUtils.nextHex(4);
      expect(hex4.length).assertEqual(4);
      expect(hexPattern.test(hex4)).assertTrue();
    });

    // ========================================
    // nextUuid
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_0900
     * @tc.name testUtilsRandomUtils0009
     * @tc.desc 正向: nextUuid 返回符合 v4 格式的 UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0009 begin');
      const uuid: string = RandomUtils.nextUuid();
      const parts: string[] = uuid.split('-');
      expect(parts.length).assertEqual(5);
      expect(parts[0].length).assertEqual(8);
      expect(parts[1].length).assertEqual(4);
      expect(parts[2].length).assertEqual(4);
      expect(parts[3].length).assertEqual(4);
      expect(parts[4].length).assertEqual(12);
      expect(parts[2].charAt(0)).assertEqual('4');
    });

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1000
     * @tc.name testUtilsRandomUtils0010
     * @tc.desc 正向: 多次生成的 UUID 互不相同
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsRandomUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0010 begin');
      const uuids: string[] = [];
      for (let i: number = 0; i < 10; i++) {
        uuids.push(RandomUtils.nextUuid());
      }
      const uniqueSet: Set<string> = new Set(uuids);
      expect(uniqueSet.size).assertEqual(10);
      expect(uuids[0].length).assertEqual(36);
      expect(uuids[9].split('-')[4].length).assertEqual(12);
    });

    // ========================================
    // nextColor
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1100
     * @tc.name testUtilsRandomUtils0011
     * @tc.desc 正向: nextColor 返回 #RRGGBB 格式
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0011 begin');
      const color: string = RandomUtils.nextColor();
      expect(color.charAt(0)).assertEqual('#');
      expect(color.length).assertEqual(7);
      const hexPart: string = color.substring(1);
      const hexPattern: RegExp = /^[0-9a-f]{6}$/;
      expect(hexPattern.test(hexPart)).assertTrue();
    });

    // ========================================
    // nextElement
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1200
     * @tc.name testUtilsRandomUtils0012
     * @tc.desc 正向: 从非空数组中选取元素存在于原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0012 begin');
      const arr: number[] = [10, 20, 30, 40, 50];
      for (let i: number = 0; i < 10; i++) {
        const elem: number | undefined = RandomUtils.nextElement(arr);
        expect(elem !== undefined).assertEqual(true);
        expect(arr.indexOf(elem as number)).assertLarger(-1);
      }
      const emptyArr: number[] = [];
      expect(RandomUtils.nextElement(emptyArr)).assertUndefined();
    });

    // ========================================
    // shuffle
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1300
     * @tc.name testUtilsRandomUtils0013
     * @tc.desc 正向: shuffle 返回等长数组且不修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0013 begin');
      const original: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const backup: number[] = [...original];
      const shuffled: number[] = RandomUtils.shuffle(original);
      expect(shuffled.length).assertEqual(original.length);
      expect(shuffled.length).assertEqual(10);
      for (const item of shuffled) {
        expect(backup.indexOf(item)).assertLarger(-1);
      }
      // 原数组不变
      for (let i: number = 0; i < original.length; i++) {
        expect(original[i]).assertEqual(backup[i]);
      }
    });

    // ========================================
    // nextInRange
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1400
     * @tc.name testUtilsRandomUtils0014
     * @tc.desc 正向: nextInRange 返回值为 min + n*step 之一
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0014 begin');
      const min: number = 0;
      const max: number = 10;
      const step: number = 2;
      const validValues: number[] = [0, 2, 4, 6, 8, 10];
      for (let i: number = 0; i < 20; i++) {
        const val: number = RandomUtils.nextInRange(min, max, step);
        expect(validValues.indexOf(val)).assertLarger(-1);
        expect(val).assertLarger(-1);
        expect(val).assertLess(11);
      }
    });

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1500
     * @tc.name testUtilsRandomUtils0015
     * @tc.desc 边界: step <= 0 或 min > max 时返回 min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsRandomUtils0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0015 begin');
      expect(RandomUtils.nextInRange(5, 10, 0)).assertEqual(5);
      expect(RandomUtils.nextInRange(5, 10, -1)).assertEqual(5);
      expect(RandomUtils.nextInRange(20, 10, 5)).assertEqual(20);
    });

    // ========================================
    // weightedRandom
    // ========================================

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1600
     * @tc.name testUtilsRandomUtils0016
     * @tc.desc 正向: weightedRandom 返回值在候选列表中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsRandomUtils0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0016 begin');
      const items: string[] = ['A', 'B', 'C'];
      const weights: number[] = [10, 1, 1];
      for (let i: number = 0; i < 20; i++) {
        const result: string | undefined = RandomUtils.weightedRandom(items, weights);
        expect(result !== undefined).assertEqual(true);
        expect(items.indexOf(result as string)).assertLarger(-1);
      }
      const emptyResult: string | undefined = RandomUtils.weightedRandom([], []);
      expect(emptyResult).assertUndefined();
    });

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1700
     * @tc.name testUtilsRandomUtils0017
     * @tc.desc 边界: items 与 weights 长度不一致返回 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsRandomUtils0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0017 begin');
      const result: number | undefined = RandomUtils.weightedRandom([1, 2], [1]);
      expect(result).assertUndefined();
      const result2: number | undefined = RandomUtils.weightedRandom([1], [1, 2]);
      expect(result2).assertUndefined();
      const result3: number | undefined = RandomUtils.weightedRandom([], [1, 2]);
      expect(result3).assertUndefined();
    });

    /**
     * @tc.number SUB_UTILS_RANDOM_UTILS_1800
     * @tc.name testUtilsRandomUtils0018
     * @tc.desc 边界: 全零权重时仍返回候选之一
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsRandomUtils0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsRandomUtils0018 begin');
      const items: string[] = ['X', 'Y', 'Z'];
      const weights: number[] = [0, 0, 0];
      const result: string | undefined = RandomUtils.weightedRandom(items, weights);
      expect(result !== undefined).assertEqual(true);
      expect(items.indexOf(result as string)).assertLarger(-1);
      expect((result as string).length).assertLarger(0);
    });
  });
}
