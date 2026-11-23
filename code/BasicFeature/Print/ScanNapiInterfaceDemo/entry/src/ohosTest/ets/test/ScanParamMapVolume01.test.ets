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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { scan } from '@kit.BasicServicesKit';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { ScanOptionConstraint, ScanConstraintKind } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanOptionModel } from '../../../main/ets/scan/model/ScanOptionViewModel';
import { ScanOptionValueParser } from '../../../main/ets/scan/model/ScanOptionValueParser';
import { ScanDeviceFilter } from '../../../main/ets/scan/model/ScanDeviceFilter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanParamMapVolume01Test() {
  describe('ScanParamMap', () => {

    /**
     * @tc.name   testParamMap010001
     * @tc.number SUB_SCAN_PARAM_01_0001
     * @tc.desc   toConstraintType maps -100 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010001 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-100);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(-100, 0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanParameterBuilder.range(-100, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010001 end');
    });

    /**
     * @tc.name   testParamMap010002
     * @tc.number SUB_SCAN_PARAM_01_0002
     * @tc.desc   toConstraintType maps -9 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010002 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-9);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(-9, 0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanParameterBuilder.range(-9, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010002 end');
    });

    /**
     * @tc.name   testParamMap010003
     * @tc.number SUB_SCAN_PARAM_01_0003
     * @tc.desc   toConstraintType maps -1 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010003 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-1);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(-1, 0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanParameterBuilder.range(-1, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010003 end');
    });

    /**
     * @tc.name   testParamMap010004
     * @tc.number SUB_SCAN_PARAM_01_0004
     * @tc.desc   toConstraintType maps 0 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010004 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(0, 0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanParameterBuilder.range(0, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010004 end');
    });

    /**
     * @tc.name   testParamMap010005
     * @tc.number SUB_SCAN_PARAM_01_0005
     * @tc.desc   toConstraintType maps 1 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010005 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(1, 0))).assertEqual(ScanConstraintKind.RANGE);
      expect(ScanParameterBuilder.range(1, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010005 end');
    });

    /**
     * @tc.name   testParamMap010006
     * @tc.number SUB_SCAN_PARAM_01_0006
     * @tc.desc   toConstraintType maps 2 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010006 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(2);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.build(2, 0))
      ).assertEqual(ScanConstraintKind.NUMBER_LIST);
      expect(ScanParameterBuilder.range(2, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010006 end');
    });

    /**
     * @tc.name   testParamMap010007
     * @tc.number SUB_SCAN_PARAM_01_0007
     * @tc.desc   toConstraintType maps 3 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010007 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(3);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.build(3, 0))
      ).assertEqual(ScanConstraintKind.STRING_LIST);
      expect(ScanParameterBuilder.range(3, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010007 end');
    });

    /**
     * @tc.name   testParamMap010008
     * @tc.number SUB_SCAN_PARAM_01_0008
     * @tc.desc   toConstraintType maps 4 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010008 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(4);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(4, 0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanParameterBuilder.range(4, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010008 end');
    });

    /**
     * @tc.name   testParamMap010009
     * @tc.number SUB_SCAN_PARAM_01_0009
     * @tc.desc   toConstraintType maps 5 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010009 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(5);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(5, 0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanParameterBuilder.range(5, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010009 end');
    });

    /**
     * @tc.name   testParamMap010010
     * @tc.number SUB_SCAN_PARAM_01_0010
     * @tc.desc   toConstraintType maps 1000 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010010 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1000);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.build(1000, 0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanParameterBuilder.range(1000, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010010 end');
    });

    /**
     * @tc.name   testParamMap010011
     * @tc.number SUB_SCAN_PARAM_01_0011
     * @tc.desc   toOptionType maps -100 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010011 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-100);
      expect(ScanParameterBuilder.toOptionType(-100)).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(-100, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanParameterBuilder.bareOptionValue(-100).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010011 end');
    });

    /**
     * @tc.name   testParamMap010012
     * @tc.number SUB_SCAN_PARAM_01_0012
     * @tc.desc   toOptionType maps -3 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010012 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-3);
      expect(ScanParameterBuilder.toOptionType(-3)).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(-3, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanParameterBuilder.bareOptionValue(-3).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010012 end');
    });

    /**
     * @tc.name   testParamMap010013
     * @tc.number SUB_SCAN_PARAM_01_0013
     * @tc.desc   toOptionType maps -1 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010013 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-1);
      expect(ScanParameterBuilder.toOptionType(-1)).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(-1, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanParameterBuilder.bareOptionValue(-1).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010013 end');
    });

    /**
     * @tc.name   testParamMap010014
     * @tc.number SUB_SCAN_PARAM_01_0014
     * @tc.desc   toOptionType maps 0 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010014 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.toOptionType(0)).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(0, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanParameterBuilder.bareOptionValue(0).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010014 end');
    });

    /**
     * @tc.name   testParamMap010015
     * @tc.number SUB_SCAN_PARAM_01_0015
     * @tc.desc   toOptionType maps 1 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010015 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(ScanParameterBuilder.toOptionType(1)).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanParameterBuilder.optionValue(1, 7, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(
        ScanParameterBuilder.bareOptionValue(1).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010015 end');
    });

    /**
     * @tc.name   testParamMap010016
     * @tc.number SUB_SCAN_PARAM_01_0016
     * @tc.desc   toOptionType maps 2 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010016 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(2);
      expect(ScanParameterBuilder.toOptionType(2)).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanParameterBuilder.optionValue(2, 7, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(
        ScanParameterBuilder.bareOptionValue(2).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010016 end');
    });

    /**
     * @tc.name   testParamMap010017
     * @tc.number SUB_SCAN_PARAM_01_0017
     * @tc.desc   toOptionType maps 3 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010017 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(3);
      expect(ScanParameterBuilder.toOptionType(3)).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanParameterBuilder.optionValue(3, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanParameterBuilder.bareOptionValue(3).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010017 end');
    });

    /**
     * @tc.name   testParamMap010018
     * @tc.number SUB_SCAN_PARAM_01_0018
     * @tc.desc   toOptionType maps 4 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010018 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(4);
      expect(ScanParameterBuilder.toOptionType(4)).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(4, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanParameterBuilder.bareOptionValue(4).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010018 end');
    });

    /**
     * @tc.name   testParamMap010019
     * @tc.number SUB_SCAN_PARAM_01_0019
     * @tc.desc   toOptionType maps 1000 to its frozen enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010019 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1000);
      expect(ScanParameterBuilder.toOptionType(1000)).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(1000, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanParameterBuilder.bareOptionValue(1000).valueType === scan.OptionValueType.SCAN_TYPE_BOOL
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010019 end');
    });

    /**
     * @tc.name   testParamMap010020
     * @tc.number SUB_SCAN_PARAM_01_0020
     * @tc.desc   unit maps -100 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010020 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-100);
      expect(ScanParameterBuilder.unit(-100)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(-100))).assertEqual(0);
      expect(ScanParameterBuilder.unit(-100) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010020 end');
    });

    /**
     * @tc.name   testParamMap010021
     * @tc.number SUB_SCAN_PARAM_01_0021
     * @tc.desc   unit maps -2 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010021 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-2);
      expect(ScanParameterBuilder.unit(-2)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(-2))).assertEqual(0);
      expect(ScanParameterBuilder.unit(-2) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010021 end');
    });

    /**
     * @tc.name   testParamMap010022
     * @tc.number SUB_SCAN_PARAM_01_0022
     * @tc.desc   unit maps -1 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010022 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(-1);
      expect(ScanParameterBuilder.unit(-1)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(-1))).assertEqual(0);
      expect(ScanParameterBuilder.unit(-1) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010022 end');
    });

    /**
     * @tc.name   testParamMap010023
     * @tc.number SUB_SCAN_PARAM_01_0023
     * @tc.desc   unit maps 0 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010023 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.unit(0)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(0))).assertEqual(0);
      expect(ScanParameterBuilder.unit(0) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010023 end');
    });

    /**
     * @tc.name   testParamMap010024
     * @tc.number SUB_SCAN_PARAM_01_0024
     * @tc.desc   unit maps 1 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010024 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(ScanParameterBuilder.unit(1)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_PIXEL);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(1))).assertEqual(1);
      expect(ScanParameterBuilder.unit(1) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010024 end');
    });

    /**
     * @tc.name   testParamMap010025
     * @tc.number SUB_SCAN_PARAM_01_0025
     * @tc.desc   unit maps 2 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010025 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(2);
      expect(ScanParameterBuilder.unit(2)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_BIT);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(2))).assertEqual(2);
      expect(ScanParameterBuilder.unit(2) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010025 end');
    });

    /**
     * @tc.name   testParamMap010026
     * @tc.number SUB_SCAN_PARAM_01_0026
     * @tc.desc   unit maps 3 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010026 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(3);
      expect(ScanParameterBuilder.unit(3)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_MM);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(3))).assertEqual(3);
      expect(ScanParameterBuilder.unit(3) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010026 end');
    });

    /**
     * @tc.name   testParamMap010027
     * @tc.number SUB_SCAN_PARAM_01_0027
     * @tc.desc   unit maps 4 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010027 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(4);
      expect(ScanParameterBuilder.unit(4)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_DPI);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(4))).assertEqual(4);
      expect(ScanParameterBuilder.unit(4) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010027 end');
    });

    /**
     * @tc.name   testParamMap010028
     * @tc.number SUB_SCAN_PARAM_01_0028
     * @tc.desc   unit maps 5 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010028 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(5);
      expect(ScanParameterBuilder.unit(5)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_PERCENT);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(5))).assertEqual(5);
      expect(ScanParameterBuilder.unit(5) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010028 end');
    });

    /**
     * @tc.name   testParamMap010029
     * @tc.number SUB_SCAN_PARAM_01_0029
     * @tc.desc   unit maps 6 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010029 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(6);
      expect(ScanParameterBuilder.unit(6)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_MICROSECOND);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(6))).assertEqual(6);
      expect(ScanParameterBuilder.unit(6) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010029 end');
    });

    /**
     * @tc.name   testParamMap010030
     * @tc.number SUB_SCAN_PARAM_01_0030
     * @tc.desc   unit maps 7 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010030 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(7);
      expect(ScanParameterBuilder.unit(7)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(7))).assertEqual(0);
      expect(ScanParameterBuilder.unit(7) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010030 end');
    });

    /**
     * @tc.name   testParamMap010031
     * @tc.number SUB_SCAN_PARAM_01_0031
     * @tc.desc   unit maps 8 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010031 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(8);
      expect(ScanParameterBuilder.unit(8)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(8))).assertEqual(0);
      expect(ScanParameterBuilder.unit(8) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010031 end');
    });

    /**
     * @tc.name   testParamMap010032
     * @tc.number SUB_SCAN_PARAM_01_0032
     * @tc.desc   unit maps 100 to its frozen enum with out-of-range fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010032 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(100);
      expect(ScanParameterBuilder.unit(100)).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(ScanParameterBuilder.units().indexOf(ScanParameterBuilder.unit(100))).assertEqual(0);
      expect(ScanParameterBuilder.unit(100) === scan.PhysicalUnit.SCAN_UNIT_NONE).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010032 end');
    });

    /**
     * @tc.name   testParamMap010033
     * @tc.number SUB_SCAN_PARAM_01_0033
     * @tc.desc   build(0, 0) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010033 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(
        ScanParameterBuilder.build(0, 0).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 0).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(0, 0))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010033 end');
    });

    /**
     * @tc.name   testParamMap010034
     * @tc.number SUB_SCAN_PARAM_01_0034
     * @tc.desc   build(0, 1) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010034 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(
        ScanParameterBuilder.build(0, 1).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 1).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(0, 1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010034 end');
    });

    /**
     * @tc.name   testParamMap010035
     * @tc.number SUB_SCAN_PARAM_01_0035
     * @tc.desc   build(0, 2) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010035 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(
        ScanParameterBuilder.build(0, 2).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 2).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(0, 2))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010035 end');
    });

    /**
     * @tc.name   testParamMap010036
     * @tc.number SUB_SCAN_PARAM_01_0036
     * @tc.desc   build(0, 3) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010036 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(
        ScanParameterBuilder.build(0, 3).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 3).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(0, 3))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010036 end');
    });

    /**
     * @tc.name   testParamMap010037
     * @tc.number SUB_SCAN_PARAM_01_0037
     * @tc.desc   build(1, 0) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010037 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.build(1, 0).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      expect(ScanParameterBuilder.build(1, 0).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(1, 0))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010037 end');
    });

    /**
     * @tc.name   testParamMap010038
     * @tc.number SUB_SCAN_PARAM_01_0038
     * @tc.desc   build(1, 1) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010038 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.build(1, 1).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      expect(ScanParameterBuilder.build(1, 1).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(1, 1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010038 end');
    });

    /**
     * @tc.name   testParamMap010039
     * @tc.number SUB_SCAN_PARAM_01_0039
     * @tc.desc   build(1, 2) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010039 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.build(1, 2).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      expect(ScanParameterBuilder.build(1, 2).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(1, 2))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010039 end');
    });

    /**
     * @tc.name   testParamMap010040
     * @tc.number SUB_SCAN_PARAM_01_0040
     * @tc.desc   build(1, 3) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010040 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.build(1, 3).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      expect(ScanParameterBuilder.build(1, 3).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(1, 3))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010040 end');
    });

    /**
     * @tc.name   testParamMap010041
     * @tc.number SUB_SCAN_PARAM_01_0041
     * @tc.desc   build(2, 0) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010041 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(2);
      expect(
        ScanParameterBuilder.build(2, 0).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST);
      expect(ScanParameterBuilder.build(2, 0).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(2, 0))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010041 end');
    });

    /**
     * @tc.name   testParamMap010042
     * @tc.number SUB_SCAN_PARAM_01_0042
     * @tc.desc   build(2, 1) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010042 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(2);
      expect(
        ScanParameterBuilder.build(2, 1).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST);
      expect(ScanParameterBuilder.build(2, 1).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(2, 1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010042 end');
    });

    /**
     * @tc.name   testParamMap010043
     * @tc.number SUB_SCAN_PARAM_01_0043
     * @tc.desc   build(2, 2) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010043 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(2);
      expect(
        ScanParameterBuilder.build(2, 2).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST);
      expect(ScanParameterBuilder.build(2, 2).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(2, 2))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010043 end');
    });

    /**
     * @tc.name   testParamMap010044
     * @tc.number SUB_SCAN_PARAM_01_0044
     * @tc.desc   build(2, 3) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010044 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(2);
      expect(
        ScanParameterBuilder.build(2, 3).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST);
      expect(ScanParameterBuilder.build(2, 3).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(2, 3))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010044 end');
    });

    /**
     * @tc.name   testParamMap010045
     * @tc.number SUB_SCAN_PARAM_01_0045
     * @tc.desc   build(3, 0) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010045 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(3);
      expect(
        ScanParameterBuilder.build(3, 0).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST);
      expect(ScanParameterBuilder.build(3, 0).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(3, 0))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010045 end');
    });

    /**
     * @tc.name   testParamMap010046
     * @tc.number SUB_SCAN_PARAM_01_0046
     * @tc.desc   build(3, 1) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010046 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(3);
      expect(
        ScanParameterBuilder.build(3, 1).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST);
      expect(ScanParameterBuilder.build(3, 1).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(3, 1))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010046 end');
    });

    /**
     * @tc.name   testParamMap010047
     * @tc.number SUB_SCAN_PARAM_01_0047
     * @tc.desc   build(3, 2) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010047 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(3);
      expect(
        ScanParameterBuilder.build(3, 2).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST);
      expect(ScanParameterBuilder.build(3, 2).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(3, 2))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010047 end');
    });

    /**
     * @tc.name   testParamMap010048
     * @tc.number SUB_SCAN_PARAM_01_0048
     * @tc.desc   build(3, 3) keeps constraint type and value type in sync with the mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010048 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(3);
      expect(
        ScanParameterBuilder.build(3, 3).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST);
      expect(ScanParameterBuilder.build(3, 3).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.build(3, 3))).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010048 end');
    });

    /**
     * @tc.name   testParamMap010049
     * @tc.number SUB_SCAN_PARAM_01_0049
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 0, 0, 300, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010049 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 0, 0, 300, 1))
      ).assertEqual('constraint=1 type=0 range=0..300/1 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 0, 0, 300, 1)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010049 end');
    });

    /**
     * @tc.name   testParamMap010050
     * @tc.number SUB_SCAN_PARAM_01_0050
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 2, -50, 50, 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010050 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 2, -50, 50, 5))
      ).assertEqual('constraint=1 type=2 range=-50..50/5 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 2, -50, 50, 5)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010050 end');
    });

    /**
     * @tc.name   testParamMap010051
     * @tc.number SUB_SCAN_PARAM_01_0051
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(0, 3, 0, 0, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010051 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 3, 0, 0, 1))
      ).assertEqual('constraint=0 type=3 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 3, 0, 0, 1)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010051 end');
    });

    /**
     * @tc.name   testParamMap010052
     * @tc.number SUB_SCAN_PARAM_01_0052
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.numberList([1, 3, 5])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010052 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([1, 3, 5]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=3');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([1, 3, 5])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010052 end');
    });

    /**
     * @tc.name   testParamMap010053
     * @tc.number SUB_SCAN_PARAM_01_0053
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.stringList(['pdf', 'png'])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010053 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['pdf', 'png']))
      ).assertEqual('constraint=3 type=3 range=- texts=2 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['pdf', 'png'])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010053 end');
    });

    /**
     * @tc.name   testParamMap010054
     * @tc.number SUB_SCAN_PARAM_01_0054
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.free(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010054 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(0))
      ).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.describe(ScanParameterBuilder.free(0)).indexOf('range=- ') >= 0).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010054 end');
    });

    /**
     * @tc.name   testParamMap010055
     * @tc.number SUB_SCAN_PARAM_01_0055
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.build(2, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010055 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.build(2, 1))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.build(2, 1)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010055 end');
    });

    /**
     * @tc.name   testParamMap010056
     * @tc.number SUB_SCAN_PARAM_01_0056
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.intRange(10, 90, 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010056 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(10, 90, 10))
      ).assertEqual('constraint=1 type=1 range=10..90/10 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(10, 90, 10)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010056 end');
    });

    /**
     * @tc.name   testParamMap010057
     * @tc.number SUB_SCAN_PARAM_01_0057
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.fixedRange(0, 1, 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010057 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.fixedRange(0, 1, 0))
      ).assertEqual('constraint=1 type=2 range=0..1/0 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.fixedRange(0, 1, 0)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010057 end');
    });

    /**
     * @tc.name   testParamMap010058
     * @tc.number SUB_SCAN_PARAM_01_0058
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 0, 300, 0, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010058 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 0, 300, 0, 1))
      ).assertEqual('constraint=1 type=0 range=300..0/1 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 0, 300, 0, 1)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010058 end');
    });

    /**
     * @tc.name   testParamMap010059
     * @tc.number SUB_SCAN_PARAM_01_0059
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 3, 0, 0, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010059 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 3, 0, 0, 1))
      ).assertEqual('constraint=1 type=3 range=0..0/1 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 3, 0, 0, 1)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010059 end');
    });

    /**
     * @tc.name   testParamMap010060
     * @tc.number SUB_SCAN_PARAM_01_0060
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(2, 1, 1, 2, 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010060 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 1, 1, 2, 3))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 1, 1, 2, 3)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010060 end');
    });

    /**
     * @tc.name   testParamMap010061
     * @tc.number SUB_SCAN_PARAM_01_0061
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.stringList([])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010061 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList([]))
      ).assertEqual('constraint=3 type=3 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList([])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010061 end');
    });

    /**
     * @tc.name   testParamMap010062
     * @tc.number SUB_SCAN_PARAM_01_0062
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.numberList([])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010062 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010062 end');
    });

    /**
     * @tc.name   testParamMap010063
     * @tc.number SUB_SCAN_PARAM_01_0063
     * @tc.desc   discoveryMode maps 'USB' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010063 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('USB')).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      expect(ScanParameterBuilder.discoveryMode('USB') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(true);
      expect(ScanParameterBuilder.discoveryMode('USB') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010063 end');
    });

    /**
     * @tc.name   testParamMap010064
     * @tc.number SUB_SCAN_PARAM_01_0064
     * @tc.desc   discoveryMode maps 'usb' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010064 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('usb')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('usb') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('usb') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010064 end');
    });

    /**
     * @tc.name   testParamMap010065
     * @tc.number SUB_SCAN_PARAM_01_0065
     * @tc.desc   discoveryMode maps 'Usb' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010065 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('Usb')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('Usb') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('Usb') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010065 end');
    });

    /**
     * @tc.name   testParamMap010066
     * @tc.number SUB_SCAN_PARAM_01_0066
     * @tc.desc   discoveryMode maps 'USB ' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010066 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('USB ')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('USB ') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('USB ') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010066 end');
    });

    /**
     * @tc.name   testParamMap010067
     * @tc.number SUB_SCAN_PARAM_01_0067
     * @tc.desc   discoveryMode maps 'TCP' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010067 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('TCP')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('TCP') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('TCP') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010067 end');
    });

    /**
     * @tc.name   testParamMap010068
     * @tc.number SUB_SCAN_PARAM_01_0068
     * @tc.desc   discoveryMode maps 'tcp' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010068 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('tcp')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('tcp') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('tcp') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010068 end');
    });

    /**
     * @tc.name   testParamMap010069
     * @tc.number SUB_SCAN_PARAM_01_0069
     * @tc.desc   discoveryMode maps 'Tcp' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010069 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('Tcp')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('Tcp') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('Tcp') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010069 end');
    });

    /**
     * @tc.name   testParamMap010070
     * @tc.number SUB_SCAN_PARAM_01_0070
     * @tc.desc   discoveryMode maps '' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010070 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010070 end');
    });

    /**
     * @tc.name   testParamMap010071
     * @tc.number SUB_SCAN_PARAM_01_0071
     * @tc.desc   discoveryMode maps ' ' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010071 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode(' ')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode(' ') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode(' ') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010071 end');
    });

    /**
     * @tc.name   testParamMap010072
     * @tc.number SUB_SCAN_PARAM_01_0072
     * @tc.desc   discoveryMode maps 'bluetooth' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010072 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('bluetooth')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('bluetooth') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('bluetooth') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010072 end');
    });

    /**
     * @tc.name   testParamMap010073
     * @tc.number SUB_SCAN_PARAM_01_0073
     * @tc.desc   discoveryMode maps 'wifi' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010073 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('wifi')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('wifi') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('wifi') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010073 end');
    });

    /**
     * @tc.name   testParamMap010074
     * @tc.number SUB_SCAN_PARAM_01_0074
     * @tc.desc   discoveryMode maps 'ethernet' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010074 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('ethernet')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('ethernet') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('ethernet') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010074 end');
    });

    /**
     * @tc.name   testParamMap010075
     * @tc.number SUB_SCAN_PARAM_01_0075
     * @tc.desc   discoveryMode maps 'cable' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010075 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('cable')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('cable') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('cable') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010075 end');
    });

    /**
     * @tc.name   testParamMap010076
     * @tc.number SUB_SCAN_PARAM_01_0076
     * @tc.desc   discoveryMode maps 'network' with USB-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010076 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.discoveryMode('network')).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(ScanParameterBuilder.discoveryMode('network') === scan.ScannerDiscoveryMode.USB_STR).assertEqual(false);
      expect(ScanParameterBuilder.discoveryMode('network') !== scan.ScannerDiscoveryMode.TCP_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010076 end');
    });

    /**
     * @tc.name   testParamMap010077
     * @tc.number SUB_SCAN_PARAM_01_0077
     * @tc.desc   syncMode maps 'delete' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010077 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('delete')).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(ScanParameterBuilder.syncMode('delete') === scan.ScannerSyncMode.DELETE_STR).assertEqual(true);
      expect(ScanParameterBuilder.syncMode('delete') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010077 end');
    });

    /**
     * @tc.name   testParamMap010078
     * @tc.number SUB_SCAN_PARAM_01_0078
     * @tc.desc   syncMode maps 'Delete' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010078 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('Delete')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('Delete') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('Delete') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010078 end');
    });

    /**
     * @tc.name   testParamMap010079
     * @tc.number SUB_SCAN_PARAM_01_0079
     * @tc.desc   syncMode maps 'DELETE' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010079 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('DELETE')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('DELETE') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('DELETE') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010079 end');
    });

    /**
     * @tc.name   testParamMap010080
     * @tc.number SUB_SCAN_PARAM_01_0080
     * @tc.desc   syncMode maps ' delete' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010080 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode(' delete')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode(' delete') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode(' delete') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010080 end');
    });

    /**
     * @tc.name   testParamMap010081
     * @tc.number SUB_SCAN_PARAM_01_0081
     * @tc.desc   syncMode maps 'delete ' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010081 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('delete ')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('delete ') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('delete ') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010081 end');
    });

    /**
     * @tc.name   testParamMap010082
     * @tc.number SUB_SCAN_PARAM_01_0082
     * @tc.desc   syncMode maps 'update' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010082 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('update')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('update') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('update') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010082 end');
    });

    /**
     * @tc.name   testParamMap010083
     * @tc.number SUB_SCAN_PARAM_01_0083
     * @tc.desc   syncMode maps 'Update' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010083 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('Update')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('Update') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('Update') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010083 end');
    });

    /**
     * @tc.name   testParamMap010084
     * @tc.number SUB_SCAN_PARAM_01_0084
     * @tc.desc   syncMode maps 'UPDATE' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010084 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('UPDATE')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('UPDATE') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('UPDATE') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010084 end');
    });

    /**
     * @tc.name   testParamMap010085
     * @tc.number SUB_SCAN_PARAM_01_0085
     * @tc.desc   syncMode maps '' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010085 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010085 end');
    });

    /**
     * @tc.name   testParamMap010086
     * @tc.number SUB_SCAN_PARAM_01_0086
     * @tc.desc   syncMode maps ' ' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010086 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode(' ')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode(' ') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode(' ') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010086 end');
    });

    /**
     * @tc.name   testParamMap010087
     * @tc.number SUB_SCAN_PARAM_01_0087
     * @tc.desc   syncMode maps 'add' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010087 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('add')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('add') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('add') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010087 end');
    });

    /**
     * @tc.name   testParamMap010088
     * @tc.number SUB_SCAN_PARAM_01_0088
     * @tc.desc   syncMode maps 'remove' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010088 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('remove')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('remove') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('remove') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010088 end');
    });

    /**
     * @tc.name   testParamMap010089
     * @tc.number SUB_SCAN_PARAM_01_0089
     * @tc.desc   syncMode maps 'sync' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010089 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('sync')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('sync') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('sync') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010089 end');
    });

    /**
     * @tc.name   testParamMap010090
     * @tc.number SUB_SCAN_PARAM_01_0090
     * @tc.desc   syncMode maps 'reset' with delete-only match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamMap010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010090 begin');
      const result: scan.ConstraintType = ScanParameterBuilder.toConstraintType(0);
      expect(ScanParameterBuilder.syncMode('reset')).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.syncMode('reset') === scan.ScannerSyncMode.DELETE_STR).assertEqual(false);
      expect(ScanParameterBuilder.syncMode('reset') !== scan.ScannerSyncMode.UPDATE_STR).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamMap010090 end');
    });

  });
}
