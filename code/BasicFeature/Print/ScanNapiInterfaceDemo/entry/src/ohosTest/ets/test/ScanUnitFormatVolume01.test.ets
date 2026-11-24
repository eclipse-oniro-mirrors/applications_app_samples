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
import { ScanUnitFormatter } from '../../../main/ets/scan/model/ScanUnitFormatter';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanUnitFormatTest() {
  describe('ScanUnitFormat', () => {

    /**
     * @tc.name   testUnitFormat0001
     * @tc.number SUB_SCAN_UNIT_01_0001
     * @tc.desc   format 0 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0001 begin');
      const result: string = ScanUnitFormatter.format(0, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('0');
      expect(ScanUnitFormatter.roundTo(0, 2)).assertEqual(0);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(0))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0001 end');
    });

    /**
     * @tc.name   testUnitFormat0002
     * @tc.number SUB_SCAN_UNIT_01_0002
     * @tc.desc   format 0 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0002 begin');
      const result: string = ScanUnitFormatter.format(0, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('0 px');
      expect(ScanUnitFormatter.roundTo(0, 2)).assertEqual(0);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(1))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0002 end');
    });

    /**
     * @tc.name   testUnitFormat0003
     * @tc.number SUB_SCAN_UNIT_01_0003
     * @tc.desc   format 0 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0003 begin');
      const result: string = ScanUnitFormatter.format(0, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('0 bit');
      expect(ScanUnitFormatter.roundTo(0, 2)).assertEqual(0);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(2))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0003 end');
    });

    /**
     * @tc.name   testUnitFormat0004
     * @tc.number SUB_SCAN_UNIT_01_0004
     * @tc.desc   format 0 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0004 begin');
      const result: string = ScanUnitFormatter.format(0, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('0 mm');
      expect(ScanUnitFormatter.roundTo(0, 2)).assertEqual(0);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(3))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0004 end');
    });

    /**
     * @tc.name   testUnitFormat0005
     * @tc.number SUB_SCAN_UNIT_01_0005
     * @tc.desc   format 0 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0005 begin');
      const result: string = ScanUnitFormatter.format(0, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('0 dpi');
      expect(ScanUnitFormatter.roundTo(0, 2)).assertEqual(0);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(4))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0005 end');
    });

    /**
     * @tc.name   testUnitFormat0006
     * @tc.number SUB_SCAN_UNIT_01_0006
     * @tc.desc   format 0 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0006 begin');
      const result: string = ScanUnitFormatter.format(0, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('0 %');
      expect(ScanUnitFormatter.roundTo(0, 2)).assertEqual(0);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(5))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0006 end');
    });

    /**
     * @tc.name   testUnitFormat0007
     * @tc.number SUB_SCAN_UNIT_01_0007
     * @tc.desc   format 0 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0007 begin');
      const result: string = ScanUnitFormatter.format(0, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('0 us');
      expect(ScanUnitFormatter.roundTo(0, 2)).assertEqual(0);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(6))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0007 end');
    });

    /**
     * @tc.name   testUnitFormat0008
     * @tc.number SUB_SCAN_UNIT_01_0008
     * @tc.desc   format 1 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0008 begin');
      const result: string = ScanUnitFormatter.format(1, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('1');
      expect(ScanUnitFormatter.roundTo(1, 2)).assertEqual(1);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(1, ScanParameterBuilder.unit(0))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0008 end');
    });

    /**
     * @tc.name   testUnitFormat0009
     * @tc.number SUB_SCAN_UNIT_01_0009
     * @tc.desc   format 1 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0009 begin');
      const result: string = ScanUnitFormatter.format(1, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('1 px');
      expect(ScanUnitFormatter.roundTo(1, 2)).assertEqual(1);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(1, ScanParameterBuilder.unit(1))).assertEqual(0.26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0009 end');
    });

    /**
     * @tc.name   testUnitFormat0010
     * @tc.number SUB_SCAN_UNIT_01_0010
     * @tc.desc   format 1 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0010 begin');
      const result: string = ScanUnitFormatter.format(1, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('1 bit');
      expect(ScanUnitFormatter.roundTo(1, 2)).assertEqual(1);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(1, ScanParameterBuilder.unit(2))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0010 end');
    });

    /**
     * @tc.name   testUnitFormat0011
     * @tc.number SUB_SCAN_UNIT_01_0011
     * @tc.desc   format 1 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0011 begin');
      const result: string = ScanUnitFormatter.format(1, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('1 mm');
      expect(ScanUnitFormatter.roundTo(1, 2)).assertEqual(1);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(1, ScanParameterBuilder.unit(3))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0011 end');
    });

    /**
     * @tc.name   testUnitFormat0012
     * @tc.number SUB_SCAN_UNIT_01_0012
     * @tc.desc   format 1 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0012 begin');
      const result: string = ScanUnitFormatter.format(1, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('1 dpi');
      expect(ScanUnitFormatter.roundTo(1, 2)).assertEqual(1);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(1, ScanParameterBuilder.unit(4))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0012 end');
    });

    /**
     * @tc.name   testUnitFormat0013
     * @tc.number SUB_SCAN_UNIT_01_0013
     * @tc.desc   format 1 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0013 begin');
      const result: string = ScanUnitFormatter.format(1, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('1 %');
      expect(ScanUnitFormatter.roundTo(1, 2)).assertEqual(1);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(1, ScanParameterBuilder.unit(5))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0013 end');
    });

    /**
     * @tc.name   testUnitFormat0014
     * @tc.number SUB_SCAN_UNIT_01_0014
     * @tc.desc   format 1 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0014 begin');
      const result: string = ScanUnitFormatter.format(1, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('1 us');
      expect(ScanUnitFormatter.roundTo(1, 2)).assertEqual(1);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(1, ScanParameterBuilder.unit(6))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0014 end');
    });

    /**
     * @tc.name   testUnitFormat0015
     * @tc.number SUB_SCAN_UNIT_01_0015
     * @tc.desc   format 2.5 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0015 begin');
      const result: string = ScanUnitFormatter.format(2.5, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('2.5');
      expect(ScanUnitFormatter.roundTo(2.5, 2)).assertEqual(2.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(2.5, ScanParameterBuilder.unit(0))).assertEqual(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0015 end');
    });

    /**
     * @tc.name   testUnitFormat0016
     * @tc.number SUB_SCAN_UNIT_01_0016
     * @tc.desc   format 2.5 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0016 begin');
      const result: string = ScanUnitFormatter.format(2.5, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('2.5 px');
      expect(ScanUnitFormatter.roundTo(2.5, 2)).assertEqual(2.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(2.5, ScanParameterBuilder.unit(1))).assertEqual(0.66);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0016 end');
    });

    /**
     * @tc.name   testUnitFormat0017
     * @tc.number SUB_SCAN_UNIT_01_0017
     * @tc.desc   format 2.5 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0017 begin');
      const result: string = ScanUnitFormatter.format(2.5, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('2.5 bit');
      expect(ScanUnitFormatter.roundTo(2.5, 2)).assertEqual(2.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(2.5, ScanParameterBuilder.unit(2))).assertEqual(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0017 end');
    });

    /**
     * @tc.name   testUnitFormat0018
     * @tc.number SUB_SCAN_UNIT_01_0018
     * @tc.desc   format 2.5 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0018 begin');
      const result: string = ScanUnitFormatter.format(2.5, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('2.5 mm');
      expect(ScanUnitFormatter.roundTo(2.5, 2)).assertEqual(2.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(2.5, ScanParameterBuilder.unit(3))).assertEqual(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0018 end');
    });

    /**
     * @tc.name   testUnitFormat0019
     * @tc.number SUB_SCAN_UNIT_01_0019
     * @tc.desc   format 2.5 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0019 begin');
      const result: string = ScanUnitFormatter.format(2.5, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('2.5 dpi');
      expect(ScanUnitFormatter.roundTo(2.5, 2)).assertEqual(2.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(2.5, ScanParameterBuilder.unit(4))).assertEqual(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0019 end');
    });

    /**
     * @tc.name   testUnitFormat0020
     * @tc.number SUB_SCAN_UNIT_01_0020
     * @tc.desc   format 2.5 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0020 begin');
      const result: string = ScanUnitFormatter.format(2.5, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('2.5 %');
      expect(ScanUnitFormatter.roundTo(2.5, 2)).assertEqual(2.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(2.5, ScanParameterBuilder.unit(5))).assertEqual(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0020 end');
    });

    /**
     * @tc.name   testUnitFormat0021
     * @tc.number SUB_SCAN_UNIT_01_0021
     * @tc.desc   format 2.5 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0021 begin');
      const result: string = ScanUnitFormatter.format(2.5, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('2.5 us');
      expect(ScanUnitFormatter.roundTo(2.5, 2)).assertEqual(2.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(2.5, ScanParameterBuilder.unit(6))).assertEqual(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0021 end');
    });

    /**
     * @tc.name   testUnitFormat0022
     * @tc.number SUB_SCAN_UNIT_01_0022
     * @tc.desc   format 10 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0022 begin');
      const result: string = ScanUnitFormatter.format(10, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('10');
      expect(ScanUnitFormatter.roundTo(10, 2)).assertEqual(10);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(10, ScanParameterBuilder.unit(0))).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0022 end');
    });

    /**
     * @tc.name   testUnitFormat0023
     * @tc.number SUB_SCAN_UNIT_01_0023
     * @tc.desc   format 10 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0023 begin');
      const result: string = ScanUnitFormatter.format(10, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('10 px');
      expect(ScanUnitFormatter.roundTo(10, 2)).assertEqual(10);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(10, ScanParameterBuilder.unit(1))).assertEqual(2.65);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0023 end');
    });

    /**
     * @tc.name   testUnitFormat0024
     * @tc.number SUB_SCAN_UNIT_01_0024
     * @tc.desc   format 10 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0024 begin');
      const result: string = ScanUnitFormatter.format(10, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('10 bit');
      expect(ScanUnitFormatter.roundTo(10, 2)).assertEqual(10);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(10, ScanParameterBuilder.unit(2))).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0024 end');
    });

    /**
     * @tc.name   testUnitFormat0025
     * @tc.number SUB_SCAN_UNIT_01_0025
     * @tc.desc   format 10 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0025 begin');
      const result: string = ScanUnitFormatter.format(10, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('10 mm');
      expect(ScanUnitFormatter.roundTo(10, 2)).assertEqual(10);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(10, ScanParameterBuilder.unit(3))).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0025 end');
    });

    /**
     * @tc.name   testUnitFormat0026
     * @tc.number SUB_SCAN_UNIT_01_0026
     * @tc.desc   format 10 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0026 begin');
      const result: string = ScanUnitFormatter.format(10, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('10 dpi');
      expect(ScanUnitFormatter.roundTo(10, 2)).assertEqual(10);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(10, ScanParameterBuilder.unit(4))).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0026 end');
    });

    /**
     * @tc.name   testUnitFormat0027
     * @tc.number SUB_SCAN_UNIT_01_0027
     * @tc.desc   format 10 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0027 begin');
      const result: string = ScanUnitFormatter.format(10, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('10 %');
      expect(ScanUnitFormatter.roundTo(10, 2)).assertEqual(10);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(10, ScanParameterBuilder.unit(5))).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0027 end');
    });

    /**
     * @tc.name   testUnitFormat0028
     * @tc.number SUB_SCAN_UNIT_01_0028
     * @tc.desc   format 10 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0028 begin');
      const result: string = ScanUnitFormatter.format(10, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('10 us');
      expect(ScanUnitFormatter.roundTo(10, 2)).assertEqual(10);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(10, ScanParameterBuilder.unit(6))).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0028 end');
    });

    /**
     * @tc.name   testUnitFormat0029
     * @tc.number SUB_SCAN_UNIT_01_0029
     * @tc.desc   format 25.4 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0029 begin');
      const result: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('25.4');
      expect(ScanUnitFormatter.roundTo(25.4, 2)).assertEqual(25.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(0))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0029 end');
    });

    /**
     * @tc.name   testUnitFormat0030
     * @tc.number SUB_SCAN_UNIT_01_0030
     * @tc.desc   format 25.4 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0030 begin');
      const result: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('25.4 px');
      expect(ScanUnitFormatter.roundTo(25.4, 2)).assertEqual(25.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(1))).assertEqual(6.72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0030 end');
    });

    /**
     * @tc.name   testUnitFormat0031
     * @tc.number SUB_SCAN_UNIT_01_0031
     * @tc.desc   format 25.4 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0031 begin');
      const result: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('25.4 bit');
      expect(ScanUnitFormatter.roundTo(25.4, 2)).assertEqual(25.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(2))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0031 end');
    });

    /**
     * @tc.name   testUnitFormat0032
     * @tc.number SUB_SCAN_UNIT_01_0032
     * @tc.desc   format 25.4 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0032 begin');
      const result: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('25.4 mm');
      expect(ScanUnitFormatter.roundTo(25.4, 2)).assertEqual(25.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(3))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0032 end');
    });

    /**
     * @tc.name   testUnitFormat0033
     * @tc.number SUB_SCAN_UNIT_01_0033
     * @tc.desc   format 25.4 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0033 begin');
      const result: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('25.4 dpi');
      expect(ScanUnitFormatter.roundTo(25.4, 2)).assertEqual(25.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(4))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0033 end');
    });

    /**
     * @tc.name   testUnitFormat0034
     * @tc.number SUB_SCAN_UNIT_01_0034
     * @tc.desc   format 25.4 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0034 begin');
      const result: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('25.4 %');
      expect(ScanUnitFormatter.roundTo(25.4, 2)).assertEqual(25.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(5))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0034 end');
    });

    /**
     * @tc.name   testUnitFormat0035
     * @tc.number SUB_SCAN_UNIT_01_0035
     * @tc.desc   format 25.4 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0035 begin');
      const result: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('25.4 us');
      expect(ScanUnitFormatter.roundTo(25.4, 2)).assertEqual(25.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(6))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0035 end');
    });

    /**
     * @tc.name   testUnitFormat0036
     * @tc.number SUB_SCAN_UNIT_01_0036
     * @tc.desc   format 96 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0036 begin');
      const result: string = ScanUnitFormatter.format(96, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('96');
      expect(ScanUnitFormatter.roundTo(96, 2)).assertEqual(96);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(0))).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0036 end');
    });

    /**
     * @tc.name   testUnitFormat0037
     * @tc.number SUB_SCAN_UNIT_01_0037
     * @tc.desc   format 96 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0037 begin');
      const result: string = ScanUnitFormatter.format(96, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('96 px');
      expect(ScanUnitFormatter.roundTo(96, 2)).assertEqual(96);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(1))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0037 end');
    });

    /**
     * @tc.name   testUnitFormat0038
     * @tc.number SUB_SCAN_UNIT_01_0038
     * @tc.desc   format 96 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0038 begin');
      const result: string = ScanUnitFormatter.format(96, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('96 bit');
      expect(ScanUnitFormatter.roundTo(96, 2)).assertEqual(96);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(2))).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0038 end');
    });

    /**
     * @tc.name   testUnitFormat0039
     * @tc.number SUB_SCAN_UNIT_01_0039
     * @tc.desc   format 96 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0039 begin');
      const result: string = ScanUnitFormatter.format(96, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('96 mm');
      expect(ScanUnitFormatter.roundTo(96, 2)).assertEqual(96);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(3))).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0039 end');
    });

    /**
     * @tc.name   testUnitFormat0040
     * @tc.number SUB_SCAN_UNIT_01_0040
     * @tc.desc   format 96 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0040 begin');
      const result: string = ScanUnitFormatter.format(96, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('96 dpi');
      expect(ScanUnitFormatter.roundTo(96, 2)).assertEqual(96);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(4))).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0040 end');
    });

    /**
     * @tc.name   testUnitFormat0041
     * @tc.number SUB_SCAN_UNIT_01_0041
     * @tc.desc   format 96 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0041 begin');
      const result: string = ScanUnitFormatter.format(96, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('96 %');
      expect(ScanUnitFormatter.roundTo(96, 2)).assertEqual(96);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(5))).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0041 end');
    });

    /**
     * @tc.name   testUnitFormat0042
     * @tc.number SUB_SCAN_UNIT_01_0042
     * @tc.desc   format 96 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0042 begin');
      const result: string = ScanUnitFormatter.format(96, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('96 us');
      expect(ScanUnitFormatter.roundTo(96, 2)).assertEqual(96);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(6))).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0042 end');
    });

    /**
     * @tc.name   testUnitFormat0043
     * @tc.number SUB_SCAN_UNIT_01_0043
     * @tc.desc   format 300 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0043 begin');
      const result: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('300');
      expect(ScanUnitFormatter.roundTo(300, 2)).assertEqual(300);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(300, ScanParameterBuilder.unit(0))).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0043 end');
    });

    /**
     * @tc.name   testUnitFormat0044
     * @tc.number SUB_SCAN_UNIT_01_0044
     * @tc.desc   format 300 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0044 begin');
      const result: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('300 px');
      expect(ScanUnitFormatter.roundTo(300, 2)).assertEqual(300);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(300, ScanParameterBuilder.unit(1))).assertEqual(79.38);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0044 end');
    });

    /**
     * @tc.name   testUnitFormat0045
     * @tc.number SUB_SCAN_UNIT_01_0045
     * @tc.desc   format 300 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0045 begin');
      const result: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('300 bit');
      expect(ScanUnitFormatter.roundTo(300, 2)).assertEqual(300);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(300, ScanParameterBuilder.unit(2))).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0045 end');
    });

    /**
     * @tc.name   testUnitFormat0046
     * @tc.number SUB_SCAN_UNIT_01_0046
     * @tc.desc   format 300 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0046 begin');
      const result: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('300 mm');
      expect(ScanUnitFormatter.roundTo(300, 2)).assertEqual(300);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(300, ScanParameterBuilder.unit(3))).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0046 end');
    });

    /**
     * @tc.name   testUnitFormat0047
     * @tc.number SUB_SCAN_UNIT_01_0047
     * @tc.desc   format 300 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0047 begin');
      const result: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('300 dpi');
      expect(ScanUnitFormatter.roundTo(300, 2)).assertEqual(300);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(300, ScanParameterBuilder.unit(4))).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0047 end');
    });

    /**
     * @tc.name   testUnitFormat0048
     * @tc.number SUB_SCAN_UNIT_01_0048
     * @tc.desc   format 300 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0048 begin');
      const result: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('300 %');
      expect(ScanUnitFormatter.roundTo(300, 2)).assertEqual(300);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(300, ScanParameterBuilder.unit(5))).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0048 end');
    });

    /**
     * @tc.name   testUnitFormat0049
     * @tc.number SUB_SCAN_UNIT_01_0049
     * @tc.desc   format 300 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0049 begin');
      const result: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('300 us');
      expect(ScanUnitFormatter.roundTo(300, 2)).assertEqual(300);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(300, ScanParameterBuilder.unit(6))).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0049 end');
    });

    /**
     * @tc.name   testUnitFormat0050
     * @tc.number SUB_SCAN_UNIT_01_0050
     * @tc.desc   format -12.345 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0050 begin');
      const result: string = ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('-12.34');
      expect(ScanUnitFormatter.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(-12.345, ScanParameterBuilder.unit(0))).assertEqual(-12.34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0050 end');
    });

    /**
     * @tc.name   testUnitFormat0051
     * @tc.number SUB_SCAN_UNIT_01_0051
     * @tc.desc   format -12.345 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0051 begin');
      const result: string = ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('-12.34 px');
      expect(ScanUnitFormatter.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(-12.345, ScanParameterBuilder.unit(1))).assertEqual(-3.27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0051 end');
    });

    /**
     * @tc.name   testUnitFormat0052
     * @tc.number SUB_SCAN_UNIT_01_0052
     * @tc.desc   format -12.345 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0052 begin');
      const result: string = ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('-12.34 bit');
      expect(ScanUnitFormatter.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(-12.345, ScanParameterBuilder.unit(2))).assertEqual(-12.34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0052 end');
    });

    /**
     * @tc.name   testUnitFormat0053
     * @tc.number SUB_SCAN_UNIT_01_0053
     * @tc.desc   format -12.345 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0053 begin');
      const result: string = ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('-12.34 mm');
      expect(ScanUnitFormatter.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(-12.345, ScanParameterBuilder.unit(3))).assertEqual(-12.34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0053 end');
    });

    /**
     * @tc.name   testUnitFormat0054
     * @tc.number SUB_SCAN_UNIT_01_0054
     * @tc.desc   format -12.345 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0054 begin');
      const result: string = ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('-12.34 dpi');
      expect(ScanUnitFormatter.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(-12.345, ScanParameterBuilder.unit(4))).assertEqual(-12.34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0054 end');
    });

    /**
     * @tc.name   testUnitFormat0055
     * @tc.number SUB_SCAN_UNIT_01_0055
     * @tc.desc   format -12.345 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0055 begin');
      const result: string = ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('-12.34 %');
      expect(ScanUnitFormatter.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(-12.345, ScanParameterBuilder.unit(5))).assertEqual(-12.34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0055 end');
    });

    /**
     * @tc.name   testUnitFormat0056
     * @tc.number SUB_SCAN_UNIT_01_0056
     * @tc.desc   format -12.345 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0056 begin');
      const result: string = ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('-12.34 us');
      expect(ScanUnitFormatter.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(-12.345, ScanParameterBuilder.unit(6))).assertEqual(-12.34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0056 end');
    });

    /**
     * @tc.name   testUnitFormat0057
     * @tc.number SUB_SCAN_UNIT_01_0057
     * @tc.desc   format 7.777 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0057 begin');
      const result: string = ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('7.78');
      expect(ScanUnitFormatter.roundTo(7.777, 2)).assertEqual(7.78);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(0))).assertEqual(7.78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0057 end');
    });

    /**
     * @tc.name   testUnitFormat0058
     * @tc.number SUB_SCAN_UNIT_01_0058
     * @tc.desc   format 7.777 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0058 begin');
      const result: string = ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('7.78 px');
      expect(ScanUnitFormatter.roundTo(7.777, 2)).assertEqual(7.78);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(1))).assertEqual(2.06);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0058 end');
    });

    /**
     * @tc.name   testUnitFormat0059
     * @tc.number SUB_SCAN_UNIT_01_0059
     * @tc.desc   format 7.777 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0059 begin');
      const result: string = ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('7.78 bit');
      expect(ScanUnitFormatter.roundTo(7.777, 2)).assertEqual(7.78);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(2))).assertEqual(7.78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0059 end');
    });

    /**
     * @tc.name   testUnitFormat0060
     * @tc.number SUB_SCAN_UNIT_01_0060
     * @tc.desc   format 7.777 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0060 begin');
      const result: string = ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('7.78 mm');
      expect(ScanUnitFormatter.roundTo(7.777, 2)).assertEqual(7.78);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(3))).assertEqual(7.78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0060 end');
    });

    /**
     * @tc.name   testUnitFormat0061
     * @tc.number SUB_SCAN_UNIT_01_0061
     * @tc.desc   format 7.777 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0061 begin');
      const result: string = ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('7.78 dpi');
      expect(ScanUnitFormatter.roundTo(7.777, 2)).assertEqual(7.78);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(4))).assertEqual(7.78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0061 end');
    });

    /**
     * @tc.name   testUnitFormat0062
     * @tc.number SUB_SCAN_UNIT_01_0062
     * @tc.desc   format 7.777 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0062 begin');
      const result: string = ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('7.78 %');
      expect(ScanUnitFormatter.roundTo(7.777, 2)).assertEqual(7.78);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(5))).assertEqual(7.78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0062 end');
    });

    /**
     * @tc.name   testUnitFormat0063
     * @tc.number SUB_SCAN_UNIT_01_0063
     * @tc.desc   format 7.777 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0063 begin');
      const result: string = ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('7.78 us');
      expect(ScanUnitFormatter.roundTo(7.777, 2)).assertEqual(7.78);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(6))).assertEqual(7.78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0063 end');
    });

    /**
     * @tc.name   testUnitFormat0064
     * @tc.number SUB_SCAN_UNIT_01_0064
     * @tc.desc   format 1000.999 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0064 begin');
      const result: string = ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('1001');
      expect(ScanUnitFormatter.roundTo(1000.999, 2)).assertEqual(1001);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(1000.999, ScanParameterBuilder.unit(0))).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0064 end');
    });

    /**
     * @tc.name   testUnitFormat0065
     * @tc.number SUB_SCAN_UNIT_01_0065
     * @tc.desc   format 1000.999 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0065 begin');
      const result: string = ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('1001 px');
      expect(ScanUnitFormatter.roundTo(1000.999, 2)).assertEqual(1001);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(1000.999, ScanParameterBuilder.unit(1))).assertEqual(264.85);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0065 end');
    });

    /**
     * @tc.name   testUnitFormat0066
     * @tc.number SUB_SCAN_UNIT_01_0066
     * @tc.desc   format 1000.999 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0066 begin');
      const result: string = ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('1001 bit');
      expect(ScanUnitFormatter.roundTo(1000.999, 2)).assertEqual(1001);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(1000.999, ScanParameterBuilder.unit(2))).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0066 end');
    });

    /**
     * @tc.name   testUnitFormat0067
     * @tc.number SUB_SCAN_UNIT_01_0067
     * @tc.desc   format 1000.999 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0067 begin');
      const result: string = ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('1001 mm');
      expect(ScanUnitFormatter.roundTo(1000.999, 2)).assertEqual(1001);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(1000.999, ScanParameterBuilder.unit(3))).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0067 end');
    });

    /**
     * @tc.name   testUnitFormat0068
     * @tc.number SUB_SCAN_UNIT_01_0068
     * @tc.desc   format 1000.999 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0068 begin');
      const result: string = ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('1001 dpi');
      expect(ScanUnitFormatter.roundTo(1000.999, 2)).assertEqual(1001);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(1000.999, ScanParameterBuilder.unit(4))).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0068 end');
    });

    /**
     * @tc.name   testUnitFormat0069
     * @tc.number SUB_SCAN_UNIT_01_0069
     * @tc.desc   format 1000.999 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0069 begin');
      const result: string = ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('1001 %');
      expect(ScanUnitFormatter.roundTo(1000.999, 2)).assertEqual(1001);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(1000.999, ScanParameterBuilder.unit(5))).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0069 end');
    });

    /**
     * @tc.name   testUnitFormat0070
     * @tc.number SUB_SCAN_UNIT_01_0070
     * @tc.desc   format 1000.999 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0070 begin');
      const result: string = ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('1001 us');
      expect(ScanUnitFormatter.roundTo(1000.999, 2)).assertEqual(1001);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(1000.999, ScanParameterBuilder.unit(6))).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0070 end');
    });

    /**
     * @tc.name   testUnitFormat0071
     * @tc.number SUB_SCAN_UNIT_01_0071
     * @tc.desc   format 0.005 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0071 begin');
      const result: string = ScanUnitFormatter.format(0.005, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('0.01');
      expect(ScanUnitFormatter.roundTo(0.005, 2)).assertEqual(0.01);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(0.005, ScanParameterBuilder.unit(0))).assertEqual(0.01);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0071 end');
    });

    /**
     * @tc.name   testUnitFormat0072
     * @tc.number SUB_SCAN_UNIT_01_0072
     * @tc.desc   format 0.005 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0072 begin');
      const result: string = ScanUnitFormatter.format(0.005, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('0.01 px');
      expect(ScanUnitFormatter.roundTo(0.005, 2)).assertEqual(0.01);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(0.005, ScanParameterBuilder.unit(1))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0072 end');
    });

    /**
     * @tc.name   testUnitFormat0073
     * @tc.number SUB_SCAN_UNIT_01_0073
     * @tc.desc   format 0.005 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0073 begin');
      const result: string = ScanUnitFormatter.format(0.005, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('0.01 bit');
      expect(ScanUnitFormatter.roundTo(0.005, 2)).assertEqual(0.01);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(0.005, ScanParameterBuilder.unit(2))).assertEqual(0.01);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0073 end');
    });

    /**
     * @tc.name   testUnitFormat0074
     * @tc.number SUB_SCAN_UNIT_01_0074
     * @tc.desc   format 0.005 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0074 begin');
      const result: string = ScanUnitFormatter.format(0.005, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('0.01 mm');
      expect(ScanUnitFormatter.roundTo(0.005, 2)).assertEqual(0.01);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(0.005, ScanParameterBuilder.unit(3))).assertEqual(0.01);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0074 end');
    });

    /**
     * @tc.name   testUnitFormat0075
     * @tc.number SUB_SCAN_UNIT_01_0075
     * @tc.desc   format 0.005 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0075 begin');
      const result: string = ScanUnitFormatter.format(0.005, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('0.01 dpi');
      expect(ScanUnitFormatter.roundTo(0.005, 2)).assertEqual(0.01);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(0.005, ScanParameterBuilder.unit(4))).assertEqual(0.01);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0075 end');
    });

    /**
     * @tc.name   testUnitFormat0076
     * @tc.number SUB_SCAN_UNIT_01_0076
     * @tc.desc   format 0.005 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0076 begin');
      const result: string = ScanUnitFormatter.format(0.005, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('0.01 %');
      expect(ScanUnitFormatter.roundTo(0.005, 2)).assertEqual(0.01);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(0.005, ScanParameterBuilder.unit(5))).assertEqual(0.01);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0076 end');
    });

    /**
     * @tc.name   testUnitFormat0077
     * @tc.number SUB_SCAN_UNIT_01_0077
     * @tc.desc   format 0.005 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0077 begin');
      const result: string = ScanUnitFormatter.format(0.005, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('0.01 us');
      expect(ScanUnitFormatter.roundTo(0.005, 2)).assertEqual(0.01);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(0.005, ScanParameterBuilder.unit(6))).assertEqual(0.01);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0077 end');
    });

    /**
     * @tc.name   testUnitFormat0078
     * @tc.number SUB_SCAN_UNIT_01_0078
     * @tc.desc   format 49.5 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0078 begin');
      const result: string = ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('49.5');
      expect(ScanUnitFormatter.roundTo(49.5, 2)).assertEqual(49.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(49.5, ScanParameterBuilder.unit(0))).assertEqual(49.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0078 end');
    });

    /**
     * @tc.name   testUnitFormat0079
     * @tc.number SUB_SCAN_UNIT_01_0079
     * @tc.desc   format 49.5 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0079 begin');
      const result: string = ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('49.5 px');
      expect(ScanUnitFormatter.roundTo(49.5, 2)).assertEqual(49.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(49.5, ScanParameterBuilder.unit(1))).assertEqual(13.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0079 end');
    });

    /**
     * @tc.name   testUnitFormat0080
     * @tc.number SUB_SCAN_UNIT_01_0080
     * @tc.desc   format 49.5 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0080 begin');
      const result: string = ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('49.5 bit');
      expect(ScanUnitFormatter.roundTo(49.5, 2)).assertEqual(49.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(49.5, ScanParameterBuilder.unit(2))).assertEqual(49.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0080 end');
    });

    /**
     * @tc.name   testUnitFormat0081
     * @tc.number SUB_SCAN_UNIT_01_0081
     * @tc.desc   format 49.5 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0081 begin');
      const result: string = ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('49.5 mm');
      expect(ScanUnitFormatter.roundTo(49.5, 2)).assertEqual(49.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(49.5, ScanParameterBuilder.unit(3))).assertEqual(49.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0081 end');
    });

    /**
     * @tc.name   testUnitFormat0082
     * @tc.number SUB_SCAN_UNIT_01_0082
     * @tc.desc   format 49.5 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0082 begin');
      const result: string = ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('49.5 dpi');
      expect(ScanUnitFormatter.roundTo(49.5, 2)).assertEqual(49.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(49.5, ScanParameterBuilder.unit(4))).assertEqual(49.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0082 end');
    });

    /**
     * @tc.name   testUnitFormat0083
     * @tc.number SUB_SCAN_UNIT_01_0083
     * @tc.desc   format 49.5 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0083 begin');
      const result: string = ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('49.5 %');
      expect(ScanUnitFormatter.roundTo(49.5, 2)).assertEqual(49.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(49.5, ScanParameterBuilder.unit(5))).assertEqual(49.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0083 end');
    });

    /**
     * @tc.name   testUnitFormat0084
     * @tc.number SUB_SCAN_UNIT_01_0084
     * @tc.desc   format 49.5 in unit 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0084 begin');
      const result: string = ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(6));
      expect(result).assertEqual('49.5 us');
      expect(ScanUnitFormatter.roundTo(49.5, 2)).assertEqual(49.5);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(6))).assertEqual('scan_unit_microsecond');
      expect(ScanUnitFormatter.toMillimeter(49.5, ScanParameterBuilder.unit(6))).assertEqual(49.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0084 end');
    });

    /**
     * @tc.name   testUnitFormat0085
     * @tc.number SUB_SCAN_UNIT_01_0085
     * @tc.desc   format -0.4 in unit 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0085 begin');
      const result: string = ScanUnitFormatter.format(-0.4, ScanParameterBuilder.unit(0));
      expect(result).assertEqual('-0.4');
      expect(ScanUnitFormatter.roundTo(-0.4, 2)).assertEqual(-0.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(0))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.toMillimeter(-0.4, ScanParameterBuilder.unit(0))).assertEqual(-0.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0085 end');
    });

    /**
     * @tc.name   testUnitFormat0086
     * @tc.number SUB_SCAN_UNIT_01_0086
     * @tc.desc   format -0.4 in unit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0086 begin');
      const result: string = ScanUnitFormatter.format(-0.4, ScanParameterBuilder.unit(1));
      expect(result).assertEqual('-0.4 px');
      expect(ScanUnitFormatter.roundTo(-0.4, 2)).assertEqual(-0.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(1))).assertEqual('scan_unit_pixel');
      expect(ScanUnitFormatter.toMillimeter(-0.4, ScanParameterBuilder.unit(1))).assertEqual(-0.11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0086 end');
    });

    /**
     * @tc.name   testUnitFormat0087
     * @tc.number SUB_SCAN_UNIT_01_0087
     * @tc.desc   format -0.4 in unit 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0087 begin');
      const result: string = ScanUnitFormatter.format(-0.4, ScanParameterBuilder.unit(2));
      expect(result).assertEqual('-0.4 bit');
      expect(ScanUnitFormatter.roundTo(-0.4, 2)).assertEqual(-0.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(2))).assertEqual('scan_unit_bit');
      expect(ScanUnitFormatter.toMillimeter(-0.4, ScanParameterBuilder.unit(2))).assertEqual(-0.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0087 end');
    });

    /**
     * @tc.name   testUnitFormat0088
     * @tc.number SUB_SCAN_UNIT_01_0088
     * @tc.desc   format -0.4 in unit 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0088 begin');
      const result: string = ScanUnitFormatter.format(-0.4, ScanParameterBuilder.unit(3));
      expect(result).assertEqual('-0.4 mm');
      expect(ScanUnitFormatter.roundTo(-0.4, 2)).assertEqual(-0.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(3))).assertEqual('scan_unit_mm');
      expect(ScanUnitFormatter.toMillimeter(-0.4, ScanParameterBuilder.unit(3))).assertEqual(-0.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0088 end');
    });

    /**
     * @tc.name   testUnitFormat0089
     * @tc.number SUB_SCAN_UNIT_01_0089
     * @tc.desc   format -0.4 in unit 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0089 begin');
      const result: string = ScanUnitFormatter.format(-0.4, ScanParameterBuilder.unit(4));
      expect(result).assertEqual('-0.4 dpi');
      expect(ScanUnitFormatter.roundTo(-0.4, 2)).assertEqual(-0.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(4))).assertEqual('scan_unit_dpi');
      expect(ScanUnitFormatter.toMillimeter(-0.4, ScanParameterBuilder.unit(4))).assertEqual(-0.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0089 end');
    });

    /**
     * @tc.name   testUnitFormat0090
     * @tc.number SUB_SCAN_UNIT_01_0090
     * @tc.desc   format -0.4 in unit 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitFormat0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0090 begin');
      const result: string = ScanUnitFormatter.format(-0.4, ScanParameterBuilder.unit(5));
      expect(result).assertEqual('-0.4 %');
      expect(ScanUnitFormatter.roundTo(-0.4, 2)).assertEqual(-0.4);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(5))).assertEqual('scan_unit_percent');
      expect(ScanUnitFormatter.toMillimeter(-0.4, ScanParameterBuilder.unit(5))).assertEqual(-0.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitFormat0090 end');
    });

  });
}
