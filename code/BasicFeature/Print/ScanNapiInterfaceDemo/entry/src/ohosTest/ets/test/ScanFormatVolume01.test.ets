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
import { ScanFormatTable } from '../../../main/ets/scan/model/ScanFormatTable';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanFormatVolume01Test() {
  describe('ScanFormat', () => {

    /**
     * @tc.name   testFormat010001
     * @tc.number SUB_SCAN_FORMAT_01_0001
     * @tc.desc   pageSizeIndex and dotsText map 'A3' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010001 begin');
      const result: string = ScanFormatTable.dotsText('A3');
      expect(ScanFormatTable.pageSizeIndex('A3')).assertEqual(0);
      expect(result).assertEqual('3508x4961');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('A3'))).assertEqual('A3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010001 end');
    });

    /**
     * @tc.name   testFormat010002
     * @tc.number SUB_SCAN_FORMAT_01_0002
     * @tc.desc   pageSizeIndex and dotsText map 'A4' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010002 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeIndex('A4')).assertEqual(1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('A4'))).assertEqual('A4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010002 end');
    });

    /**
     * @tc.name   testFormat010003
     * @tc.number SUB_SCAN_FORMAT_01_0003
     * @tc.desc   pageSizeIndex and dotsText map 'A5' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010003 begin');
      const result: string = ScanFormatTable.dotsText('A5');
      expect(ScanFormatTable.pageSizeIndex('A5')).assertEqual(2);
      expect(result).assertEqual('1748x2480');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('A5'))).assertEqual('A5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010003 end');
    });

    /**
     * @tc.name   testFormat010004
     * @tc.number SUB_SCAN_FORMAT_01_0004
     * @tc.desc   pageSizeIndex and dotsText map 'B4' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010004 begin');
      const result: string = ScanFormatTable.dotsText('B4');
      expect(ScanFormatTable.pageSizeIndex('B4')).assertEqual(3);
      expect(result).assertEqual('2953x4169');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('B4'))).assertEqual('B4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010004 end');
    });

    /**
     * @tc.name   testFormat010005
     * @tc.number SUB_SCAN_FORMAT_01_0005
     * @tc.desc   pageSizeIndex and dotsText map 'B5' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010005 begin');
      const result: string = ScanFormatTable.dotsText('B5');
      expect(ScanFormatTable.pageSizeIndex('B5')).assertEqual(4);
      expect(result).assertEqual('2079x2953');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('B5'))).assertEqual('B5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010005 end');
    });

    /**
     * @tc.name   testFormat010006
     * @tc.number SUB_SCAN_FORMAT_01_0006
     * @tc.desc   pageSizeIndex and dotsText map 'LETTER' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010006 begin');
      const result: string = ScanFormatTable.dotsText('LETTER');
      expect(ScanFormatTable.pageSizeIndex('LETTER')).assertEqual(5);
      expect(result).assertEqual('2550x3300');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('LETTER'))).assertEqual('LETTER');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010006 end');
    });

    /**
     * @tc.name   testFormat010007
     * @tc.number SUB_SCAN_FORMAT_01_0007
     * @tc.desc   pageSizeIndex and dotsText map 'LEGAL' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010007 begin');
      const result: string = ScanFormatTable.dotsText('LEGAL');
      expect(ScanFormatTable.pageSizeIndex('LEGAL')).assertEqual(6);
      expect(result).assertEqual('2550x4200');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('LEGAL'))).assertEqual('LEGAL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010007 end');
    });

    /**
     * @tc.name   testFormat010008
     * @tc.number SUB_SCAN_FORMAT_01_0008
     * @tc.desc   pageSizeIndex and dotsText map '' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010008 begin');
      const result: string = ScanFormatTable.dotsText('');
      expect(ScanFormatTable.pageSizeIndex('')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex(''))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010008 end');
    });

    /**
     * @tc.name   testFormat010009
     * @tc.number SUB_SCAN_FORMAT_01_0009
     * @tc.desc   pageSizeIndex and dotsText map 'a' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010009 begin');
      const result: string = ScanFormatTable.dotsText('a');
      expect(ScanFormatTable.pageSizeIndex('a')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('a'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010009 end');
    });

    /**
     * @tc.name   testFormat010010
     * @tc.number SUB_SCAN_FORMAT_01_0010
     * @tc.desc   pageSizeIndex and dotsText map 'A3 ' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010010 begin');
      const result: string = ScanFormatTable.dotsText('A3 ');
      expect(ScanFormatTable.pageSizeIndex('A3 ')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('A3 '))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010010 end');
    });

    /**
     * @tc.name   testFormat010011
     * @tc.number SUB_SCAN_FORMAT_01_0011
     * @tc.desc   pageSizeIndex and dotsText map 'a3' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010011 begin');
      const result: string = ScanFormatTable.dotsText('a3');
      expect(ScanFormatTable.pageSizeIndex('a3')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('a3'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010011 end');
    });

    /**
     * @tc.name   testFormat010012
     * @tc.number SUB_SCAN_FORMAT_01_0012
     * @tc.desc   pageSizeIndex and dotsText map 'LEGAL ' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010012 begin');
      const result: string = ScanFormatTable.dotsText('LEGAL ');
      expect(ScanFormatTable.pageSizeIndex('LEGAL ')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('LEGAL '))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010012 end');
    });

    /**
     * @tc.name   testFormat010013
     * @tc.number SUB_SCAN_FORMAT_01_0013
     * @tc.desc   pageSizeIndex and dotsText map 'jpeg' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010013 begin');
      const result: string = ScanFormatTable.dotsText('jpeg');
      expect(ScanFormatTable.pageSizeIndex('jpeg')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('jpeg'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010013 end');
    });

    /**
     * @tc.name   testFormat010014
     * @tc.number SUB_SCAN_FORMAT_01_0014
     * @tc.desc   pageSizeIndex and dotsText map 'LETTER1' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010014 begin');
      const result: string = ScanFormatTable.dotsText('LETTER1');
      expect(ScanFormatTable.pageSizeIndex('LETTER1')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('LETTER1'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010014 end');
    });

    /**
     * @tc.name   testFormat010015
     * @tc.number SUB_SCAN_FORMAT_01_0015
     * @tc.desc   pageSizeIndex and dotsText map 'A6' with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010015 begin');
      const result: string = ScanFormatTable.dotsText('A6');
      expect(ScanFormatTable.pageSizeIndex('A6')).assertEqual(-1);
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.pageSizeAt(ScanFormatTable.pageSizeIndex('A6'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010015 end');
    });

    /**
     * @tc.name   testFormat010016
     * @tc.number SUB_SCAN_FORMAT_01_0016
     * @tc.desc   totalPixels and dotsFor compute 'A3' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010016 begin');
      const result: string = ScanFormatTable.dotsText('A3');
      expect(ScanFormatTable.totalPixels('A3')).assertEqual(17403188);
      expect(ScanFormatTable.dotsFor('A3')[0]).assertEqual(3508);
      expect(result).assertEqual('3508x4961');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010016 end');
    });

    /**
     * @tc.name   testFormat010017
     * @tc.number SUB_SCAN_FORMAT_01_0017
     * @tc.desc   totalPixels and dotsFor compute 'A4' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010017 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.totalPixels('A4')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('A4')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010017 end');
    });

    /**
     * @tc.name   testFormat010018
     * @tc.number SUB_SCAN_FORMAT_01_0018
     * @tc.desc   totalPixels and dotsFor compute 'A5' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010018 begin');
      const result: string = ScanFormatTable.dotsText('A5');
      expect(ScanFormatTable.totalPixels('A5')).assertEqual(4335040);
      expect(ScanFormatTable.dotsFor('A5')[0]).assertEqual(1748);
      expect(result).assertEqual('1748x2480');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010018 end');
    });

    /**
     * @tc.name   testFormat010019
     * @tc.number SUB_SCAN_FORMAT_01_0019
     * @tc.desc   totalPixels and dotsFor compute 'B4' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010019 begin');
      const result: string = ScanFormatTable.dotsText('B4');
      expect(ScanFormatTable.totalPixels('B4')).assertEqual(12311057);
      expect(ScanFormatTable.dotsFor('B4')[0]).assertEqual(2953);
      expect(result).assertEqual('2953x4169');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010019 end');
    });

    /**
     * @tc.name   testFormat010020
     * @tc.number SUB_SCAN_FORMAT_01_0020
     * @tc.desc   totalPixels and dotsFor compute 'B5' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010020 begin');
      const result: string = ScanFormatTable.dotsText('B5');
      expect(ScanFormatTable.totalPixels('B5')).assertEqual(6139287);
      expect(ScanFormatTable.dotsFor('B5')[0]).assertEqual(2079);
      expect(result).assertEqual('2079x2953');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010020 end');
    });

    /**
     * @tc.name   testFormat010021
     * @tc.number SUB_SCAN_FORMAT_01_0021
     * @tc.desc   totalPixels and dotsFor compute 'LETTER' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010021 begin');
      const result: string = ScanFormatTable.dotsText('LETTER');
      expect(ScanFormatTable.totalPixels('LETTER')).assertEqual(8415000);
      expect(ScanFormatTable.dotsFor('LETTER')[0]).assertEqual(2550);
      expect(result).assertEqual('2550x3300');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010021 end');
    });

    /**
     * @tc.name   testFormat010022
     * @tc.number SUB_SCAN_FORMAT_01_0022
     * @tc.desc   totalPixels and dotsFor compute 'LEGAL' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010022 begin');
      const result: string = ScanFormatTable.dotsText('LEGAL');
      expect(ScanFormatTable.totalPixels('LEGAL')).assertEqual(10710000);
      expect(ScanFormatTable.dotsFor('LEGAL')[0]).assertEqual(2550);
      expect(result).assertEqual('2550x4200');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010022 end');
    });

    /**
     * @tc.name   testFormat010023
     * @tc.number SUB_SCAN_FORMAT_01_0023
     * @tc.desc   totalPixels and dotsFor compute '' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010023 begin');
      const result: string = ScanFormatTable.dotsText('');
      expect(ScanFormatTable.totalPixels('')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010023 end');
    });

    /**
     * @tc.name   testFormat010024
     * @tc.number SUB_SCAN_FORMAT_01_0024
     * @tc.desc   totalPixels and dotsFor compute 'a' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010024 begin');
      const result: string = ScanFormatTable.dotsText('a');
      expect(ScanFormatTable.totalPixels('a')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('a')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010024 end');
    });

    /**
     * @tc.name   testFormat010025
     * @tc.number SUB_SCAN_FORMAT_01_0025
     * @tc.desc   totalPixels and dotsFor compute 'A3 ' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010025 begin');
      const result: string = ScanFormatTable.dotsText('A3 ');
      expect(ScanFormatTable.totalPixels('A3 ')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('A3 ')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010025 end');
    });

    /**
     * @tc.name   testFormat010026
     * @tc.number SUB_SCAN_FORMAT_01_0026
     * @tc.desc   totalPixels and dotsFor compute 'a3' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010026 begin');
      const result: string = ScanFormatTable.dotsText('a3');
      expect(ScanFormatTable.totalPixels('a3')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('a3')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010026 end');
    });

    /**
     * @tc.name   testFormat010027
     * @tc.number SUB_SCAN_FORMAT_01_0027
     * @tc.desc   totalPixels and dotsFor compute 'LEGAL ' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010027 begin');
      const result: string = ScanFormatTable.dotsText('LEGAL ');
      expect(ScanFormatTable.totalPixels('LEGAL ')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('LEGAL ')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010027 end');
    });

    /**
     * @tc.name   testFormat010028
     * @tc.number SUB_SCAN_FORMAT_01_0028
     * @tc.desc   totalPixels and dotsFor compute 'jpeg' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010028 begin');
      const result: string = ScanFormatTable.dotsText('jpeg');
      expect(ScanFormatTable.totalPixels('jpeg')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('jpeg')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010028 end');
    });

    /**
     * @tc.name   testFormat010029
     * @tc.number SUB_SCAN_FORMAT_01_0029
     * @tc.desc   totalPixels and dotsFor compute 'LETTER1' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010029 begin');
      const result: string = ScanFormatTable.dotsText('LETTER1');
      expect(ScanFormatTable.totalPixels('LETTER1')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('LETTER1')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010029 end');
    });

    /**
     * @tc.name   testFormat010030
     * @tc.number SUB_SCAN_FORMAT_01_0030
     * @tc.desc   totalPixels and dotsFor compute 'A6' from the frozen dot table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010030 begin');
      const result: string = ScanFormatTable.dotsText('A6');
      expect(ScanFormatTable.totalPixels('A6')).assertEqual(8699840);
      expect(ScanFormatTable.dotsFor('A6')[0]).assertEqual(2480);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010030 end');
    });

    /**
     * @tc.name   testFormat010031
     * @tc.number SUB_SCAN_FORMAT_01_0031
     * @tc.desc   pageSizeAt(-100) returns '' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010031 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(-100)).assertEqual('');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(-100))).assertEqual(8699840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010031 end');
    });

    /**
     * @tc.name   testFormat010032
     * @tc.number SUB_SCAN_FORMAT_01_0032
     * @tc.desc   pageSizeAt(-1) returns '' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010032 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(-1)).assertEqual('');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(-1))).assertEqual(8699840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010032 end');
    });

    /**
     * @tc.name   testFormat010033
     * @tc.number SUB_SCAN_FORMAT_01_0033
     * @tc.desc   pageSizeAt(0) returns 'A3' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010033 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(0)).assertEqual('A3');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(0))).assertEqual(17403188);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010033 end');
    });

    /**
     * @tc.name   testFormat010034
     * @tc.number SUB_SCAN_FORMAT_01_0034
     * @tc.desc   pageSizeAt(1) returns 'A4' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010034 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(1)).assertEqual('A4');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(1))).assertEqual(8699840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010034 end');
    });

    /**
     * @tc.name   testFormat010035
     * @tc.number SUB_SCAN_FORMAT_01_0035
     * @tc.desc   pageSizeAt(2) returns 'A5' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010035 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(2)).assertEqual('A5');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(2))).assertEqual(4335040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010035 end');
    });

    /**
     * @tc.name   testFormat010036
     * @tc.number SUB_SCAN_FORMAT_01_0036
     * @tc.desc   pageSizeAt(3) returns 'B4' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010036 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(3)).assertEqual('B4');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(3))).assertEqual(12311057);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010036 end');
    });

    /**
     * @tc.name   testFormat010037
     * @tc.number SUB_SCAN_FORMAT_01_0037
     * @tc.desc   pageSizeAt(4) returns 'B5' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010037 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(4)).assertEqual('B5');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(4))).assertEqual(6139287);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010037 end');
    });

    /**
     * @tc.name   testFormat010038
     * @tc.number SUB_SCAN_FORMAT_01_0038
     * @tc.desc   pageSizeAt(5) returns 'LETTER' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010038 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(5)).assertEqual('LETTER');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(5))).assertEqual(8415000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010038 end');
    });

    /**
     * @tc.name   testFormat010039
     * @tc.number SUB_SCAN_FORMAT_01_0039
     * @tc.desc   pageSizeAt(6) returns 'LEGAL' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010039 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(6)).assertEqual('LEGAL');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(6))).assertEqual(10710000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010039 end');
    });

    /**
     * @tc.name   testFormat010040
     * @tc.number SUB_SCAN_FORMAT_01_0040
     * @tc.desc   pageSizeAt(7) returns '' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010040 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(7)).assertEqual('');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(7))).assertEqual(8699840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010040 end');
    });

    /**
     * @tc.name   testFormat010041
     * @tc.number SUB_SCAN_FORMAT_01_0041
     * @tc.desc   pageSizeAt(8) returns '' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010041 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(8)).assertEqual('');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(8))).assertEqual(8699840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010041 end');
    });

    /**
     * @tc.name   testFormat010042
     * @tc.number SUB_SCAN_FORMAT_01_0042
     * @tc.desc   pageSizeAt(50) returns '' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010042 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(50)).assertEqual('');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(50))).assertEqual(8699840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010042 end');
    });

    /**
     * @tc.name   testFormat010043
     * @tc.number SUB_SCAN_FORMAT_01_0043
     * @tc.desc   pageSizeAt(100) returns '' with fallback dots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010043 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.pageSizeAt(100)).assertEqual('');
      expect(result).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels(ScanFormatTable.pageSizeAt(100))).assertEqual(8699840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010043 end');
    });

    /**
     * @tc.name   testFormat010044
     * @tc.number SUB_SCAN_FORMAT_01_0044
     * @tc.desc   formatIndex and extension map 'jpg' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010044 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('jpg')).assertEqual(0);
      expect(ScanFormatTable.extension('jpg')).assertEqual('jpg');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010044 end');
    });

    /**
     * @tc.name   testFormat010045
     * @tc.number SUB_SCAN_FORMAT_01_0045
     * @tc.desc   formatIndex and extension map 'png' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010045 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('png')).assertEqual(1);
      expect(ScanFormatTable.extension('png')).assertEqual('png');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010045 end');
    });

    /**
     * @tc.name   testFormat010046
     * @tc.number SUB_SCAN_FORMAT_01_0046
     * @tc.desc   formatIndex and extension map 'pdf' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010046 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('pdf')).assertEqual(2);
      expect(ScanFormatTable.extension('pdf')).assertEqual('pdf');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010046 end');
    });

    /**
     * @tc.name   testFormat010047
     * @tc.number SUB_SCAN_FORMAT_01_0047
     * @tc.desc   formatIndex and extension map 'bmp' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010047 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('bmp')).assertEqual(3);
      expect(ScanFormatTable.extension('bmp')).assertEqual('bmp');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010047 end');
    });

    /**
     * @tc.name   testFormat010048
     * @tc.number SUB_SCAN_FORMAT_01_0048
     * @tc.desc   formatIndex and extension map 'tiff' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010048 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('tiff')).assertEqual(4);
      expect(ScanFormatTable.extension('tiff')).assertEqual('tiff');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010048 end');
    });

    /**
     * @tc.name   testFormat010049
     * @tc.number SUB_SCAN_FORMAT_01_0049
     * @tc.desc   formatIndex and extension map '' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010049 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('')).assertEqual(-1);
      expect(ScanFormatTable.extension('')).assertEqual('');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010049 end');
    });

    /**
     * @tc.name   testFormat010050
     * @tc.number SUB_SCAN_FORMAT_01_0050
     * @tc.desc   formatIndex and extension map 'JPG' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010050 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('JPG')).assertEqual(-1);
      expect(ScanFormatTable.extension('JPG')).assertEqual('');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010050 end');
    });

    /**
     * @tc.name   testFormat010051
     * @tc.number SUB_SCAN_FORMAT_01_0051
     * @tc.desc   formatIndex and extension map 'jpeg' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010051 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('jpeg')).assertEqual(-1);
      expect(ScanFormatTable.extension('jpeg')).assertEqual('');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010051 end');
    });

    /**
     * @tc.name   testFormat010052
     * @tc.number SUB_SCAN_FORMAT_01_0052
     * @tc.desc   formatIndex and extension map 'gif' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010052 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('gif')).assertEqual(-1);
      expect(ScanFormatTable.extension('gif')).assertEqual('');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010052 end');
    });

    /**
     * @tc.name   testFormat010053
     * @tc.number SUB_SCAN_FORMAT_01_0053
     * @tc.desc   formatIndex and extension map 'tif' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010053 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('tif')).assertEqual(-1);
      expect(ScanFormatTable.extension('tif')).assertEqual('');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010053 end');
    });

    /**
     * @tc.name   testFormat010054
     * @tc.number SUB_SCAN_FORMAT_01_0054
     * @tc.desc   formatIndex and extension map 'PDF' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010054 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('PDF')).assertEqual(-1);
      expect(ScanFormatTable.extension('PDF')).assertEqual('');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010054 end');
    });

    /**
     * @tc.name   testFormat010055
     * @tc.number SUB_SCAN_FORMAT_01_0055
     * @tc.desc   formatIndex and extension map 'a' with unknown fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010055 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.formatIndex('a')).assertEqual(-1);
      expect(ScanFormatTable.extension('a')).assertEqual('');
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010055 end');
    });

    /**
     * @tc.name   testFormat010056
     * @tc.number SUB_SCAN_FORMAT_01_0056
     * @tc.desc   mimeType and colorDepth map 'jpg' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010056 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('jpg')).assertEqual('image/jpeg');
      expect(ScanFormatTable.colorDepth('jpg')).assertEqual(24);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010056 end');
    });

    /**
     * @tc.name   testFormat010057
     * @tc.number SUB_SCAN_FORMAT_01_0057
     * @tc.desc   mimeType and colorDepth map 'png' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010057 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('png')).assertEqual('image/png');
      expect(ScanFormatTable.colorDepth('png')).assertEqual(24);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010057 end');
    });

    /**
     * @tc.name   testFormat010058
     * @tc.number SUB_SCAN_FORMAT_01_0058
     * @tc.desc   mimeType and colorDepth map 'pdf' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010058 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('pdf')).assertEqual('application/pdf');
      expect(ScanFormatTable.colorDepth('pdf')).assertEqual(32);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010058 end');
    });

    /**
     * @tc.name   testFormat010059
     * @tc.number SUB_SCAN_FORMAT_01_0059
     * @tc.desc   mimeType and colorDepth map 'bmp' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010059 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('bmp')).assertEqual('image/bmp');
      expect(ScanFormatTable.colorDepth('bmp')).assertEqual(24);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010059 end');
    });

    /**
     * @tc.name   testFormat010060
     * @tc.number SUB_SCAN_FORMAT_01_0060
     * @tc.desc   mimeType and colorDepth map 'tiff' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010060 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('tiff')).assertEqual('image/tiff');
      expect(ScanFormatTable.colorDepth('tiff')).assertEqual(24);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010060 end');
    });

    /**
     * @tc.name   testFormat010061
     * @tc.number SUB_SCAN_FORMAT_01_0061
     * @tc.desc   mimeType and colorDepth map '' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010061 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.colorDepth('')).assertEqual(0);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010061 end');
    });

    /**
     * @tc.name   testFormat010062
     * @tc.number SUB_SCAN_FORMAT_01_0062
     * @tc.desc   mimeType and colorDepth map 'JPG' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010062 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('JPG')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.colorDepth('JPG')).assertEqual(0);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010062 end');
    });

    /**
     * @tc.name   testFormat010063
     * @tc.number SUB_SCAN_FORMAT_01_0063
     * @tc.desc   mimeType and colorDepth map 'jpeg' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010063 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('jpeg')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.colorDepth('jpeg')).assertEqual(0);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010063 end');
    });

    /**
     * @tc.name   testFormat010064
     * @tc.number SUB_SCAN_FORMAT_01_0064
     * @tc.desc   mimeType and colorDepth map 'gif' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010064 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('gif')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.colorDepth('gif')).assertEqual(0);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010064 end');
    });

    /**
     * @tc.name   testFormat010065
     * @tc.number SUB_SCAN_FORMAT_01_0065
     * @tc.desc   mimeType and colorDepth map 'tif' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010065 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('tif')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.colorDepth('tif')).assertEqual(0);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010065 end');
    });

    /**
     * @tc.name   testFormat010066
     * @tc.number SUB_SCAN_FORMAT_01_0066
     * @tc.desc   mimeType and colorDepth map 'PDF' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010066 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('PDF')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.colorDepth('PDF')).assertEqual(0);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010066 end');
    });

    /**
     * @tc.name   testFormat010067
     * @tc.number SUB_SCAN_FORMAT_01_0067
     * @tc.desc   mimeType and colorDepth map 'a' from the frozen format table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010067 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.mimeType('a')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.colorDepth('a')).assertEqual(0);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010067 end');
    });

    /**
     * @tc.name   testFormat010068
     * @tc.number SUB_SCAN_FORMAT_01_0068
     * @tc.desc   multiPage and gray flags for 'jpg' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010068 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('jpg')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('jpg')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010068 end');
    });

    /**
     * @tc.name   testFormat010069
     * @tc.number SUB_SCAN_FORMAT_01_0069
     * @tc.desc   multiPage and gray flags for 'png' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010069 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('png')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('png')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010069 end');
    });

    /**
     * @tc.name   testFormat010070
     * @tc.number SUB_SCAN_FORMAT_01_0070
     * @tc.desc   multiPage and gray flags for 'pdf' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010070 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('pdf')).assertEqual(true);
      expect(ScanFormatTable.supportsGray('pdf')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010070 end');
    });

    /**
     * @tc.name   testFormat010071
     * @tc.number SUB_SCAN_FORMAT_01_0071
     * @tc.desc   multiPage and gray flags for 'bmp' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010071 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('bmp')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('bmp')).assertEqual(true);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010071 end');
    });

    /**
     * @tc.name   testFormat010072
     * @tc.number SUB_SCAN_FORMAT_01_0072
     * @tc.desc   multiPage and gray flags for 'tiff' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010072 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('tiff')).assertEqual(true);
      expect(ScanFormatTable.supportsGray('tiff')).assertEqual(true);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010072 end');
    });

    /**
     * @tc.name   testFormat010073
     * @tc.number SUB_SCAN_FORMAT_01_0073
     * @tc.desc   multiPage and gray flags for '' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010073 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010073 end');
    });

    /**
     * @tc.name   testFormat010074
     * @tc.number SUB_SCAN_FORMAT_01_0074
     * @tc.desc   multiPage and gray flags for 'JPG' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010074 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('JPG')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('JPG')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010074 end');
    });

    /**
     * @tc.name   testFormat010075
     * @tc.number SUB_SCAN_FORMAT_01_0075
     * @tc.desc   multiPage and gray flags for 'jpeg' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010075 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('jpeg')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('jpeg')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010075 end');
    });

    /**
     * @tc.name   testFormat010076
     * @tc.number SUB_SCAN_FORMAT_01_0076
     * @tc.desc   multiPage and gray flags for 'gif' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010076 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('gif')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('gif')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010076 end');
    });

    /**
     * @tc.name   testFormat010077
     * @tc.number SUB_SCAN_FORMAT_01_0077
     * @tc.desc   multiPage and gray flags for 'tif' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010077 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('tif')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('tif')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010077 end');
    });

    /**
     * @tc.name   testFormat010078
     * @tc.number SUB_SCAN_FORMAT_01_0078
     * @tc.desc   multiPage and gray flags for 'PDF' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010078 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('PDF')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('PDF')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010078 end');
    });

    /**
     * @tc.name   testFormat010079
     * @tc.number SUB_SCAN_FORMAT_01_0079
     * @tc.desc   multiPage and gray flags for 'a' follow the frozen table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010079 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.isMultiPage('a')).assertEqual(false);
      expect(ScanFormatTable.supportsGray('a')).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010079 end');
    });

    /**
     * @tc.name   testFormat010080
     * @tc.number SUB_SCAN_FORMAT_01_0080
     * @tc.desc   describe combines format 'jpg' with page 'A3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010080 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('jpg', 'A3')).assertEqual('format=jpg page=A3 pixels=3508x4961 multi=false');
      expect(ScanFormatTable.describe('jpg', 'A3').indexOf('multi=true') >= 0).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010080 end');
    });

    /**
     * @tc.name   testFormat010081
     * @tc.number SUB_SCAN_FORMAT_01_0081
     * @tc.desc   describe combines format 'png' with page 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010081 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('png', 'A4')).assertEqual('format=png page=A4 pixels=2480x3508 multi=false');
      expect(ScanFormatTable.describe('png', 'A4').indexOf('multi=true') >= 0).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010081 end');
    });

    /**
     * @tc.name   testFormat010082
     * @tc.number SUB_SCAN_FORMAT_01_0082
     * @tc.desc   describe combines format 'pdf' with page 'A5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010082 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('pdf', 'A5')).assertEqual('format=pdf page=A5 pixels=1748x2480 multi=true');
      expect(ScanFormatTable.describe('pdf', 'A5').indexOf('multi=true') >= 0).assertEqual(true);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010082 end');
    });

    /**
     * @tc.name   testFormat010083
     * @tc.number SUB_SCAN_FORMAT_01_0083
     * @tc.desc   describe combines format 'bmp' with page 'B4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010083 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('bmp', 'B4')).assertEqual('format=bmp page=B4 pixels=2953x4169 multi=false');
      expect(ScanFormatTable.describe('bmp', 'B4').indexOf('multi=true') >= 0).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010083 end');
    });

    /**
     * @tc.name   testFormat010084
     * @tc.number SUB_SCAN_FORMAT_01_0084
     * @tc.desc   describe combines format 'tiff' with page 'B5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010084 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('tiff', 'B5')).assertEqual('format=tiff page=B5 pixels=2079x2953 multi=true');
      expect(ScanFormatTable.describe('tiff', 'B5').indexOf('multi=true') >= 0).assertEqual(true);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010084 end');
    });

    /**
     * @tc.name   testFormat010085
     * @tc.number SUB_SCAN_FORMAT_01_0085
     * @tc.desc   describe combines format 'jpg' with page 'LETTER'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010085 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(
        ScanFormatTable.describe('jpg', 'LETTER')
      ).assertEqual('format=jpg page=LETTER pixels=2550x3300 multi=false');
      expect(ScanFormatTable.describe('jpg', 'LETTER').indexOf('multi=true') >= 0).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010085 end');
    });

    /**
     * @tc.name   testFormat010086
     * @tc.number SUB_SCAN_FORMAT_01_0086
     * @tc.desc   describe combines format 'png' with page 'LEGAL'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010086 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(
        ScanFormatTable.describe('png', 'LEGAL')
      ).assertEqual('format=png page=LEGAL pixels=2550x4200 multi=false');
      expect(ScanFormatTable.describe('png', 'LEGAL').indexOf('multi=true') >= 0).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010086 end');
    });

    /**
     * @tc.name   testFormat010087
     * @tc.number SUB_SCAN_FORMAT_01_0087
     * @tc.desc   describe combines format 'gif' with page 'A4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010087 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('gif', 'A4')).assertEqual('format=gif page=A4 pixels=2480x3508 multi=false');
      expect(ScanFormatTable.describe('gif', 'A4').indexOf('multi=true') >= 0).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010087 end');
    });

    /**
     * @tc.name   testFormat010088
     * @tc.number SUB_SCAN_FORMAT_01_0088
     * @tc.desc   describe combines format 'pdf' with page 'ZZZ'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010088 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('pdf', 'ZZZ')).assertEqual('format=pdf page=ZZZ pixels=2480x3508 multi=true');
      expect(ScanFormatTable.describe('pdf', 'ZZZ').indexOf('multi=true') >= 0).assertEqual(true);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010088 end');
    });

    /**
     * @tc.name   testFormat010089
     * @tc.number SUB_SCAN_FORMAT_01_0089
     * @tc.desc   describe combines format 'tiff' with page ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010089 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('tiff', '')).assertEqual('format=tiff page= pixels=2480x3508 multi=true');
      expect(ScanFormatTable.describe('tiff', '').indexOf('multi=true') >= 0).assertEqual(true);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010089 end');
    });

    /**
     * @tc.name   testFormat010090
     * @tc.number SUB_SCAN_FORMAT_01_0090
     * @tc.desc   describe combines format 'jpg' with page 'a3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFormat010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010090 begin');
      const result: string = ScanFormatTable.dotsText('A4');
      expect(ScanFormatTable.describe('jpg', 'a3')).assertEqual('format=jpg page=a3 pixels=2480x3508 multi=false');
      expect(ScanFormatTable.describe('jpg', 'a3').indexOf('multi=true') >= 0).assertEqual(false);
      expect(result).assertEqual('2480x3508');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFormat010090 end');
    });

  });
}
