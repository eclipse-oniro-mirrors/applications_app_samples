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

  });
}
