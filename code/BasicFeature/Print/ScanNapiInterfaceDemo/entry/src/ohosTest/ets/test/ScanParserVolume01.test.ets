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
import { ScanOptionValueParser } from '../../../main/ets/scan/model/ScanOptionValueParser';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanParserVolume01Test() {
  describe('ScanParser', () => {

    /**
     * @tc.name   testParser010001
     * @tc.number SUB_SCAN_PARSE_01_0001
     * @tc.desc   asNumber and asText convert type 0 bool true to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010001 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7.25, '12.5', true);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      expect(ScanOptionValueParser.asText(result)).assertEqual('on');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010001 end');
    });

    /**
     * @tc.name   testParser010002
     * @tc.number SUB_SCAN_PARSE_01_0002
     * @tc.desc   asNumber and asText convert type 0 bool false to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010002 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7.25, '12.5', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.asText(result)).assertEqual('off');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010002 end');
    });

    /**
     * @tc.name   testParser010003
     * @tc.number SUB_SCAN_PARSE_01_0003
     * @tc.desc   asNumber and asText convert type 1 bool true to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010003 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7.25, '12.5', true);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7.25);
      expect(ScanOptionValueParser.asText(result)).assertEqual('7');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010003 end');
    });

    /**
     * @tc.name   testParser010004
     * @tc.number SUB_SCAN_PARSE_01_0004
     * @tc.desc   asNumber and asText convert type 1 bool false to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010004 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7.25, '12.5', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7.25);
      expect(ScanOptionValueParser.asText(result)).assertEqual('7');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010004 end');
    });

    /**
     * @tc.name   testParser010005
     * @tc.number SUB_SCAN_PARSE_01_0005
     * @tc.desc   asNumber and asText convert type 2 bool true to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010005 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.25, '12.5', true);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7.25);
      expect(ScanOptionValueParser.asText(result)).assertEqual('7.25');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010005 end');
    });

    /**
     * @tc.name   testParser010006
     * @tc.number SUB_SCAN_PARSE_01_0006
     * @tc.desc   asNumber and asText convert type 2 bool false to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010006 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 7.25, '12.5', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7.25);
      expect(ScanOptionValueParser.asText(result)).assertEqual('7.25');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010006 end');
    });

    /**
     * @tc.name   testParser010007
     * @tc.number SUB_SCAN_PARSE_01_0007
     * @tc.desc   asNumber and asText convert type 3 bool true to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010007 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7.25, '12.5', true);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(12.5);
      expect(ScanOptionValueParser.asText(result)).assertEqual('12.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010007 end');
    });

    /**
     * @tc.name   testParser010008
     * @tc.number SUB_SCAN_PARSE_01_0008
     * @tc.desc   asNumber and asText convert type 3 bool false to frozen text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010008 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7.25, '12.5', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(12.5);
      expect(ScanOptionValueParser.asText(result)).assertEqual('12.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010008 end');
    });

    /**
     * @tc.name   testParser010009
     * @tc.number SUB_SCAN_PARSE_01_0009
     * @tc.desc   asNumber and asText convert type 0 value -7 str 'x'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010009 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, -7, 'x', true);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      expect(ScanOptionValueParser.asText(result)).assertEqual('on');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010009 end');
    });

    /**
     * @tc.name   testParser010010
     * @tc.number SUB_SCAN_PARSE_01_0010
     * @tc.desc   asNumber and asText convert type 1 value 3.75 str 'x'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010010 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 3.75, 'x', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(3.75);
      expect(ScanOptionValueParser.asText(result)).assertEqual('4');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010010 end');
    });

    /**
     * @tc.name   testParser010011
     * @tc.number SUB_SCAN_PARSE_01_0011
     * @tc.desc   asNumber and asText convert type 2 value -0.5 str 'x'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010011 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -0.5, 'x', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(-0.5);
      expect(ScanOptionValueParser.asText(result)).assertEqual('-0.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010011 end');
    });

    /**
     * @tc.name   testParser010012
     * @tc.number SUB_SCAN_PARSE_01_0012
     * @tc.desc   asNumber and asText convert type 3 value -9 str '-9'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010012 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, -9, '-9', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(-9);
      expect(ScanOptionValueParser.asText(result)).assertEqual('-9');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010012 end');
    });

    /**
     * @tc.name   testParser010013
     * @tc.number SUB_SCAN_PARSE_01_0013
     * @tc.desc   asNumber and asText convert type 1 value 0 str 'x'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010013 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0, 'x', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.asText(result)).assertEqual('0');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010013 end');
    });

    /**
     * @tc.name   testParser010014
     * @tc.number SUB_SCAN_PARSE_01_0014
     * @tc.desc   string value '' parses to 0 with numeric false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010014 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.isNumeric('')).assertEqual(false);
      expect(ScanOptionValueParser.asText(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010014 end');
    });

    /**
     * @tc.name   testParser010015
     * @tc.number SUB_SCAN_PARSE_01_0015
     * @tc.desc   string value '0' parses to 0 with numeric true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010015 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '0', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.isNumeric('0')).assertEqual(true);
      expect(ScanOptionValueParser.asText(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010015 end');
    });

    /**
     * @tc.name   testParser010016
     * @tc.number SUB_SCAN_PARSE_01_0016
     * @tc.desc   string value '-3' parses to -3 with numeric true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010016 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '-3', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(-3);
      expect(ScanOptionValueParser.isNumeric('-3')).assertEqual(true);
      expect(ScanOptionValueParser.asText(result)).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010016 end');
    });

    /**
     * @tc.name   testParser010017
     * @tc.number SUB_SCAN_PARSE_01_0017
     * @tc.desc   string value '3.14' parses to 3.14 with numeric true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010017 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '3.14', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(3.14);
      expect(ScanOptionValueParser.isNumeric('3.14')).assertEqual(true);
      expect(ScanOptionValueParser.asText(result)).assertEqual('3.14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010017 end');
    });

    /**
     * @tc.name   testParser010018
     * @tc.number SUB_SCAN_PARSE_01_0018
     * @tc.desc   string value '12.345' parses to 12.35 with numeric true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010018 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '12.345', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(12.35);
      expect(ScanOptionValueParser.isNumeric('12.345')).assertEqual(true);
      expect(ScanOptionValueParser.asText(result)).assertEqual('12.345');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010018 end');
    });

    /**
     * @tc.name   testParser010019
     * @tc.number SUB_SCAN_PARSE_01_0019
     * @tc.desc   string value '1e3' parses to 1000 with numeric false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010019 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '1e3', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1000);
      expect(ScanOptionValueParser.isNumeric('1e3')).assertEqual(false);
      expect(ScanOptionValueParser.asText(result)).assertEqual('1e3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010019 end');
    });

    /**
     * @tc.name   testParser010020
     * @tc.number SUB_SCAN_PARSE_01_0020
     * @tc.desc   string value 'abc' parses to 0 with numeric false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010020 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, 'abc', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.isNumeric('abc')).assertEqual(false);
      expect(ScanOptionValueParser.asText(result)).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010020 end');
    });

    /**
     * @tc.name   testParser010021
     * @tc.number SUB_SCAN_PARSE_01_0021
     * @tc.desc   string value '12abc' parses to 0 with numeric false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010021 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '12abc', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.isNumeric('12abc')).assertEqual(false);
      expect(ScanOptionValueParser.asText(result)).assertEqual('12abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010021 end');
    });

    /**
     * @tc.name   testParser010022
     * @tc.number SUB_SCAN_PARSE_01_0022
     * @tc.desc   string value 'abc12' parses to 0 with numeric false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010022 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, 'abc12', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.isNumeric('abc12')).assertEqual(false);
      expect(ScanOptionValueParser.asText(result)).assertEqual('abc12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010022 end');
    });

    /**
     * @tc.name   testParser010023
     * @tc.number SUB_SCAN_PARSE_01_0023
     * @tc.desc   string value '1.2.3' parses to 0 with numeric true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010023 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '1.2.3', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.isNumeric('1.2.3')).assertEqual(true);
      expect(ScanOptionValueParser.asText(result)).assertEqual('1.2.3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010023 end');
    });

    /**
     * @tc.name   testParser010024
     * @tc.number SUB_SCAN_PARSE_01_0024
     * @tc.desc   string value '--5' parses to 0 with numeric true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010024 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, '--5', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      expect(ScanOptionValueParser.isNumeric('--5')).assertEqual(true);
      expect(ScanOptionValueParser.asText(result)).assertEqual('--5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010024 end');
    });

    /**
     * @tc.name   testParser010025
     * @tc.number SUB_SCAN_PARSE_01_0025
     * @tc.desc   string value ' 7' parses to 7 with numeric false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010025 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 0, ' 7', false);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      expect(ScanOptionValueParser.isNumeric(' 7')).assertEqual(false);
      expect(ScanOptionValueParser.asText(result)).assertEqual(' 7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010025 end');
    });

    /**
     * @tc.name   testParser010026
     * @tc.number SUB_SCAN_PARSE_01_0026
     * @tc.desc   clamp(5, 0, 10) lands on 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010026 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 5, 'txt', true);
      expect(ScanOptionValueParser.clamp(5, 0, 10)).assertEqual(5);
      expect(ScanOptionValueParser.rangeText(0, 10, 1)).assertEqual('0..10/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010026 end');
    });

    /**
     * @tc.name   testParser010027
     * @tc.number SUB_SCAN_PARSE_01_0027
     * @tc.desc   clamp(-5, 0, 10) lands on 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010027 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, -5, 'txt', true);
      expect(ScanOptionValueParser.clamp(-5, 0, 10)).assertEqual(0);
      expect(ScanOptionValueParser.rangeText(0, 10, 1)).assertEqual('0..10/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010027 end');
    });

    /**
     * @tc.name   testParser010028
     * @tc.number SUB_SCAN_PARSE_01_0028
     * @tc.desc   clamp(15, 0, 10) lands on 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010028 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 15, 'txt', true);
      expect(ScanOptionValueParser.clamp(15, 0, 10)).assertEqual(10);
      expect(ScanOptionValueParser.rangeText(0, 10, 1)).assertEqual('0..10/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010028 end');
    });

    /**
     * @tc.name   testParser010029
     * @tc.number SUB_SCAN_PARSE_01_0029
     * @tc.desc   clamp(0, 0, 0) lands on 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010029 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 0, 'txt', true);
      expect(ScanOptionValueParser.clamp(0, 0, 0)).assertEqual(0);
      expect(ScanOptionValueParser.rangeText(0, 0, 1)).assertEqual('0..0/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010029 end');
    });

    /**
     * @tc.name   testParser010030
     * @tc.number SUB_SCAN_PARSE_01_0030
     * @tc.desc   clamp(5, 10, 0) lands on 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010030 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 5, 'txt', true);
      expect(ScanOptionValueParser.clamp(5, 10, 0)).assertEqual(5);
      expect(ScanOptionValueParser.rangeText(10, 0, 1)).assertEqual('10..0/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010030 end');
    });

    /**
     * @tc.name   testParser010031
     * @tc.number SUB_SCAN_PARSE_01_0031
     * @tc.desc   clamp(-1, 10, 0) lands on 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010031 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, -1, 'txt', true);
      expect(ScanOptionValueParser.clamp(-1, 10, 0)).assertEqual(0);
      expect(ScanOptionValueParser.rangeText(10, 0, 1)).assertEqual('10..0/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010031 end');
    });

    /**
     * @tc.name   testParser010032
     * @tc.number SUB_SCAN_PARSE_01_0032
     * @tc.desc   clamp(11, 10, 0) lands on 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010032 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 11, 'txt', true);
      expect(ScanOptionValueParser.clamp(11, 10, 0)).assertEqual(10);
      expect(ScanOptionValueParser.rangeText(10, 0, 1)).assertEqual('10..0/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010032 end');
    });

    /**
     * @tc.name   testParser010033
     * @tc.number SUB_SCAN_PARSE_01_0033
     * @tc.desc   clamp(5, 5, 5) lands on 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010033 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 5, 'txt', true);
      expect(ScanOptionValueParser.clamp(5, 5, 5)).assertEqual(5);
      expect(ScanOptionValueParser.rangeText(5, 5, 1)).assertEqual('5..5/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010033 end');
    });

    /**
     * @tc.name   testParser010034
     * @tc.number SUB_SCAN_PARSE_01_0034
     * @tc.desc   clamp(4, 5, 5) lands on 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010034 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 4, 'txt', true);
      expect(ScanOptionValueParser.clamp(4, 5, 5)).assertEqual(5);
      expect(ScanOptionValueParser.rangeText(5, 5, 1)).assertEqual('5..5/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010034 end');
    });

    /**
     * @tc.name   testParser010035
     * @tc.number SUB_SCAN_PARSE_01_0035
     * @tc.desc   clamp(6, 5, 5) lands on 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010035 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 6, 'txt', true);
      expect(ScanOptionValueParser.clamp(6, 5, 5)).assertEqual(5);
      expect(ScanOptionValueParser.rangeText(5, 5, 1)).assertEqual('5..5/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010035 end');
    });

    /**
     * @tc.name   testParser010036
     * @tc.number SUB_SCAN_PARSE_01_0036
     * @tc.desc   clamp(-100, -50, 50) lands on -50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010036 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, -100, 'txt', true);
      expect(ScanOptionValueParser.clamp(-100, -50, 50)).assertEqual(-50);
      expect(ScanOptionValueParser.rangeText(-50, 50, 1)).assertEqual('-50..50/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010036 end');
    });

    /**
     * @tc.name   testParser010037
     * @tc.number SUB_SCAN_PARSE_01_0037
     * @tc.desc   clamp(100, -50, 50) lands on 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010037 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 100, 'txt', true);
      expect(ScanOptionValueParser.clamp(100, -50, 50)).assertEqual(50);
      expect(ScanOptionValueParser.rangeText(-50, 50, 1)).assertEqual('-50..50/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010037 end');
    });

    /**
     * @tc.name   testParser010038
     * @tc.number SUB_SCAN_PARSE_01_0038
     * @tc.desc   clamp(0, -50, 50) lands on 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010038 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 0, 'txt', true);
      expect(ScanOptionValueParser.clamp(0, -50, 50)).assertEqual(0);
      expect(ScanOptionValueParser.rangeText(-50, 50, 1)).assertEqual('-50..50/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010038 end');
    });

    /**
     * @tc.name   testParser010039
     * @tc.number SUB_SCAN_PARSE_01_0039
     * @tc.desc   clamp(50.5, -50, 50) lands on 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010039 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 50.5, 'txt', true);
      expect(ScanOptionValueParser.clamp(50.5, -50, 50)).assertEqual(50);
      expect(ScanOptionValueParser.rangeText(-50, 50, 1)).assertEqual('-50..50/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010039 end');
    });

    /**
     * @tc.name   testParser010040
     * @tc.number SUB_SCAN_PARSE_01_0040
     * @tc.desc   clamp(-50.5, -50, 50) lands on -50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010040 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, -50.5, 'txt', true);
      expect(ScanOptionValueParser.clamp(-50.5, -50, 50)).assertEqual(-50);
      expect(ScanOptionValueParser.rangeText(-50, 50, 1)).assertEqual('-50..50/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010040 end');
    });

    /**
     * @tc.name   testParser010041
     * @tc.number SUB_SCAN_PARSE_01_0041
     * @tc.desc   clamp(0, 100, -100) lands on 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010041 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 0, 'txt', true);
      expect(ScanOptionValueParser.clamp(0, 100, -100)).assertEqual(0);
      expect(ScanOptionValueParser.rangeText(100, -100, 1)).assertEqual('100..-100/1');
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010041 end');
    });

    /**
     * @tc.name   testParser010042
     * @tc.number SUB_SCAN_PARSE_01_0042
     * @tc.desc   isNumeric '0' is true and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010042 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '0', false);
      expect(ScanOptionValueParser.isNumeric('0')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('0')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010042 end');
    });

    /**
     * @tc.name   testParser010043
     * @tc.number SUB_SCAN_PARSE_01_0043
     * @tc.desc   isNumeric '123' is true and parseFixed gives 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010043 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '123', false);
      expect(ScanOptionValueParser.isNumeric('123')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('123')).assertEqual(123);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010043 end');
    });

    /**
     * @tc.name   testParser010044
     * @tc.number SUB_SCAN_PARSE_01_0044
     * @tc.desc   isNumeric '-42' is true and parseFixed gives -42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010044 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '-42', false);
      expect(ScanOptionValueParser.isNumeric('-42')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('-42')).assertEqual(-42);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010044 end');
    });

    /**
     * @tc.name   testParser010045
     * @tc.number SUB_SCAN_PARSE_01_0045
     * @tc.desc   isNumeric '3.14' is true and parseFixed gives 3.14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010045 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '3.14', false);
      expect(ScanOptionValueParser.isNumeric('3.14')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('3.14')).assertEqual(3.14);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010045 end');
    });

    /**
     * @tc.name   testParser010046
     * @tc.number SUB_SCAN_PARSE_01_0046
     * @tc.desc   isNumeric '.5' is true and parseFixed gives 0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010046 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '.5', false);
      expect(ScanOptionValueParser.isNumeric('.5')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('.5')).assertEqual(0.5);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010046 end');
    });

    /**
     * @tc.name   testParser010047
     * @tc.number SUB_SCAN_PARSE_01_0047
     * @tc.desc   isNumeric '-.5' is true and parseFixed gives -0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010047 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '-.5', false);
      expect(ScanOptionValueParser.isNumeric('-.5')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('-.5')).assertEqual(-0.5);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010047 end');
    });

    /**
     * @tc.name   testParser010048
     * @tc.number SUB_SCAN_PARSE_01_0048
     * @tc.desc   isNumeric '5.' is true and parseFixed gives 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010048 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '5.', false);
      expect(ScanOptionValueParser.isNumeric('5.')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('5.')).assertEqual(5);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010048 end');
    });

    /**
     * @tc.name   testParser010049
     * @tc.number SUB_SCAN_PARSE_01_0049
     * @tc.desc   isNumeric 'a' is false and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010049 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'a', false);
      expect(ScanOptionValueParser.isNumeric('a')).assertEqual(false);
      expect(ScanOptionValueParser.parseFixed('a')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010049 end');
    });

    /**
     * @tc.name   testParser010050
     * @tc.number SUB_SCAN_PARSE_01_0050
     * @tc.desc   isNumeric ' ' is false and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010050 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, ' ', false);
      expect(ScanOptionValueParser.isNumeric(' ')).assertEqual(false);
      expect(ScanOptionValueParser.parseFixed(' ')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010050 end');
    });

    /**
     * @tc.name   testParser010051
     * @tc.number SUB_SCAN_PARSE_01_0051
     * @tc.desc   isNumeric '' is false and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010051 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '', false);
      expect(ScanOptionValueParser.isNumeric('')).assertEqual(false);
      expect(ScanOptionValueParser.parseFixed('')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010051 end');
    });

    /**
     * @tc.name   testParser010052
     * @tc.number SUB_SCAN_PARSE_01_0052
     * @tc.desc   isNumeric '1.2.3' is true and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010052 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '1.2.3', false);
      expect(ScanOptionValueParser.isNumeric('1.2.3')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('1.2.3')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010052 end');
    });

    /**
     * @tc.name   testParser010053
     * @tc.number SUB_SCAN_PARSE_01_0053
     * @tc.desc   isNumeric '--' is false and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010053 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '--', false);
      expect(ScanOptionValueParser.isNumeric('--')).assertEqual(false);
      expect(ScanOptionValueParser.parseFixed('--')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010053 end');
    });

    /**
     * @tc.name   testParser010054
     * @tc.number SUB_SCAN_PARSE_01_0054
     * @tc.desc   isNumeric '-' is false and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010054 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '-', false);
      expect(ScanOptionValueParser.isNumeric('-')).assertEqual(false);
      expect(ScanOptionValueParser.parseFixed('-')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010054 end');
    });

    /**
     * @tc.name   testParser010055
     * @tc.number SUB_SCAN_PARSE_01_0055
     * @tc.desc   isNumeric '.' is false and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010055 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '.', false);
      expect(ScanOptionValueParser.isNumeric('.')).assertEqual(false);
      expect(ScanOptionValueParser.parseFixed('.')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010055 end');
    });

    /**
     * @tc.name   testParser010056
     * @tc.number SUB_SCAN_PARSE_01_0056
     * @tc.desc   isNumeric '-1-2' is true and parseFixed gives 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010056 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, '-1-2', false);
      expect(ScanOptionValueParser.isNumeric('-1-2')).assertEqual(true);
      expect(ScanOptionValueParser.parseFixed('-1-2')).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010056 end');
    });

    /**
     * @tc.name   testParser010057
     * @tc.number SUB_SCAN_PARSE_01_0057
     * @tc.desc   compare(7, 3) yields 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010057 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', false);
      expect(ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, 3, 'x', false))).assertEqual(1);
      expect(ScanOptionValueParser.clamp(7, 0, 3)).assertEqual(3);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010057 end');
    });

    /**
     * @tc.name   testParser010058
     * @tc.number SUB_SCAN_PARSE_01_0058
     * @tc.desc   compare(3, 7) yields -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010058 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 3, 'txt', false);
      expect(ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, 7, 'x', false))).assertEqual(-1);
      expect(ScanOptionValueParser.clamp(3, 0, 7)).assertEqual(3);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010058 end');
    });

    /**
     * @tc.name   testParser010059
     * @tc.number SUB_SCAN_PARSE_01_0059
     * @tc.desc   compare(5, 5) yields 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010059 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 5, 'txt', false);
      expect(ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, 5, 'x', false))).assertEqual(0);
      expect(ScanOptionValueParser.clamp(5, 0, 5)).assertEqual(5);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010059 end');
    });

    /**
     * @tc.name   testParser010060
     * @tc.number SUB_SCAN_PARSE_01_0060
     * @tc.desc   compare(-1, 1) yields -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010060 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, -1, 'txt', false);
      expect(ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, 1, 'x', false))).assertEqual(-1);
      expect(ScanOptionValueParser.clamp(-1, 0, 1)).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010060 end');
    });

    /**
     * @tc.name   testParser010061
     * @tc.number SUB_SCAN_PARSE_01_0061
     * @tc.desc   compare(0, 0) yields 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010061 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 0, 'txt', false);
      expect(ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, 0, 'x', false))).assertEqual(0);
      expect(ScanOptionValueParser.clamp(0, 0, 0)).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010061 end');
    });

    /**
     * @tc.name   testParser010062
     * @tc.number SUB_SCAN_PARSE_01_0062
     * @tc.desc   compare(100, -100) yields 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010062 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 100, 'txt', false);
      expect(
        ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, -100, 'x', false))
      ).assertEqual(1);
      expect(ScanOptionValueParser.clamp(100, 0, -100)).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010062 end');
    });

    /**
     * @tc.name   testParser010063
     * @tc.number SUB_SCAN_PARSE_01_0063
     * @tc.desc   compare(7, 7.5) yields -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010063 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', false);
      expect(
        ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, 7.5, 'x', false))
      ).assertEqual(-1);
      expect(ScanOptionValueParser.clamp(7, 0, 7.5)).assertEqual(7);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010063 end');
    });

    /**
     * @tc.name   testParser010064
     * @tc.number SUB_SCAN_PARSE_01_0064
     * @tc.desc   compare(7.5, 7) yields 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010064 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7.5, 'txt', false);
      expect(ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, 7, 'x', false))).assertEqual(1);
      expect(ScanOptionValueParser.clamp(7.5, 0, 7)).assertEqual(7);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(7.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010064 end');
    });

    /**
     * @tc.name   testParser010065
     * @tc.number SUB_SCAN_PARSE_01_0065
     * @tc.desc   compare(-3, -2) yields -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010065 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, -3, 'txt', false);
      expect(
        ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, -2, 'x', false))
      ).assertEqual(-1);
      expect(ScanOptionValueParser.clamp(-3, 0, -2)).assertEqual(-2);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010065 end');
    });

    /**
     * @tc.name   testParser010066
     * @tc.number SUB_SCAN_PARSE_01_0066
     * @tc.desc   compare(2, -3) yields 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010066 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 2, 'txt', false);
      expect(ScanOptionValueParser.compare(result, ScanParameterBuilder.optionValue(1, -3, 'x', false))).assertEqual(1);
      expect(ScanOptionValueParser.clamp(2, 0, -3)).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010066 end');
    });

    /**
     * @tc.name   testParser010067
     * @tc.number SUB_SCAN_PARSE_01_0067
     * @tc.desc   describe prints the frozen summary for raw type 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010067 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', true);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=0 num=- str=- bool=true');
      expect(ScanOptionValueParser.asText(result)).assertEqual('on');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010067 end');
    });

    /**
     * @tc.name   testParser010068
     * @tc.number SUB_SCAN_PARSE_01_0068
     * @tc.desc   describe prints the frozen summary for raw type 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010068 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(0, 7, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=0 num=- str=- bool=false');
      expect(ScanOptionValueParser.asText(result)).assertEqual('off');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010068 end');
    });

    /**
     * @tc.name   testParser010069
     * @tc.number SUB_SCAN_PARSE_01_0069
     * @tc.desc   describe prints the frozen summary for raw type 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010069 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 7, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=1 num=7 str=- bool=-');
      expect(ScanOptionValueParser.asText(result)).assertEqual('7');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010069 end');
    });

    /**
     * @tc.name   testParser010070
     * @tc.number SUB_SCAN_PARSE_01_0070
     * @tc.desc   describe prints the frozen summary for raw type 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010070 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, -3.5, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=2 num=-3.5 str=- bool=-');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-3.5');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010070 end');
    });

    /**
     * @tc.name   testParser010071
     * @tc.number SUB_SCAN_PARSE_01_0071
     * @tc.desc   describe prints the frozen summary for raw type 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010071 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'pdf', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=3 num=- str=pdf bool=-');
      expect(ScanOptionValueParser.asText(result)).assertEqual('pdf');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010071 end');
    });

    /**
     * @tc.name   testParser010072
     * @tc.number SUB_SCAN_PARSE_01_0072
     * @tc.desc   describe prints the frozen summary for raw type 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010072 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, '', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=3 num=- str= bool=-');
      expect(ScanOptionValueParser.asText(result)).assertEqual('');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010072 end');
    });

    /**
     * @tc.name   testParser010073
     * @tc.number SUB_SCAN_PARSE_01_0073
     * @tc.desc   describe prints the frozen summary for raw type -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010073 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(-1, 7, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=0 num=- str=- bool=false');
      expect(ScanOptionValueParser.asText(result)).assertEqual('off');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010073 end');
    });

    /**
     * @tc.name   testParser010074
     * @tc.number SUB_SCAN_PARSE_01_0074
     * @tc.desc   describe prints the frozen summary for raw type 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010074 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(4, 7, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=0 num=- str=- bool=false');
      expect(ScanOptionValueParser.asText(result)).assertEqual('off');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010074 end');
    });

    /**
     * @tc.name   testParser010075
     * @tc.number SUB_SCAN_PARSE_01_0075
     * @tc.desc   describe prints the frozen summary for raw type 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010075 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1000, 7, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=0 num=- str=- bool=false');
      expect(ScanOptionValueParser.asText(result)).assertEqual('off');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_BOOL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010075 end');
    });

    /**
     * @tc.name   testParser010076
     * @tc.number SUB_SCAN_PARSE_01_0076
     * @tc.desc   describe prints the frozen summary for raw type 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010076 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, -7, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=1 num=-7 str=- bool=-');
      expect(ScanOptionValueParser.asText(result)).assertEqual('-7');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010076 end');
    });

    /**
     * @tc.name   testParser010077
     * @tc.number SUB_SCAN_PARSE_01_0077
     * @tc.desc   describe prints the frozen summary for raw type 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010077 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(2, 0, 'txt', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=2 num=0 str=- bool=-');
      expect(ScanOptionValueParser.asText(result)).assertEqual('0');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010077 end');
    });

    /**
     * @tc.name   testParser010078
     * @tc.number SUB_SCAN_PARSE_01_0078
     * @tc.desc   describe prints the frozen summary for raw type 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010078 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(3, 7, 'x-y', false);
      expect(ScanOptionValueParser.describe(result)).assertEqual('type=3 num=- str=x-y bool=-');
      expect(ScanOptionValueParser.asText(result)).assertEqual('x-y');
      expect(result.valueType).assertEqual(scan.OptionValueType.SCAN_TYPE_STRING);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010078 end');
    });

    /**
     * @tc.name   testParser010079
     * @tc.number SUB_SCAN_PARSE_01_0079
     * @tc.desc   rangeText(0, 10, 1) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010079 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(0, 10, 1)).assertEqual('0..10/1');
      expect(ScanOptionValueParser.clamp(50, 0, 10)).assertEqual(10);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010079 end');
    });

    /**
     * @tc.name   testParser010080
     * @tc.number SUB_SCAN_PARSE_01_0080
     * @tc.desc   rangeText(10, 90, 10) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010080 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(10, 90, 10)).assertEqual('10..90/10');
      expect(ScanOptionValueParser.clamp(50, 10, 90)).assertEqual(50);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010080 end');
    });

    /**
     * @tc.name   testParser010081
     * @tc.number SUB_SCAN_PARSE_01_0081
     * @tc.desc   rangeText(-50, 50, 5) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010081 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(-50, 50, 5)).assertEqual('-50..50/5');
      expect(ScanOptionValueParser.clamp(50, -50, 50)).assertEqual(50);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010081 end');
    });

    /**
     * @tc.name   testParser010082
     * @tc.number SUB_SCAN_PARSE_01_0082
     * @tc.desc   rangeText(0, 0, 1) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010082 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(0, 0, 1)).assertEqual('0..0/1');
      expect(ScanOptionValueParser.clamp(50, 0, 0)).assertEqual(0);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010082 end');
    });

    /**
     * @tc.name   testParser010083
     * @tc.number SUB_SCAN_PARSE_01_0083
     * @tc.desc   rangeText(5, 5, 5) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010083 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(5, 5, 5)).assertEqual('5..5/5');
      expect(ScanOptionValueParser.clamp(50, 5, 5)).assertEqual(5);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010083 end');
    });

    /**
     * @tc.name   testParser010084
     * @tc.number SUB_SCAN_PARSE_01_0084
     * @tc.desc   rangeText(300, 0, 1) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010084 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(300, 0, 1)).assertEqual('300..0/1');
      expect(ScanOptionValueParser.clamp(50, 300, 0)).assertEqual(50);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010084 end');
    });

    /**
     * @tc.name   testParser010085
     * @tc.number SUB_SCAN_PARSE_01_0085
     * @tc.desc   rangeText(0, 1, 0) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010085 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(0, 1, 0)).assertEqual('0..1/0');
      expect(ScanOptionValueParser.clamp(50, 0, 1)).assertEqual(1);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010085 end');
    });

    /**
     * @tc.name   testParser010086
     * @tc.number SUB_SCAN_PARSE_01_0086
     * @tc.desc   rangeText(1, 100, 2) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010086 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(1, 100, 2)).assertEqual('1..100/2');
      expect(ScanOptionValueParser.clamp(50, 1, 100)).assertEqual(50);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010086 end');
    });

    /**
     * @tc.name   testParser010087
     * @tc.number SUB_SCAN_PARSE_01_0087
     * @tc.desc   rangeText(-3, -2, 3) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010087 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(-3, -2, 3)).assertEqual('-3..-2/3');
      expect(ScanOptionValueParser.clamp(50, -3, -2)).assertEqual(-2);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010087 end');
    });

    /**
     * @tc.name   testParser010088
     * @tc.number SUB_SCAN_PARSE_01_0088
     * @tc.desc   rangeText(7, 7, 7) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010088 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(7, 7, 7)).assertEqual('7..7/7');
      expect(ScanOptionValueParser.clamp(50, 7, 7)).assertEqual(7);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010088 end');
    });

    /**
     * @tc.name   testParser010089
     * @tc.number SUB_SCAN_PARSE_01_0089
     * @tc.desc   rangeText(0, 300, 15) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010089 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(0, 300, 15)).assertEqual('0..300/15');
      expect(ScanOptionValueParser.clamp(50, 0, 300)).assertEqual(50);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010089 end');
    });

    /**
     * @tc.name   testParser010090
     * @tc.number SUB_SCAN_PARSE_01_0090
     * @tc.desc   rangeText(9, 8, 7) formats the frozen bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParser010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010090 begin');
      const result: scan.ScannerOptionValue = ScanParameterBuilder.optionValue(1, 50, 'txt', false);
      expect(ScanOptionValueParser.rangeText(9, 8, 7)).assertEqual('9..8/7');
      expect(ScanOptionValueParser.clamp(50, 9, 8)).assertEqual(9);
      expect(ScanOptionValueParser.asNumber(result)).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParser010090 end');
    });

  });
}
