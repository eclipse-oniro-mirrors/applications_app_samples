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
import { ScanConstraintKind } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanOptionModel } from '../../../main/ets/scan/model/ScanOptionViewModel';
import { ScanOptionValueParser } from '../../../main/ets/scan/model/ScanOptionValueParser';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanOptionTopupVolume01Test() {
  describe('ScanOptionTopup', () => {

    /**
     * @tc.name   testOption020001
     * @tc.number SUB_SCAN_OPTION_03_0001
     * @tc.desc   formatValue type 0 value 1 prints 'true'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020001 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 1, 'x', true);
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      expect(ScanOptionValueParser.asText(result)).assertEqual('on');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020001 end');
    });

    /**
     * @tc.name   testOption020002
     * @tc.number SUB_SCAN_OPTION_03_0002
     * @tc.desc   formatValue type 0 value 0 prints 'false'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020002 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 0, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('false');
      expect(ScanOptionValueParser.asText(result)).assertEqual('off');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020002 end');
    });

    /**
     * @tc.name   testOption020003
     * @tc.number SUB_SCAN_OPTION_03_0003
     * @tc.desc   formatValue type 0 value 1 prints 'true'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020003 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 1, 'x', true);
      expect(ScanOptionModel.formatValue(result)).assertEqual('true');
      expect(ScanOptionValueParser.asText(result)).assertEqual('on');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020003 end');
    });

    /**
     * @tc.name   testOption020004
     * @tc.number SUB_SCAN_OPTION_03_0004
     * @tc.desc   formatValue type 0 value 0 prints 'false'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020004 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 0, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('false');
      expect(ScanOptionValueParser.asText(result)).assertEqual('off');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020004 end');
    });

    /**
     * @tc.name   testOption020005
     * @tc.number SUB_SCAN_OPTION_03_0005
     * @tc.desc   formatValue type 1 value 7 prints '7'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020005 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7');
      expect(ScanOptionValueParser.asText(result)).assertEqual('7');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020005 end');
    });

    /**
     * @tc.name   testOption020006
     * @tc.number SUB_SCAN_OPTION_03_0006
     * @tc.desc   formatValue type 1 value 3.7 prints '4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020006 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 3.7, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('4');
      expect(ScanOptionValueParser.asText(result)).assertEqual('4');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020006 end');
    });

    /**
     * @tc.name   testOption020007
     * @tc.number SUB_SCAN_OPTION_03_0007
     * @tc.desc   formatValue type 1 value -3.7 prints '-4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020007 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, -3.7, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-4');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-4');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020007 end');
    });

    /**
     * @tc.name   testOption020008
     * @tc.number SUB_SCAN_OPTION_03_0008
     * @tc.desc   formatValue type 1 value -0.4 prints '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020008 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, -0.4, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      expect(ScanOptionValueParser.asText(result)).assertEqual('0');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020008 end');
    });

    /**
     * @tc.name   testOption020009
     * @tc.number SUB_SCAN_OPTION_03_0009
     * @tc.desc   formatValue type 1 value 0 prints '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020009 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      expect(ScanOptionValueParser.asText(result)).assertEqual('0');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020009 end');
    });

    /**
     * @tc.name   testOption020010
     * @tc.number SUB_SCAN_OPTION_03_0010
     * @tc.desc   formatValue type 1 value 2.5 prints '3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020010 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 2.5, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('3');
      expect(ScanOptionValueParser.asText(result)).assertEqual('3');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020010 end');
    });

    /**
     * @tc.name   testOption020011
     * @tc.number SUB_SCAN_OPTION_03_0011
     * @tc.desc   formatValue type 1 value -2.5 prints '-2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020011 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, -2.5, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-2');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-2');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020011 end');
    });

    /**
     * @tc.name   testOption020012
     * @tc.number SUB_SCAN_OPTION_03_0012
     * @tc.desc   formatValue type 1 value 1000.6 prints '1001'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020012 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 1000.6, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('1001');
      expect(ScanOptionValueParser.asText(result)).assertEqual('1001');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020012 end');
    });

    /**
     * @tc.name   testOption020013
     * @tc.number SUB_SCAN_OPTION_03_0013
     * @tc.desc   formatValue type 1 value -1000.4 prints '-1000'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020013 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, -1000.4, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-1000');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-1000');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020013 end');
    });

    /**
     * @tc.name   testOption020014
     * @tc.number SUB_SCAN_OPTION_03_0014
     * @tc.desc   formatValue type 2 value 7.25 prints '7.25'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020014 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.25, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7.25');
      expect(ScanOptionValueParser.asText(result)).assertEqual('7.25');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020014 end');
    });

    /**
     * @tc.name   testOption020015
     * @tc.number SUB_SCAN_OPTION_03_0015
     * @tc.desc   formatValue type 2 value 7.2 prints '7.2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020015 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.2, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('7.2');
      expect(ScanOptionValueParser.asText(result)).assertEqual('7.2');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020015 end');
    });

    /**
     * @tc.name   testOption020016
     * @tc.number SUB_SCAN_OPTION_03_0016
     * @tc.desc   formatValue type 2 value 0.5 prints '0.5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020016 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0.5, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0.5');
      expect(ScanOptionValueParser.asText(result)).assertEqual('0.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020016 end');
    });

    /**
     * @tc.name   testOption020017
     * @tc.number SUB_SCAN_OPTION_03_0017
     * @tc.desc   formatValue type 2 value 3.14 prints '3.14'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020017 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 3.14, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('3.14');
      expect(ScanOptionValueParser.asText(result)).assertEqual('3.14');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020017 end');
    });

    /**
     * @tc.name   testOption020018
     * @tc.number SUB_SCAN_OPTION_03_0018
     * @tc.desc   formatValue type 2 value 2.5 prints '2.5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020018 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 2.5, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('2.5');
      expect(ScanOptionValueParser.asText(result)).assertEqual('2.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020018 end');
    });

    /**
     * @tc.name   testOption020019
     * @tc.number SUB_SCAN_OPTION_03_0019
     * @tc.desc   formatValue type 2 value -1.25 prints '-1.25'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020019 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -1.25, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-1.25');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-1.25');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020019 end');
    });

    /**
     * @tc.name   testOption020020
     * @tc.number SUB_SCAN_OPTION_03_0020
     * @tc.desc   formatValue type 2 value 0 prints '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020020 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      expect(ScanOptionValueParser.asText(result)).assertEqual('0');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020020 end');
    });

    /**
     * @tc.name   testOption020021
     * @tc.number SUB_SCAN_OPTION_03_0021
     * @tc.desc   formatValue type 2 value 1.1 prints '1.1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020021 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 1.1, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('1.1');
      expect(ScanOptionValueParser.asText(result)).assertEqual('1.1');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020021 end');
    });

    /**
     * @tc.name   testOption020022
     * @tc.number SUB_SCAN_OPTION_03_0022
     * @tc.desc   formatValue type 2 value -0.5 prints '-0.5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020022 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -0.5, 'x', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-0.5');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-0.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020022 end');
    });

    /**
     * @tc.name   testOption020023
     * @tc.number SUB_SCAN_OPTION_03_0023
     * @tc.desc   formatValue type 3 value '' prints ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020023 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, '', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('');
      expect(ScanOptionValueParser.asText(result)).assertEqual('');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020023 end');
    });

    /**
     * @tc.name   testOption020024
     * @tc.number SUB_SCAN_OPTION_03_0024
     * @tc.desc   formatValue type 3 value 'abc' prints 'abc'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020024 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'abc', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('abc');
      expect(ScanOptionValueParser.asText(result)).assertEqual('abc');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020024 end');
    });

    /**
     * @tc.name   testOption020025
     * @tc.number SUB_SCAN_OPTION_03_0025
     * @tc.desc   formatValue type 3 value '0' prints '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020025 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, '0', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('0');
      expect(ScanOptionValueParser.asText(result)).assertEqual('0');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020025 end');
    });

    /**
     * @tc.name   testOption020026
     * @tc.number SUB_SCAN_OPTION_03_0026
     * @tc.desc   formatValue type 3 value '12.5' prints '12.5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020026 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, '12.5', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('12.5');
      expect(ScanOptionValueParser.asText(result)).assertEqual('12.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020026 end');
    });

    /**
     * @tc.name   testOption020027
     * @tc.number SUB_SCAN_OPTION_03_0027
     * @tc.desc   formatValue type 3 value '-3' prints '-3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020027 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, '-3', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('-3');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-3');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020027 end');
    });

    /**
     * @tc.name   testOption020028
     * @tc.number SUB_SCAN_OPTION_03_0028
     * @tc.desc   formatValue type 3 value 'pdf ' prints 'pdf '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020028 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'pdf ', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('pdf ');
      expect(ScanOptionValueParser.asText(result)).assertEqual('pdf ');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020028 end');
    });

    /**
     * @tc.name   testOption020029
     * @tc.number SUB_SCAN_OPTION_03_0029
     * @tc.desc   formatValue type 3 value 'TRUE' prints 'TRUE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020029 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'TRUE', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('TRUE');
      expect(ScanOptionValueParser.asText(result)).assertEqual('TRUE');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020029 end');
    });

    /**
     * @tc.name   testOption020030
     * @tc.number SUB_SCAN_OPTION_03_0030
     * @tc.desc   formatValue type 3 value 'x y' prints 'x y'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020030 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'x y', false);
      expect(ScanOptionModel.formatValue(result)).assertEqual('x y');
      expect(ScanOptionValueParser.asText(result)).assertEqual('x y');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020030 end');
    });

    /**
     * @tc.name   testOption020031
     * @tc.number SUB_SCAN_OPTION_03_0031
     * @tc.desc   editable ct=0 ot=0 counts 0 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020031 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 0)).editable).assertEqual(false);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(0, 0)]))
      ).assertEqual(0);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 0)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020031 end');
    });

    /**
     * @tc.name   testOption020032
     * @tc.number SUB_SCAN_OPTION_03_0032
     * @tc.desc   editable ct=0 ot=1 counts 0 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020032 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 1)).editable).assertEqual(false);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(0, 1)]))
      ).assertEqual(0);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 1)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020032 end');
    });

    /**
     * @tc.name   testOption020033
     * @tc.number SUB_SCAN_OPTION_03_0033
     * @tc.desc   editable ct=0 ot=2 counts 0 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020033 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 2)).editable).assertEqual(false);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(0, 2)]))
      ).assertEqual(0);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 2)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020033 end');
    });

    /**
     * @tc.name   testOption020034
     * @tc.number SUB_SCAN_OPTION_03_0034
     * @tc.desc   editable ct=0 ot=3 counts 0 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020034 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 3)).editable).assertEqual(false);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(0, 3)]))
      ).assertEqual(0);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 3)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020034 end');
    });

    /**
     * @tc.name   testOption020035
     * @tc.number SUB_SCAN_OPTION_03_0035
     * @tc.desc   editable ct=1 ot=0 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020035 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 0)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(1, 0)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 0)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020035 end');
    });

    /**
     * @tc.name   testOption020036
     * @tc.number SUB_SCAN_OPTION_03_0036
     * @tc.desc   editable ct=1 ot=1 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020036 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 1)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(1, 1)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 1)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020036 end');
    });

    /**
     * @tc.name   testOption020037
     * @tc.number SUB_SCAN_OPTION_03_0037
     * @tc.desc   editable ct=1 ot=2 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020037 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 2)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(1, 2)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 2)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020037 end');
    });

    /**
     * @tc.name   testOption020038
     * @tc.number SUB_SCAN_OPTION_03_0038
     * @tc.desc   editable ct=1 ot=3 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020038 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 3)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(1, 3)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 3)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020038 end');
    });

    /**
     * @tc.name   testOption020039
     * @tc.number SUB_SCAN_OPTION_03_0039
     * @tc.desc   editable ct=2 ot=0 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020039 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 0)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(2, 0)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 0)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020039 end');
    });

    /**
     * @tc.name   testOption020040
     * @tc.number SUB_SCAN_OPTION_03_0040
     * @tc.desc   editable ct=2 ot=1 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020040 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 1)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(2, 1)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 1)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020040 end');
    });

    /**
     * @tc.name   testOption020041
     * @tc.number SUB_SCAN_OPTION_03_0041
     * @tc.desc   editable ct=2 ot=2 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020041 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 2)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(2, 2)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 2)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020041 end');
    });

    /**
     * @tc.name   testOption020042
     * @tc.number SUB_SCAN_OPTION_03_0042
     * @tc.desc   editable ct=2 ot=3 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020042 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 3)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(2, 3)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 3)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020042 end');
    });

    /**
     * @tc.name   testOption020043
     * @tc.number SUB_SCAN_OPTION_03_0043
     * @tc.desc   editable ct=3 ot=0 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020043 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 0)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(3, 0)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 0)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020043 end');
    });

    /**
     * @tc.name   testOption020044
     * @tc.number SUB_SCAN_OPTION_03_0044
     * @tc.desc   editable ct=3 ot=1 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020044 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 1)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(3, 1)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 1)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020044 end');
    });

    /**
     * @tc.name   testOption020045
     * @tc.number SUB_SCAN_OPTION_03_0045
     * @tc.desc   editable ct=3 ot=2 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020045 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 2)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(3, 2)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 2)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020045 end');
    });

    /**
     * @tc.name   testOption020046
     * @tc.number SUB_SCAN_OPTION_03_0046
     * @tc.desc   editable ct=3 ot=3 counts 1 editable items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020046 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 3)).editable).assertEqual(true);
      expect(
        ScanOptionModel.countEditable(ScanOptionModel.buildItems([ScanParameterBuilder.build(3, 3)]))
      ).assertEqual(1);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 3)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020046 end');
    });

    /**
     * @tc.name   testOption020047
     * @tc.number SUB_SCAN_OPTION_03_0047
     * @tc.desc   filterByKind ct=0 with kind 0 keeps 1 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020047 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 0)]),
                 ScanConstraintKind.NONE).length
      ).assertEqual(1);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 0)]),
                 ScanConstraintKind.NONE).length === 0
      ).assertEqual(false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 0)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020047 end');
    });

    /**
     * @tc.name   testOption020048
     * @tc.number SUB_SCAN_OPTION_03_0048
     * @tc.desc   filterByKind ct=0 with kind 1 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020048 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 1)]),
                 ScanConstraintKind.RANGE).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 1)]),
                 ScanConstraintKind.RANGE).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 1)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020048 end');
    });

    /**
     * @tc.name   testOption020049
     * @tc.number SUB_SCAN_OPTION_03_0049
     * @tc.desc   filterByKind ct=0 with kind 2 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020049 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 2)]),
                 ScanConstraintKind.NUMBER_LIST).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 2)]),
                 ScanConstraintKind.NUMBER_LIST).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 2)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020049 end');
    });

    /**
     * @tc.name   testOption020050
     * @tc.number SUB_SCAN_OPTION_03_0050
     * @tc.desc   filterByKind ct=0 with kind 3 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020050 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 3)]),
                 ScanConstraintKind.STRING_LIST).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(0, 3)]),
                 ScanConstraintKind.STRING_LIST).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(0, 3)).kind).assertEqual(ScanConstraintKind.NONE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020050 end');
    });

    /**
     * @tc.name   testOption020051
     * @tc.number SUB_SCAN_OPTION_03_0051
     * @tc.desc   filterByKind ct=1 with kind 1 keeps 1 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020051 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 0)]),
                 ScanConstraintKind.RANGE).length
      ).assertEqual(1);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 0)]),
                 ScanConstraintKind.RANGE).length === 0
      ).assertEqual(false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 0)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020051 end');
    });

    /**
     * @tc.name   testOption020052
     * @tc.number SUB_SCAN_OPTION_03_0052
     * @tc.desc   filterByKind ct=1 with kind 2 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020052 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 1)]),
                 ScanConstraintKind.NUMBER_LIST).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 1)]),
                 ScanConstraintKind.NUMBER_LIST).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 1)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020052 end');
    });

    /**
     * @tc.name   testOption020053
     * @tc.number SUB_SCAN_OPTION_03_0053
     * @tc.desc   filterByKind ct=1 with kind 0 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020053 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 2)]),
                 ScanConstraintKind.NONE).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 2)]),
                 ScanConstraintKind.NONE).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 2)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020053 end');
    });

    /**
     * @tc.name   testOption020054
     * @tc.number SUB_SCAN_OPTION_03_0054
     * @tc.desc   filterByKind ct=2 with kind 2 keeps 1 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020054 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(2, 3)]),
                 ScanConstraintKind.NUMBER_LIST).length
      ).assertEqual(1);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(2, 3)]),
                 ScanConstraintKind.NUMBER_LIST).length === 0
      ).assertEqual(false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 3)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020054 end');
    });

    /**
     * @tc.name   testOption020055
     * @tc.number SUB_SCAN_OPTION_03_0055
     * @tc.desc   filterByKind ct=2 with kind 3 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020055 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(2, 0)]),
                 ScanConstraintKind.STRING_LIST).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(2, 0)]),
                 ScanConstraintKind.STRING_LIST).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 0)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020055 end');
    });

    /**
     * @tc.name   testOption020056
     * @tc.number SUB_SCAN_OPTION_03_0056
     * @tc.desc   filterByKind ct=2 with kind 1 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020056 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(2, 1)]),
                 ScanConstraintKind.RANGE).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(2, 1)]),
                 ScanConstraintKind.RANGE).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(2, 1)).kind).assertEqual(ScanConstraintKind.NUMBER_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020056 end');
    });

    /**
     * @tc.name   testOption020057
     * @tc.number SUB_SCAN_OPTION_03_0057
     * @tc.desc   filterByKind ct=3 with kind 3 keeps 1 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020057 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(3, 2)]),
                 ScanConstraintKind.STRING_LIST).length
      ).assertEqual(1);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(3, 2)]),
                 ScanConstraintKind.STRING_LIST).length === 0
      ).assertEqual(false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 2)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020057 end');
    });

    /**
     * @tc.name   testOption020058
     * @tc.number SUB_SCAN_OPTION_03_0058
     * @tc.desc   filterByKind ct=3 with kind 0 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020058 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(3, 3)]),
                 ScanConstraintKind.NONE).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(3, 3)]),
                 ScanConstraintKind.NONE).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 3)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020058 end');
    });

    /**
     * @tc.name   testOption020059
     * @tc.number SUB_SCAN_OPTION_03_0059
     * @tc.desc   filterByKind ct=3 with kind 2 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020059 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(3, 0)]),
                 ScanConstraintKind.NUMBER_LIST).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(3, 0)]),
                 ScanConstraintKind.NUMBER_LIST).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(3, 0)).kind).assertEqual(ScanConstraintKind.STRING_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020059 end');
    });

    /**
     * @tc.name   testOption020060
     * @tc.number SUB_SCAN_OPTION_03_0060
     * @tc.desc   filterByKind ct=1 with kind 3 keeps 0 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020060 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 1)]),
                 ScanConstraintKind.STRING_LIST).length
      ).assertEqual(0);
      expect(
        ScanOptionModel.filterByKind(ScanOptionModel.buildItems(
                [ScanParameterBuilder.build(1, 1)]),
                 ScanConstraintKind.STRING_LIST).length === 0
      ).assertEqual(true);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.build(1, 1)).kind).assertEqual(ScanConstraintKind.RANGE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020060 end');
    });

    /**
     * @tc.name   testOption020061
     * @tc.number SUB_SCAN_OPTION_03_0061
     * @tc.desc   index 0 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020061 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0)).optionIndex).assertEqual(0);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0)]),
                 0) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(0, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 0
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020061 end');
    });

    /**
     * @tc.name   testOption020062
     * @tc.number SUB_SCAN_OPTION_03_0062
     * @tc.desc   index 1 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020062 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0)).optionIndex).assertEqual(1);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0)]),
                 1) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(1, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 1
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020062 end');
    });

    /**
     * @tc.name   testOption020063
     * @tc.number SUB_SCAN_OPTION_03_0063
     * @tc.desc   index 2 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020063 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0)).optionIndex).assertEqual(2);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0)]),
                 2) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(2, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 2
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020063 end');
    });

    /**
     * @tc.name   testOption020064
     * @tc.number SUB_SCAN_OPTION_03_0064
     * @tc.desc   index 5 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020064 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0)).optionIndex).assertEqual(5);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0)]),
                 5) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(5, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 5
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020064 end');
    });

    /**
     * @tc.name   testOption020065
     * @tc.number SUB_SCAN_OPTION_03_0065
     * @tc.desc   index 7 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020065 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(7, 'n', 't', 'd', 0, 0, 0)).optionIndex).assertEqual(7);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(7, 'n', 't', 'd', 0, 0, 0)]),
                 7) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(7, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 7
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020065 end');
    });

    /**
     * @tc.name   testOption020066
     * @tc.number SUB_SCAN_OPTION_03_0066
     * @tc.desc   index 9 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020066 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(9, 'n', 't', 'd', 0, 0, 0)).optionIndex).assertEqual(9);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(9, 'n', 't', 'd', 0, 0, 0)]),
                 9) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(9, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 9
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020066 end');
    });

    /**
     * @tc.name   testOption020067
     * @tc.number SUB_SCAN_OPTION_03_0067
     * @tc.desc   index 10 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020067 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(10, 'n', 't', 'd', 0, 0, 0)).optionIndex
      ).assertEqual(10);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(10, 'n', 't', 'd', 0, 0, 0)]),
                 10) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(10, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 10
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020067 end');
    });

    /**
     * @tc.name   testOption020068
     * @tc.number SUB_SCAN_OPTION_03_0068
     * @tc.desc   index 100 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020068 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(100, 'n', 't', 'd', 0, 0, 0)).optionIndex
      ).assertEqual(100);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(100, 'n', 't', 'd', 0, 0, 0)]),
                 100) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(100, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 100
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020068 end');
    });

    /**
     * @tc.name   testOption020069
     * @tc.number SUB_SCAN_OPTION_03_0069
     * @tc.desc   index -1 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020069 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(-1, 'n', 't', 'd', 0, 0, 0)).optionIndex
      ).assertEqual(-1);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(-1, 'n', 't', 'd', 0, 0, 0)]),
                 -1) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(-1, 'n', 't', 'd', 0, 0, 0)])
                )[0] === -1
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020069 end');
    });

    /**
     * @tc.name   testOption020070
     * @tc.number SUB_SCAN_OPTION_03_0070
     * @tc.desc   index 3 flows through item find and index list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020070 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0)).optionIndex).assertEqual(3);
      expect(
        ScanOptionModel.findItem(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0)]),
                 3) === undefined
      ).assertEqual(false);
      expect(
        ScanOptionModel.toIndexList(ScanOptionModel.buildItems(
                [ScanParameterBuilder.param(3, 'n', 't', 'd', 0, 0, 0)])
                )[0] === 3
      ).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020070 end');
    });

    /**
     * @tc.name   testOption020071
     * @tc.number SUB_SCAN_OPTION_03_0071
     * @tc.desc   title fallback name 'n1' title '' detail 'd1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020071 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(0, 'n1', '', 'd1', 0, 0, 0))).assertEqual('n1');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(0, 'n1', '', 'd1', 0, 0, 0))).assertEqual('d1');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(0, 'n1', '', 'd1', 0, 0, 0)).unitText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020071 end');
    });

    /**
     * @tc.name   testOption020072
     * @tc.number SUB_SCAN_OPTION_03_0072
     * @tc.desc   title fallback name 'n1' title 't1' detail ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020072 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(1, 'n1', 't1', '', 1, 0, 0))).assertEqual('t1');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(1, 'n1', 't1', '', 1, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(1, 'n1', 't1', '', 1, 0, 0)).unitText).assertEqual('px');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020072 end');
    });

    /**
     * @tc.name   testOption020073
     * @tc.number SUB_SCAN_OPTION_03_0073
     * @tc.desc   title fallback name '' title '' detail ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020073 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(2, '', '', '', 2, 0, 0))).assertEqual('');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(2, '', '', '', 2, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(2, '', '', '', 2, 0, 0)).unitText).assertEqual('bit');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020073 end');
    });

    /**
     * @tc.name   testOption020074
     * @tc.number SUB_SCAN_OPTION_03_0074
     * @tc.desc   title fallback name 'n2' title '' detail ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020074 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(3, 'n2', '', '', 3, 0, 0))).assertEqual('n2');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(3, 'n2', '', '', 3, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(3, 'n2', '', '', 3, 0, 0)).unitText).assertEqual('mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020074 end');
    });

    /**
     * @tc.name   testOption020075
     * @tc.number SUB_SCAN_OPTION_03_0075
     * @tc.desc   title fallback name 'n2' title 't2' detail 'd2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020075 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(4, 'n2', 't2', 'd2', 4, 0, 0))).assertEqual('t2');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(4, 'n2', 't2', 'd2', 4, 0, 0))).assertEqual('d2');
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(4, 'n2', 't2', 'd2', 4, 0, 0)).unitText
      ).assertEqual('dpi');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020075 end');
    });

    /**
     * @tc.name   testOption020076
     * @tc.number SUB_SCAN_OPTION_03_0076
     * @tc.desc   title fallback name 'n3' title '' detail 'd3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020076 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(5, 'n3', '', 'd3', 5, 0, 0))).assertEqual('n3');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(5, 'n3', '', 'd3', 5, 0, 0))).assertEqual('d3');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(5, 'n3', '', 'd3', 5, 0, 0)).unitText).assertEqual('%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020076 end');
    });

    /**
     * @tc.name   testOption020077
     * @tc.number SUB_SCAN_OPTION_03_0077
     * @tc.desc   title fallback name 'n4' title 't4' detail 'd4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020077 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(6, 'n4', 't4', 'd4', 6, 0, 0))).assertEqual('t4');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(6, 'n4', 't4', 'd4', 6, 0, 0))).assertEqual('d4');
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(6, 'n4', 't4', 'd4', 6, 0, 0)).unitText
      ).assertEqual('us');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020077 end');
    });

    /**
     * @tc.name   testOption020078
     * @tc.number SUB_SCAN_OPTION_03_0078
     * @tc.desc   title fallback name 'n5' title '' detail 'd5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020078 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(7, 'n5', '', 'd5', 0, 0, 0))).assertEqual('n5');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(7, 'n5', '', 'd5', 0, 0, 0))).assertEqual('d5');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(7, 'n5', '', 'd5', 0, 0, 0)).unitText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020078 end');
    });

    /**
     * @tc.name   testOption020079
     * @tc.number SUB_SCAN_OPTION_03_0079
     * @tc.desc   title fallback name 'n6' title 't6' detail ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020079 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(8, 'n6', 't6', '', 1, 0, 0))).assertEqual('t6');
      expect(
        ScanOptionModel.getDetail(ScanParameterBuilder.param(8, 'n6', 't6', '', 1, 0, 0))
      ).assertEqual('scan_option_no_description');
      expect(ScanOptionModel.toItem(ScanParameterBuilder.param(8, 'n6', 't6', '', 1, 0, 0)).unitText).assertEqual('px');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020079 end');
    });

    /**
     * @tc.name   testOption020080
     * @tc.number SUB_SCAN_OPTION_03_0080
     * @tc.desc   title fallback name 'n7' title 't7' detail 'd7'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020080 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(9, 'n7', 't7', 'd7', 2, 0, 0))).assertEqual('t7');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(9, 'n7', 't7', 'd7', 2, 0, 0))).assertEqual('d7');
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(9, 'n7', 't7', 'd7', 2, 0, 0)).unitText
      ).assertEqual('bit');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020080 end');
    });

    /**
     * @tc.name   testOption020081
     * @tc.number SUB_SCAN_OPTION_03_0081
     * @tc.desc   title fallback name 'n8' title '' detail 'x8'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020081 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(10, 'n8', '', 'x8', 3, 0, 0))).assertEqual('n8');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(10, 'n8', '', 'x8', 3, 0, 0))).assertEqual('x8');
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(10, 'n8', '', 'x8', 3, 0, 0)).unitText
      ).assertEqual('mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020081 end');
    });

    /**
     * @tc.name   testOption020082
     * @tc.number SUB_SCAN_OPTION_03_0082
     * @tc.desc   title fallback name 'n9' title 't9' detail 'd9'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020082 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'x', false);
      expect(ScanOptionModel.getTitle(ScanParameterBuilder.param(11, 'n9', 't9', 'd9', 4, 0, 0))).assertEqual('t9');
      expect(ScanOptionModel.getDetail(ScanParameterBuilder.param(11, 'n9', 't9', 'd9', 4, 0, 0))).assertEqual('d9');
      expect(
        ScanOptionModel.toItem(ScanParameterBuilder.param(11, 'n9', 't9', 'd9', 4, 0, 0)).unitText
      ).assertEqual('dpi');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020082 end');
    });

    /**
     * @tc.name   testOption020083
     * @tc.number SUB_SCAN_OPTION_03_0083
     * @tc.desc   roundFixed(0.125) lands on 0.13 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020083 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0.125, 'x', false);
      expect(ScanOptionModel.roundFixed(0.125)).assertEqual(0.13);
      expect(ScanOptionModel.formatNumber(0.125, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('0.13');
      expect(ScanOptionModel.formatNumber(0.125, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('0.13 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020083 end');
    });

    /**
     * @tc.name   testOption020084
     * @tc.number SUB_SCAN_OPTION_03_0084
     * @tc.desc   roundFixed(0.375) lands on 0.38 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020084 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0.375, 'x', false);
      expect(ScanOptionModel.roundFixed(0.375)).assertEqual(0.38);
      expect(ScanOptionModel.formatNumber(0.375, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('0.38');
      expect(ScanOptionModel.formatNumber(0.375, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('0.38 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020084 end');
    });

    /**
     * @tc.name   testOption020085
     * @tc.number SUB_SCAN_OPTION_03_0085
     * @tc.desc   roundFixed(0.625) lands on 0.63 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020085 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0.625, 'x', false);
      expect(ScanOptionModel.roundFixed(0.625)).assertEqual(0.63);
      expect(ScanOptionModel.formatNumber(0.625, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('0.63');
      expect(ScanOptionModel.formatNumber(0.625, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('0.63 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020085 end');
    });

    /**
     * @tc.name   testOption020086
     * @tc.number SUB_SCAN_OPTION_03_0086
     * @tc.desc   roundFixed(0.875) lands on 0.88 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020086 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0.875, 'x', false);
      expect(ScanOptionModel.roundFixed(0.875)).assertEqual(0.88);
      expect(ScanOptionModel.formatNumber(0.875, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('0.88');
      expect(ScanOptionModel.formatNumber(0.875, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('0.88 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020086 end');
    });

    /**
     * @tc.name   testOption020087
     * @tc.number SUB_SCAN_OPTION_03_0087
     * @tc.desc   roundFixed(0.5) lands on 0.5 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020087 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0.5, 'x', false);
      expect(ScanOptionModel.roundFixed(0.5)).assertEqual(0.5);
      expect(ScanOptionModel.formatNumber(0.5, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('0.5');
      expect(ScanOptionModel.formatNumber(0.5, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('0.5 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020087 end');
    });

    /**
     * @tc.name   testOption020088
     * @tc.number SUB_SCAN_OPTION_03_0088
     * @tc.desc   roundFixed(0.25) lands on 0.25 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020088 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0.25, 'x', false);
      expect(ScanOptionModel.roundFixed(0.25)).assertEqual(0.25);
      expect(ScanOptionModel.formatNumber(0.25, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('0.25');
      expect(ScanOptionModel.formatNumber(0.25, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('0.25 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020088 end');
    });

    /**
     * @tc.name   testOption020089
     * @tc.number SUB_SCAN_OPTION_03_0089
     * @tc.desc   roundFixed(1.125) lands on 1.13 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020089 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 1.125, 'x', false);
      expect(ScanOptionModel.roundFixed(1.125)).assertEqual(1.13);
      expect(ScanOptionModel.formatNumber(1.125, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('1.13');
      expect(ScanOptionModel.formatNumber(1.125, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('1.13 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020089 end');
    });

    /**
     * @tc.name   testOption020090
     * @tc.number SUB_SCAN_OPTION_03_0090
     * @tc.desc   roundFixed(2.625) lands on 2.63 with suffix form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOption020090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020090 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 2.625, 'x', false);
      expect(ScanOptionModel.roundFixed(2.625)).assertEqual(2.63);
      expect(ScanOptionModel.formatNumber(2.625, scan.PhysicalUnit.SCAN_UNIT_NONE)).assertEqual('2.63');
      expect(ScanOptionModel.formatNumber(2.625, scan.PhysicalUnit.SCAN_UNIT_MM)).assertEqual('2.63 mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOption020090 end');
    });

  });
}
