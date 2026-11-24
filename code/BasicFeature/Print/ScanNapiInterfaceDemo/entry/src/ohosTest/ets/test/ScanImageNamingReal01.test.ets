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
import { ScanImageNaming } from '../../../main/ets/scan/model/ScanImageNaming';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanImageNameRealTest() {
  describe('ScanImageNaming', () => {

    /**
     * @tc.name   testImageReal0001
     * @tc.number SUB_SCAN_IMGNAME_02_0001
     * @tc.desc   padIndex pads to four digits and takes the absolute value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0001 begin');
      const inputs: number[] = [0, 7, 99, 999, 9999];
      const expected: string[] = ['0000', '0007', '0099', '0999', '9999'];
      let matched: number = 0;
      for (let index = 0; index < inputs.length; index++) {
        if (ScanImageNaming.padIndex(inputs[index]) === expected[index]) {
          matched++;
        }
      }
      expect(matched).assertEqual(5);
      expect(ScanImageNaming.padIndex(-7)).assertEqual('0007');
      expect(ScanImageNaming.padIndex(3.7)).assertEqual('0003');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0001 end');
    });

    /**
     * @tc.name   testImageReal0002
     * @tc.number SUB_SCAN_IMGNAME_02_0002
     * @tc.desc   padIndex skips padding once the index exceeds four digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0002 begin');
      expect(ScanImageNaming.padIndex(10000)).assertEqual('10000');
      expect(ScanImageNaming.padIndex(9999)).assertEqual('9999');
      expect(ScanImageNaming.padIndex(10000).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0002 end');
    });

    /**
     * @tc.name   testImageReal0003
     * @tc.number SUB_SCAN_IMGNAME_02_0003
     * @tc.desc   pad2 adds a leading zero below ten only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0003 begin');
      expect(ScanImageNaming.pad2(0)).assertEqual('00');
      expect(ScanImageNaming.pad2(9)).assertEqual('09');
      expect(ScanImageNaming.pad2(10)).assertEqual('10');
      expect(ScanImageNaming.pad2(31)).assertEqual('31');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0003 end');
    });

    /**
     * @tc.name   testImageReal0004
     * @tc.number SUB_SCAN_IMGNAME_02_0004
     * @tc.desc   normalizeFormat trims, lowercases and drops one leading dot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0004 begin');
      expect(ScanImageNaming.normalizeFormat(' PNG ')).assertEqual('png');
      expect(ScanImageNaming.normalizeFormat('.JpEg')).assertEqual('jpeg');
      expect(ScanImageNaming.normalizeFormat('..png')).assertEqual('.png');
      expect(ScanImageNaming.normalizeFormat('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0004 end');
    });

    /**
     * @tc.name   testImageReal0005
     * @tc.number SUB_SCAN_IMGNAME_02_0005
     * @tc.desc   every documented format is accepted in any casing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0005 begin');
      let accepted: number = 0;
      for (let index = 0; index < ScanImageNaming.SUPPORTED_FORMATS.length; index++) {
        if (ScanImageNaming.isSupportedFormat(ScanImageNaming.SUPPORTED_FORMATS[index].toUpperCase())) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(5);
      expect(ScanImageNaming.isSupportedFormat('.PDF')).assertTrue();
      expect(ScanImageNaming.isSupportedFormat('tiff ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0005 end');
    });

    /**
     * @tc.name   testImageReal0006
     * @tc.number SUB_SCAN_IMGNAME_02_0006
     * @tc.desc   unsupported or empty formats are rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0006 begin');
      expect(ScanImageNaming.isSupportedFormat('bmp')).assertFalse();
      expect(ScanImageNaming.isSupportedFormat('')).assertFalse();
      expect(ScanImageNaming.isSupportedFormat('jp')).assertFalse();
      expect(ScanImageNaming.isSupportedFormat('jpgx')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0006 end');
    });

    /**
     * @tc.name   testImageReal0007
     * @tc.number SUB_SCAN_IMGNAME_02_0007
     * @tc.desc   formatDate renders UTC dates so the result is timezone independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0007 begin');
      expect(ScanImageNaming.formatDate(0)).assertEqual('19700101');
      expect(ScanImageNaming.formatDate(86400000)).assertEqual('19700102');
      expect(ScanImageNaming.formatDate(1700000000000)).assertEqual('20231114');
      expect(ScanImageNaming.formatDate(1735689599000)).assertEqual('20241231');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0007 end');
    });

    /**
     * @tc.name   testImageReal0008
     * @tc.number SUB_SCAN_IMGNAME_02_0008
     * @tc.desc   an invalid timestamp degrades to the zero date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0008 begin');
      expect(ScanImageNaming.formatDate(Number.NaN)).assertEqual('00000000');
      expect(ScanImageNaming.build(4, 'png', Number.NaN)).assertEqual('scan_0004_00000000.png');
      expect(ScanImageNaming.isValid('scan_0004_00000000.png')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0008 end');
    });

    /**
     * @tc.name   testImageReal0009
     * @tc.number SUB_SCAN_IMGNAME_02_0009
     * @tc.desc   build joins prefix, padded index, date and normalized format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0009 begin');
      expect(ScanImageNaming.build(12, '.PNG', 1700000000000)).assertEqual('scan_0012_20231114.png');
      expect(ScanImageNaming.build(9999, 'pdf', 0)).assertEqual('scan_9999_19700101.pdf');
      expect(ScanImageNaming.build(0, 'jpeg', 86400000)).assertEqual('scan_0000_19700102.jpeg');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0009 end');
    });

    /**
     * @tc.name   testImageReal0010
     * @tc.number SUB_SCAN_IMGNAME_02_0010
     * @tc.desc   unsupported formats fall back to jpg in the built name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0010 begin');
      expect(ScanImageNaming.build(5, 'bmp', 0)).assertEqual('scan_0005_19700101.jpg');
      expect(ScanImageNaming.build(5, '', 0)).assertEqual('scan_0005_19700101.jpg');
      expect(ScanImageNaming.extractFormat(ScanImageNaming.build(5, 'bmp', 0))).assertEqual('jpg');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0010 end');
    });

    /**
     * @tc.name   testImageReal0011
     * @tc.number SUB_SCAN_IMGNAME_02_0011
     * @tc.desc   negative and fractional indexes are normalized before padding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0011 begin');
      expect(ScanImageNaming.build(-7, 'jpg', 0)).assertEqual('scan_0007_19700101.jpg');
      expect(ScanImageNaming.build(3.7, 'jpg', 0)).assertEqual('scan_0003_19700101.jpg');
      expect(ScanImageNaming.parseIndex(ScanImageNaming.build(-7, 'jpg', 0))).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0011 end');
    });

    /**
     * @tc.name   testImageReal0012
     * @tc.number SUB_SCAN_IMGNAME_02_0012
     * @tc.desc   parseIndex reads the four digit segment of a valid name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0012 begin');
      expect(ScanImageNaming.parseIndex('scan_0012_20240101.png')).assertEqual(12);
      expect(ScanImageNaming.parseIndex('scan_0000_19700101.jpg')).assertEqual(0);
      expect(ScanImageNaming.parseIndex('scan_9999_20241231.tiff')).assertEqual(9999);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0012 end');
    });

    /**
     * @tc.name   testImageReal0013
     * @tc.number SUB_SCAN_IMGNAME_02_0013
     * @tc.desc   parseIndex rejects names whose segment count is not three
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0013 begin');
      expect(ScanImageNaming.parseIndex('scan_0012')).assertEqual(-1);
      expect(ScanImageNaming.parseIndex('scan_0012_20240101_extra.jpg')).assertEqual(-1);
      expect(ScanImageNaming.parseIndex('')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0013 end');
    });

    /**
     * @tc.name   testImageReal0014
     * @tc.number SUB_SCAN_IMGNAME_02_0014
     * @tc.desc   parseIndex rejects a wrong prefix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0014 begin');
      expect(ScanImageNaming.parseIndex('image_0012_20240101.png')).assertEqual(-1);
      expect(ScanImageNaming.parseIndex('Scan_0012_20240101.png')).assertEqual(-1);
      expect(ScanImageNaming.parseIndex('scan_0012_20240101.png')).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0014 end');
    });

    /**
     * @tc.name   testImageReal0015
     * @tc.number SUB_SCAN_IMGNAME_02_0015
     * @tc.desc   parseIndex rejects indexes that are not exactly four digits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0015 begin');
      const wrongLength: string[] = ['scan_12_20240101.png', 'scan_00123_20240101.png', 'scan_0012x_20240101.png'];
      let rejected: number = 0;
      for (let i = 0; i < wrongLength.length; i++) {
        if (ScanImageNaming.parseIndex(wrongLength[i]) === -1) {
          rejected++;
        }
      }
      expect(rejected).assertEqual(3);
      expect(ScanImageNaming.parseIndex('scan_0012_20240101.png')).assertEqual(12);
      expect(wrongLength.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0015 end');
    });

    /**
     * @tc.name   testImageReal0016
     * @tc.number SUB_SCAN_IMGNAME_02_0016
     * @tc.desc   extractFormat returns the normalized supported suffix only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0016 begin');
      expect(ScanImageNaming.extractFormat('scan_0012_20240101.PNG')).assertEqual('png');
      expect(ScanImageNaming.extractFormat('scan_0012_20240101.bmp')).assertEqual('');
      expect(ScanImageNaming.extractFormat('scan_0012_20240101')).assertEqual('');
      expect(ScanImageNaming.extractFormat('scan_0012_20240101.')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0016 end');
    });

    /**
     * @tc.name   testImageReal0017
     * @tc.number SUB_SCAN_IMGNAME_02_0017
     * @tc.desc   isValid requires both a four digit index and a supported format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0017 begin');
      expect(ScanImageNaming.isValid('scan_0012_20240101.pdf')).assertTrue();
      expect(ScanImageNaming.isValid('scan_00123_20240101.pdf')).assertFalse();
      expect(ScanImageNaming.isValid('scan_0012_20240101')).assertFalse();
      expect(ScanImageNaming.isValid('notes.txt')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0017 end');
    });

    /**
     * @tc.name   testImageReal0018
     * @tc.number SUB_SCAN_IMGNAME_02_0018
     * @tc.desc   nextIndex starts at one for an empty folder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0018 begin');
      expect(ScanImageNaming.nextIndex([])).assertEqual(1);
      expect(ScanImageNaming.nextIndex(['notes.txt', 'scan_bad_20240101.jpg'])).assertEqual(1);
      expect(ScanImageNaming.nextIndex(['scan_0000_19700101.jpg'])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0018 end');
    });

    /**
     * @tc.name   testImageReal0019
     * @tc.number SUB_SCAN_IMGNAME_02_0019
     * @tc.desc   nextIndex continues after the largest existing index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0019 begin');
      const names: string[] = [
        'scan_0003_20240101.jpg', 'scan_0010_20240101.png', 'scan_0007_20240101.pdf'];
      expect(ScanImageNaming.nextIndex(names)).assertEqual(11);
      expect(ScanImageNaming.nextIndex(['scan_0010_20240101.png'])).assertEqual(11);
      expect(ScanImageNaming.nextIndex(names) > ScanImageNaming.MAX_INDEX).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0019 end');
    });

    /**
     * @tc.name   testImageReal0020
     * @tc.number SUB_SCAN_IMGNAME_02_0020
     * @tc.desc   nextIndex ignores unparsable names when picking the maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0020 begin');
      const names: string[] = ['cover.bmp', 'scan_0002_20240101.jpg', 'scan_abcd_20240101.jpg'];
      expect(ScanImageNaming.nextIndex(names)).assertEqual(3);
      expect(ScanImageNaming.parseIndex('cover.bmp')).assertEqual(-1);
      expect(ScanImageNaming.parseIndex('scan_abcd_20240101.jpg')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0020 end');
    });

    /**
     * @tc.name   testImageReal0021
     * @tc.number SUB_SCAN_IMGNAME_02_0021
     * @tc.desc   sortByIndex sorts a copy by numeric index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0021 begin');
      const names: string[] = ['scan_0010_20240101.jpg', 'scan_0002_20240101.jpg', 'scan_0001_20240101.jpg'];
      const sorted: string[] = ScanImageNaming.sortByIndex(names);
      expect(ScanImageNaming.parseIndex(sorted[0])).assertEqual(1);
      expect(ScanImageNaming.parseIndex(sorted[2])).assertEqual(10);
      expect(ScanImageNaming.parseIndex(names[0])).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0021 end');
    });

    /**
     * @tc.name   testImageReal0022
     * @tc.number SUB_SCAN_IMGNAME_02_0022
     * @tc.desc   sortByIndex pushes every invalid name to the tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0022 begin');
      const names: string[] = ['notes.txt', 'scan_0005_20240101.jpg', 'scan_0010_20240101.jpg'];
      const sorted: string[] = ScanImageNaming.sortByIndex(names);
      expect(sorted[0]).assertEqual('scan_0005_20240101.jpg');
      expect(ScanImageNaming.parseIndex(sorted[2])).assertEqual(-1);
      expect(sorted[2]).assertEqual('notes.txt');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0022 end');
    });

    /**
     * @tc.name   testImageReal0023
     * @tc.number SUB_SCAN_IMGNAME_02_0023
     * @tc.desc   documented constants stay stable for the file naming policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0023 begin');
      expect(ScanImageNaming.PREFIX).assertEqual('scan');
      expect(ScanImageNaming.SEPARATOR).assertEqual('_');
      expect(ScanImageNaming.INDEX_DIGITS).assertEqual(4);
      expect(ScanImageNaming.MAX_INDEX).assertEqual(9999);
      expect(ScanImageNaming.INVALID_INDEX).assertEqual(-1);
      expect(ScanImageNaming.DEFAULT_FORMAT).assertEqual('jpg');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0023 end');
    });

    /**
     * @tc.name   testImageReal0024
     * @tc.number SUB_SCAN_IMGNAME_02_0024
     * @tc.desc   a generated name survives the parse and sort round trip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0024 begin');
      const names: string[] = [];
      for (let index = 1; index <= 3; index++) {
        names.push(ScanImageNaming.build(index, 'pdf', 1609459200000));
      }
      const sorted: string[] = ScanImageNaming.sortByIndex(names);
      expect(ScanImageNaming.nextIndex(sorted)).assertEqual(4);
      expect(ScanImageNaming.parseIndex(sorted[1])).assertEqual(2);
      expect(ScanImageNaming.extractFormat(sorted[2])).assertEqual('pdf');
      expect(ScanImageNaming.SUPPORTED_FORMATS.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageReal0024 end');
    });
  });
}
