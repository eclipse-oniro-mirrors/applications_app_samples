'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { SIZES } from '../../../../main/ets/common/Contants';
import { logSuite } from '../Shared/Copy';

export default function SizeMetricsTest(): void {
  describe('SizeMetricsTest', () => {
    beforeAll(() => {
      logSuite('SizeMetricsTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SizeMetricsTest', 'end');
    });

    /**
     * @tc.name SizeMetricsTest_case_001
     * @tc.desc size-metrics: radius basic contract, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_001', 0, () => {
      expect(SIZES.radius).assertEqual(12);
      expect(typeof SIZES.radius).assertEqual('int');
      expect(SIZES.radius > 0).assertTrue();
      expect(Math.floor(SIZES.radius)).assertEqual(12);
      expect(SIZES.radius === 12).assertTrue();
      expect(Number.isInteger(SIZES.radius)).assertTrue();
      expect(SIZES.radius.toString()).assertEqual('12');
    });

    /**
     * @tc.name SizeMetricsTest_case_002
     * @tc.desc size-metrics: radius basic contract, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_002', 0, () => {
      const value: number = SIZES.radius;
      expect(value * 2).assertEqual(24);
      expect(value / 2).assertEqual(6);
      expect(Math.round(value * 1.5)).assertEqual(18);
      expect(value * value).assertEqual(144);
      expect(value % 2).assertEqual(0);
      expect(value - 1).assertEqual(11);
      expect(value + 1).assertEqual(13);
    });

    /**
     * @tc.name SizeMetricsTest_case_003
     * @tc.desc size-metrics: radius basic contract, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_003', 0, () => {
      const value: number = SIZES.radius;
      expect(value >= 1).assertTrue();
      expect(value <= 100).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
      expect(Math.abs(value)).assertEqual(12);
      expect(Math.max(value, 0)).assertEqual(12);
      expect(Math.min(value, 0)).assertEqual(0);
      expect(value === 0).assertFalse();
    });

    /**
     * @tc.name SizeMetricsTest_case_004
     * @tc.desc size-metrics: padding basic contract, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_004', 0, () => {
      expect(SIZES.padding).assertEqual(20);
      expect(typeof SIZES.padding).assertEqual('int');
      expect(SIZES.padding > 0).assertTrue();
      expect(Math.floor(SIZES.padding)).assertEqual(20);
      expect(SIZES.padding === 20).assertTrue();
      expect(Number.isInteger(SIZES.padding)).assertTrue();
      expect(SIZES.padding.toString()).assertEqual('20');
    });

    /**
     * @tc.name SizeMetricsTest_case_005
     * @tc.desc size-metrics: padding basic contract, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_005', 0, () => {
      const value: number = SIZES.padding;
      expect(value * 2).assertEqual(40);
      expect(value / 2).assertEqual(10);
      expect(Math.round(value * 1.5)).assertEqual(30);
      expect(value * value).assertEqual(400);
      expect(value % 2).assertEqual(0);
      expect(value - 1).assertEqual(19);
      expect(value + 1).assertEqual(21);
    });

    /**
     * @tc.name SizeMetricsTest_case_006
     * @tc.desc size-metrics: padding basic contract, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_006', 0, () => {
      const value: number = SIZES.padding;
      expect(value >= 1).assertTrue();
      expect(value <= 100).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
      expect(Math.abs(value)).assertEqual(20);
      expect(Math.max(value, 0)).assertEqual(20);
      expect(Math.min(value, 0)).assertEqual(0);
      expect(value === 0).assertFalse();
    });

    /**
     * @tc.name SizeMetricsTest_case_007
     * @tc.desc size-metrics: fontSizeTitle basic contract, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_007', 0, () => {
      expect(SIZES.fontSizeTitle).assertEqual(22);
      expect(typeof SIZES.fontSizeTitle).assertEqual('int');
      expect(SIZES.fontSizeTitle > 0).assertTrue();
      expect(Math.floor(SIZES.fontSizeTitle)).assertEqual(22);
      expect(SIZES.fontSizeTitle === 22).assertTrue();
      expect(Number.isInteger(SIZES.fontSizeTitle)).assertTrue();
      expect(SIZES.fontSizeTitle.toString()).assertEqual('22');
    });

    /**
     * @tc.name SizeMetricsTest_case_008
     * @tc.desc size-metrics: fontSizeTitle basic contract, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_008', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(value * 2).assertEqual(44);
      expect(value / 2).assertEqual(11);
      expect(Math.round(value * 1.5)).assertEqual(33);
      expect(value * value).assertEqual(484);
      expect(value % 2).assertEqual(0);
      expect(value - 1).assertEqual(21);
      expect(value + 1).assertEqual(23);
    });

    /**
     * @tc.name SizeMetricsTest_case_009
     * @tc.desc size-metrics: fontSizeTitle basic contract, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_009', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(value >= 1).assertTrue();
      expect(value <= 100).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
      expect(Math.abs(value)).assertEqual(22);
      expect(Math.max(value, 0)).assertEqual(22);
      expect(Math.min(value, 0)).assertEqual(0);
      expect(value === 0).assertFalse();
    });

    /**
     * @tc.name SizeMetricsTest_case_010
     * @tc.desc size-metrics: fontSizeNormal basic contract, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_010', 0, () => {
      expect(SIZES.fontSizeNormal).assertEqual(16);
      expect(typeof SIZES.fontSizeNormal).assertEqual('int');
      expect(SIZES.fontSizeNormal > 0).assertTrue();
      expect(Math.floor(SIZES.fontSizeNormal)).assertEqual(16);
      expect(SIZES.fontSizeNormal === 16).assertTrue();
      expect(Number.isInteger(SIZES.fontSizeNormal)).assertTrue();
      expect(SIZES.fontSizeNormal.toString()).assertEqual('16');
    });

    /**
     * @tc.name SizeMetricsTest_case_011
     * @tc.desc size-metrics: fontSizeNormal basic contract, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_011', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(value * 2).assertEqual(32);
      expect(value / 2).assertEqual(8);
      expect(Math.round(value * 1.5)).assertEqual(24);
      expect(value * value).assertEqual(256);
      expect(value % 2).assertEqual(0);
      expect(value - 1).assertEqual(15);
      expect(value + 1).assertEqual(17);
    });

    /**
     * @tc.name SizeMetricsTest_case_012
     * @tc.desc size-metrics: fontSizeNormal basic contract, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_012', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(value >= 1).assertTrue();
      expect(value <= 100).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
      expect(Math.abs(value)).assertEqual(16);
      expect(Math.max(value, 0)).assertEqual(16);
      expect(Math.min(value, 0)).assertEqual(0);
      expect(value === 0).assertFalse();
    });

    /**
     * @tc.name SizeMetricsTest_case_013
     * @tc.desc size-metrics: fontSizeSmall basic contract, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_013', 0, () => {
      expect(SIZES.fontSizeSmall).assertEqual(14);
      expect(typeof SIZES.fontSizeSmall).assertEqual('int');
      expect(SIZES.fontSizeSmall > 0).assertTrue();
      expect(Math.floor(SIZES.fontSizeSmall)).assertEqual(14);
      expect(SIZES.fontSizeSmall === 14).assertTrue();
      expect(Number.isInteger(SIZES.fontSizeSmall)).assertTrue();
      expect(SIZES.fontSizeSmall.toString()).assertEqual('14');
    });

    /**
     * @tc.name SizeMetricsTest_case_014
     * @tc.desc size-metrics: fontSizeSmall basic contract, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_014', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(value * 2).assertEqual(28);
      expect(value / 2).assertEqual(7);
      expect(Math.round(value * 1.5)).assertEqual(21);
      expect(value * value).assertEqual(196);
      expect(value % 2).assertEqual(0);
      expect(value - 1).assertEqual(13);
      expect(value + 1).assertEqual(15);
    });

    /**
     * @tc.name SizeMetricsTest_case_015
     * @tc.desc size-metrics: fontSizeSmall basic contract, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_015', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(value >= 1).assertTrue();
      expect(value <= 100).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
      expect(Math.abs(value)).assertEqual(14);
      expect(Math.max(value, 0)).assertEqual(14);
      expect(Math.min(value, 0)).assertEqual(0);
      expect(value === 0).assertFalse();
    });

    /**
     * @tc.name SizeMetricsTest_case_016
     * @tc.desc size-metrics: spacing basic contract, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_016', 0, () => {
      expect(SIZES.spacing).assertEqual(16);
      expect(typeof SIZES.spacing).assertEqual('int');
      expect(SIZES.spacing > 0).assertTrue();
      expect(Math.floor(SIZES.spacing)).assertEqual(16);
      expect(SIZES.spacing === 16).assertTrue();
      expect(Number.isInteger(SIZES.spacing)).assertTrue();
      expect(SIZES.spacing.toString()).assertEqual('16');
    });

    /**
     * @tc.name SizeMetricsTest_case_017
     * @tc.desc size-metrics: spacing basic contract, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_017', 0, () => {
      const value: number = SIZES.spacing;
      expect(value * 2).assertEqual(32);
      expect(value / 2).assertEqual(8);
      expect(Math.round(value * 1.5)).assertEqual(24);
      expect(value * value).assertEqual(256);
      expect(value % 2).assertEqual(0);
      expect(value - 1).assertEqual(15);
      expect(value + 1).assertEqual(17);
    });

    /**
     * @tc.name SizeMetricsTest_case_018
     * @tc.desc size-metrics: spacing basic contract, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_018', 0, () => {
      const value: number = SIZES.spacing;
      expect(value >= 1).assertTrue();
      expect(value <= 100).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
      expect(Math.abs(value)).assertEqual(16);
      expect(Math.max(value, 0)).assertEqual(16);
      expect(Math.min(value, 0)).assertEqual(0);
      expect(value === 0).assertFalse();
    });

    /**
     * @tc.name SizeMetricsTest_case_019
     * @tc.desc size-metrics: arithmetic on radius and radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_019', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.radius;
      expect(left + right).assertEqual(24);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(144);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_020
     * @tc.desc size-metrics: arithmetic on radius and radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_020', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.radius;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(12);
      expect(left + right * 2).assertEqual(36);
      expect((left + right) / 2).assertEqual(12);
    });

    /**
     * @tc.name SizeMetricsTest_case_021
     * @tc.desc size-metrics: arithmetic on radius and radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_021', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.radius;
      expect(Math.max(left, right)).assertEqual(12);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_022
     * @tc.desc size-metrics: arithmetic on radius and padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_022', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.padding;
      expect(left + right).assertEqual(32);
      expect(left - right).assertEqual(-8);
      expect(right - left).assertEqual(8);
      expect(Math.abs(left - right)).assertEqual(8);
      expect(left * right).assertEqual(240);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_023
     * @tc.desc size-metrics: arithmetic on radius and padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_023', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.padding;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.6000);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(12);
      expect(left * 2 - right).assertEqual(4);
      expect(left + right * 2).assertEqual(52);
      expect((left + right) / 2).assertEqual(16);
    });

    /**
     * @tc.name SizeMetricsTest_case_024
     * @tc.desc size-metrics: arithmetic on radius and padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_024', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.padding;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_025
     * @tc.desc size-metrics: arithmetic on radius and fontSizeTitle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_025', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeTitle;
      expect(left + right).assertEqual(34);
      expect(left - right).assertEqual(-10);
      expect(right - left).assertEqual(10);
      expect(Math.abs(left - right)).assertEqual(10);
      expect(left * right).assertEqual(264);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_026
     * @tc.desc size-metrics: arithmetic on radius and fontSizeTitle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_026', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.5455);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(12);
      expect(left * 2 - right).assertEqual(2);
      expect(left + right * 2).assertEqual(56);
      expect((left + right) / 2).assertEqual(17);
    });

    /**
     * @tc.name SizeMetricsTest_case_027
     * @tc.desc size-metrics: arithmetic on radius and fontSizeTitle, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_027', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_028
     * @tc.desc size-metrics: arithmetic on radius and fontSizeNormal, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_028', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeNormal;
      expect(left + right).assertEqual(28);
      expect(left - right).assertEqual(-4);
      expect(right - left).assertEqual(4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(192);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_029
     * @tc.desc size-metrics: arithmetic on radius and fontSizeNormal, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_029', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.7500);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(12);
      expect(left * 2 - right).assertEqual(8);
      expect(left + right * 2).assertEqual(44);
      expect((left + right) / 2).assertEqual(14);
    });

    /**
     * @tc.name SizeMetricsTest_case_030
     * @tc.desc size-metrics: arithmetic on radius and fontSizeNormal, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_030', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_031
     * @tc.desc size-metrics: arithmetic on radius and fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_031', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeSmall;
      expect(left + right).assertEqual(26);
      expect(left - right).assertEqual(-2);
      expect(right - left).assertEqual(2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(168);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_032
     * @tc.desc size-metrics: arithmetic on radius and fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_032', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.8571);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(12);
      expect(left * 2 - right).assertEqual(10);
      expect(left + right * 2).assertEqual(40);
      expect((left + right) / 2).assertEqual(13);
    });

    /**
     * @tc.name SizeMetricsTest_case_033
     * @tc.desc size-metrics: arithmetic on radius and fontSizeSmall, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_033', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.max(left, right)).assertEqual(14);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_034
     * @tc.desc size-metrics: arithmetic on radius and spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_034', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.spacing;
      expect(left + right).assertEqual(28);
      expect(left - right).assertEqual(-4);
      expect(right - left).assertEqual(4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(192);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_035
     * @tc.desc size-metrics: arithmetic on radius and spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_035', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.spacing;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.7500);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(12);
      expect(left * 2 - right).assertEqual(8);
      expect(left + right * 2).assertEqual(44);
      expect((left + right) / 2).assertEqual(14);
    });

    /**
     * @tc.name SizeMetricsTest_case_036
     * @tc.desc size-metrics: arithmetic on radius and spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_036', 0, () => {
      const left: number = SIZES.radius;
      const right: number = SIZES.spacing;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_037
     * @tc.desc size-metrics: arithmetic on padding and radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_037', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.radius;
      expect(left + right).assertEqual(32);
      expect(left - right).assertEqual(8);
      expect(right - left).assertEqual(-8);
      expect(Math.abs(left - right)).assertEqual(8);
      expect(left * right).assertEqual(240);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_038
     * @tc.desc size-metrics: arithmetic on padding and radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_038', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.radius;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.6667);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(8);
      expect(left * 2 - right).assertEqual(28);
      expect(left + right * 2).assertEqual(44);
      expect((left + right) / 2).assertEqual(16);
    });

    /**
     * @tc.name SizeMetricsTest_case_039
     * @tc.desc size-metrics: arithmetic on padding and radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_039', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.radius;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_040
     * @tc.desc size-metrics: arithmetic on padding and padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_040', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.padding;
      expect(left + right).assertEqual(40);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(400);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_041
     * @tc.desc size-metrics: arithmetic on padding and padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_041', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.padding;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(20);
      expect(left + right * 2).assertEqual(60);
      expect((left + right) / 2).assertEqual(20);
    });

    /**
     * @tc.name SizeMetricsTest_case_042
     * @tc.desc size-metrics: arithmetic on padding and padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_042', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.padding;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(20);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_043
     * @tc.desc size-metrics: arithmetic on padding and fontSizeTitle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_043', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeTitle;
      expect(left + right).assertEqual(42);
      expect(left - right).assertEqual(-2);
      expect(right - left).assertEqual(2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(440);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_044
     * @tc.desc size-metrics: arithmetic on padding and fontSizeTitle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_044', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.9091);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(20);
      expect(left * 2 - right).assertEqual(18);
      expect(left + right * 2).assertEqual(64);
      expect((left + right) / 2).assertEqual(21);
    });

    /**
     * @tc.name SizeMetricsTest_case_045
     * @tc.desc size-metrics: arithmetic on padding and fontSizeTitle, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_045', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(20);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_046
     * @tc.desc size-metrics: arithmetic on padding and fontSizeNormal, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_046', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeNormal;
      expect(left + right).assertEqual(36);
      expect(left - right).assertEqual(4);
      expect(right - left).assertEqual(-4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(320);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_047
     * @tc.desc size-metrics: arithmetic on padding and fontSizeNormal, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_047', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.2500);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(4);
      expect(left * 2 - right).assertEqual(24);
      expect(left + right * 2).assertEqual(52);
      expect((left + right) / 2).assertEqual(18);
    });

    /**
     * @tc.name SizeMetricsTest_case_048
     * @tc.desc size-metrics: arithmetic on padding and fontSizeNormal, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_048', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_049
     * @tc.desc size-metrics: arithmetic on padding and fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_049', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeSmall;
      expect(left + right).assertEqual(34);
      expect(left - right).assertEqual(6);
      expect(right - left).assertEqual(-6);
      expect(Math.abs(left - right)).assertEqual(6);
      expect(left * right).assertEqual(280);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_050
     * @tc.desc size-metrics: arithmetic on padding and fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_050', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.4286);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(6);
      expect(left * 2 - right).assertEqual(26);
      expect(left + right * 2).assertEqual(48);
      expect((left + right) / 2).assertEqual(17);
    });

    /**
     * @tc.name SizeMetricsTest_case_051
     * @tc.desc size-metrics: arithmetic on padding and fontSizeSmall, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_051', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_052
     * @tc.desc size-metrics: arithmetic on padding and spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_052', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.spacing;
      expect(left + right).assertEqual(36);
      expect(left - right).assertEqual(4);
      expect(right - left).assertEqual(-4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(320);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_053
     * @tc.desc size-metrics: arithmetic on padding and spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_053', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.spacing;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.2500);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(4);
      expect(left * 2 - right).assertEqual(24);
      expect(left + right * 2).assertEqual(52);
      expect((left + right) / 2).assertEqual(18);
    });

    /**
     * @tc.name SizeMetricsTest_case_054
     * @tc.desc size-metrics: arithmetic on padding and spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_054', 0, () => {
      const left: number = SIZES.padding;
      const right: number = SIZES.spacing;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_055
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_055', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.radius;
      expect(left + right).assertEqual(34);
      expect(left - right).assertEqual(10);
      expect(right - left).assertEqual(-10);
      expect(Math.abs(left - right)).assertEqual(10);
      expect(left * right).assertEqual(264);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_056
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_056', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.radius;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.8333);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(10);
      expect(left * 2 - right).assertEqual(32);
      expect(left + right * 2).assertEqual(46);
      expect((left + right) / 2).assertEqual(17);
    });

    /**
     * @tc.name SizeMetricsTest_case_057
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_057', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.radius;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_058
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_058', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.padding;
      expect(left + right).assertEqual(42);
      expect(left - right).assertEqual(2);
      expect(right - left).assertEqual(-2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(440);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_059
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_059', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.padding;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.1000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(2);
      expect(left * 2 - right).assertEqual(24);
      expect(left + right * 2).assertEqual(62);
      expect((left + right) / 2).assertEqual(21);
    });

    /**
     * @tc.name SizeMetricsTest_case_060
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_060', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.padding;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(20);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_061
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeTitle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_061', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeTitle;
      expect(left + right).assertEqual(44);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(484);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_062
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeTitle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_062', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(22);
      expect(left + right * 2).assertEqual(66);
      expect((left + right) / 2).assertEqual(22);
    });

    /**
     * @tc.name SizeMetricsTest_case_063
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeTitle, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_063', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(22);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_064
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeNormal, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_064', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeNormal;
      expect(left + right).assertEqual(38);
      expect(left - right).assertEqual(6);
      expect(right - left).assertEqual(-6);
      expect(Math.abs(left - right)).assertEqual(6);
      expect(left * right).assertEqual(352);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_065
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeNormal, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_065', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.3750);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(6);
      expect(left * 2 - right).assertEqual(28);
      expect(left + right * 2).assertEqual(54);
      expect((left + right) / 2).assertEqual(19);
    });

    /**
     * @tc.name SizeMetricsTest_case_066
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeNormal, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_066', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_067
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_067', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeSmall;
      expect(left + right).assertEqual(36);
      expect(left - right).assertEqual(8);
      expect(right - left).assertEqual(-8);
      expect(Math.abs(left - right)).assertEqual(8);
      expect(left * right).assertEqual(308);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_068
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_068', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.5714);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(8);
      expect(left * 2 - right).assertEqual(30);
      expect(left + right * 2).assertEqual(50);
      expect((left + right) / 2).assertEqual(18);
    });

    /**
     * @tc.name SizeMetricsTest_case_069
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and fontSizeSmall, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_069', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_070
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_070', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.spacing;
      expect(left + right).assertEqual(38);
      expect(left - right).assertEqual(6);
      expect(right - left).assertEqual(-6);
      expect(Math.abs(left - right)).assertEqual(6);
      expect(left * right).assertEqual(352);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_071
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_071', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.spacing;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.3750);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(6);
      expect(left * 2 - right).assertEqual(28);
      expect(left + right * 2).assertEqual(54);
      expect((left + right) / 2).assertEqual(19);
    });

    /**
     * @tc.name SizeMetricsTest_case_072
     * @tc.desc size-metrics: arithmetic on fontSizeTitle and spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_072', 0, () => {
      const left: number = SIZES.fontSizeTitle;
      const right: number = SIZES.spacing;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_073
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_073', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.radius;
      expect(left + right).assertEqual(28);
      expect(left - right).assertEqual(4);
      expect(right - left).assertEqual(-4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(192);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_074
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_074', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.radius;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.3333);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(4);
      expect(left * 2 - right).assertEqual(20);
      expect(left + right * 2).assertEqual(40);
      expect((left + right) / 2).assertEqual(14);
    });

    /**
     * @tc.name SizeMetricsTest_case_075
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_075', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.radius;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_076
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_076', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.padding;
      expect(left + right).assertEqual(36);
      expect(left - right).assertEqual(-4);
      expect(right - left).assertEqual(4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(320);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_077
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_077', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.padding;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.8000);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(16);
      expect(left * 2 - right).assertEqual(12);
      expect(left + right * 2).assertEqual(56);
      expect((left + right) / 2).assertEqual(18);
    });

    /**
     * @tc.name SizeMetricsTest_case_078
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_078', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.padding;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_079
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeTitle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_079', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeTitle;
      expect(left + right).assertEqual(38);
      expect(left - right).assertEqual(-6);
      expect(right - left).assertEqual(6);
      expect(Math.abs(left - right)).assertEqual(6);
      expect(left * right).assertEqual(352);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_080
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeTitle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_080', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.7273);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(16);
      expect(left * 2 - right).assertEqual(10);
      expect(left + right * 2).assertEqual(60);
      expect((left + right) / 2).assertEqual(19);
    });

    /**
     * @tc.name SizeMetricsTest_case_081
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeTitle, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_081', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_082
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeNormal, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_082', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeNormal;
      expect(left + right).assertEqual(32);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(256);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_083
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeNormal, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_083', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(16);
      expect(left + right * 2).assertEqual(48);
      expect((left + right) / 2).assertEqual(16);
    });

    /**
     * @tc.name SizeMetricsTest_case_084
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeNormal, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_084', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_085
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_085', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeSmall;
      expect(left + right).assertEqual(30);
      expect(left - right).assertEqual(2);
      expect(right - left).assertEqual(-2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(224);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_086
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_086', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.1429);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(2);
      expect(left * 2 - right).assertEqual(18);
      expect(left + right * 2).assertEqual(44);
      expect((left + right) / 2).assertEqual(15);
    });

    /**
     * @tc.name SizeMetricsTest_case_087
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and fontSizeSmall, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_087', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_088
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_088', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.spacing;
      expect(left + right).assertEqual(32);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(256);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_089
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_089', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.spacing;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(16);
      expect(left + right * 2).assertEqual(48);
      expect((left + right) / 2).assertEqual(16);
    });

    /**
     * @tc.name SizeMetricsTest_case_090
     * @tc.desc size-metrics: arithmetic on fontSizeNormal and spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_090', 0, () => {
      const left: number = SIZES.fontSizeNormal;
      const right: number = SIZES.spacing;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_091
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_091', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.radius;
      expect(left + right).assertEqual(26);
      expect(left - right).assertEqual(2);
      expect(right - left).assertEqual(-2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(168);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_092
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_092', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.radius;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.1667);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(2);
      expect(left * 2 - right).assertEqual(16);
      expect(left + right * 2).assertEqual(38);
      expect((left + right) / 2).assertEqual(13);
    });

    /**
     * @tc.name SizeMetricsTest_case_093
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_093', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.radius;
      expect(Math.max(left, right)).assertEqual(14);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_094
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_094', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.padding;
      expect(left + right).assertEqual(34);
      expect(left - right).assertEqual(-6);
      expect(right - left).assertEqual(6);
      expect(Math.abs(left - right)).assertEqual(6);
      expect(left * right).assertEqual(280);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_095
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_095', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.padding;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.7000);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(14);
      expect(left * 2 - right).assertEqual(8);
      expect(left + right * 2).assertEqual(54);
      expect((left + right) / 2).assertEqual(17);
    });

    /**
     * @tc.name SizeMetricsTest_case_096
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_096', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.padding;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_097
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeTitle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_097', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeTitle;
      expect(left + right).assertEqual(36);
      expect(left - right).assertEqual(-8);
      expect(right - left).assertEqual(8);
      expect(Math.abs(left - right)).assertEqual(8);
      expect(left * right).assertEqual(308);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_098
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeTitle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_098', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.6364);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(14);
      expect(left * 2 - right).assertEqual(6);
      expect(left + right * 2).assertEqual(58);
      expect((left + right) / 2).assertEqual(18);
    });

    /**
     * @tc.name SizeMetricsTest_case_099
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeTitle, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_099', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_100
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeNormal, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_100', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeNormal;
      expect(left + right).assertEqual(30);
      expect(left - right).assertEqual(-2);
      expect(right - left).assertEqual(2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(224);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_101
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeNormal, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_101', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.8750);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(14);
      expect(left * 2 - right).assertEqual(12);
      expect(left + right * 2).assertEqual(46);
      expect((left + right) / 2).assertEqual(15);
    });

    /**
     * @tc.name SizeMetricsTest_case_102
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeNormal, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_102', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_103
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_103', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeSmall;
      expect(left + right).assertEqual(28);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(196);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_104
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_104', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(14);
      expect(left + right * 2).assertEqual(42);
      expect((left + right) / 2).assertEqual(14);
    });

    /**
     * @tc.name SizeMetricsTest_case_105
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and fontSizeSmall, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_105', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.max(left, right)).assertEqual(14);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_106
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_106', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.spacing;
      expect(left + right).assertEqual(30);
      expect(left - right).assertEqual(-2);
      expect(right - left).assertEqual(2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(224);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_107
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_107', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.spacing;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.8750);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(14);
      expect(left * 2 - right).assertEqual(12);
      expect(left + right * 2).assertEqual(46);
      expect((left + right) / 2).assertEqual(15);
    });

    /**
     * @tc.name SizeMetricsTest_case_108
     * @tc.desc size-metrics: arithmetic on fontSizeSmall and spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_108', 0, () => {
      const left: number = SIZES.fontSizeSmall;
      const right: number = SIZES.spacing;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_109
     * @tc.desc size-metrics: arithmetic on spacing and radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_109', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.radius;
      expect(left + right).assertEqual(28);
      expect(left - right).assertEqual(4);
      expect(right - left).assertEqual(-4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(192);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_110
     * @tc.desc size-metrics: arithmetic on spacing and radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_110', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.radius;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.3333);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(4);
      expect(left * 2 - right).assertEqual(20);
      expect(left + right * 2).assertEqual(40);
      expect((left + right) / 2).assertEqual(14);
    });

    /**
     * @tc.name SizeMetricsTest_case_111
     * @tc.desc size-metrics: arithmetic on spacing and radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_111', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.radius;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(12);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_112
     * @tc.desc size-metrics: arithmetic on spacing and padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_112', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.padding;
      expect(left + right).assertEqual(36);
      expect(left - right).assertEqual(-4);
      expect(right - left).assertEqual(4);
      expect(Math.abs(left - right)).assertEqual(4);
      expect(left * right).assertEqual(320);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_113
     * @tc.desc size-metrics: arithmetic on spacing and padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_113', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.padding;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.8000);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(16);
      expect(left * 2 - right).assertEqual(12);
      expect(left + right * 2).assertEqual(56);
      expect((left + right) / 2).assertEqual(18);
    });

    /**
     * @tc.name SizeMetricsTest_case_114
     * @tc.desc size-metrics: arithmetic on spacing and padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_114', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.padding;
      expect(Math.max(left, right)).assertEqual(20);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_115
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeTitle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_115', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeTitle;
      expect(left + right).assertEqual(38);
      expect(left - right).assertEqual(-6);
      expect(right - left).assertEqual(6);
      expect(Math.abs(left - right)).assertEqual(6);
      expect(left * right).assertEqual(352);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_116
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeTitle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_116', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(0.7273);
      expect(Math.floor(left / right)).assertEqual(0);
      expect(left % right).assertEqual(16);
      expect(left * 2 - right).assertEqual(10);
      expect(left + right * 2).assertEqual(60);
      expect((left + right) / 2).assertEqual(19);
    });

    /**
     * @tc.name SizeMetricsTest_case_117
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeTitle, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_117', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeTitle;
      expect(Math.max(left, right)).assertEqual(22);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(false);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_118
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeNormal, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_118', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeNormal;
      expect(left + right).assertEqual(32);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(256);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_119
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeNormal, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_119', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(16);
      expect(left + right * 2).assertEqual(48);
      expect((left + right) / 2).assertEqual(16);
    });

    /**
     * @tc.name SizeMetricsTest_case_120
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeNormal, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_120', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeNormal;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_121
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_121', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeSmall;
      expect(left + right).assertEqual(30);
      expect(left - right).assertEqual(2);
      expect(right - left).assertEqual(-2);
      expect(Math.abs(left - right)).assertEqual(2);
      expect(left * right).assertEqual(224);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_122
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_122', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.1429);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(2);
      expect(left * 2 - right).assertEqual(18);
      expect(left + right * 2).assertEqual(44);
      expect((left + right) / 2).assertEqual(15);
    });

    /**
     * @tc.name SizeMetricsTest_case_123
     * @tc.desc size-metrics: arithmetic on spacing and fontSizeSmall, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_123', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.fontSizeSmall;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(14);
      expect(left <= right).assertEqual(false);
      expect(left === right).assertEqual(false);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(true);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_124
     * @tc.desc size-metrics: arithmetic on spacing and spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_124', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.spacing;
      expect(left + right).assertEqual(32);
      expect(left - right).assertEqual(0);
      expect(right - left).assertEqual(0);
      expect(Math.abs(left - right)).assertEqual(0);
      expect(left * right).assertEqual(256);
      expect(left + right === right + left).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_125
     * @tc.desc size-metrics: arithmetic on spacing and spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_125', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.spacing;
      expect(Math.round((left / right) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.floor(left / right)).assertEqual(1);
      expect(left % right).assertEqual(0);
      expect(left * 2 - right).assertEqual(16);
      expect(left + right * 2).assertEqual(48);
      expect((left + right) / 2).assertEqual(16);
    });

    /**
     * @tc.name SizeMetricsTest_case_126
     * @tc.desc size-metrics: arithmetic on spacing and spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_126', 0, () => {
      const left: number = SIZES.spacing;
      const right: number = SIZES.spacing;
      expect(Math.max(left, right)).assertEqual(16);
      expect(Math.min(left, right)).assertEqual(16);
      expect(left <= right).assertEqual(true);
      expect(left === right).assertEqual(true);
      expect(left >= right).assertEqual(true);
      expect((left !== right)).assertEqual(false);
      expect(left + right > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_127
     * @tc.desc size-metrics: triple combination (radius, radius, radius).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_127', 0, () => {
      expect(SIZES.radius + SIZES.radius + SIZES.radius).assertEqual(36);
      expect(Math.max(SIZES.radius, Math.max(SIZES.radius, SIZES.radius))).assertEqual(12);
      expect(Math.min(SIZES.radius, Math.min(SIZES.radius, SIZES.radius))).assertEqual(12);
      expect(SIZES.radius * SIZES.radius - SIZES.radius).assertEqual(132);
      expect(SIZES.radius + SIZES.radius * SIZES.radius).assertEqual(156);
      expect(SIZES.radius > 0 && SIZES.radius > 0 && SIZES.radius > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_128
     * @tc.desc size-metrics: triple combination (radius, radius, padding).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_128', 0, () => {
      expect(SIZES.radius + SIZES.radius + SIZES.padding).assertEqual(44);
      expect(Math.max(SIZES.radius, Math.max(SIZES.radius, SIZES.padding))).assertEqual(20);
      expect(Math.min(SIZES.radius, Math.min(SIZES.radius, SIZES.padding))).assertEqual(12);
      expect(SIZES.radius * SIZES.radius - SIZES.padding).assertEqual(124);
      expect(SIZES.radius + SIZES.radius * SIZES.padding).assertEqual(252);
      expect(SIZES.radius > 0 && SIZES.radius > 0 && SIZES.padding > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_129
     * @tc.desc size-metrics: triple combination (radius, radius, fontSizeTitle).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_129', 0, () => {
      expect(SIZES.radius + SIZES.radius + SIZES.fontSizeTitle).assertEqual(46);
      expect(Math.max(SIZES.radius, Math.max(SIZES.radius, SIZES.fontSizeTitle))).assertEqual(22);
      expect(Math.min(SIZES.radius, Math.min(SIZES.radius, SIZES.fontSizeTitle))).assertEqual(12);
      expect(SIZES.radius * SIZES.radius - SIZES.fontSizeTitle).assertEqual(122);
      expect(SIZES.radius + SIZES.radius * SIZES.fontSizeTitle).assertEqual(276);
      expect(SIZES.radius > 0 && SIZES.radius > 0 && SIZES.fontSizeTitle > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_130
     * @tc.desc size-metrics: triple combination (radius, radius, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_130', 0, () => {
      expect(SIZES.radius + SIZES.radius + SIZES.fontSizeNormal).assertEqual(40);
      expect(Math.max(SIZES.radius, Math.max(SIZES.radius, SIZES.fontSizeNormal))).assertEqual(16);
      expect(Math.min(SIZES.radius, Math.min(SIZES.radius, SIZES.fontSizeNormal))).assertEqual(12);
      expect(SIZES.radius * SIZES.radius - SIZES.fontSizeNormal).assertEqual(128);
      expect(SIZES.radius + SIZES.radius * SIZES.fontSizeNormal).assertEqual(204);
      expect(SIZES.radius > 0 && SIZES.radius > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_131
     * @tc.desc size-metrics: triple combination (radius, radius, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_131', 0, () => {
      expect(SIZES.radius + SIZES.radius + SIZES.fontSizeSmall).assertEqual(38);
      expect(Math.max(SIZES.radius, Math.max(SIZES.radius, SIZES.fontSizeSmall))).assertEqual(14);
      expect(Math.min(SIZES.radius, Math.min(SIZES.radius, SIZES.fontSizeSmall))).assertEqual(12);
      expect(SIZES.radius * SIZES.radius - SIZES.fontSizeSmall).assertEqual(130);
      expect(SIZES.radius + SIZES.radius * SIZES.fontSizeSmall).assertEqual(180);
      expect(SIZES.radius > 0 && SIZES.radius > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_132
     * @tc.desc size-metrics: triple combination (radius, radius, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_132', 0, () => {
      expect(SIZES.radius + SIZES.radius + SIZES.spacing).assertEqual(40);
      expect(Math.max(SIZES.radius, Math.max(SIZES.radius, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.radius, Math.min(SIZES.radius, SIZES.spacing))).assertEqual(12);
      expect(SIZES.radius * SIZES.radius - SIZES.spacing).assertEqual(128);
      expect(SIZES.radius + SIZES.radius * SIZES.spacing).assertEqual(204);
      expect(SIZES.radius > 0 && SIZES.radius > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_133
     * @tc.desc size-metrics: triple combination (radius, padding, padding).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_133', 0, () => {
      expect(SIZES.radius + SIZES.padding + SIZES.padding).assertEqual(52);
      expect(Math.max(SIZES.radius, Math.max(SIZES.padding, SIZES.padding))).assertEqual(20);
      expect(Math.min(SIZES.radius, Math.min(SIZES.padding, SIZES.padding))).assertEqual(12);
      expect(SIZES.radius * SIZES.padding - SIZES.padding).assertEqual(220);
      expect(SIZES.radius + SIZES.padding * SIZES.padding).assertEqual(412);
      expect(SIZES.radius > 0 && SIZES.padding > 0 && SIZES.padding > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_134
     * @tc.desc size-metrics: triple combination (radius, padding, fontSizeTitle).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_134', 0, () => {
      expect(SIZES.radius + SIZES.padding + SIZES.fontSizeTitle).assertEqual(54);
      expect(Math.max(SIZES.radius, Math.max(SIZES.padding, SIZES.fontSizeTitle))).assertEqual(22);
      expect(Math.min(SIZES.radius, Math.min(SIZES.padding, SIZES.fontSizeTitle))).assertEqual(12);
      expect(SIZES.radius * SIZES.padding - SIZES.fontSizeTitle).assertEqual(218);
      expect(SIZES.radius + SIZES.padding * SIZES.fontSizeTitle).assertEqual(452);
      expect(SIZES.radius > 0 && SIZES.padding > 0 && SIZES.fontSizeTitle > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_135
     * @tc.desc size-metrics: triple combination (radius, padding, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_135', 0, () => {
      expect(SIZES.radius + SIZES.padding + SIZES.fontSizeNormal).assertEqual(48);
      expect(Math.max(SIZES.radius, Math.max(SIZES.padding, SIZES.fontSizeNormal))).assertEqual(20);
      expect(Math.min(SIZES.radius, Math.min(SIZES.padding, SIZES.fontSizeNormal))).assertEqual(12);
      expect(SIZES.radius * SIZES.padding - SIZES.fontSizeNormal).assertEqual(224);
      expect(SIZES.radius + SIZES.padding * SIZES.fontSizeNormal).assertEqual(332);
      expect(SIZES.radius > 0 && SIZES.padding > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_136
     * @tc.desc size-metrics: triple combination (radius, padding, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_136', 0, () => {
      expect(SIZES.radius + SIZES.padding + SIZES.fontSizeSmall).assertEqual(46);
      expect(Math.max(SIZES.radius, Math.max(SIZES.padding, SIZES.fontSizeSmall))).assertEqual(20);
      expect(Math.min(SIZES.radius, Math.min(SIZES.padding, SIZES.fontSizeSmall))).assertEqual(12);
      expect(SIZES.radius * SIZES.padding - SIZES.fontSizeSmall).assertEqual(226);
      expect(SIZES.radius + SIZES.padding * SIZES.fontSizeSmall).assertEqual(292);
      expect(SIZES.radius > 0 && SIZES.padding > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_137
     * @tc.desc size-metrics: triple combination (radius, padding, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_137', 0, () => {
      expect(SIZES.radius + SIZES.padding + SIZES.spacing).assertEqual(48);
      expect(Math.max(SIZES.radius, Math.max(SIZES.padding, SIZES.spacing))).assertEqual(20);
      expect(Math.min(SIZES.radius, Math.min(SIZES.padding, SIZES.spacing))).assertEqual(12);
      expect(SIZES.radius * SIZES.padding - SIZES.spacing).assertEqual(224);
      expect(SIZES.radius + SIZES.padding * SIZES.spacing).assertEqual(332);
      expect(SIZES.radius > 0 && SIZES.padding > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_138
     * @tc.desc size-metrics: triple combination (radius, fontSizeTitle, fontSizeTitle).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_138', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeTitle + SIZES.fontSizeTitle).assertEqual(56);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeTitle))).assertEqual(22);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeTitle))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeTitle - SIZES.fontSizeTitle).assertEqual(242);
      expect(SIZES.radius + SIZES.fontSizeTitle * SIZES.fontSizeTitle).assertEqual(496);
      expect(SIZES.radius > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeTitle > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_139
     * @tc.desc size-metrics: triple combination (radius, fontSizeTitle, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_139', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeTitle + SIZES.fontSizeNormal).assertEqual(50);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeNormal))).assertEqual(22);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeNormal))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeTitle - SIZES.fontSizeNormal).assertEqual(248);
      expect(SIZES.radius + SIZES.fontSizeTitle * SIZES.fontSizeNormal).assertEqual(364);
      expect(SIZES.radius > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_140
     * @tc.desc size-metrics: triple combination (radius, fontSizeTitle, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_140', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeTitle + SIZES.fontSizeSmall).assertEqual(48);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeSmall))).assertEqual(22);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeSmall))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeTitle - SIZES.fontSizeSmall).assertEqual(250);
      expect(SIZES.radius + SIZES.fontSizeTitle * SIZES.fontSizeSmall).assertEqual(320);
      expect(SIZES.radius > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_141
     * @tc.desc size-metrics: triple combination (radius, fontSizeTitle, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_141', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeTitle + SIZES.spacing).assertEqual(50);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeTitle, SIZES.spacing))).assertEqual(22);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeTitle, SIZES.spacing))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeTitle - SIZES.spacing).assertEqual(248);
      expect(SIZES.radius + SIZES.fontSizeTitle * SIZES.spacing).assertEqual(364);
      expect(SIZES.radius > 0 && SIZES.fontSizeTitle > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_142
     * @tc.desc size-metrics: triple combination (radius, fontSizeNormal, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_142', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeNormal + SIZES.fontSizeNormal).assertEqual(44);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(16);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeNormal - SIZES.fontSizeNormal).assertEqual(176);
      expect(SIZES.radius + SIZES.fontSizeNormal * SIZES.fontSizeNormal).assertEqual(268);
      expect(SIZES.radius > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_143
     * @tc.desc size-metrics: triple combination (radius, fontSizeNormal, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_143', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeNormal + SIZES.fontSizeSmall).assertEqual(42);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(16);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeNormal - SIZES.fontSizeSmall).assertEqual(178);
      expect(SIZES.radius + SIZES.fontSizeNormal * SIZES.fontSizeSmall).assertEqual(236);
      expect(SIZES.radius > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_144
     * @tc.desc size-metrics: triple combination (radius, fontSizeNormal, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_144', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeNormal + SIZES.spacing).assertEqual(44);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeNormal - SIZES.spacing).assertEqual(176);
      expect(SIZES.radius + SIZES.fontSizeNormal * SIZES.spacing).assertEqual(268);
      expect(SIZES.radius > 0 && SIZES.fontSizeNormal > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_145
     * @tc.desc size-metrics: triple combination (radius, fontSizeSmall, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_145', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeSmall + SIZES.fontSizeSmall).assertEqual(40);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(14);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeSmall - SIZES.fontSizeSmall).assertEqual(154);
      expect(SIZES.radius + SIZES.fontSizeSmall * SIZES.fontSizeSmall).assertEqual(208);
      expect(SIZES.radius > 0 && SIZES.fontSizeSmall > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_146
     * @tc.desc size-metrics: triple combination (radius, fontSizeSmall, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_146', 0, () => {
      expect(SIZES.radius + SIZES.fontSizeSmall + SIZES.spacing).assertEqual(42);
      expect(Math.max(SIZES.radius, Math.max(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.radius, Math.min(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(12);
      expect(SIZES.radius * SIZES.fontSizeSmall - SIZES.spacing).assertEqual(152);
      expect(SIZES.radius + SIZES.fontSizeSmall * SIZES.spacing).assertEqual(236);
      expect(SIZES.radius > 0 && SIZES.fontSizeSmall > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_147
     * @tc.desc size-metrics: triple combination (radius, spacing, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_147', 0, () => {
      expect(SIZES.radius + SIZES.spacing + SIZES.spacing).assertEqual(44);
      expect(Math.max(SIZES.radius, Math.max(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.radius, Math.min(SIZES.spacing, SIZES.spacing))).assertEqual(12);
      expect(SIZES.radius * SIZES.spacing - SIZES.spacing).assertEqual(176);
      expect(SIZES.radius + SIZES.spacing * SIZES.spacing).assertEqual(268);
      expect(SIZES.radius > 0 && SIZES.spacing > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_148
     * @tc.desc size-metrics: triple combination (padding, padding, padding).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_148', 0, () => {
      expect(SIZES.padding + SIZES.padding + SIZES.padding).assertEqual(60);
      expect(Math.max(SIZES.padding, Math.max(SIZES.padding, SIZES.padding))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.padding, SIZES.padding))).assertEqual(20);
      expect(SIZES.padding * SIZES.padding - SIZES.padding).assertEqual(380);
      expect(SIZES.padding + SIZES.padding * SIZES.padding).assertEqual(420);
      expect(SIZES.padding > 0 && SIZES.padding > 0 && SIZES.padding > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_149
     * @tc.desc size-metrics: triple combination (padding, padding, fontSizeTitle).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_149', 0, () => {
      expect(SIZES.padding + SIZES.padding + SIZES.fontSizeTitle).assertEqual(62);
      expect(Math.max(SIZES.padding, Math.max(SIZES.padding, SIZES.fontSizeTitle))).assertEqual(22);
      expect(Math.min(SIZES.padding, Math.min(SIZES.padding, SIZES.fontSizeTitle))).assertEqual(20);
      expect(SIZES.padding * SIZES.padding - SIZES.fontSizeTitle).assertEqual(378);
      expect(SIZES.padding + SIZES.padding * SIZES.fontSizeTitle).assertEqual(460);
      expect(SIZES.padding > 0 && SIZES.padding > 0 && SIZES.fontSizeTitle > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_150
     * @tc.desc size-metrics: triple combination (padding, padding, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_150', 0, () => {
      expect(SIZES.padding + SIZES.padding + SIZES.fontSizeNormal).assertEqual(56);
      expect(Math.max(SIZES.padding, Math.max(SIZES.padding, SIZES.fontSizeNormal))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.padding, SIZES.fontSizeNormal))).assertEqual(16);
      expect(SIZES.padding * SIZES.padding - SIZES.fontSizeNormal).assertEqual(384);
      expect(SIZES.padding + SIZES.padding * SIZES.fontSizeNormal).assertEqual(340);
      expect(SIZES.padding > 0 && SIZES.padding > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_151
     * @tc.desc size-metrics: triple combination (padding, padding, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_151', 0, () => {
      expect(SIZES.padding + SIZES.padding + SIZES.fontSizeSmall).assertEqual(54);
      expect(Math.max(SIZES.padding, Math.max(SIZES.padding, SIZES.fontSizeSmall))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.padding, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.padding * SIZES.padding - SIZES.fontSizeSmall).assertEqual(386);
      expect(SIZES.padding + SIZES.padding * SIZES.fontSizeSmall).assertEqual(300);
      expect(SIZES.padding > 0 && SIZES.padding > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_152
     * @tc.desc size-metrics: triple combination (padding, padding, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_152', 0, () => {
      expect(SIZES.padding + SIZES.padding + SIZES.spacing).assertEqual(56);
      expect(Math.max(SIZES.padding, Math.max(SIZES.padding, SIZES.spacing))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.padding, SIZES.spacing))).assertEqual(16);
      expect(SIZES.padding * SIZES.padding - SIZES.spacing).assertEqual(384);
      expect(SIZES.padding + SIZES.padding * SIZES.spacing).assertEqual(340);
      expect(SIZES.padding > 0 && SIZES.padding > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_153
     * @tc.desc size-metrics: triple combination (padding, fontSizeTitle, fontSizeTitle).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_153', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeTitle + SIZES.fontSizeTitle).assertEqual(64);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeTitle))).assertEqual(22);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeTitle))).assertEqual(20);
      expect(SIZES.padding * SIZES.fontSizeTitle - SIZES.fontSizeTitle).assertEqual(418);
      expect(SIZES.padding + SIZES.fontSizeTitle * SIZES.fontSizeTitle).assertEqual(504);
      expect(SIZES.padding > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeTitle > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_154
     * @tc.desc size-metrics: triple combination (padding, fontSizeTitle, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_154', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeTitle + SIZES.fontSizeNormal).assertEqual(58);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeNormal))).assertEqual(22);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeNormal))).assertEqual(16);
      expect(SIZES.padding * SIZES.fontSizeTitle - SIZES.fontSizeNormal).assertEqual(424);
      expect(SIZES.padding + SIZES.fontSizeTitle * SIZES.fontSizeNormal).assertEqual(372);
      expect(SIZES.padding > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_155
     * @tc.desc size-metrics: triple combination (padding, fontSizeTitle, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_155', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeTitle + SIZES.fontSizeSmall).assertEqual(56);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeSmall))).assertEqual(22);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.padding * SIZES.fontSizeTitle - SIZES.fontSizeSmall).assertEqual(426);
      expect(SIZES.padding + SIZES.fontSizeTitle * SIZES.fontSizeSmall).assertEqual(328);
      expect(SIZES.padding > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_156
     * @tc.desc size-metrics: triple combination (padding, fontSizeTitle, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_156', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeTitle + SIZES.spacing).assertEqual(58);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeTitle, SIZES.spacing))).assertEqual(22);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeTitle, SIZES.spacing))).assertEqual(16);
      expect(SIZES.padding * SIZES.fontSizeTitle - SIZES.spacing).assertEqual(424);
      expect(SIZES.padding + SIZES.fontSizeTitle * SIZES.spacing).assertEqual(372);
      expect(SIZES.padding > 0 && SIZES.fontSizeTitle > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_157
     * @tc.desc size-metrics: triple combination (padding, fontSizeNormal, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_157', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeNormal + SIZES.fontSizeNormal).assertEqual(52);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(16);
      expect(SIZES.padding * SIZES.fontSizeNormal - SIZES.fontSizeNormal).assertEqual(304);
      expect(SIZES.padding + SIZES.fontSizeNormal * SIZES.fontSizeNormal).assertEqual(276);
      expect(SIZES.padding > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_158
     * @tc.desc size-metrics: triple combination (padding, fontSizeNormal, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_158', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeNormal + SIZES.fontSizeSmall).assertEqual(50);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.padding * SIZES.fontSizeNormal - SIZES.fontSizeSmall).assertEqual(306);
      expect(SIZES.padding + SIZES.fontSizeNormal * SIZES.fontSizeSmall).assertEqual(244);
      expect(SIZES.padding > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_159
     * @tc.desc size-metrics: triple combination (padding, fontSizeNormal, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_159', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeNormal + SIZES.spacing).assertEqual(52);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(16);
      expect(SIZES.padding * SIZES.fontSizeNormal - SIZES.spacing).assertEqual(304);
      expect(SIZES.padding + SIZES.fontSizeNormal * SIZES.spacing).assertEqual(276);
      expect(SIZES.padding > 0 && SIZES.fontSizeNormal > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_160
     * @tc.desc size-metrics: triple combination (padding, fontSizeSmall, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_160', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeSmall + SIZES.fontSizeSmall).assertEqual(48);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.padding * SIZES.fontSizeSmall - SIZES.fontSizeSmall).assertEqual(266);
      expect(SIZES.padding + SIZES.fontSizeSmall * SIZES.fontSizeSmall).assertEqual(216);
      expect(SIZES.padding > 0 && SIZES.fontSizeSmall > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_161
     * @tc.desc size-metrics: triple combination (padding, fontSizeSmall, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_161', 0, () => {
      expect(SIZES.padding + SIZES.fontSizeSmall + SIZES.spacing).assertEqual(50);
      expect(Math.max(SIZES.padding, Math.max(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(14);
      expect(SIZES.padding * SIZES.fontSizeSmall - SIZES.spacing).assertEqual(264);
      expect(SIZES.padding + SIZES.fontSizeSmall * SIZES.spacing).assertEqual(244);
      expect(SIZES.padding > 0 && SIZES.fontSizeSmall > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_162
     * @tc.desc size-metrics: triple combination (padding, spacing, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_162', 0, () => {
      expect(SIZES.padding + SIZES.spacing + SIZES.spacing).assertEqual(52);
      expect(Math.max(SIZES.padding, Math.max(SIZES.spacing, SIZES.spacing))).assertEqual(20);
      expect(Math.min(SIZES.padding, Math.min(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(SIZES.padding * SIZES.spacing - SIZES.spacing).assertEqual(304);
      expect(SIZES.padding + SIZES.spacing * SIZES.spacing).assertEqual(276);
      expect(SIZES.padding > 0 && SIZES.spacing > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_163
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeTitle, fontSizeTitle).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_163', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle + SIZES.fontSizeTitle).assertEqual(66);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeTitle))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeTitle))).assertEqual(22);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeTitle - SIZES.fontSizeTitle).assertEqual(462);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle * SIZES.fontSizeTitle).assertEqual(506);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeTitle > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_164
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeTitle, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_164', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle + SIZES.fontSizeNormal).assertEqual(60);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeNormal))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeNormal))).assertEqual(16);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeTitle - SIZES.fontSizeNormal).assertEqual(468);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle * SIZES.fontSizeNormal).assertEqual(374);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_165
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeTitle, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_165', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle + SIZES.fontSizeSmall).assertEqual(58);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeTitle, SIZES.fontSizeSmall))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeTitle, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeTitle - SIZES.fontSizeSmall).assertEqual(470);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle * SIZES.fontSizeSmall).assertEqual(330);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeTitle > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_166
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeTitle, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_166', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle + SIZES.spacing).assertEqual(60);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeTitle, SIZES.spacing))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeTitle, SIZES.spacing))).assertEqual(16);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeTitle - SIZES.spacing).assertEqual(468);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle * SIZES.spacing).assertEqual(374);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeTitle > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_167
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeNormal, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_167', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeNormal + SIZES.fontSizeNormal).assertEqual(54);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(16);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeNormal - SIZES.fontSizeNormal).assertEqual(336);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeNormal * SIZES.fontSizeNormal).assertEqual(278);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_168
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeNormal, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_168', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeNormal + SIZES.fontSizeSmall).assertEqual(52);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeNormal - SIZES.fontSizeSmall).assertEqual(338);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeNormal * SIZES.fontSizeSmall).assertEqual(246);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_169
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeNormal, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_169', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeNormal + SIZES.spacing).assertEqual(54);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(16);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeNormal - SIZES.spacing).assertEqual(336);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeNormal * SIZES.spacing).assertEqual(278);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeNormal > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_170
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeSmall, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_170', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeSmall + SIZES.fontSizeSmall).assertEqual(50);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeSmall - SIZES.fontSizeSmall).assertEqual(294);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeSmall * SIZES.fontSizeSmall).assertEqual(218);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeSmall > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_171
     * @tc.desc size-metrics: triple combination (fontSizeTitle, fontSizeSmall, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_171', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.fontSizeSmall + SIZES.spacing).assertEqual(52);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(14);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeSmall - SIZES.spacing).assertEqual(292);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeSmall * SIZES.spacing).assertEqual(246);
      expect(SIZES.fontSizeTitle > 0 && SIZES.fontSizeSmall > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_172
     * @tc.desc size-metrics: triple combination (fontSizeTitle, spacing, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_172', 0, () => {
      expect(SIZES.fontSizeTitle + SIZES.spacing + SIZES.spacing).assertEqual(54);
      expect(Math.max(SIZES.fontSizeTitle, Math.max(SIZES.spacing, SIZES.spacing))).assertEqual(22);
      expect(Math.min(SIZES.fontSizeTitle, Math.min(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(SIZES.fontSizeTitle * SIZES.spacing - SIZES.spacing).assertEqual(336);
      expect(SIZES.fontSizeTitle + SIZES.spacing * SIZES.spacing).assertEqual(278);
      expect(SIZES.fontSizeTitle > 0 && SIZES.spacing > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_173
     * @tc.desc size-metrics: triple combination (fontSizeNormal, fontSizeNormal, fontSizeNormal).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_173', 0, () => {
      expect(SIZES.fontSizeNormal + SIZES.fontSizeNormal + SIZES.fontSizeNormal).assertEqual(48);
      expect(Math.max(SIZES.fontSizeNormal, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeNormal, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeNormal))).assertEqual(16);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeNormal - SIZES.fontSizeNormal).assertEqual(240);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeNormal * SIZES.fontSizeNormal).assertEqual(272);
      expect(SIZES.fontSizeNormal > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeNormal > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_174
     * @tc.desc size-metrics: triple combination (fontSizeNormal, fontSizeNormal, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_174', 0, () => {
      expect(SIZES.fontSizeNormal + SIZES.fontSizeNormal + SIZES.fontSizeSmall).assertEqual(46);
      expect(Math.max(SIZES.fontSizeNormal, Math.max(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeNormal, Math.min(SIZES.fontSizeNormal, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeNormal - SIZES.fontSizeSmall).assertEqual(242);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeNormal * SIZES.fontSizeSmall).assertEqual(240);
      expect(SIZES.fontSizeNormal > 0 && SIZES.fontSizeNormal > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_175
     * @tc.desc size-metrics: triple combination (fontSizeNormal, fontSizeNormal, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_175', 0, () => {
      expect(SIZES.fontSizeNormal + SIZES.fontSizeNormal + SIZES.spacing).assertEqual(48);
      expect(Math.max(SIZES.fontSizeNormal, Math.max(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeNormal, Math.min(SIZES.fontSizeNormal, SIZES.spacing))).assertEqual(16);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeNormal - SIZES.spacing).assertEqual(240);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeNormal * SIZES.spacing).assertEqual(272);
      expect(SIZES.fontSizeNormal > 0 && SIZES.fontSizeNormal > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_176
     * @tc.desc size-metrics: triple combination (fontSizeNormal, fontSizeSmall, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_176', 0, () => {
      expect(SIZES.fontSizeNormal + SIZES.fontSizeSmall + SIZES.fontSizeSmall).assertEqual(44);
      expect(Math.max(SIZES.fontSizeNormal, Math.max(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeNormal, Math.min(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeSmall - SIZES.fontSizeSmall).assertEqual(210);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeSmall * SIZES.fontSizeSmall).assertEqual(212);
      expect(SIZES.fontSizeNormal > 0 && SIZES.fontSizeSmall > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_177
     * @tc.desc size-metrics: triple combination (fontSizeNormal, fontSizeSmall, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_177', 0, () => {
      expect(SIZES.fontSizeNormal + SIZES.fontSizeSmall + SIZES.spacing).assertEqual(46);
      expect(Math.max(SIZES.fontSizeNormal, Math.max(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeNormal, Math.min(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(14);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeSmall - SIZES.spacing).assertEqual(208);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeSmall * SIZES.spacing).assertEqual(240);
      expect(SIZES.fontSizeNormal > 0 && SIZES.fontSizeSmall > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_178
     * @tc.desc size-metrics: triple combination (fontSizeNormal, spacing, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_178', 0, () => {
      expect(SIZES.fontSizeNormal + SIZES.spacing + SIZES.spacing).assertEqual(48);
      expect(Math.max(SIZES.fontSizeNormal, Math.max(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeNormal, Math.min(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(SIZES.fontSizeNormal * SIZES.spacing - SIZES.spacing).assertEqual(240);
      expect(SIZES.fontSizeNormal + SIZES.spacing * SIZES.spacing).assertEqual(272);
      expect(SIZES.fontSizeNormal > 0 && SIZES.spacing > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_179
     * @tc.desc size-metrics: triple combination (fontSizeSmall, fontSizeSmall, fontSizeSmall).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_179', 0, () => {
      expect(SIZES.fontSizeSmall + SIZES.fontSizeSmall + SIZES.fontSizeSmall).assertEqual(42);
      expect(Math.max(SIZES.fontSizeSmall, Math.max(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(14);
      expect(Math.min(SIZES.fontSizeSmall, Math.min(SIZES.fontSizeSmall, SIZES.fontSizeSmall))).assertEqual(14);
      expect(SIZES.fontSizeSmall * SIZES.fontSizeSmall - SIZES.fontSizeSmall).assertEqual(182);
      expect(SIZES.fontSizeSmall + SIZES.fontSizeSmall * SIZES.fontSizeSmall).assertEqual(210);
      expect(SIZES.fontSizeSmall > 0 && SIZES.fontSizeSmall > 0 && SIZES.fontSizeSmall > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_180
     * @tc.desc size-metrics: triple combination (fontSizeSmall, fontSizeSmall, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_180', 0, () => {
      expect(SIZES.fontSizeSmall + SIZES.fontSizeSmall + SIZES.spacing).assertEqual(44);
      expect(Math.max(SIZES.fontSizeSmall, Math.max(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeSmall, Math.min(SIZES.fontSizeSmall, SIZES.spacing))).assertEqual(14);
      expect(SIZES.fontSizeSmall * SIZES.fontSizeSmall - SIZES.spacing).assertEqual(180);
      expect(SIZES.fontSizeSmall + SIZES.fontSizeSmall * SIZES.spacing).assertEqual(238);
      expect(SIZES.fontSizeSmall > 0 && SIZES.fontSizeSmall > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_181
     * @tc.desc size-metrics: triple combination (fontSizeSmall, spacing, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_181', 0, () => {
      expect(SIZES.fontSizeSmall + SIZES.spacing + SIZES.spacing).assertEqual(46);
      expect(Math.max(SIZES.fontSizeSmall, Math.max(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.fontSizeSmall, Math.min(SIZES.spacing, SIZES.spacing))).assertEqual(14);
      expect(SIZES.fontSizeSmall * SIZES.spacing - SIZES.spacing).assertEqual(208);
      expect(SIZES.fontSizeSmall + SIZES.spacing * SIZES.spacing).assertEqual(270);
      expect(SIZES.fontSizeSmall > 0 && SIZES.spacing > 0 && SIZES.spacing > 0).assertTrue();
    });

    /**
     * @tc.name SizeMetricsTest_case_182
     * @tc.desc size-metrics: triple combination (spacing, spacing, spacing).
     * @tc.type Function
     * @tc.level Level1
     */
    it('SizeMetricsTest_case_182', 0, () => {
      expect(SIZES.spacing + SIZES.spacing + SIZES.spacing).assertEqual(48);
      expect(Math.max(SIZES.spacing, Math.max(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(Math.min(SIZES.spacing, Math.min(SIZES.spacing, SIZES.spacing))).assertEqual(16);
      expect(SIZES.spacing * SIZES.spacing - SIZES.spacing).assertEqual(240);
      expect(SIZES.spacing + SIZES.spacing * SIZES.spacing).assertEqual(272);
      expect(SIZES.spacing > 0 && SIZES.spacing > 0 && SIZES.spacing > 0).assertTrue();
    });

  });
}
