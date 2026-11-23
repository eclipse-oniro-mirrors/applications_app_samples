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

export default function scanImageNameTest() {
  describe('ScanImageName', () => {

    /**
     * @tc.name   testImageName0001
     * @tc.number SUB_SCAN_IMGNAME_01_0001
     * @tc.desc   build name for index 0 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0001 begin');
      const result: string = ScanImageNaming.build(0, 'jpg', 86400000);
      expect(result).assertEqual('scan_0000_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0001 end');
    });

    /**
     * @tc.name   testImageName0002
     * @tc.number SUB_SCAN_IMGNAME_01_0002
     * @tc.desc   build name for index 0 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0002 begin');
      const result: string = ScanImageNaming.build(0, 'JPG', 1609459200000);
      expect(result).assertEqual('scan_0000_20210101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0002 end');
    });

    /**
     * @tc.name   testImageName0003
     * @tc.number SUB_SCAN_IMGNAME_01_0003
     * @tc.desc   build name for index 0 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0003 begin');
      const result: string = ScanImageNaming.build(0, '.png', 1700000000000);
      expect(result).assertEqual('scan_0000_20231114.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0003 end');
    });

    /**
     * @tc.name   testImageName0004
     * @tc.number SUB_SCAN_IMGNAME_01_0004
     * @tc.desc   build name for index 0 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0004 begin');
      const result: string = ScanImageNaming.build(0, ' pdf ', 1735689599000);
      expect(result).assertEqual('scan_0000_20241231.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0004 end');
    });

    /**
     * @tc.name   testImageName0005
     * @tc.number SUB_SCAN_IMGNAME_01_0005
     * @tc.desc   build name for index 0 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0005 begin');
      const result: string = ScanImageNaming.build(0, 'tiff', 0);
      expect(result).assertEqual('scan_0000_19700101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0005 end');
    });

    /**
     * @tc.name   testImageName0006
     * @tc.number SUB_SCAN_IMGNAME_01_0006
     * @tc.desc   build name for index 0 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0006 begin');
      const result: string = ScanImageNaming.build(0, 'bmp', 86400000);
      expect(result).assertEqual('scan_0000_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0006 end');
    });

    /**
     * @tc.name   testImageName0007
     * @tc.number SUB_SCAN_IMGNAME_01_0007
     * @tc.desc   build name for index 0 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0007 begin');
      const result: string = ScanImageNaming.build(0, '', 1609459200000);
      expect(result).assertEqual('scan_0000_20210101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0007 end');
    });

    /**
     * @tc.name   testImageName0008
     * @tc.number SUB_SCAN_IMGNAME_01_0008
     * @tc.desc   build name for index 0 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0008 begin');
      const result: string = ScanImageNaming.build(0, 'JPeG', 1700000000000);
      expect(result).assertEqual('scan_0000_20231114.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0008 end');
    });

    /**
     * @tc.name   testImageName0009
     * @tc.number SUB_SCAN_IMGNAME_01_0009
     * @tc.desc   build name for index 0 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0009 begin');
      const result: string = ScanImageNaming.build(0, '.Tiff', 1735689599000);
      expect(result).assertEqual('scan_0000_20241231.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(0);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0009 end');
    });

    /**
     * @tc.name   testImageName0010
     * @tc.number SUB_SCAN_IMGNAME_01_0010
     * @tc.desc   build name for index 1 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0010 begin');
      const result: string = ScanImageNaming.build(1, 'jpg', 0);
      expect(result).assertEqual('scan_0001_19700101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0010 end');
    });

    /**
     * @tc.name   testImageName0011
     * @tc.number SUB_SCAN_IMGNAME_01_0011
     * @tc.desc   build name for index 1 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0011 begin');
      const result: string = ScanImageNaming.build(1, 'JPG', 86400000);
      expect(result).assertEqual('scan_0001_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0011 end');
    });

    /**
     * @tc.name   testImageName0012
     * @tc.number SUB_SCAN_IMGNAME_01_0012
     * @tc.desc   build name for index 1 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0012 begin');
      const result: string = ScanImageNaming.build(1, '.png', 1609459200000);
      expect(result).assertEqual('scan_0001_20210101.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0012 end');
    });

    /**
     * @tc.name   testImageName0013
     * @tc.number SUB_SCAN_IMGNAME_01_0013
     * @tc.desc   build name for index 1 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0013 begin');
      const result: string = ScanImageNaming.build(1, ' pdf ', Number.NaN);
      expect(result).assertEqual('scan_0001_00000000.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0013 end');
    });

    /**
     * @tc.name   testImageName0014
     * @tc.number SUB_SCAN_IMGNAME_01_0014
     * @tc.desc   build name for index 1 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0014 begin');
      const result: string = ScanImageNaming.build(1, 'tiff', 1735689599000);
      expect(result).assertEqual('scan_0001_20241231.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0014 end');
    });

    /**
     * @tc.name   testImageName0015
     * @tc.number SUB_SCAN_IMGNAME_01_0015
     * @tc.desc   build name for index 1 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0015 begin');
      const result: string = ScanImageNaming.build(1, 'bmp', 0);
      expect(result).assertEqual('scan_0001_19700101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0015 end');
    });

    /**
     * @tc.name   testImageName0016
     * @tc.number SUB_SCAN_IMGNAME_01_0016
     * @tc.desc   build name for index 1 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0016 begin');
      const result: string = ScanImageNaming.build(1, '', 86400000);
      expect(result).assertEqual('scan_0001_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0016 end');
    });

    /**
     * @tc.name   testImageName0017
     * @tc.number SUB_SCAN_IMGNAME_01_0017
     * @tc.desc   build name for index 1 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0017 begin');
      const result: string = ScanImageNaming.build(1, 'JPeG', 1609459200000);
      expect(result).assertEqual('scan_0001_20210101.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0017 end');
    });

    /**
     * @tc.name   testImageName0018
     * @tc.number SUB_SCAN_IMGNAME_01_0018
     * @tc.desc   build name for index 1 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0018 begin');
      const result: string = ScanImageNaming.build(1, '.Tiff', 1700000000000);
      expect(result).assertEqual('scan_0001_20231114.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0018 end');
    });

    /**
     * @tc.name   testImageName0019
     * @tc.number SUB_SCAN_IMGNAME_01_0019
     * @tc.desc   build name for index 7 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0019 begin');
      const result: string = ScanImageNaming.build(7, 'jpg', 1735689599000);
      expect(result).assertEqual('scan_0007_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0019 end');
    });

    /**
     * @tc.name   testImageName0020
     * @tc.number SUB_SCAN_IMGNAME_01_0020
     * @tc.desc   build name for index 7 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0020 begin');
      const result: string = ScanImageNaming.build(7, 'JPG', 0);
      expect(result).assertEqual('scan_0007_19700101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0020 end');
    });

    /**
     * @tc.name   testImageName0021
     * @tc.number SUB_SCAN_IMGNAME_01_0021
     * @tc.desc   build name for index 7 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0021 begin');
      const result: string = ScanImageNaming.build(7, '.png', 86400000);
      expect(result).assertEqual('scan_0007_19700102.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0021 end');
    });

    /**
     * @tc.name   testImageName0022
     * @tc.number SUB_SCAN_IMGNAME_01_0022
     * @tc.desc   build name for index 7 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0022 begin');
      const result: string = ScanImageNaming.build(7, ' pdf ', 1609459200000);
      expect(result).assertEqual('scan_0007_20210101.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0022 end');
    });

    /**
     * @tc.name   testImageName0023
     * @tc.number SUB_SCAN_IMGNAME_01_0023
     * @tc.desc   build name for index 7 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0023 begin');
      const result: string = ScanImageNaming.build(7, 'tiff', 1700000000000);
      expect(result).assertEqual('scan_0007_20231114.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0023 end');
    });

    /**
     * @tc.name   testImageName0024
     * @tc.number SUB_SCAN_IMGNAME_01_0024
     * @tc.desc   build name for index 7 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0024 begin');
      const result: string = ScanImageNaming.build(7, 'bmp', 1735689599000);
      expect(result).assertEqual('scan_0007_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0024 end');
    });

    /**
     * @tc.name   testImageName0025
     * @tc.number SUB_SCAN_IMGNAME_01_0025
     * @tc.desc   build name for index 7 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0025 begin');
      const result: string = ScanImageNaming.build(7, '', 0);
      expect(result).assertEqual('scan_0007_19700101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0025 end');
    });

    /**
     * @tc.name   testImageName0026
     * @tc.number SUB_SCAN_IMGNAME_01_0026
     * @tc.desc   build name for index 7 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0026 begin');
      const result: string = ScanImageNaming.build(7, 'JPeG', Number.NaN);
      expect(result).assertEqual('scan_0007_00000000.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0026 end');
    });

    /**
     * @tc.name   testImageName0027
     * @tc.number SUB_SCAN_IMGNAME_01_0027
     * @tc.desc   build name for index 7 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0027 begin');
      const result: string = ScanImageNaming.build(7, '.Tiff', 1609459200000);
      expect(result).assertEqual('scan_0007_20210101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(7);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0027 end');
    });

    /**
     * @tc.name   testImageName0028
     * @tc.number SUB_SCAN_IMGNAME_01_0028
     * @tc.desc   build name for index 12 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0028 begin');
      const result: string = ScanImageNaming.build(12, 'jpg', 1700000000000);
      expect(result).assertEqual('scan_0012_20231114.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0028 end');
    });

    /**
     * @tc.name   testImageName0029
     * @tc.number SUB_SCAN_IMGNAME_01_0029
     * @tc.desc   build name for index 12 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0029 begin');
      const result: string = ScanImageNaming.build(12, 'JPG', 1735689599000);
      expect(result).assertEqual('scan_0012_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0029 end');
    });

    /**
     * @tc.name   testImageName0030
     * @tc.number SUB_SCAN_IMGNAME_01_0030
     * @tc.desc   build name for index 12 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0030 begin');
      const result: string = ScanImageNaming.build(12, '.png', 0);
      expect(result).assertEqual('scan_0012_19700101.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0030 end');
    });

    /**
     * @tc.name   testImageName0031
     * @tc.number SUB_SCAN_IMGNAME_01_0031
     * @tc.desc   build name for index 12 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0031 begin');
      const result: string = ScanImageNaming.build(12, ' pdf ', 86400000);
      expect(result).assertEqual('scan_0012_19700102.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0031 end');
    });

    /**
     * @tc.name   testImageName0032
     * @tc.number SUB_SCAN_IMGNAME_01_0032
     * @tc.desc   build name for index 12 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0032 begin');
      const result: string = ScanImageNaming.build(12, 'tiff', 1609459200000);
      expect(result).assertEqual('scan_0012_20210101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0032 end');
    });

    /**
     * @tc.name   testImageName0033
     * @tc.number SUB_SCAN_IMGNAME_01_0033
     * @tc.desc   build name for index 12 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0033 begin');
      const result: string = ScanImageNaming.build(12, 'bmp', 1700000000000);
      expect(result).assertEqual('scan_0012_20231114.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0033 end');
    });

    /**
     * @tc.name   testImageName0034
     * @tc.number SUB_SCAN_IMGNAME_01_0034
     * @tc.desc   build name for index 12 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0034 begin');
      const result: string = ScanImageNaming.build(12, '', 1735689599000);
      expect(result).assertEqual('scan_0012_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0034 end');
    });

    /**
     * @tc.name   testImageName0035
     * @tc.number SUB_SCAN_IMGNAME_01_0035
     * @tc.desc   build name for index 12 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0035 begin');
      const result: string = ScanImageNaming.build(12, 'JPeG', 0);
      expect(result).assertEqual('scan_0012_19700101.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0035 end');
    });

    /**
     * @tc.name   testImageName0036
     * @tc.number SUB_SCAN_IMGNAME_01_0036
     * @tc.desc   build name for index 12 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0036 begin');
      const result: string = ScanImageNaming.build(12, '.Tiff', 86400000);
      expect(result).assertEqual('scan_0012_19700102.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(12);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0036 end');
    });

    /**
     * @tc.name   testImageName0037
     * @tc.number SUB_SCAN_IMGNAME_01_0037
     * @tc.desc   build name for index 999 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0037 begin');
      const result: string = ScanImageNaming.build(999, 'jpg', 1609459200000);
      expect(result).assertEqual('scan_0999_20210101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0037 end');
    });

    /**
     * @tc.name   testImageName0038
     * @tc.number SUB_SCAN_IMGNAME_01_0038
     * @tc.desc   build name for index 999 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0038 begin');
      const result: string = ScanImageNaming.build(999, 'JPG', 1700000000000);
      expect(result).assertEqual('scan_0999_20231114.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0038 end');
    });

    /**
     * @tc.name   testImageName0039
     * @tc.number SUB_SCAN_IMGNAME_01_0039
     * @tc.desc   build name for index 999 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0039 begin');
      const result: string = ScanImageNaming.build(999, '.png', Number.NaN);
      expect(result).assertEqual('scan_0999_00000000.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0039 end');
    });

    /**
     * @tc.name   testImageName0040
     * @tc.number SUB_SCAN_IMGNAME_01_0040
     * @tc.desc   build name for index 999 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0040 begin');
      const result: string = ScanImageNaming.build(999, ' pdf ', 0);
      expect(result).assertEqual('scan_0999_19700101.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0040 end');
    });

    /**
     * @tc.name   testImageName0041
     * @tc.number SUB_SCAN_IMGNAME_01_0041
     * @tc.desc   build name for index 999 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0041 begin');
      const result: string = ScanImageNaming.build(999, 'tiff', 86400000);
      expect(result).assertEqual('scan_0999_19700102.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0041 end');
    });

    /**
     * @tc.name   testImageName0042
     * @tc.number SUB_SCAN_IMGNAME_01_0042
     * @tc.desc   build name for index 999 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0042 begin');
      const result: string = ScanImageNaming.build(999, 'bmp', 1609459200000);
      expect(result).assertEqual('scan_0999_20210101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0042 end');
    });

    /**
     * @tc.name   testImageName0043
     * @tc.number SUB_SCAN_IMGNAME_01_0043
     * @tc.desc   build name for index 999 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0043 begin');
      const result: string = ScanImageNaming.build(999, '', 1700000000000);
      expect(result).assertEqual('scan_0999_20231114.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0043 end');
    });

    /**
     * @tc.name   testImageName0044
     * @tc.number SUB_SCAN_IMGNAME_01_0044
     * @tc.desc   build name for index 999 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0044 begin');
      const result: string = ScanImageNaming.build(999, 'JPeG', 1735689599000);
      expect(result).assertEqual('scan_0999_20241231.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0044 end');
    });

    /**
     * @tc.name   testImageName0045
     * @tc.number SUB_SCAN_IMGNAME_01_0045
     * @tc.desc   build name for index 999 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0045 begin');
      const result: string = ScanImageNaming.build(999, '.Tiff', 0);
      expect(result).assertEqual('scan_0999_19700101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0045 end');
    });

    /**
     * @tc.name   testImageName0046
     * @tc.number SUB_SCAN_IMGNAME_01_0046
     * @tc.desc   build name for index 1000 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0046 begin');
      const result: string = ScanImageNaming.build(1000, 'jpg', 86400000);
      expect(result).assertEqual('scan_1000_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0046 end');
    });

    /**
     * @tc.name   testImageName0047
     * @tc.number SUB_SCAN_IMGNAME_01_0047
     * @tc.desc   build name for index 1000 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0047 begin');
      const result: string = ScanImageNaming.build(1000, 'JPG', 1609459200000);
      expect(result).assertEqual('scan_1000_20210101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0047 end');
    });

    /**
     * @tc.name   testImageName0048
     * @tc.number SUB_SCAN_IMGNAME_01_0048
     * @tc.desc   build name for index 1000 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0048 begin');
      const result: string = ScanImageNaming.build(1000, '.png', 1700000000000);
      expect(result).assertEqual('scan_1000_20231114.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0048 end');
    });

    /**
     * @tc.name   testImageName0049
     * @tc.number SUB_SCAN_IMGNAME_01_0049
     * @tc.desc   build name for index 1000 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0049 begin');
      const result: string = ScanImageNaming.build(1000, ' pdf ', 1735689599000);
      expect(result).assertEqual('scan_1000_20241231.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0049 end');
    });

    /**
     * @tc.name   testImageName0050
     * @tc.number SUB_SCAN_IMGNAME_01_0050
     * @tc.desc   build name for index 1000 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0050 begin');
      const result: string = ScanImageNaming.build(1000, 'tiff', 0);
      expect(result).assertEqual('scan_1000_19700101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0050 end');
    });

    /**
     * @tc.name   testImageName0051
     * @tc.number SUB_SCAN_IMGNAME_01_0051
     * @tc.desc   build name for index 1000 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0051 begin');
      const result: string = ScanImageNaming.build(1000, 'bmp', 86400000);
      expect(result).assertEqual('scan_1000_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0051 end');
    });

    /**
     * @tc.name   testImageName0052
     * @tc.number SUB_SCAN_IMGNAME_01_0052
     * @tc.desc   build name for index 1000 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0052 begin');
      const result: string = ScanImageNaming.build(1000, '', Number.NaN);
      expect(result).assertEqual('scan_1000_00000000.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0052 end');
    });

    /**
     * @tc.name   testImageName0053
     * @tc.number SUB_SCAN_IMGNAME_01_0053
     * @tc.desc   build name for index 1000 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0053 begin');
      const result: string = ScanImageNaming.build(1000, 'JPeG', 1700000000000);
      expect(result).assertEqual('scan_1000_20231114.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0053 end');
    });

    /**
     * @tc.name   testImageName0054
     * @tc.number SUB_SCAN_IMGNAME_01_0054
     * @tc.desc   build name for index 1000 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0054 begin');
      const result: string = ScanImageNaming.build(1000, '.Tiff', 1735689599000);
      expect(result).assertEqual('scan_1000_20241231.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(1000);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0054 end');
    });

    /**
     * @tc.name   testImageName0055
     * @tc.number SUB_SCAN_IMGNAME_01_0055
     * @tc.desc   build name for index 9999 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0055 begin');
      const result: string = ScanImageNaming.build(9999, 'jpg', 0);
      expect(result).assertEqual('scan_9999_19700101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0055 end');
    });

    /**
     * @tc.name   testImageName0056
     * @tc.number SUB_SCAN_IMGNAME_01_0056
     * @tc.desc   build name for index 9999 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0056 begin');
      const result: string = ScanImageNaming.build(9999, 'JPG', 86400000);
      expect(result).assertEqual('scan_9999_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0056 end');
    });

    /**
     * @tc.name   testImageName0057
     * @tc.number SUB_SCAN_IMGNAME_01_0057
     * @tc.desc   build name for index 9999 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0057 begin');
      const result: string = ScanImageNaming.build(9999, '.png', 1609459200000);
      expect(result).assertEqual('scan_9999_20210101.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0057 end');
    });

    /**
     * @tc.name   testImageName0058
     * @tc.number SUB_SCAN_IMGNAME_01_0058
     * @tc.desc   build name for index 9999 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0058 begin');
      const result: string = ScanImageNaming.build(9999, ' pdf ', 1700000000000);
      expect(result).assertEqual('scan_9999_20231114.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0058 end');
    });

    /**
     * @tc.name   testImageName0059
     * @tc.number SUB_SCAN_IMGNAME_01_0059
     * @tc.desc   build name for index 9999 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0059 begin');
      const result: string = ScanImageNaming.build(9999, 'tiff', 1735689599000);
      expect(result).assertEqual('scan_9999_20241231.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0059 end');
    });

    /**
     * @tc.name   testImageName0060
     * @tc.number SUB_SCAN_IMGNAME_01_0060
     * @tc.desc   build name for index 9999 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0060 begin');
      const result: string = ScanImageNaming.build(9999, 'bmp', 0);
      expect(result).assertEqual('scan_9999_19700101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0060 end');
    });

    /**
     * @tc.name   testImageName0061
     * @tc.number SUB_SCAN_IMGNAME_01_0061
     * @tc.desc   build name for index 9999 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0061 begin');
      const result: string = ScanImageNaming.build(9999, '', 86400000);
      expect(result).assertEqual('scan_9999_19700102.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0061 end');
    });

    /**
     * @tc.name   testImageName0062
     * @tc.number SUB_SCAN_IMGNAME_01_0062
     * @tc.desc   build name for index 9999 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0062 begin');
      const result: string = ScanImageNaming.build(9999, 'JPeG', 1609459200000);
      expect(result).assertEqual('scan_9999_20210101.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0062 end');
    });

    /**
     * @tc.name   testImageName0063
     * @tc.number SUB_SCAN_IMGNAME_01_0063
     * @tc.desc   build name for index 9999 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0063 begin');
      const result: string = ScanImageNaming.build(9999, '.Tiff', 1700000000000);
      expect(result).assertEqual('scan_9999_20231114.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(9999);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0063 end');
    });

    /**
     * @tc.name   testImageName0064
     * @tc.number SUB_SCAN_IMGNAME_01_0064
     * @tc.desc   build name for index 10000 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0064 begin');
      const result: string = ScanImageNaming.build(10000, 'jpg', 1735689599000);
      expect(result).assertEqual('scan_10000_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0064 end');
    });

    /**
     * @tc.name   testImageName0065
     * @tc.number SUB_SCAN_IMGNAME_01_0065
     * @tc.desc   build name for index 10000 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0065 begin');
      const result: string = ScanImageNaming.build(10000, 'JPG', Number.NaN);
      expect(result).assertEqual('scan_10000_00000000.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0065 end');
    });

    /**
     * @tc.name   testImageName0066
     * @tc.number SUB_SCAN_IMGNAME_01_0066
     * @tc.desc   build name for index 10000 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0066 begin');
      const result: string = ScanImageNaming.build(10000, '.png', 86400000);
      expect(result).assertEqual('scan_10000_19700102.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0066 end');
    });

    /**
     * @tc.name   testImageName0067
     * @tc.number SUB_SCAN_IMGNAME_01_0067
     * @tc.desc   build name for index 10000 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0067 begin');
      const result: string = ScanImageNaming.build(10000, ' pdf ', 1609459200000);
      expect(result).assertEqual('scan_10000_20210101.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0067 end');
    });

    /**
     * @tc.name   testImageName0068
     * @tc.number SUB_SCAN_IMGNAME_01_0068
     * @tc.desc   build name for index 10000 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0068 begin');
      const result: string = ScanImageNaming.build(10000, 'tiff', 1700000000000);
      expect(result).assertEqual('scan_10000_20231114.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0068 end');
    });

    /**
     * @tc.name   testImageName0069
     * @tc.number SUB_SCAN_IMGNAME_01_0069
     * @tc.desc   build name for index 10000 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0069 begin');
      const result: string = ScanImageNaming.build(10000, 'bmp', 1735689599000);
      expect(result).assertEqual('scan_10000_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0069 end');
    });

    /**
     * @tc.name   testImageName0070
     * @tc.number SUB_SCAN_IMGNAME_01_0070
     * @tc.desc   build name for index 10000 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0070 begin');
      const result: string = ScanImageNaming.build(10000, '', 0);
      expect(result).assertEqual('scan_10000_19700101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0070 end');
    });

    /**
     * @tc.name   testImageName0071
     * @tc.number SUB_SCAN_IMGNAME_01_0071
     * @tc.desc   build name for index 10000 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0071 begin');
      const result: string = ScanImageNaming.build(10000, 'JPeG', 86400000);
      expect(result).assertEqual('scan_10000_19700102.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0071 end');
    });

    /**
     * @tc.name   testImageName0072
     * @tc.number SUB_SCAN_IMGNAME_01_0072
     * @tc.desc   build name for index 10000 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0072 begin');
      const result: string = ScanImageNaming.build(10000, '.Tiff', 1609459200000);
      expect(result).assertEqual('scan_10000_20210101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(-1);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0072 end');
    });

    /**
     * @tc.name   testImageName0073
     * @tc.number SUB_SCAN_IMGNAME_01_0073
     * @tc.desc   build name for index -5 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0073 begin');
      const result: string = ScanImageNaming.build(-5, 'jpg', 1700000000000);
      expect(result).assertEqual('scan_0005_20231114.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0073 end');
    });

    /**
     * @tc.name   testImageName0074
     * @tc.number SUB_SCAN_IMGNAME_01_0074
     * @tc.desc   build name for index -5 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0074 begin');
      const result: string = ScanImageNaming.build(-5, 'JPG', 1735689599000);
      expect(result).assertEqual('scan_0005_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0074 end');
    });

    /**
     * @tc.name   testImageName0075
     * @tc.number SUB_SCAN_IMGNAME_01_0075
     * @tc.desc   build name for index -5 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0075 begin');
      const result: string = ScanImageNaming.build(-5, '.png', 0);
      expect(result).assertEqual('scan_0005_19700101.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0075 end');
    });

    /**
     * @tc.name   testImageName0076
     * @tc.number SUB_SCAN_IMGNAME_01_0076
     * @tc.desc   build name for index -5 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0076 begin');
      const result: string = ScanImageNaming.build(-5, ' pdf ', 86400000);
      expect(result).assertEqual('scan_0005_19700102.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0076 end');
    });

    /**
     * @tc.name   testImageName0077
     * @tc.number SUB_SCAN_IMGNAME_01_0077
     * @tc.desc   build name for index -5 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0077 begin');
      const result: string = ScanImageNaming.build(-5, 'tiff', 1609459200000);
      expect(result).assertEqual('scan_0005_20210101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0077 end');
    });

    /**
     * @tc.name   testImageName0078
     * @tc.number SUB_SCAN_IMGNAME_01_0078
     * @tc.desc   build name for index -5 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0078 begin');
      const result: string = ScanImageNaming.build(-5, 'bmp', Number.NaN);
      expect(result).assertEqual('scan_0005_00000000.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0078 end');
    });

    /**
     * @tc.name   testImageName0079
     * @tc.number SUB_SCAN_IMGNAME_01_0079
     * @tc.desc   build name for index -5 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0079 begin');
      const result: string = ScanImageNaming.build(-5, '', 1735689599000);
      expect(result).assertEqual('scan_0005_20241231.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0079 end');
    });

    /**
     * @tc.name   testImageName0080
     * @tc.number SUB_SCAN_IMGNAME_01_0080
     * @tc.desc   build name for index -5 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0080 begin');
      const result: string = ScanImageNaming.build(-5, 'JPeG', 0);
      expect(result).assertEqual('scan_0005_19700101.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0080 end');
    });

    /**
     * @tc.name   testImageName0081
     * @tc.number SUB_SCAN_IMGNAME_01_0081
     * @tc.desc   build name for index -5 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0081 begin');
      const result: string = ScanImageNaming.build(-5, '.Tiff', 86400000);
      expect(result).assertEqual('scan_0005_19700102.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(5);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0081 end');
    });

    /**
     * @tc.name   testImageName0082
     * @tc.number SUB_SCAN_IMGNAME_01_0082
     * @tc.desc   build name for index 3.7 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0082 begin');
      const result: string = ScanImageNaming.build(3.7, 'jpg', 1609459200000);
      expect(result).assertEqual('scan_0003_20210101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0082 end');
    });

    /**
     * @tc.name   testImageName0083
     * @tc.number SUB_SCAN_IMGNAME_01_0083
     * @tc.desc   build name for index 3.7 with format [jpg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0083 begin');
      const result: string = ScanImageNaming.build(3.7, 'JPG', 1700000000000);
      expect(result).assertEqual('scan_0003_20231114.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0083 end');
    });

    /**
     * @tc.name   testImageName0084
     * @tc.number SUB_SCAN_IMGNAME_01_0084
     * @tc.desc   build name for index 3.7 with format [png]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0084 begin');
      const result: string = ScanImageNaming.build(3.7, '.png', 1735689599000);
      expect(result).assertEqual('scan_0003_20241231.png');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('png');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0084 end');
    });

    /**
     * @tc.name   testImageName0085
     * @tc.number SUB_SCAN_IMGNAME_01_0085
     * @tc.desc   build name for index 3.7 with format [pdf]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0085 begin');
      const result: string = ScanImageNaming.build(3.7, ' pdf ', 0);
      expect(result).assertEqual('scan_0003_19700101.pdf');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('pdf');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0085 end');
    });

    /**
     * @tc.name   testImageName0086
     * @tc.number SUB_SCAN_IMGNAME_01_0086
     * @tc.desc   build name for index 3.7 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0086 begin');
      const result: string = ScanImageNaming.build(3.7, 'tiff', 86400000);
      expect(result).assertEqual('scan_0003_19700102.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0086 end');
    });

    /**
     * @tc.name   testImageName0087
     * @tc.number SUB_SCAN_IMGNAME_01_0087
     * @tc.desc   build name for index 3.7 with format [bmp]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0087 begin');
      const result: string = ScanImageNaming.build(3.7, 'bmp', 1609459200000);
      expect(result).assertEqual('scan_0003_20210101.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0087 end');
    });

    /**
     * @tc.name   testImageName0088
     * @tc.number SUB_SCAN_IMGNAME_01_0088
     * @tc.desc   build name for index 3.7 with format []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0088 begin');
      const result: string = ScanImageNaming.build(3.7, '', 1700000000000);
      expect(result).assertEqual('scan_0003_20231114.jpg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0088 end');
    });

    /**
     * @tc.name   testImageName0089
     * @tc.number SUB_SCAN_IMGNAME_01_0089
     * @tc.desc   build name for index 3.7 with format [jpeg]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0089 begin');
      const result: string = ScanImageNaming.build(3.7, 'JPeG', 1735689599000);
      expect(result).assertEqual('scan_0003_20241231.jpeg');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('jpeg');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0089 end');
    });

    /**
     * @tc.name   testImageName0090
     * @tc.number SUB_SCAN_IMGNAME_01_0090
     * @tc.desc   build name for index 3.7 with format [tiff]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageName0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0090 begin');
      const result: string = ScanImageNaming.build(3.7, '.Tiff', 0);
      expect(result).assertEqual('scan_0003_19700101.tiff');
      expect(ScanImageNaming.parseIndex(result)).assertEqual(3);
      expect(ScanImageNaming.extractFormat(result)).assertEqual('tiff');
      expect(ScanImageNaming.isValid(result)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testImageName0090 end');
    });

  });
}
