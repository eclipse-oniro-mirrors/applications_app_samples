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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanOptionMatrixVolume01Test() {
  describe('ScanOptionMatrix', () => {

    /**
     * @tc.name   testOptionMatrix010001
     * @tc.number SUB_SCAN_OPMATRIX_01_0001
     * @tc.desc   getUnitText and formatNumber for unit -100 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010001 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(-100))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(-100))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010001 end');
    });

    /**
     * @tc.name   testOptionMatrix010002
     * @tc.number SUB_SCAN_OPMATRIX_01_0002
     * @tc.desc   getUnitText and formatNumber for unit -1 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010002 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(-1))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(-1))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010002 end');
    });

    /**
     * @tc.name   testOptionMatrix010003
     * @tc.number SUB_SCAN_OPMATRIX_01_0003
     * @tc.desc   getUnitText and formatNumber for unit 0 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010003 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(0))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(0))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010003 end');
    });

    /**
     * @tc.name   testOptionMatrix010004
     * @tc.number SUB_SCAN_OPMATRIX_01_0004
     * @tc.desc   getUnitText and formatNumber for unit 1 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010004 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(1))).assertEqual('px');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(1))).assertEqual('5 px');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010004 end');
    });

    /**
     * @tc.name   testOptionMatrix010005
     * @tc.number SUB_SCAN_OPMATRIX_01_0005
     * @tc.desc   getUnitText and formatNumber for unit 2 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010005 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(2))).assertEqual('bit');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(2))).assertEqual('5 bit');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7.25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010005 end');
    });

    /**
     * @tc.name   testOptionMatrix010006
     * @tc.number SUB_SCAN_OPMATRIX_01_0006
     * @tc.desc   getUnitText and formatNumber for unit 3 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010006 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(3))).assertEqual('mm');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(3))).assertEqual('5 mm');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010006 end');
    });

    /**
     * @tc.name   testOptionMatrix010007
     * @tc.number SUB_SCAN_OPMATRIX_01_0007
     * @tc.desc   getUnitText and formatNumber for unit 4 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010007 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(4))).assertEqual('dpi');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(4))).assertEqual('5 dpi');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010007 end');
    });

    /**
     * @tc.name   testOptionMatrix010008
     * @tc.number SUB_SCAN_OPMATRIX_01_0008
     * @tc.desc   getUnitText and formatNumber for unit 5 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010008 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(5))).assertEqual('%');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(5))).assertEqual('5 %');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010008 end');
    });

    /**
     * @tc.name   testOptionMatrix010009
     * @tc.number SUB_SCAN_OPMATRIX_01_0009
     * @tc.desc   getUnitText and formatNumber for unit 6 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010009 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(6))).assertEqual('us');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(6))).assertEqual('5 us');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7.25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010009 end');
    });

    /**
     * @tc.name   testOptionMatrix010010
     * @tc.number SUB_SCAN_OPMATRIX_01_0010
     * @tc.desc   getUnitText and formatNumber for unit 7 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010010 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(7))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(7))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010010 end');
    });

    /**
     * @tc.name   testOptionMatrix010011
     * @tc.number SUB_SCAN_OPMATRIX_01_0011
     * @tc.desc   getUnitText and formatNumber for unit 8 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010011 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(8))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(8))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010011 end');
    });

    /**
     * @tc.name   testOptionMatrix010012
     * @tc.number SUB_SCAN_OPMATRIX_01_0012
     * @tc.desc   getUnitText and formatNumber for unit 9 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010012 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(9))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(9))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010012 end');
    });

    /**
     * @tc.name   testOptionMatrix010013
     * @tc.number SUB_SCAN_OPMATRIX_01_0013
     * @tc.desc   getUnitText and formatNumber for unit 100 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010013 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(100))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(100))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010013 end');
    });

    /**
     * @tc.name   testOptionMatrix010014
     * @tc.number SUB_SCAN_OPMATRIX_01_0014
     * @tc.desc   getUnitText and formatNumber for unit -2 fall back on out-of-table values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010014 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.25, 'txt', true);
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(-2))).assertEqual('');
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(-2))).assertEqual('5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7.25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010014 end');
    });

    /**
     * @tc.name   testOptionMatrix010015
     * @tc.number SUB_SCAN_OPMATRIX_01_0015
     * @tc.desc   roundFixed and trimZeros normalize 0 into 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010015 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0, 'txt', false);
      expect(ScanOptionModel.roundFixed(0)).assertEqual(0);
      expect(ScanOptionModel.formatNumber(0, ScanParameterBuilder.unit(0))).assertEqual('0');
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010015 end');
    });

    /**
     * @tc.name   testOptionMatrix010016
     * @tc.number SUB_SCAN_OPMATRIX_01_0016
     * @tc.desc   roundFixed and trimZeros normalize 0.004 into 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010016 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0.004, 'txt', false);
      expect(ScanOptionModel.roundFixed(0.004)).assertEqual(0);
      expect(ScanOptionModel.formatNumber(0.004, ScanParameterBuilder.unit(0))).assertEqual('0');
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010016 end');
    });

    /**
     * @tc.name   testOptionMatrix010017
     * @tc.number SUB_SCAN_OPMATRIX_01_0017
     * @tc.desc   roundFixed and trimZeros normalize 0.005 into 0.01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010017 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0.005, 'txt', false);
      expect(ScanOptionModel.roundFixed(0.005)).assertEqual(0.01);
      expect(ScanOptionModel.formatNumber(0.005, ScanParameterBuilder.unit(0))).assertEqual('0.01');
      expect(ScanOptionModel.formatValue(result)).assertEqual('0.01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010017 end');
    });

    /**
     * @tc.name   testOptionMatrix010018
     * @tc.number SUB_SCAN_OPMATRIX_01_0018
     * @tc.desc   roundFixed and trimZeros normalize 1.234 into 1.23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010018 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 1.234, 'txt', false);
      expect(ScanOptionModel.roundFixed(1.234)).assertEqual(1.23);
      expect(ScanOptionModel.formatNumber(1.234, ScanParameterBuilder.unit(0))).assertEqual('1.23');
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.23');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010018 end');
    });

    /**
     * @tc.name   testOptionMatrix010019
     * @tc.number SUB_SCAN_OPMATRIX_01_0019
     * @tc.desc   roundFixed and trimZeros normalize 1.235 into 1.24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010019 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 1.235, 'txt', false);
      expect(ScanOptionModel.roundFixed(1.235)).assertEqual(1.24);
      expect(ScanOptionModel.formatNumber(1.235, ScanParameterBuilder.unit(0))).assertEqual('1.24');
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010019 end');
    });

    /**
     * @tc.name   testOptionMatrix010020
     * @tc.number SUB_SCAN_OPMATRIX_01_0020
     * @tc.desc   roundFixed and trimZeros normalize -1.235 into -1.24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010020 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -1.235, 'txt', false);
      expect(ScanOptionModel.roundFixed(-1.235)).assertEqual(-1.24);
      expect(ScanOptionModel.formatNumber(-1.235, ScanParameterBuilder.unit(0))).assertEqual('-1.24');
      expect(ScanOptionModel.formatValue(result)).assertEqual('-1.24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010020 end');
    });

    /**
     * @tc.name   testOptionMatrix010021
     * @tc.number SUB_SCAN_OPMATRIX_01_0021
     * @tc.desc   roundFixed and trimZeros normalize 2.5 into 2.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010021 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 2.5, 'txt', false);
      expect(ScanOptionModel.roundFixed(2.5)).assertEqual(2.5);
      expect(ScanOptionModel.formatNumber(2.5, ScanParameterBuilder.unit(0))).assertEqual('2.5');
      expect(ScanOptionModel.formatValue(result)).assertEqual('2.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010021 end');
    });

    /**
     * @tc.name   testOptionMatrix010022
     * @tc.number SUB_SCAN_OPMATRIX_01_0022
     * @tc.desc   roundFixed and trimZeros normalize 99.999 into 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010022 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 99.999, 'txt', false);
      expect(ScanOptionModel.roundFixed(99.999)).assertEqual(100);
      expect(ScanOptionModel.formatNumber(99.999, ScanParameterBuilder.unit(0))).assertEqual('100');
      expect(ScanOptionModel.formatValue(result)).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010022 end');
    });

    /**
     * @tc.name   testOptionMatrix010023
     * @tc.number SUB_SCAN_OPMATRIX_01_0023
     * @tc.desc   roundFixed and trimZeros normalize 100 into 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010023 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 100, 'txt', false);
      expect(ScanOptionModel.roundFixed(100)).assertEqual(100);
      expect(ScanOptionModel.formatNumber(100, ScanParameterBuilder.unit(0))).assertEqual('100');
      expect(ScanOptionModel.formatValue(result)).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010023 end');
    });

    /**
     * @tc.name   testOptionMatrix010024
     * @tc.number SUB_SCAN_OPMATRIX_01_0024
     * @tc.desc   roundFixed and trimZeros normalize -0.005 into 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010024 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -0.005, 'txt', false);
      expect(ScanOptionModel.roundFixed(-0.005)).assertEqual(0);
      expect(ScanOptionModel.formatNumber(-0.005, ScanParameterBuilder.unit(0))).assertEqual('0');
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010024 end');
    });

    /**
     * @tc.name   testOptionMatrix010025
     * @tc.number SUB_SCAN_OPMATRIX_01_0025
     * @tc.desc   roundFixed and trimZeros normalize -0.004 into 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010025 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -0.004, 'txt', false);
      expect(ScanOptionModel.roundFixed(-0.004)).assertEqual(0);
      expect(ScanOptionModel.formatNumber(-0.004, ScanParameterBuilder.unit(0))).assertEqual('0');
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010025 end');
    });

    /**
     * @tc.name   testOptionMatrix010026
     * @tc.number SUB_SCAN_OPMATRIX_01_0026
     * @tc.desc   roundFixed and trimZeros normalize 0.01 into 0.01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010026 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0.01, 'txt', false);
      expect(ScanOptionModel.roundFixed(0.01)).assertEqual(0.01);
      expect(ScanOptionModel.formatNumber(0.01, ScanParameterBuilder.unit(0))).assertEqual('0.01');
      expect(ScanOptionModel.formatValue(result)).assertEqual('0.01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010026 end');
    });

    /**
     * @tc.name   testOptionMatrix010027
     * @tc.number SUB_SCAN_OPMATRIX_01_0027
     * @tc.desc   roundFixed and trimZeros normalize 1234.5678 into 1234.57
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010027 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 1234.5678, 'txt', false);
      expect(ScanOptionModel.roundFixed(1234.5678)).assertEqual(1234.57);
      expect(ScanOptionModel.formatNumber(1234.5678, ScanParameterBuilder.unit(0))).assertEqual('1234.57');
      expect(ScanOptionModel.formatValue(result)).assertEqual('1234.57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010027 end');
    });

    /**
     * @tc.name   testOptionMatrix010028
     * @tc.number SUB_SCAN_OPMATRIX_01_0028
     * @tc.desc   roundFixed and trimZeros normalize 3.14159 into 3.14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010028 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 3.14159, 'txt', false);
      expect(ScanOptionModel.roundFixed(3.14159)).assertEqual(3.14);
      expect(ScanOptionModel.formatNumber(3.14159, ScanParameterBuilder.unit(0))).assertEqual('3.14');
      expect(ScanOptionModel.formatValue(result)).assertEqual('3.14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010028 end');
    });

    /**
     * @tc.name   testOptionMatrix010029
     * @tc.number SUB_SCAN_OPMATRIX_01_0029
     * @tc.desc   trimZeros strips trailing zeros from '1.50'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010029 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '1.50', false);
      expect(ScanOptionModel.trimZeros('1.50')).assertEqual('1.5');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('1.50'))).assertEqual(1.5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.50');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010029 end');
    });

    /**
     * @tc.name   testOptionMatrix010030
     * @tc.number SUB_SCAN_OPMATRIX_01_0030
     * @tc.desc   trimZeros strips trailing zeros from '1.00'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010030 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '1.00', false);
      expect(ScanOptionModel.trimZeros('1.00')).assertEqual('1');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('1.00'))).assertEqual(1);
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010030 end');
    });

    /**
     * @tc.name   testOptionMatrix010031
     * @tc.number SUB_SCAN_OPMATRIX_01_0031
     * @tc.desc   trimZeros strips trailing zeros from '1.'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010031 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '1.', false);
      expect(ScanOptionModel.trimZeros('1.')).assertEqual('1');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('1.'))).assertEqual(1);
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010031 end');
    });

    /**
     * @tc.name   testOptionMatrix010032
     * @tc.number SUB_SCAN_OPMATRIX_01_0032
     * @tc.desc   trimZeros strips trailing zeros from '0.10'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010032 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '0.10', false);
      expect(ScanOptionModel.trimZeros('0.10')).assertEqual('0.1');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('0.10'))).assertEqual(0.1);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0.10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010032 end');
    });

    /**
     * @tc.name   testOptionMatrix010033
     * @tc.number SUB_SCAN_OPMATRIX_01_0033
     * @tc.desc   trimZeros strips trailing zeros from '10.'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010033 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '10.', false);
      expect(ScanOptionModel.trimZeros('10.')).assertEqual('10');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('10.'))).assertEqual(10);
      expect(ScanOptionModel.formatValue(result)).assertEqual('10.');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010033 end');
    });

    /**
     * @tc.name   testOptionMatrix010034
     * @tc.number SUB_SCAN_OPMATRIX_01_0034
     * @tc.desc   trimZeros strips trailing zeros from '5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010034 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '5', false);
      expect(ScanOptionModel.trimZeros('5')).assertEqual('5');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('5'))).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010034 end');
    });

    /**
     * @tc.name   testOptionMatrix010035
     * @tc.number SUB_SCAN_OPMATRIX_01_0035
     * @tc.desc   trimZeros strips trailing zeros from '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010035 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '0', false);
      expect(ScanOptionModel.trimZeros('0')).assertEqual('0');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('0'))).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010035 end');
    });

    /**
     * @tc.name   testOptionMatrix010036
     * @tc.number SUB_SCAN_OPMATRIX_01_0036
     * @tc.desc   trimZeros strips trailing zeros from '-1.20'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010036 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '-1.20', false);
      expect(ScanOptionModel.trimZeros('-1.20')).assertEqual('-1.2');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('-1.20'))).assertEqual(-1.2);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-1.20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010036 end');
    });

    /**
     * @tc.name   testOptionMatrix010037
     * @tc.number SUB_SCAN_OPMATRIX_01_0037
     * @tc.desc   trimZeros strips trailing zeros from '100.500'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010037 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '100.500', false);
      expect(ScanOptionModel.trimZeros('100.500')).assertEqual('100.5');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('100.500'))).assertEqual(100.5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('100.500');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010037 end');
    });

    /**
     * @tc.name   testOptionMatrix010038
     * @tc.number SUB_SCAN_OPMATRIX_01_0038
     * @tc.desc   trimZeros strips trailing zeros from '1.230'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010038 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '1.230', false);
      expect(ScanOptionModel.trimZeros('1.230')).assertEqual('1.23');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('1.230'))).assertEqual(1.23);
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.230');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010038 end');
    });

    /**
     * @tc.name   testOptionMatrix010039
     * @tc.number SUB_SCAN_OPMATRIX_01_0039
     * @tc.desc   trimZeros strips trailing zeros from '..'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010039 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '..', false);
      expect(ScanOptionModel.trimZeros('..')).assertEqual('');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('..'))).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('..');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010039 end');
    });

    /**
     * @tc.name   testOptionMatrix010040
     * @tc.number SUB_SCAN_OPMATRIX_01_0040
     * @tc.desc   trimZeros strips trailing zeros from '1.2.3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010040 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '1.2.3', false);
      expect(ScanOptionModel.trimZeros('1.2.3')).assertEqual('1.2.3');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('1.2.3'))).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.2.3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010040 end');
    });

    /**
     * @tc.name   testOptionMatrix010041
     * @tc.number SUB_SCAN_OPMATRIX_01_0041
     * @tc.desc   trimZeros strips trailing zeros from 'abc'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010041 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, 'abc', false);
      expect(ScanOptionModel.trimZeros('abc')).assertEqual('abc');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed('abc'))).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010041 end');
    });

    /**
     * @tc.name   testOptionMatrix010042
     * @tc.number SUB_SCAN_OPMATRIX_01_0042
     * @tc.desc   trimZeros strips trailing zeros from ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010042 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '', false);
      expect(ScanOptionModel.trimZeros('')).assertEqual('');
      expect(ScanOptionModel.roundFixed(ScanOptionValueParser.parseFixed(''))).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010042 end');
    });

    /**
     * @tc.name   testOptionMatrix010043
     * @tc.number SUB_SCAN_OPMATRIX_01_0043
     * @tc.desc   formatNumber(5, unit 0) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010043 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(0))).assertEqual('5');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010043 end');
    });

    /**
     * @tc.name   testOptionMatrix010044
     * @tc.number SUB_SCAN_OPMATRIX_01_0044
     * @tc.desc   formatNumber(5, unit 1) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010044 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(1))).assertEqual('5 px');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010044 end');
    });

    /**
     * @tc.name   testOptionMatrix010045
     * @tc.number SUB_SCAN_OPMATRIX_01_0045
     * @tc.desc   formatNumber(5, unit 2) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010045 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(2))).assertEqual('5 bit');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010045 end');
    });

    /**
     * @tc.name   testOptionMatrix010046
     * @tc.number SUB_SCAN_OPMATRIX_01_0046
     * @tc.desc   formatNumber(5, unit 3) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010046 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(3))).assertEqual('5 mm');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010046 end');
    });

    /**
     * @tc.name   testOptionMatrix010047
     * @tc.number SUB_SCAN_OPMATRIX_01_0047
     * @tc.desc   formatNumber(5, unit 4) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010047 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(4))).assertEqual('5 dpi');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010047 end');
    });

    /**
     * @tc.name   testOptionMatrix010048
     * @tc.number SUB_SCAN_OPMATRIX_01_0048
     * @tc.desc   formatNumber(5, unit 5) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010048 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(5))).assertEqual('5 %');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010048 end');
    });

    /**
     * @tc.name   testOptionMatrix010049
     * @tc.number SUB_SCAN_OPMATRIX_01_0049
     * @tc.desc   formatNumber(5, unit 6) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010049 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(6))).assertEqual('5 us');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010049 end');
    });

    /**
     * @tc.name   testOptionMatrix010050
     * @tc.number SUB_SCAN_OPMATRIX_01_0050
     * @tc.desc   formatNumber(5, unit 7) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010050 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 5, 'txt', false);
      expect(ScanOptionModel.formatNumber(5, ScanParameterBuilder.unit(7))).assertEqual('5');
      expect(ScanOptionModel.roundFixed(5)).assertEqual(5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010050 end');
    });

    /**
     * @tc.name   testOptionMatrix010051
     * @tc.number SUB_SCAN_OPMATRIX_01_0051
     * @tc.desc   formatNumber(0, unit 1) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010051 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0, 'txt', false);
      expect(ScanOptionModel.formatNumber(0, ScanParameterBuilder.unit(1))).assertEqual('0 px');
      expect(ScanOptionModel.roundFixed(0)).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010051 end');
    });

    /**
     * @tc.name   testOptionMatrix010052
     * @tc.number SUB_SCAN_OPMATRIX_01_0052
     * @tc.desc   formatNumber(7.5, unit 2) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010052 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.5, 'txt', false);
      expect(ScanOptionModel.formatNumber(7.5, ScanParameterBuilder.unit(2))).assertEqual('7.5 bit');
      expect(ScanOptionModel.roundFixed(7.5)).assertEqual(7.5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010052 end');
    });

    /**
     * @tc.name   testOptionMatrix010053
     * @tc.number SUB_SCAN_OPMATRIX_01_0053
     * @tc.desc   formatNumber(100, unit 3) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010053 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 100, 'txt', false);
      expect(ScanOptionModel.formatNumber(100, ScanParameterBuilder.unit(3))).assertEqual('100 mm');
      expect(ScanOptionModel.roundFixed(100)).assertEqual(100);
      expect(ScanOptionModel.formatValue(result)).assertEqual('100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010053 end');
    });

    /**
     * @tc.name   testOptionMatrix010054
     * @tc.number SUB_SCAN_OPMATRIX_01_0054
     * @tc.desc   formatNumber(-3.25, unit 5) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010054 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -3.25, 'txt', false);
      expect(ScanOptionModel.formatNumber(-3.25, ScanParameterBuilder.unit(5))).assertEqual('-3.25 %');
      expect(ScanOptionModel.roundFixed(-3.25)).assertEqual(-3.25);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-3.25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010054 end');
    });

    /**
     * @tc.name   testOptionMatrix010055
     * @tc.number SUB_SCAN_OPMATRIX_01_0055
     * @tc.desc   formatNumber(0.5, unit 6) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010055 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0.5, 'txt', false);
      expect(ScanOptionModel.formatNumber(0.5, ScanParameterBuilder.unit(6))).assertEqual('0.5 us');
      expect(ScanOptionModel.roundFixed(0.5)).assertEqual(0.5);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0.5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010055 end');
    });

    /**
     * @tc.name   testOptionMatrix010056
     * @tc.number SUB_SCAN_OPMATRIX_01_0056
     * @tc.desc   formatNumber(9, unit 99) appends the frozen unit suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010056 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 9, 'txt', false);
      expect(ScanOptionModel.formatNumber(9, ScanParameterBuilder.unit(99))).assertEqual('9');
      expect(ScanOptionModel.roundFixed(9)).assertEqual(9);
      expect(ScanOptionModel.formatValue(result)).assertEqual('9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010056 end');
    });

    /**
     * @tc.name   testOptionMatrix010057
     * @tc.number SUB_SCAN_OPMATRIX_01_0057
     * @tc.desc   getTitle and getDetail pick the frozen field for param 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010057 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(0, 'n', '', '', 0, 0, 0))).assertEqual('n');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(0, 'n', '', '', 0, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010057 end');
    });

    /**
     * @tc.name   testOptionMatrix010058
     * @tc.number SUB_SCAN_OPMATRIX_01_0058
     * @tc.desc   getTitle and getDetail pick the frozen field for param 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010058 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(1, 'n', 't', '', 0, 0, 0))).assertEqual('t');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(1, 'n', 't', '', 0, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010058 end');
    });

    /**
     * @tc.name   testOptionMatrix010059
     * @tc.number SUB_SCAN_OPMATRIX_01_0059
     * @tc.desc   getTitle and getDetail pick the frozen field for param 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010059 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(2, '', '', 'd', 0, 0, 0))).assertEqual('');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(2, '', '', 'd', 0, 0, 0))).assertEqual('d');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010059 end');
    });

    /**
     * @tc.name   testOptionMatrix010060
     * @tc.number SUB_SCAN_OPMATRIX_01_0060
     * @tc.desc   getTitle and getDetail pick the frozen field for param 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010060 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(3, 'a', 'b', 'c', 0, 0, 0))).assertEqual('b');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(3, 'a', 'b', 'c', 0, 0, 0))).assertEqual('c');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010060 end');
    });

    /**
     * @tc.name   testOptionMatrix010061
     * @tc.number SUB_SCAN_OPMATRIX_01_0061
     * @tc.desc   getTitle and getDetail pick the frozen field for param 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010061 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(4, '', 'x', '', 0, 0, 0))).assertEqual('x');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(4, '', 'x', '', 0, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010061 end');
    });

    /**
     * @tc.name   testOptionMatrix010062
     * @tc.number SUB_SCAN_OPMATRIX_01_0062
     * @tc.desc   getTitle and getDetail pick the frozen field for param 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010062 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(5, 'k', '', 'y', 0, 0, 0))).assertEqual('k');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(5, 'k', '', 'y', 0, 0, 0))).assertEqual('y');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010062 end');
    });

    /**
     * @tc.name   testOptionMatrix010063
     * @tc.number SUB_SCAN_OPMATRIX_01_0063
     * @tc.desc   getTitle and getDetail pick the frozen field for param 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010063 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(6, 'p', 'q', 'r', 0, 0, 0))).assertEqual('q');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(6, 'p', 'q', 'r', 0, 0, 0))).assertEqual('r');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010063 end');
    });

    /**
     * @tc.name   testOptionMatrix010064
     * @tc.number SUB_SCAN_OPMATRIX_01_0064
     * @tc.desc   getTitle and getDetail pick the frozen field for param 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010064 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(7, '', '', '', 0, 0, 0))).assertEqual('');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(7, '', '', '', 0, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010064 end');
    });

    /**
     * @tc.name   testOptionMatrix010065
     * @tc.number SUB_SCAN_OPMATRIX_01_0065
     * @tc.desc   getTitle and getDetail pick the frozen field for param 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010065 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(8, 'u', '', 'v', 0, 0, 0))).assertEqual('u');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(8, 'u', '', 'v', 0, 0, 0))).assertEqual('v');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010065 end');
    });

    /**
     * @tc.name   testOptionMatrix010066
     * @tc.number SUB_SCAN_OPMATRIX_01_0066
     * @tc.desc   getTitle and getDetail pick the frozen field for param 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010066 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(9, '', 'w', '', 0, 0, 0))).assertEqual('w');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(9, '', 'w', '', 0, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010066 end');
    });

    /**
     * @tc.name   testOptionMatrix010067
     * @tc.number SUB_SCAN_OPMATRIX_01_0067
     * @tc.desc   getTitle and getDetail pick the frozen field for param 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010067 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(10, 'm', 'n', '', 0, 0, 0))).assertEqual('n');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(10, 'm', 'n', '', 0, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010067 end');
    });

    /**
     * @tc.name   testOptionMatrix010068
     * @tc.number SUB_SCAN_OPMATRIX_01_0068
     * @tc.desc   getTitle and getDetail pick the frozen field for param 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010068 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'txt', true);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(11, 'o', '', 'p', 0, 0, 0))).assertEqual('o');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(11, 'o', '', 'p', 0, 0, 0))).assertEqual('p');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010068 end');
    });

    /**
     * @tc.name   testOptionMatrix010069
     * @tc.number SUB_SCAN_OPMATRIX_01_0069
     * @tc.desc   toItem for constraint 0 type 0 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010069 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 0)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 0)).editable).assertEqual(false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 0)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010069 end');
    });

    /**
     * @tc.name   testOptionMatrix010070
     * @tc.number SUB_SCAN_OPMATRIX_01_0070
     * @tc.desc   toItem for constraint 0 type 1 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010070 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 1)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 1)).editable).assertEqual(false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 1)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010070 end');
    });

    /**
     * @tc.name   testOptionMatrix010071
     * @tc.number SUB_SCAN_OPMATRIX_01_0071
     * @tc.desc   toItem for constraint 0 type 2 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010071 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 2)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 2)).editable).assertEqual(false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 2)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010071 end');
    });

    /**
     * @tc.name   testOptionMatrix010072
     * @tc.number SUB_SCAN_OPMATRIX_01_0072
     * @tc.desc   toItem for constraint 1 type 0 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010072 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 0)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 0)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 0)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010072 end');
    });

    /**
     * @tc.name   testOptionMatrix010073
     * @tc.number SUB_SCAN_OPMATRIX_01_0073
     * @tc.desc   toItem for constraint 1 type 1 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010073 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 1)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 1)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 1)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010073 end');
    });

    /**
     * @tc.name   testOptionMatrix010074
     * @tc.number SUB_SCAN_OPMATRIX_01_0074
     * @tc.desc   toItem for constraint 1 type 2 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010074 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 2)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 2)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 2)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010074 end');
    });

    /**
     * @tc.name   testOptionMatrix010075
     * @tc.number SUB_SCAN_OPMATRIX_01_0075
     * @tc.desc   toItem for constraint 2 type 0 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010075 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 0)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 0)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 0)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010075 end');
    });

    /**
     * @tc.name   testOptionMatrix010076
     * @tc.number SUB_SCAN_OPMATRIX_01_0076
     * @tc.desc   toItem for constraint 2 type 1 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010076 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 1)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 1)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 1)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010076 end');
    });

    /**
     * @tc.name   testOptionMatrix010077
     * @tc.number SUB_SCAN_OPMATRIX_01_0077
     * @tc.desc   toItem for constraint 2 type 2 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010077 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 2)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 2)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 2)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010077 end');
    });

    /**
     * @tc.name   testOptionMatrix010078
     * @tc.number SUB_SCAN_OPMATRIX_01_0078
     * @tc.desc   toItem for constraint 3 type 0 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010078 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 0)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 0)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 0)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010078 end');
    });

    /**
     * @tc.name   testOptionMatrix010079
     * @tc.number SUB_SCAN_OPMATRIX_01_0079
     * @tc.desc   toItem for constraint 3 type 1 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010079 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 1)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 1)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 1)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010079 end');
    });

    /**
     * @tc.name   testOptionMatrix010080
     * @tc.number SUB_SCAN_OPMATRIX_01_0080
     * @tc.desc   toItem for constraint 3 type 2 carries the frozen kind and editable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010080 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 2)).title).assertEqual('Scan option');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 2)).editable).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 2)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010080 end');
    });

    /**
     * @tc.name   testOptionMatrix010081
     * @tc.number SUB_SCAN_OPMATRIX_01_0081
     * @tc.desc   item list helper case 0 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010081 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.buildItems(ScanParameterBuilder.noParams()).length).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(0))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010081 end');
    });

    /**
     * @tc.name   testOptionMatrix010082
     * @tc.number SUB_SCAN_OPMATRIX_01_0082
     * @tc.desc   item list helper case 1 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010082 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(ScanParameterBuilder.noParams())).length
      ).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(1))).assertEqual('px');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010082 end');
    });

    /**
     * @tc.name   testOptionMatrix010083
     * @tc.number SUB_SCAN_OPMATRIX_01_0083
     * @tc.desc   item list helper case 2 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010083 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(
        ScanOptionModel.sortByIndex(ScanOptionModel.buildItems(ScanParameterBuilder.noParams())).length
      ).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(2))).assertEqual('bit');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010083 end');
    });

    /**
     * @tc.name   testOptionMatrix010084
     * @tc.number SUB_SCAN_OPMATRIX_01_0084
     * @tc.desc   item list helper case 3 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010084 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'txt', true);
      expect(ScanOptionModel.formatNumber(1, ScanParameterBuilder.unit(2))).assertEqual('1 bit');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(3))).assertEqual('mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010084 end');
    });

    /**
     * @tc.name   testOptionMatrix010085
     * @tc.number SUB_SCAN_OPMATRIX_01_0085
     * @tc.desc   item list helper case 4 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010085 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.formatNumber(1, ScanParameterBuilder.unit(3))).assertEqual('1 mm');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(4))).assertEqual('dpi');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010085 end');
    });

    /**
     * @tc.name   testOptionMatrix010086
     * @tc.number SUB_SCAN_OPMATRIX_01_0086
     * @tc.desc   item list helper case 5 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010086 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.countEditable(ScanOptionModel.buildItems(ScanParameterBuilder.noParams()))).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(5))).assertEqual('%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010086 end');
    });

    /**
     * @tc.name   testOptionMatrix010087
     * @tc.number SUB_SCAN_OPMATRIX_01_0087
     * @tc.desc   item list helper case 6 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010087 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7, 'txt', true);
      expect(ScanOptionModel.countEditable(ScanOptionModel.buildItems(ScanParameterBuilder.noParams()))).assertEqual(0);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(6))).assertEqual('us');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010087 end');
    });

    /**
     * @tc.name   testOptionMatrix010088
     * @tc.number SUB_SCAN_OPMATRIX_01_0088
     * @tc.desc   item list helper case 7 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010088 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'txt', true);
      expect(ScanOptionModel.formatNumber(0, ScanParameterBuilder.unit(1))).assertEqual('0 px');
      expect(ScanOptionModel.formatValue(result)).assertEqual('txt');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(7))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010088 end');
    });

    /**
     * @tc.name   testOptionMatrix010089
     * @tc.number SUB_SCAN_OPMATRIX_01_0089
     * @tc.desc   item list helper case 8 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010089 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(0))).assertEqual('false');
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(8))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010089 end');
    });

    /**
     * @tc.name   testOptionMatrix010090
     * @tc.number SUB_SCAN_OPMATRIX_01_0090
     * @tc.desc   item list helper case 9 yields the frozen result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOptionMatrix010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010090 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', true);
      expect(ScanOptionModel.formatValue(ScanParameterBuilder.bareOptionValue(3))).assertEqual('');
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      expect(ScanOptionModel.getUnitText(ScanParameterBuilder.unit(9))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOptionMatrix010090 end');
    });

  });
}
