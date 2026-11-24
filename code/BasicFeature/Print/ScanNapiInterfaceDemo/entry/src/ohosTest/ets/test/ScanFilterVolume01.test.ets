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
import { ScanDeviceFilter } from '../../../main/ets/scan/model/ScanDeviceFilter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanFilterVolume01Test() {
  describe('ScanFilter', () => {

    /**
     * @tc.name   testFilter010001
     * @tc.number SUB_SCAN_FILTER_01_0001
     * @tc.desc   fillDevices(0) exposes scale 0 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010001 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.count(result)).assertEqual(0);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010001 end');
    });

    /**
     * @tc.name   testFilter010002
     * @tc.number SUB_SCAN_FILTER_01_0002
     * @tc.desc   fillDevices(1) exposes scale 1 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010002 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.count(result)).assertEqual(1);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010002 end');
    });

    /**
     * @tc.name   testFilter010003
     * @tc.number SUB_SCAN_FILTER_01_0003
     * @tc.desc   fillDevices(2) exposes scale 2 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010003 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(2);
      expect(ScanDeviceFilter.count(result)).assertEqual(2);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010003 end');
    });

    /**
     * @tc.name   testFilter010004
     * @tc.number SUB_SCAN_FILTER_01_0004
     * @tc.desc   fillDevices(3) exposes scale 3 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010004 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      expect(ScanDeviceFilter.count(result)).assertEqual(3);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010004 end');
    });

    /**
     * @tc.name   testFilter010005
     * @tc.number SUB_SCAN_FILTER_01_0005
     * @tc.desc   fillDevices(5) exposes scale 5 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010005 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.count(result)).assertEqual(5);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010005 end');
    });

    /**
     * @tc.name   testFilter010006
     * @tc.number SUB_SCAN_FILTER_01_0006
     * @tc.desc   fillDevices(9) exposes scale 9 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010006 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(9);
      expect(ScanDeviceFilter.count(result)).assertEqual(9);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010006 end');
    });

    /**
     * @tc.name   testFilter010007
     * @tc.number SUB_SCAN_FILTER_01_0007
     * @tc.desc   fillDevices(10) exposes scale 10 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010007 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.count(result)).assertEqual(10);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010007 end');
    });

    /**
     * @tc.name   testFilter010008
     * @tc.number SUB_SCAN_FILTER_01_0008
     * @tc.desc   fillDevices(50) exposes scale 50 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010008 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(50);
      expect(ScanDeviceFilter.count(result)).assertEqual(50);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S49');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010008 end');
    });

    /**
     * @tc.name   testFilter010009
     * @tc.number SUB_SCAN_FILTER_01_0009
     * @tc.desc   fillDevices(99) exposes scale 99 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010009 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(99);
      expect(ScanDeviceFilter.count(result)).assertEqual(99);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S98');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010009 end');
    });

    /**
     * @tc.name   testFilter010010
     * @tc.number SUB_SCAN_FILTER_01_0010
     * @tc.desc   fillDevices(100) exposes scale 100 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010010 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.count(result)).assertEqual(100);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S99');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010010 end');
    });

    /**
     * @tc.name   testFilter010011
     * @tc.number SUB_SCAN_FILTER_01_0011
     * @tc.desc   fillDevices(150) exposes scale 150 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010011 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(150);
      expect(ScanDeviceFilter.count(result)).assertEqual(150);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S149');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010011 end');
    });

    /**
     * @tc.name   testFilter010012
     * @tc.number SUB_SCAN_FILTER_01_0012
     * @tc.desc   fillDevices(1000) exposes scale 1000 through count and ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010012 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1000);
      expect(ScanDeviceFilter.count(result)).assertEqual(1000);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      expect(ScanDeviceFilter.lastId(result)).assertEqual('S999');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010012 end');
    });

    /**
     * @tc.name   testFilter010013
     * @tc.number SUB_SCAN_FILTER_01_0013
     * @tc.desc   uniqueIds and sortById keep 0 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010013 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(0);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(0);
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010013 end');
    });

    /**
     * @tc.name   testFilter010014
     * @tc.number SUB_SCAN_FILTER_01_0014
     * @tc.desc   uniqueIds and sortById keep 1 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010014 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(1);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(1);
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010014 end');
    });

    /**
     * @tc.name   testFilter010015
     * @tc.number SUB_SCAN_FILTER_01_0015
     * @tc.desc   uniqueIds and sortById keep 2 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010015 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(2);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(2);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(2);
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010015 end');
    });

    /**
     * @tc.name   testFilter010016
     * @tc.number SUB_SCAN_FILTER_01_0016
     * @tc.desc   uniqueIds and sortById keep 3 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010016 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(3);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(3);
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010016 end');
    });

    /**
     * @tc.name   testFilter010017
     * @tc.number SUB_SCAN_FILTER_01_0017
     * @tc.desc   uniqueIds and sortById keep 5 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010017 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(5);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(5);
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010017 end');
    });

    /**
     * @tc.name   testFilter010018
     * @tc.number SUB_SCAN_FILTER_01_0018
     * @tc.desc   uniqueIds and sortById keep 10 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010018 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(10);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(10);
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010018 end');
    });

    /**
     * @tc.name   testFilter010019
     * @tc.number SUB_SCAN_FILTER_01_0019
     * @tc.desc   uniqueIds and sortById keep 20 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010019 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(20);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(20);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(20);
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010019 end');
    });

    /**
     * @tc.name   testFilter010020
     * @tc.number SUB_SCAN_FILTER_01_0020
     * @tc.desc   uniqueIds and sortById keep 50 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010020 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(50);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(50);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(50);
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010020 end');
    });

    /**
     * @tc.name   testFilter010021
     * @tc.number SUB_SCAN_FILTER_01_0021
     * @tc.desc   uniqueIds and sortById keep 100 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010021 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(100);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(100);
      expect(result.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010021 end');
    });

    /**
     * @tc.name   testFilter010022
     * @tc.number SUB_SCAN_FILTER_01_0022
     * @tc.desc   uniqueIds and sortById keep 250 distinct entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010022 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(250);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(250);
      expect(ScanDeviceFilter.sortById(result).length).assertEqual(250);
      expect(result.length).assertEqual(250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010022 end');
    });

    /**
     * @tc.name   testFilter010023
     * @tc.number SUB_SCAN_FILTER_01_0023
     * @tc.desc   hasDevice finds 'S0' in 0 devices as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010023 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.hasDevice(result, 'S0')).assertEqual(false);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S0')).assertEqual(false);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010023 end');
    });

    /**
     * @tc.name   testFilter010024
     * @tc.number SUB_SCAN_FILTER_01_0024
     * @tc.desc   hasDevice finds 'S1' in 0 devices as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010024 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.hasDevice(result, 'S1')).assertEqual(false);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S1')).assertEqual(false);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010024 end');
    });

    /**
     * @tc.name   testFilter010025
     * @tc.number SUB_SCAN_FILTER_01_0025
     * @tc.desc   hasDevice finds 'S99' in 0 devices as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010025 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.hasDevice(result, 'S99')).assertEqual(false);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S99')).assertEqual(false);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010025 end');
    });

    /**
     * @tc.name   testFilter010026
     * @tc.number SUB_SCAN_FILTER_01_0026
     * @tc.desc   hasDevice finds 'S0' in 1 devices as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010026 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.hasDevice(result, 'S0')).assertEqual(true);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S0')).assertEqual(true);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010026 end');
    });

    /**
     * @tc.name   testFilter010027
     * @tc.number SUB_SCAN_FILTER_01_0027
     * @tc.desc   hasDevice finds 'S1' in 1 devices as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010027 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.hasDevice(result, 'S1')).assertEqual(false);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S1')).assertEqual(false);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010027 end');
    });

    /**
     * @tc.name   testFilter010028
     * @tc.number SUB_SCAN_FILTER_01_0028
     * @tc.desc   hasDevice finds 'S99' in 1 devices as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010028 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.hasDevice(result, 'S99')).assertEqual(false);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S99')).assertEqual(false);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010028 end');
    });

    /**
     * @tc.name   testFilter010029
     * @tc.number SUB_SCAN_FILTER_01_0029
     * @tc.desc   hasDevice finds 'S0' in 5 devices as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010029 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.hasDevice(result, 'S0')).assertEqual(true);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S0')).assertEqual(true);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010029 end');
    });

    /**
     * @tc.name   testFilter010030
     * @tc.number SUB_SCAN_FILTER_01_0030
     * @tc.desc   hasDevice finds 'S1' in 5 devices as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010030 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.hasDevice(result, 'S1')).assertEqual(true);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S1')).assertEqual(true);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010030 end');
    });

    /**
     * @tc.name   testFilter010031
     * @tc.number SUB_SCAN_FILTER_01_0031
     * @tc.desc   hasDevice finds 'S99' in 5 devices as false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010031 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.hasDevice(result, 'S99')).assertEqual(false);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S99')).assertEqual(false);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010031 end');
    });

    /**
     * @tc.name   testFilter010032
     * @tc.number SUB_SCAN_FILTER_01_0032
     * @tc.desc   hasDevice finds 'S0' in 100 devices as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010032 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.hasDevice(result, 'S0')).assertEqual(true);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S0')).assertEqual(true);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010032 end');
    });

    /**
     * @tc.name   testFilter010033
     * @tc.number SUB_SCAN_FILTER_01_0033
     * @tc.desc   hasDevice finds 'S1' in 100 devices as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010033 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.hasDevice(result, 'S1')).assertEqual(true);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S1')).assertEqual(true);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010033 end');
    });

    /**
     * @tc.name   testFilter010034
     * @tc.number SUB_SCAN_FILTER_01_0034
     * @tc.desc   hasDevice finds 'S99' in 100 devices as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010034 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.hasDevice(result, 'S99')).assertEqual(true);
      expect(ScanDeviceFilter.hasDevice(ScanDeviceFilter.uniqueDevices(result), 'S99')).assertEqual(true);
      expect(ScanDeviceFilter.uniqueIds(result).length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010034 end');
    });

    /**
     * @tc.name   testFilter010035
     * @tc.number SUB_SCAN_FILTER_01_0035
     * @tc.desc   intersect of 0 devices with itself or empty catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010035 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.intersect(result, result).length).assertEqual(0);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(0)).length).assertEqual(0);
      expect(ScanDeviceFilter.count(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010035 end');
    });

    /**
     * @tc.name   testFilter010036
     * @tc.number SUB_SCAN_FILTER_01_0036
     * @tc.desc   intersect of 0 devices with the single S0 catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010036 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(1)).length).assertEqual(0);
      expect(ScanDeviceFilter.intersect(ScanParameterBuilder.fillDevices(1), result).length).assertEqual(0);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010036 end');
    });

    /**
     * @tc.name   testFilter010037
     * @tc.number SUB_SCAN_FILTER_01_0037
     * @tc.desc   intersect of 1 devices with itself or empty catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010037 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.intersect(result, result).length).assertEqual(1);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(0)).length).assertEqual(0);
      expect(ScanDeviceFilter.count(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010037 end');
    });

    /**
     * @tc.name   testFilter010038
     * @tc.number SUB_SCAN_FILTER_01_0038
     * @tc.desc   intersect of 1 devices with the single S0 catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010038 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(1)).length).assertEqual(1);
      expect(ScanDeviceFilter.intersect(ScanParameterBuilder.fillDevices(1), result).length).assertEqual(1);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010038 end');
    });

    /**
     * @tc.name   testFilter010039
     * @tc.number SUB_SCAN_FILTER_01_0039
     * @tc.desc   intersect of 3 devices with itself or empty catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010039 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      expect(ScanDeviceFilter.intersect(result, result).length).assertEqual(3);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(0)).length).assertEqual(0);
      expect(ScanDeviceFilter.count(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010039 end');
    });

    /**
     * @tc.name   testFilter010040
     * @tc.number SUB_SCAN_FILTER_01_0040
     * @tc.desc   intersect of 3 devices with the single S0 catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010040 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(1)).length).assertEqual(1);
      expect(ScanDeviceFilter.intersect(ScanParameterBuilder.fillDevices(1), result).length).assertEqual(1);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010040 end');
    });

    /**
     * @tc.name   testFilter010041
     * @tc.number SUB_SCAN_FILTER_01_0041
     * @tc.desc   intersect of 10 devices with itself or empty catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010041 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.intersect(result, result).length).assertEqual(10);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(0)).length).assertEqual(0);
      expect(ScanDeviceFilter.count(result)).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010041 end');
    });

    /**
     * @tc.name   testFilter010042
     * @tc.number SUB_SCAN_FILTER_01_0042
     * @tc.desc   intersect of 10 devices with the single S0 catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010042 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(1)).length).assertEqual(1);
      expect(ScanDeviceFilter.intersect(ScanParameterBuilder.fillDevices(1), result).length).assertEqual(1);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010042 end');
    });

    /**
     * @tc.name   testFilter010043
     * @tc.number SUB_SCAN_FILTER_01_0043
     * @tc.desc   intersect of 100 devices with itself or empty catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010043 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.intersect(result, result).length).assertEqual(100);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(0)).length).assertEqual(0);
      expect(ScanDeviceFilter.count(result)).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010043 end');
    });

    /**
     * @tc.name   testFilter010044
     * @tc.number SUB_SCAN_FILTER_01_0044
     * @tc.desc   intersect of 100 devices with the single S0 catalog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010044 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.intersect(result, ScanParameterBuilder.fillDevices(1)).length).assertEqual(1);
      expect(ScanDeviceFilter.intersect(ScanParameterBuilder.fillDevices(1), result).length).assertEqual(1);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010044 end');
    });

    /**
     * @tc.name   testFilter010045
     * @tc.number SUB_SCAN_FILTER_01_0045
     * @tc.desc   summary aggregates 0 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010045 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=0 first= last=');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010045 end');
    });

    /**
     * @tc.name   testFilter010046
     * @tc.number SUB_SCAN_FILTER_01_0046
     * @tc.desc   summary aggregates 1 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010046 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=1 first=S0 last=S0');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010046 end');
    });

    /**
     * @tc.name   testFilter010047
     * @tc.number SUB_SCAN_FILTER_01_0047
     * @tc.desc   summary aggregates 2 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010047 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(2);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=2 first=S0 last=S1');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010047 end');
    });

    /**
     * @tc.name   testFilter010048
     * @tc.number SUB_SCAN_FILTER_01_0048
     * @tc.desc   summary aggregates 9 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010048 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(9);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=9 first=S0 last=S8');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010048 end');
    });

    /**
     * @tc.name   testFilter010049
     * @tc.number SUB_SCAN_FILTER_01_0049
     * @tc.desc   summary aggregates 10 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010049 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=10 first=S0 last=S9');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010049 end');
    });

    /**
     * @tc.name   testFilter010050
     * @tc.number SUB_SCAN_FILTER_01_0050
     * @tc.desc   summary aggregates 99 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010050 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(99);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=99 first=S0 last=S98');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010050 end');
    });

    /**
     * @tc.name   testFilter010051
     * @tc.number SUB_SCAN_FILTER_01_0051
     * @tc.desc   summary aggregates 100 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010051 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(100);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=100 first=S0 last=S99');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010051 end');
    });

    /**
     * @tc.name   testFilter010052
     * @tc.number SUB_SCAN_FILTER_01_0052
     * @tc.desc   summary aggregates 101 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010052 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(101);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=101 first=S0 last=S100');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010052 end');
    });

    /**
     * @tc.name   testFilter010053
     * @tc.number SUB_SCAN_FILTER_01_0053
     * @tc.desc   summary aggregates 150 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010053 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(150);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=150 first=S0 last=S149');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010053 end');
    });

    /**
     * @tc.name   testFilter010054
     * @tc.number SUB_SCAN_FILTER_01_0054
     * @tc.desc   summary aggregates 1000 devices into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010054 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1000);
      expect(ScanDeviceFilter.summary(result)).assertEqual('count=1000 first=S0 last=S999');
      expect(ScanDeviceFilter.summary(result).indexOf('count=') >= 0).assertEqual(true);
      expect(ScanDeviceFilter.firstId(result)).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010054 end');
    });

    /**
     * @tc.name   testFilter010055
     * @tc.number SUB_SCAN_FILTER_01_0055
     * @tc.desc   byManufacturer 'Acme' selects 2 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010055 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Acme').length).assertEqual(2);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Acme').length === 2
      ).assertEqual(true);
      expect(ScanDeviceFilter.count(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010055 end');
    });

    /**
     * @tc.name   testFilter010056
     * @tc.number SUB_SCAN_FILTER_01_0056
     * @tc.desc   byManufacturer '' selects 1 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010056 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), '').length).assertEqual(1);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), '').length === 2).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010056 end');
    });

    /**
     * @tc.name   testFilter010057
     * @tc.number SUB_SCAN_FILTER_01_0057
     * @tc.desc   byManufacturer 'Vendor' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010057 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(2);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Vendor').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Vendor').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010057 end');
    });

    /**
     * @tc.name   testFilter010058
     * @tc.number SUB_SCAN_FILTER_01_0058
     * @tc.desc   byManufacturer 'acme' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010058 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'acme').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'acme').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010058 end');
    });

    /**
     * @tc.name   testFilter010059
     * @tc.number SUB_SCAN_FILTER_01_0059
     * @tc.desc   byManufacturer 'ACME' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010059 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(4);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'ACME').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'ACME').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010059 end');
    });

    /**
     * @tc.name   testFilter010060
     * @tc.number SUB_SCAN_FILTER_01_0060
     * @tc.desc   byManufacturer 'Acme ' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010060 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Acme ').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Acme ').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010060 end');
    });

    /**
     * @tc.name   testFilter010061
     * @tc.number SUB_SCAN_FILTER_01_0061
     * @tc.desc   byManufacturer 'X100' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010061 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(6);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'X100').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'X100').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010061 end');
    });

    /**
     * @tc.name   testFilter010062
     * @tc.number SUB_SCAN_FILTER_01_0062
     * @tc.desc   byManufacturer 'Scanner' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010062 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(7);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Scanner').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Scanner').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010062 end');
    });

    /**
     * @tc.name   testFilter010063
     * @tc.number SUB_SCAN_FILTER_01_0063
     * @tc.desc   byManufacturer 'a' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010063 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(8);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'a').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'a').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010063 end');
    });

    /**
     * @tc.name   testFilter010064
     * @tc.number SUB_SCAN_FILTER_01_0064
     * @tc.desc   byManufacturer 'M' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010064 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(9);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'M').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'M').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010064 end');
    });

    /**
     * @tc.name   testFilter010065
     * @tc.number SUB_SCAN_FILTER_01_0065
     * @tc.desc   byManufacturer 'Acme' selects 2 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010065 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Acme').length).assertEqual(2);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'Acme').length === 2
      ).assertEqual(true);
      expect(ScanDeviceFilter.count(result)).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010065 end');
    });

    /**
     * @tc.name   testFilter010066
     * @tc.number SUB_SCAN_FILTER_01_0066
     * @tc.desc   byManufacturer 'A' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010066 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(11);
      expect(ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'A').length).assertEqual(0);
      expect(
        ScanDeviceFilter.byManufacturer(ScanParameterBuilder.sampleDevices(), 'A').length === 2
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010066 end');
    });

    /**
     * @tc.name   testFilter010067
     * @tc.number SUB_SCAN_FILTER_01_0067
     * @tc.desc   byModel 'X100' selects 1 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010067 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X100').length).assertEqual(1);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X100').length === 1).assertEqual(true);
      expect(ScanDeviceFilter.count(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010067 end');
    });

    /**
     * @tc.name   testFilter010068
     * @tc.number SUB_SCAN_FILTER_01_0068
     * @tc.desc   byModel 'Y200' selects 1 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010068 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'Y200').length).assertEqual(1);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'Y200').length === 1).assertEqual(true);
      expect(ScanDeviceFilter.count(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010068 end');
    });

    /**
     * @tc.name   testFilter010069
     * @tc.number SUB_SCAN_FILTER_01_0069
     * @tc.desc   byModel '' selects 1 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010069 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(2);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), '').length).assertEqual(1);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), '').length === 1).assertEqual(true);
      expect(ScanDeviceFilter.count(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010069 end');
    });

    /**
     * @tc.name   testFilter010070
     * @tc.number SUB_SCAN_FILTER_01_0070
     * @tc.desc   byModel 'X' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010070 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010070 end');
    });

    /**
     * @tc.name   testFilter010071
     * @tc.number SUB_SCAN_FILTER_01_0071
     * @tc.desc   byModel '0' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010071 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(4);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), '0').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), '0').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010071 end');
    });

    /**
     * @tc.name   testFilter010072
     * @tc.number SUB_SCAN_FILTER_01_0072
     * @tc.desc   byModel 'x100' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010072 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'x100').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'x100').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010072 end');
    });

    /**
     * @tc.name   testFilter010073
     * @tc.number SUB_SCAN_FILTER_01_0073
     * @tc.desc   byModel 'MODEL' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010073 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(6);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'MODEL').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'MODEL').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010073 end');
    });

    /**
     * @tc.name   testFilter010074
     * @tc.number SUB_SCAN_FILTER_01_0074
     * @tc.desc   byModel 'X10' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010074 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(7);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X10').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X10').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010074 end');
    });

    /**
     * @tc.name   testFilter010075
     * @tc.number SUB_SCAN_FILTER_01_0075
     * @tc.desc   byModel 'X100 ' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010075 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(8);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X100 ').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'X100 ').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010075 end');
    });

    /**
     * @tc.name   testFilter010076
     * @tc.number SUB_SCAN_FILTER_01_0076
     * @tc.desc   byModel ' ' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010076 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(9);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), ' ').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), ' ').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010076 end');
    });

    /**
     * @tc.name   testFilter010077
     * @tc.number SUB_SCAN_FILTER_01_0077
     * @tc.desc   byModel 'Y' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010077 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'Y').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'Y').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010077 end');
    });

    /**
     * @tc.name   testFilter010078
     * @tc.number SUB_SCAN_FILTER_01_0078
     * @tc.desc   byModel 'y200' selects 0 sample devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010078 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(11);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'y200').length).assertEqual(0);
      expect(ScanDeviceFilter.byModel(ScanParameterBuilder.sampleDevices(), 'y200').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010078 end');
    });

    /**
     * @tc.name   testFilter010079
     * @tc.number SUB_SCAN_FILTER_01_0079
     * @tc.desc   byMode 'TCP' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010079 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(0);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'TCP').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'TCP').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010079 end');
    });

    /**
     * @tc.name   testFilter010080
     * @tc.number SUB_SCAN_FILTER_01_0080
     * @tc.desc   byMode 'USB' maps through discoveryMode and selects 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010080 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(1);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'USB').length).assertEqual(1);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'USB').length === 1).assertEqual(true);
      expect(ScanDeviceFilter.count(result)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010080 end');
    });

    /**
     * @tc.name   testFilter010081
     * @tc.number SUB_SCAN_FILTER_01_0081
     * @tc.desc   byMode 'tcp' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010081 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'tcp').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'tcp').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010081 end');
    });

    /**
     * @tc.name   testFilter010082
     * @tc.number SUB_SCAN_FILTER_01_0082
     * @tc.desc   byMode 'usb' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010082 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'usb').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'usb').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010082 end');
    });

    /**
     * @tc.name   testFilter010083
     * @tc.number SUB_SCAN_FILTER_01_0083
     * @tc.desc   byMode '' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010083 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(4);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), '').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), '').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010083 end');
    });

    /**
     * @tc.name   testFilter010084
     * @tc.number SUB_SCAN_FILTER_01_0084
     * @tc.desc   byMode ' ' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010084 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), ' ').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), ' ').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010084 end');
    });

    /**
     * @tc.name   testFilter010085
     * @tc.number SUB_SCAN_FILTER_01_0085
     * @tc.desc   byMode 'Tcp' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010085 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(6);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'Tcp').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'Tcp').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010085 end');
    });

    /**
     * @tc.name   testFilter010086
     * @tc.number SUB_SCAN_FILTER_01_0086
     * @tc.desc   byMode 'Usb' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010086 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(7);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'Usb').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'Usb').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010086 end');
    });

    /**
     * @tc.name   testFilter010087
     * @tc.number SUB_SCAN_FILTER_01_0087
     * @tc.desc   byMode 'bluetooth' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010087 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(8);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'bluetooth').length).assertEqual(2);
      expect(
        ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'bluetooth').length === 1
      ).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010087 end');
    });

    /**
     * @tc.name   testFilter010088
     * @tc.number SUB_SCAN_FILTER_01_0088
     * @tc.desc   byMode 'USB ' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010088 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(9);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'USB ').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'USB ').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010088 end');
    });

    /**
     * @tc.name   testFilter010089
     * @tc.number SUB_SCAN_FILTER_01_0089
     * @tc.desc   byMode 'TCP' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010089 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(10);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'TCP').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'TCP').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010089 end');
    });

    /**
     * @tc.name   testFilter010090
     * @tc.number SUB_SCAN_FILTER_01_0090
     * @tc.desc   byMode 'uSb' maps through discoveryMode and selects 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFilter010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010090 begin');
      const result: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(11);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'uSb').length).assertEqual(2);
      expect(ScanDeviceFilter.byMode(ScanParameterBuilder.sampleDevices(), 'uSb').length === 1).assertEqual(false);
      expect(ScanDeviceFilter.count(result)).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFilter010090 end');
    });

  });
}
