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

export default function scanParamShapeVolume01Test() {
  describe('ScanParamShape', () => {

    /**
     * @tc.name   testParamShape010001
     * @tc.number SUB_SCAN_PARAM_02_0001
     * @tc.desc   param echoes index 0 name k0 with constraint 0 type 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010001 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k0', 't0', 'd0', 0, 0, 0);
      expect(result.optionName).assertEqual('k0');
      expect(result.optionTitle).assertEqual('t0');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010001 end');
    });

    /**
     * @tc.name   testParamShape010002
     * @tc.number SUB_SCAN_PARAM_02_0002
     * @tc.desc   param echoes index 5 name k1 with constraint 1 type 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010002 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(5, 'k1', 't1', 'd1', 1, 1, 1);
      expect(result.optionName).assertEqual('k1');
      expect(result.optionTitle).assertEqual('t1');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010002 end');
    });

    /**
     * @tc.name   testParamShape010003
     * @tc.number SUB_SCAN_PARAM_02_0003
     * @tc.desc   param echoes index 9 name k2 with constraint 2 type 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010003 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(9, 'k2', 't2', 'd2', 2, 2, 2);
      expect(result.optionName).assertEqual('k2');
      expect(result.optionTitle).assertEqual('t2');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010003 end');
    });

    /**
     * @tc.name   testParamShape010004
     * @tc.number SUB_SCAN_PARAM_02_0004
     * @tc.desc   param echoes index 12 name k3 with constraint 3 type 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010004 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(12, 'k3', 't3', 'd3', 3, 3, 3);
      expect(result.optionName).assertEqual('k3');
      expect(result.optionTitle).assertEqual('t3');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010004 end');
    });

    /**
     * @tc.name   testParamShape010005
     * @tc.number SUB_SCAN_PARAM_02_0005
     * @tc.desc   param echoes index 20 name k4 with constraint 0 type 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010005 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(20, 'k4', 't4', 'd4', 4, 0, 2);
      expect(result.optionName).assertEqual('k4');
      expect(result.optionTitle).assertEqual('t4');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010005 end');
    });

    /**
     * @tc.name   testParamShape010006
     * @tc.number SUB_SCAN_PARAM_02_0006
     * @tc.desc   param echoes index 30 name k5 with constraint 1 type 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010006 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(30, 'k5', 't5', 'd5', 5, 1, 3);
      expect(result.optionName).assertEqual('k5');
      expect(result.optionTitle).assertEqual('t5');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010006 end');
    });

    /**
     * @tc.name   testParamShape010007
     * @tc.number SUB_SCAN_PARAM_02_0007
     * @tc.desc   param echoes index 40 name k6 with constraint 2 type 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010007 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(40, 'k6', 't6', 'd6', 6, 2, 0);
      expect(result.optionName).assertEqual('k6');
      expect(result.optionTitle).assertEqual('t6');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010007 end');
    });

    /**
     * @tc.name   testParamShape010008
     * @tc.number SUB_SCAN_PARAM_02_0008
     * @tc.desc   param echoes index 50 name k7 with constraint 3 type 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010008 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(50, 'k7', 't7', 'd7', 0, 3, 1);
      expect(result.optionName).assertEqual('k7');
      expect(result.optionTitle).assertEqual('t7');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010008 end');
    });

    /**
     * @tc.name   testParamShape010009
     * @tc.number SUB_SCAN_PARAM_02_0009
     * @tc.desc   param echoes index 60 name k8 with constraint 0 type 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010009 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(60, 'k8', 't8', 'd8', 2, 0, 3);
      expect(result.optionName).assertEqual('k8');
      expect(result.optionTitle).assertEqual('t8');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010009 end');
    });

    /**
     * @tc.name   testParamShape010010
     * @tc.number SUB_SCAN_PARAM_02_0010
     * @tc.desc   param echoes index 70 name k9 with constraint 1 type 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010010 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(70, 'k9', 't9', 'd9', 3, 1, 2);
      expect(result.optionName).assertEqual('k9');
      expect(result.optionTitle).assertEqual('t9');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010010 end');
    });

    /**
     * @tc.name   testParamShape010011
     * @tc.number SUB_SCAN_PARAM_02_0011
     * @tc.desc   param echoes index 80 name k10 with constraint 2 type 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010011 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(80, 'k10', 't10', 'd10', 5, 2, 1);
      expect(result.optionName).assertEqual('k10');
      expect(result.optionTitle).assertEqual('t10');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010011 end');
    });

    /**
     * @tc.name   testParamShape010012
     * @tc.number SUB_SCAN_PARAM_02_0012
     * @tc.desc   param echoes index 99 name k11 with constraint 3 type 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010012 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(99, 'k11', 't11', 'd11', 6, 3, 0);
      expect(result.optionName).assertEqual('k11');
      expect(result.optionTitle).assertEqual('t11');
      expect(result.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010012 end');
    });

    /**
     * @tc.name   testParamShape010013
     * @tc.number SUB_SCAN_PARAM_02_0013
     * @tc.desc   range(0, 0, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010013 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 0, 0, 9, 1))
      ).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(0, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(0, 0, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010013 end');
    });

    /**
     * @tc.name   testParamShape010014
     * @tc.number SUB_SCAN_PARAM_02_0014
     * @tc.desc   range(0, 1, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010014 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 1, 0, 9, 1))
      ).assertEqual('constraint=0 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(0, 1, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(0, 1, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010014 end');
    });

    /**
     * @tc.name   testParamShape010015
     * @tc.number SUB_SCAN_PARAM_02_0015
     * @tc.desc   range(0, 2, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010015 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 2, 0, 9, 1))
      ).assertEqual('constraint=0 type=2 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(0, 2, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(0, 2, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010015 end');
    });

    /**
     * @tc.name   testParamShape010016
     * @tc.number SUB_SCAN_PARAM_02_0016
     * @tc.desc   range(0, 3, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010016 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 3, 0, 9, 1))
      ).assertEqual('constraint=0 type=3 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(0, 3, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(0, 3, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010016 end');
    });

    /**
     * @tc.name   testParamShape010017
     * @tc.number SUB_SCAN_PARAM_02_0017
     * @tc.desc   range(1, 0, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010017 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 0, 0, 9, 1))
      ).assertEqual('constraint=1 type=0 range=0..9/1 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(true);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(1, 0, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010017 end');
    });

    /**
     * @tc.name   testParamShape010018
     * @tc.number SUB_SCAN_PARAM_02_0018
     * @tc.desc   range(1, 1, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010018 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 0, 9, 1))
      ).assertEqual('constraint=1 type=1 range=0..9/1 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 1, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(true);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(1, 1, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010018 end');
    });

    /**
     * @tc.name   testParamShape010019
     * @tc.number SUB_SCAN_PARAM_02_0019
     * @tc.desc   range(1, 2, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010019 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 2, 0, 9, 1))
      ).assertEqual('constraint=1 type=2 range=0..9/1 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 2, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(true);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(1, 2, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010019 end');
    });

    /**
     * @tc.name   testParamShape010020
     * @tc.number SUB_SCAN_PARAM_02_0020
     * @tc.desc   range(1, 3, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010020 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 3, 0, 9, 1))
      ).assertEqual('constraint=1 type=3 range=0..9/1 texts=0 ints=0');
      expect(ScanParameterBuilder.range(1, 3, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(true);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(1, 3, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010020 end');
    });

    /**
     * @tc.name   testParamShape010021
     * @tc.number SUB_SCAN_PARAM_02_0021
     * @tc.desc   range(2, 0, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010021 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 0, 0, 9, 1))
      ).assertEqual('constraint=2 type=0 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(2, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(2, 0, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010021 end');
    });

    /**
     * @tc.name   testParamShape010022
     * @tc.number SUB_SCAN_PARAM_02_0022
     * @tc.desc   range(2, 1, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010022 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 1, 0, 9, 1))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(2, 1, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(2, 1, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010022 end');
    });

    /**
     * @tc.name   testParamShape010023
     * @tc.number SUB_SCAN_PARAM_02_0023
     * @tc.desc   range(2, 2, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010023 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 2, 0, 9, 1))
      ).assertEqual('constraint=2 type=2 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(2, 2, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(2, 2, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010023 end');
    });

    /**
     * @tc.name   testParamShape010024
     * @tc.number SUB_SCAN_PARAM_02_0024
     * @tc.desc   range(2, 3, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010024 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 3, 0, 9, 1))
      ).assertEqual('constraint=2 type=3 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(2, 3, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(2, 3, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010024 end');
    });

    /**
     * @tc.name   testParamShape010025
     * @tc.number SUB_SCAN_PARAM_02_0025
     * @tc.desc   range(3, 0, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010025 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(3, 0, 0, 9, 1))
      ).assertEqual('constraint=3 type=0 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(3, 0, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(3, 0, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010025 end');
    });

    /**
     * @tc.name   testParamShape010026
     * @tc.number SUB_SCAN_PARAM_02_0026
     * @tc.desc   range(3, 1, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010026 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(3, 1, 0, 9, 1))
      ).assertEqual('constraint=3 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(3, 1, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(3, 1, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010026 end');
    });

    /**
     * @tc.name   testParamShape010027
     * @tc.number SUB_SCAN_PARAM_02_0027
     * @tc.desc   range(3, 2, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010027 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(3, 2, 0, 9, 1))
      ).assertEqual('constraint=3 type=2 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(3, 2, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(3, 2, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010027 end');
    });

    /**
     * @tc.name   testParamShape010028
     * @tc.number SUB_SCAN_PARAM_02_0028
     * @tc.desc   range(3, 3, 0, 9, 1) mounts the range only for constraint 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010028 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(3, 3, 0, 9, 1))
      ).assertEqual('constraint=3 type=3 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.range(3, 3, 0, 9, 1).optionConstraintRange !== undefined).assertEqual(false);
      expect(
        ScanOptionConstraint.getKind(ScanParameterBuilder.range(3, 3, 0, 9, 1))
      ).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010028 end');
    });

    /**
     * @tc.name   testParamShape010029
     * @tc.number SUB_SCAN_PARAM_02_0029
     * @tc.desc   intRange(10, 90, 10) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010029 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(10, 90, 10))
      ).assertEqual('constraint=1 type=1 range=10..90/10 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(10, 90, 10))).assertEqual(10);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010029 end');
    });

    /**
     * @tc.name   testParamShape010030
     * @tc.number SUB_SCAN_PARAM_02_0030
     * @tc.desc   intRange(0, 300, 1) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010030 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(0, 300, 1))
      ).assertEqual('constraint=1 type=1 range=0..300/1 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(0, 300, 1))).assertEqual(1);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010030 end');
    });

    /**
     * @tc.name   testParamShape010031
     * @tc.number SUB_SCAN_PARAM_02_0031
     * @tc.desc   intRange(-50, 50, 5) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010031 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(-50, 50, 5))
      ).assertEqual('constraint=1 type=1 range=-50..50/5 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(-50, 50, 5))).assertEqual(5);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010031 end');
    });

    /**
     * @tc.name   testParamShape010032
     * @tc.number SUB_SCAN_PARAM_02_0032
     * @tc.desc   intRange(300, 0, 1) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010032 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(300, 0, 1))
      ).assertEqual('constraint=1 type=1 range=300..0/1 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(300, 0, 1))).assertEqual(1);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010032 end');
    });

    /**
     * @tc.name   testParamShape010033
     * @tc.number SUB_SCAN_PARAM_02_0033
     * @tc.desc   intRange(0, 0, 1) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010033 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(0, 0, 1))
      ).assertEqual('constraint=1 type=1 range=0..0/1 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(0, 0, 1))).assertEqual(1);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010033 end');
    });

    /**
     * @tc.name   testParamShape010034
     * @tc.number SUB_SCAN_PARAM_02_0034
     * @tc.desc   intRange(5, 5, 5) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010034 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(5, 5, 5))
      ).assertEqual('constraint=1 type=1 range=5..5/5 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(5, 5, 5))).assertEqual(5);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010034 end');
    });

    /**
     * @tc.name   testParamShape010035
     * @tc.number SUB_SCAN_PARAM_02_0035
     * @tc.desc   intRange(1, 100, 1) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010035 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(1, 100, 1))
      ).assertEqual('constraint=1 type=1 range=1..100/1 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(1, 100, 1))).assertEqual(1);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010035 end');
    });

    /**
     * @tc.name   testParamShape010036
     * @tc.number SUB_SCAN_PARAM_02_0036
     * @tc.desc   intRange(0, 1, 0) echoes its bounds into the description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010036 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(0, 1, 0))
      ).assertEqual('constraint=1 type=1 range=0..1/0 texts=0 ints=0');
      expect(ScanOptionConstraint.getStep(ScanParameterBuilder.intRange(0, 1, 0))).assertEqual(1);
      expect(result.optionIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010036 end');
    });

    /**
     * @tc.name   testParamShape010037
     * @tc.number SUB_SCAN_PARAM_02_0037
     * @tc.desc   numberList mounts 0 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010037 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([]))).assertEqual(0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.numberList([]).optionConstraintInt === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010037 end');
    });

    /**
     * @tc.name   testParamShape010038
     * @tc.number SUB_SCAN_PARAM_02_0038
     * @tc.desc   numberList mounts 1 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010038 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([1]))).assertEqual(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([1]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=1');
      expect(ScanParameterBuilder.numberList([1]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010038 end');
    });

    /**
     * @tc.name   testParamShape010039
     * @tc.number SUB_SCAN_PARAM_02_0039
     * @tc.desc   numberList mounts 3 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010039 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([1,3,5]))).assertEqual(3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([1,3,5]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=3');
      expect(ScanParameterBuilder.numberList([1,3,5]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010039 end');
    });

    /**
     * @tc.name   testParamShape010040
     * @tc.number SUB_SCAN_PARAM_02_0040
     * @tc.desc   numberList mounts 2 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010040 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([0,100]))).assertEqual(2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([0,100]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=2');
      expect(ScanParameterBuilder.numberList([0,100]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010040 end');
    });

    /**
     * @tc.name   testParamShape010041
     * @tc.number SUB_SCAN_PARAM_02_0041
     * @tc.desc   numberList mounts 5 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010041 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([2,4,6,8,10]))).assertEqual(5);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([2,4,6,8,10]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=5');
      expect(ScanParameterBuilder.numberList([2,4,6,8,10]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010041 end');
    });

    /**
     * @tc.name   testParamShape010042
     * @tc.number SUB_SCAN_PARAM_02_0042
     * @tc.desc   numberList mounts 1 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010042 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([7]))).assertEqual(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([7]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=1');
      expect(ScanParameterBuilder.numberList([7]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010042 end');
    });

    /**
     * @tc.name   testParamShape010043
     * @tc.number SUB_SCAN_PARAM_02_0043
     * @tc.desc   numberList mounts 3 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010043 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([9,8,7]))).assertEqual(3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([9,8,7]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=3');
      expect(ScanParameterBuilder.numberList([9,8,7]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010043 end');
    });

    /**
     * @tc.name   testParamShape010044
     * @tc.number SUB_SCAN_PARAM_02_0044
     * @tc.desc   numberList mounts 8 entries as a word list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010044 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 1);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.numberList([1,2,3,4,5,6,7,8]))).assertEqual(8);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([1,2,3,4,5,6,7,8]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=8');
      expect(ScanParameterBuilder.numberList([1,2,3,4,5,6,7,8]).optionConstraintInt === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010044 end');
    });

    /**
     * @tc.name   testParamShape010045
     * @tc.number SUB_SCAN_PARAM_02_0045
     * @tc.desc   stringList mounts 0 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010045 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList([]))).assertEqual(0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList([]))
      ).assertEqual('constraint=3 type=3 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.stringList([]).optionConstraintString === undefined).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010045 end');
    });

    /**
     * @tc.name   testParamShape010046
     * @tc.number SUB_SCAN_PARAM_02_0046
     * @tc.desc   stringList mounts 1 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010046 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(["pdf"]))).assertEqual(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(["pdf"]))
      ).assertEqual('constraint=3 type=3 range=- texts=1 ints=0');
      expect(ScanParameterBuilder.stringList(["pdf"]).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010046 end');
    });

    /**
     * @tc.name   testParamShape010047
     * @tc.number SUB_SCAN_PARAM_02_0047
     * @tc.desc   stringList mounts 2 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010047 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(["pdf","png"]))).assertEqual(2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(["pdf","png"]))
      ).assertEqual('constraint=3 type=3 range=- texts=2 ints=0');
      expect(ScanParameterBuilder.stringList(["pdf","png"]).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010047 end');
    });

    /**
     * @tc.name   testParamShape010048
     * @tc.number SUB_SCAN_PARAM_02_0048
     * @tc.desc   stringList mounts 3 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010048 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(["a","b","c"]))).assertEqual(3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(["a","b","c"]))
      ).assertEqual('constraint=3 type=3 range=- texts=3 ints=0');
      expect(ScanParameterBuilder.stringList(["a","b","c"]).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010048 end');
    });

    /**
     * @tc.name   testParamShape010049
     * @tc.number SUB_SCAN_PARAM_02_0049
     * @tc.desc   stringList mounts 1 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010049 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(["x"]))).assertEqual(1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(["x"]))
      ).assertEqual('constraint=3 type=3 range=- texts=1 ints=0');
      expect(ScanParameterBuilder.stringList(["x"]).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010049 end');
    });

    /**
     * @tc.name   testParamShape010050
     * @tc.number SUB_SCAN_PARAM_02_0050
     * @tc.desc   stringList mounts 4 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010050 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(
        ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(["red","green","blue","alpha"]))
      ).assertEqual(4);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(["red","green","blue","alpha"]))
      ).assertEqual('constraint=3 type=3 range=- texts=4 ints=0');
      expect(
        ScanParameterBuilder.stringList(["red","green","blue","alpha"]).optionConstraintString === undefined
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010050 end');
    });

    /**
     * @tc.name   testParamShape010051
     * @tc.number SUB_SCAN_PARAM_02_0051
     * @tc.desc   stringList mounts 2 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010051 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(["left","right"]))).assertEqual(2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(["left","right"]))
      ).assertEqual('constraint=3 type=3 range=- texts=2 ints=0');
      expect(ScanParameterBuilder.stringList(["left","right"]).optionConstraintString === undefined).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010051 end');
    });

    /**
     * @tc.name   testParamShape010052
     * @tc.number SUB_SCAN_PARAM_02_0052
     * @tc.desc   stringList mounts 6 entries as a string list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010052 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(
        ScanOptionConstraint.countOptions(ScanParameterBuilder.stringList(["one","two","three","four","five","six"]))
      ).assertEqual(6);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(["one","two","three","four","five","six"]))
      ).assertEqual('constraint=3 type=3 range=- texts=6 ints=0');
      expect(
        ScanParameterBuilder.stringList(["one","two","three","four","five","six"]).optionConstraintString === undefined
      ).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010052 end');
    });

    /**
     * @tc.name   testParamShape010053
     * @tc.number SUB_SCAN_PARAM_02_0053
     * @tc.desc   free(-1) keeps the value type with no constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010053 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, -1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(-1))
      ).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.free(-1))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.free(-1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010053 end');
    });

    /**
     * @tc.name   testParamShape010054
     * @tc.number SUB_SCAN_PARAM_02_0054
     * @tc.desc   free(0) keeps the value type with no constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010054 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(0))
      ).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.free(0))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.free(0))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010054 end');
    });

    /**
     * @tc.name   testParamShape010055
     * @tc.number SUB_SCAN_PARAM_02_0055
     * @tc.desc   free(1) keeps the value type with no constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010055 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(1))
      ).assertEqual('constraint=0 type=1 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.free(1))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.free(1))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010055 end');
    });

    /**
     * @tc.name   testParamShape010056
     * @tc.number SUB_SCAN_PARAM_02_0056
     * @tc.desc   free(2) keeps the value type with no constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010056 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(2))
      ).assertEqual('constraint=0 type=2 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.free(2))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.free(2))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010056 end');
    });

    /**
     * @tc.name   testParamShape010057
     * @tc.number SUB_SCAN_PARAM_02_0057
     * @tc.desc   free(3) keeps the value type with no constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010057 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(3))
      ).assertEqual('constraint=0 type=3 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.free(3))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.free(3))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010057 end');
    });

    /**
     * @tc.name   testParamShape010058
     * @tc.number SUB_SCAN_PARAM_02_0058
     * @tc.desc   free(4) keeps the value type with no constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010058 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 4);
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(4))
      ).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(ScanOptionConstraint.getKind(ScanParameterBuilder.free(4))).assertEqual(ScanConstraintKind.NONE);
      expect(ScanOptionConstraint.isEditable(ScanParameterBuilder.free(4))).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010058 end');
    });

    /**
     * @tc.name   testParamShape010059
     * @tc.number SUB_SCAN_PARAM_02_0059
     * @tc.desc   build(0, 0) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010059 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(ScanParameterBuilder.build(0, 0).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(0, 0).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 0).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010059 end');
    });

    /**
     * @tc.name   testParamShape010060
     * @tc.number SUB_SCAN_PARAM_02_0060
     * @tc.desc   build(0, 1) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010060 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(ScanParameterBuilder.build(0, 1).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(0, 1).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 1).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010060 end');
    });

    /**
     * @tc.name   testParamShape010061
     * @tc.number SUB_SCAN_PARAM_02_0061
     * @tc.desc   build(0, 2) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010061 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(ScanParameterBuilder.build(0, 2).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(0, 2).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 2).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010061 end');
    });

    /**
     * @tc.name   testParamShape010062
     * @tc.number SUB_SCAN_PARAM_02_0062
     * @tc.desc   build(0, 3) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010062 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(ScanParameterBuilder.build(0, 3).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(0, 3).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(ScanParameterBuilder.build(0, 3).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010062 end');
    });

    /**
     * @tc.name   testParamShape010063
     * @tc.number SUB_SCAN_PARAM_02_0063
     * @tc.desc   build(1, 1) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010063 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 1);
      expect(ScanParameterBuilder.build(1, 1).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(1, 1).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      expect(ScanParameterBuilder.build(1, 1).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010063 end');
    });

    /**
     * @tc.name   testParamShape010064
     * @tc.number SUB_SCAN_PARAM_02_0064
     * @tc.desc   build(2, 2) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010064 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 2, 2);
      expect(ScanParameterBuilder.build(2, 2).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(2, 2).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST);
      expect(ScanParameterBuilder.build(2, 2).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010064 end');
    });

    /**
     * @tc.name   testParamShape010065
     * @tc.number SUB_SCAN_PARAM_02_0065
     * @tc.desc   build(3, 3) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010065 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 3, 3);
      expect(ScanParameterBuilder.build(3, 3).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(3, 3).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST);
      expect(ScanParameterBuilder.build(3, 3).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010065 end');
    });

    /**
     * @tc.name   testParamShape010066
     * @tc.number SUB_SCAN_PARAM_02_0066
     * @tc.desc   build(1, 2) uses the sample title with the mapped enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010066 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 1, 2);
      expect(ScanParameterBuilder.build(1, 2).optionTitle).assertEqual('Scan option');
      expect(
        ScanParameterBuilder.build(1, 2).optionConstraintType
      ).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_RANGE);
      expect(ScanParameterBuilder.build(1, 2).optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010066 end');
    });

    /**
     * @tc.name   testParamShape010067
     * @tc.number SUB_SCAN_PARAM_02_0067
     * @tc.desc   optionValue type 0 num 7 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010067 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.optionValue(0, 7, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(0, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(0, 7, 'txt', false))).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010067 end');
    });

    /**
     * @tc.name   testParamShape010068
     * @tc.number SUB_SCAN_PARAM_02_0068
     * @tc.desc   optionValue type 0 num -3 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010068 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.optionValue(0, -3, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(0, -3, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(0, -3, 'txt', false))).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010068 end');
    });

    /**
     * @tc.name   testParamShape010069
     * @tc.number SUB_SCAN_PARAM_02_0069
     * @tc.desc   optionValue type 0 num 12.345 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010069 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.optionValue(0, 12.345, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(0, 12.345, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(0, 12.345, 'txt', false))
      ).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010069 end');
    });

    /**
     * @tc.name   testParamShape010070
     * @tc.number SUB_SCAN_PARAM_02_0070
     * @tc.desc   optionValue type 1 num 7 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010070 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.optionValue(1, 7, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanParameterBuilder.optionValue(1, 7, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(1, 7, 'txt', false))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010070 end');
    });

    /**
     * @tc.name   testParamShape010071
     * @tc.number SUB_SCAN_PARAM_02_0071
     * @tc.desc   optionValue type 1 num -3 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010071 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.optionValue(1, -3, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanParameterBuilder.optionValue(1, -3, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(1, -3, 'txt', false))).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010071 end');
    });

    /**
     * @tc.name   testParamShape010072
     * @tc.number SUB_SCAN_PARAM_02_0072
     * @tc.desc   optionValue type 1 num 12.345 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010072 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.optionValue(1, 12.345, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanParameterBuilder.optionValue(1, 12.345, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(1, 12.345, 'txt', false))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010072 end');
    });

    /**
     * @tc.name   testParamShape010073
     * @tc.number SUB_SCAN_PARAM_02_0073
     * @tc.desc   optionValue type 2 num 7 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010073 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.optionValue(2, 7, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanParameterBuilder.optionValue(2, 7, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(2, 7, 'txt', false))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010073 end');
    });

    /**
     * @tc.name   testParamShape010074
     * @tc.number SUB_SCAN_PARAM_02_0074
     * @tc.desc   optionValue type 2 num -3 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010074 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.optionValue(2, -3, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanParameterBuilder.optionValue(2, -3, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(2, -3, 'txt', false))).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010074 end');
    });

    /**
     * @tc.name   testParamShape010075
     * @tc.number SUB_SCAN_PARAM_02_0075
     * @tc.desc   optionValue type 2 num 12.345 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010075 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.optionValue(2, 12.345, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanParameterBuilder.optionValue(2, 12.345, 'txt', false).numValue !== undefined).assertEqual(true);
      expect(
        ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(2, 12.345, 'txt', false))
      ).assertEqual('12.35');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010075 end');
    });

    /**
     * @tc.name   testParamShape010076
     * @tc.number SUB_SCAN_PARAM_02_0076
     * @tc.desc   optionValue type 3 num 7 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010076 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.optionValue(3, 7, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanParameterBuilder.optionValue(3, 7, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(3, 7, 'txt', false))).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010076 end');
    });

    /**
     * @tc.name   testParamShape010077
     * @tc.number SUB_SCAN_PARAM_02_0077
     * @tc.desc   optionValue type 3 num -3 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010077 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.optionValue(3, -3, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanParameterBuilder.optionValue(3, -3, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(3, -3, 'txt', false))).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010077 end');
    });

    /**
     * @tc.name   testParamShape010078
     * @tc.number SUB_SCAN_PARAM_02_0078
     * @tc.desc   optionValue type 3 num 12.345 str 'txt' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010078 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.optionValue(3, 12.345, 'txt', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanParameterBuilder.optionValue(3, 12.345, 'txt', false).numValue !== undefined).assertEqual(false);
      expect(
        ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(3, 12.345, 'txt', false))
      ).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010078 end');
    });

    /**
     * @tc.name   testParamShape010079
     * @tc.number SUB_SCAN_PARAM_02_0079
     * @tc.desc   optionValue type 0 num 0 str '' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010079 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.optionValue(0, 0, '', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(0, 0, '', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(0, 0, '', false))).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010079 end');
    });

    /**
     * @tc.name   testParamShape010080
     * @tc.number SUB_SCAN_PARAM_02_0080
     * @tc.desc   optionValue type 0 num 0 str 'a' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010080 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.optionValue(0, 0, 'a', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(0, 0, 'a', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(0, 0, 'a', false))).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010080 end');
    });

    /**
     * @tc.name   testParamShape010081
     * @tc.number SUB_SCAN_PARAM_02_0081
     * @tc.desc   optionValue type 0 num 0 str 'pdf' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010081 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 0);
      expect(
        ScanParameterBuilder.optionValue(0, 0, 'pdf', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      expect(ScanParameterBuilder.optionValue(0, 0, 'pdf', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(0, 0, 'pdf', false))).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010081 end');
    });

    /**
     * @tc.name   testParamShape010082
     * @tc.number SUB_SCAN_PARAM_02_0082
     * @tc.desc   optionValue type 1 num 0 str '' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010082 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.optionValue(1, 0, '', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanParameterBuilder.optionValue(1, 0, '', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(1, 0, '', false))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010082 end');
    });

    /**
     * @tc.name   testParamShape010083
     * @tc.number SUB_SCAN_PARAM_02_0083
     * @tc.desc   optionValue type 1 num 0 str 'a' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010083 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.optionValue(1, 0, 'a', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanParameterBuilder.optionValue(1, 0, 'a', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(1, 0, 'a', false))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010083 end');
    });

    /**
     * @tc.name   testParamShape010084
     * @tc.number SUB_SCAN_PARAM_02_0084
     * @tc.desc   optionValue type 1 num 0 str 'pdf' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010084 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 1);
      expect(
        ScanParameterBuilder.optionValue(1, 0, 'pdf', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(ScanParameterBuilder.optionValue(1, 0, 'pdf', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(1, 0, 'pdf', false))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010084 end');
    });

    /**
     * @tc.name   testParamShape010085
     * @tc.number SUB_SCAN_PARAM_02_0085
     * @tc.desc   optionValue type 2 num 0 str '' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010085 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.optionValue(2, 0, '', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanParameterBuilder.optionValue(2, 0, '', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(2, 0, '', false))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010085 end');
    });

    /**
     * @tc.name   testParamShape010086
     * @tc.number SUB_SCAN_PARAM_02_0086
     * @tc.desc   optionValue type 2 num 0 str 'a' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010086 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.optionValue(2, 0, 'a', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanParameterBuilder.optionValue(2, 0, 'a', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(2, 0, 'a', false))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010086 end');
    });

    /**
     * @tc.name   testParamShape010087
     * @tc.number SUB_SCAN_PARAM_02_0087
     * @tc.desc   optionValue type 2 num 0 str 'pdf' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010087 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 2);
      expect(
        ScanParameterBuilder.optionValue(2, 0, 'pdf', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanParameterBuilder.optionValue(2, 0, 'pdf', false).numValue !== undefined).assertEqual(true);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(2, 0, 'pdf', false))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010087 end');
    });

    /**
     * @tc.name   testParamShape010088
     * @tc.number SUB_SCAN_PARAM_02_0088
     * @tc.desc   optionValue type 3 num 0 str '' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010088 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.optionValue(3, 0, '', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanParameterBuilder.optionValue(3, 0, '', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(3, 0, '', false))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010088 end');
    });

    /**
     * @tc.name   testParamShape010089
     * @tc.number SUB_SCAN_PARAM_02_0089
     * @tc.desc   optionValue type 3 num 0 str 'a' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010089 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.optionValue(3, 0, 'a', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanParameterBuilder.optionValue(3, 0, 'a', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(3, 0, 'a', false))).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010089 end');
    });

    /**
     * @tc.name   testParamShape010090
     * @tc.number SUB_SCAN_PARAM_02_0090
     * @tc.desc   optionValue type 3 num 0 str 'pdf' selects its own field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamShape010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010090 begin');
      const result: scan.ScannerParameter = ScanParameterBuilder.param(0, 'k', 't', 'd', 0, 0, 3);
      expect(
        ScanParameterBuilder.optionValue(3, 0, 'pdf', false).valueType
      ).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      expect(ScanParameterBuilder.optionValue(3, 0, 'pdf', false).numValue !== undefined).assertEqual(false);
      expect(ScanOptionValueParser.asText(ScanParameterBuilder.optionValue(3, 0, 'pdf', false))).assertEqual('pdf');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamShape010090 end');
    });

  });
}
