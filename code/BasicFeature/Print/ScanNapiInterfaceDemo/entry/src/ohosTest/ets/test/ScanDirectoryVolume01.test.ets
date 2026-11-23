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
import { ScanDirectoryProbe, ScanDirectorySnapshot } from '../../../main/ets/scan/model/ScanDirectoryProbe';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanDirectoryMergeTest() {
  describe('ScanDirectoryMerge', () => {

    /**
     * @tc.name   testDirectoryMerge0001
     * @tc.number SUB_SCAN_SYNC_01_0001
     * @tc.desc   merge 1 sync event(s) over 0 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0001 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.devices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(0);
      expect(result.ids).assertEqual('');
      expect(result.modes).assertEqual('');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0001 end');
    });

    /**
     * @tc.name   testDirectoryMerge0002
     * @tc.number SUB_SCAN_SYNC_01_0002
     * @tc.desc   merge 1 sync event(s) over 0 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0002 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.devices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('9', 'U9', 'USB', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(0);
      expect(result.ids).assertEqual('');
      expect(result.modes).assertEqual('');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0002 end');
    });

    /**
     * @tc.name   testDirectoryMerge0003
     * @tc.number SUB_SCAN_SYNC_01_0003
     * @tc.desc   merge 1 sync event(s) over 0 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0003 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.devices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(0);
      expect(result.ids).assertEqual('');
      expect(result.modes).assertEqual('');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0003 end');
    });

    /**
     * @tc.name   testDirectoryMerge0004
     * @tc.number SUB_SCAN_SYNC_01_0004
     * @tc.desc   merge 2 sync event(s) over 0 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0004 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.devices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', ''),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(0);
      expect(result.ids).assertEqual('');
      expect(result.modes).assertEqual('');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0004 end');
    });

    /**
     * @tc.name   testDirectoryMerge0005
     * @tc.number SUB_SCAN_SYNC_01_0005
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0005 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,88');
      expect(result.modes).assertEqual('USB,USB');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0005 end');
    });

    /**
     * @tc.name   testDirectoryMerge0006
     * @tc.number SUB_SCAN_SYNC_01_0006
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0006 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'USB', 'update', ''),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,88');
      expect(result.modes).assertEqual('USB,USB');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0006 end');
    });

    /**
     * @tc.name   testDirectoryMerge0007
     * @tc.number SUB_SCAN_SYNC_01_0007
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0007 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('2,2,88');
      expect(result.modes).assertEqual('TCP,USB,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0007 end');
    });

    /**
     * @tc.name   testDirectoryMerge0008
     * @tc.number SUB_SCAN_SYNC_01_0008
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0008 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'USB', 'update', '1'),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('2,2,88');
      expect(result.modes).assertEqual('USB,USB,USB');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0008 end');
    });

    /**
     * @tc.name   testDirectoryMerge0009
     * @tc.number SUB_SCAN_SYNC_01_0009
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0009 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,88');
      expect(result.modes).assertEqual('USB,USB');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0009 end');
    });

    /**
     * @tc.name   testDirectoryMerge0010
     * @tc.number SUB_SCAN_SYNC_01_0010
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0010 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,88');
      expect(result.modes).assertEqual('USB,USB');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0010 end');
    });

    /**
     * @tc.name   testDirectoryMerge0011
     * @tc.number SUB_SCAN_SYNC_01_0011
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0011 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,1');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0011 end');
    });

    /**
     * @tc.name   testDirectoryMerge0012
     * @tc.number SUB_SCAN_SYNC_01_0012
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0012 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,1');
      expect(result.modes).assertEqual('TCP,USB,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0012 end');
    });

    /**
     * @tc.name   testDirectoryMerge0013
     * @tc.number SUB_SCAN_SYNC_01_0013
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0013 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('9', 'U9', 'USB', 'update', '2'),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,9,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0013 end');
    });

    /**
     * @tc.name   testDirectoryMerge0014
     * @tc.number SUB_SCAN_SYNC_01_0014
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0014 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('9', 'U9', 'USB', 'update', '2'),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,9,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0014 end');
    });

    /**
     * @tc.name   testDirectoryMerge0015
     * @tc.number SUB_SCAN_SYNC_01_0015
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0015 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('9', 'U9', 'USB', 'update', '2'),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,9,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0015 end');
    });

    /**
     * @tc.name   testDirectoryMerge0016
     * @tc.number SUB_SCAN_SYNC_01_0016
     * @tc.desc   merge 3 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0016 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('9', 'U9', 'USB', 'update', '2'),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,9,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0016 end');
    });

    /**
     * @tc.name   testDirectoryMerge0017
     * @tc.number SUB_SCAN_SYNC_01_0017
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0017 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,3');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0017 end');
    });

    /**
     * @tc.name   testDirectoryMerge0018
     * @tc.number SUB_SCAN_SYNC_01_0018
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0018 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0018 end');
    });

    /**
     * @tc.name   testDirectoryMerge0019
     * @tc.number SUB_SCAN_SYNC_01_0019
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0019 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,3');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0019 end');
    });

    /**
     * @tc.name   testDirectoryMerge0020
     * @tc.number SUB_SCAN_SYNC_01_0020
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0020 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0020 end');
    });

    /**
     * @tc.name   testDirectoryMerge0021
     * @tc.number SUB_SCAN_SYNC_01_0021
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0021 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(1);
      expect(result.ids).assertEqual('2');
      expect(result.modes).assertEqual('USB');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0021 end');
    });

    /**
     * @tc.name   testDirectoryMerge0022
     * @tc.number SUB_SCAN_SYNC_01_0022
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0022 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,1');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0022 end');
    });

    /**
     * @tc.name   testDirectoryMerge0023
     * @tc.number SUB_SCAN_SYNC_01_0023
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0023 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,3');
      expect(result.modes).assertEqual('TCP,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0023 end');
    });

    /**
     * @tc.name   testDirectoryMerge0024
     * @tc.number SUB_SCAN_SYNC_01_0024
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0024 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,2');
      expect(result.modes).assertEqual('TCP,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0024 end');
    });

    /**
     * @tc.name   testDirectoryMerge0025
     * @tc.number SUB_SCAN_SYNC_01_0025
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0025 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('2,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0025 end');
    });

    /**
     * @tc.name   testDirectoryMerge0026
     * @tc.number SUB_SCAN_SYNC_01_0026
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0026 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0026 end');
    });

    /**
     * @tc.name   testDirectoryMerge0027
     * @tc.number SUB_SCAN_SYNC_01_0027
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0027 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,2');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0027 end');
    });

    /**
     * @tc.name   testDirectoryMerge0028
     * @tc.number SUB_SCAN_SYNC_01_0028
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0028 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,2');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0028 end');
    });

    /**
     * @tc.name   testDirectoryMerge0029
     * @tc.number SUB_SCAN_SYNC_01_0029
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0029 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,3');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0029 end');
    });

    /**
     * @tc.name   testDirectoryMerge0030
     * @tc.number SUB_SCAN_SYNC_01_0030
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0030 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0030 end');
    });

    /**
     * @tc.name   testDirectoryMerge0031
     * @tc.number SUB_SCAN_SYNC_01_0031
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0031 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('3,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0031 end');
    });

    /**
     * @tc.name   testDirectoryMerge0032
     * @tc.number SUB_SCAN_SYNC_01_0032
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0032 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(1);
      expect(result.ids).assertEqual('2');
      expect(result.modes).assertEqual('USB');
      expect(result.tcpCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0032 end');
    });

    /**
     * @tc.name   testDirectoryMerge0033
     * @tc.number SUB_SCAN_SYNC_01_0033
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0033 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,3');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0033 end');
    });

    /**
     * @tc.name   testDirectoryMerge0034
     * @tc.number SUB_SCAN_SYNC_01_0034
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0034 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0034 end');
    });

    /**
     * @tc.name   testDirectoryMerge0035
     * @tc.number SUB_SCAN_SYNC_01_0035
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0035 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,3');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0035 end');
    });

    /**
     * @tc.name   testDirectoryMerge0036
     * @tc.number SUB_SCAN_SYNC_01_0036
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0036 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'update', ''),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0036 end');
    });

    /**
     * @tc.name   testDirectoryMerge0037
     * @tc.number SUB_SCAN_SYNC_01_0037
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0037 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('88,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0037 end');
    });

    /**
     * @tc.name   testDirectoryMerge0038
     * @tc.number SUB_SCAN_SYNC_01_0038
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0038 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'update', '1'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('88,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0038 end');
    });

    /**
     * @tc.name   testDirectoryMerge0039
     * @tc.number SUB_SCAN_SYNC_01_0039
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0039 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,88');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0039 end');
    });

    /**
     * @tc.name   testDirectoryMerge0040
     * @tc.number SUB_SCAN_SYNC_01_0040
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0040 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'update', '3'),
  ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,88');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0040 end');
    });

    /**
     * @tc.name   testDirectoryMerge0041
     * @tc.number SUB_SCAN_SYNC_01_0041
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0041 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('2,3');
      expect(result.modes).assertEqual('USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0041 end');
    });

    /**
     * @tc.name   testDirectoryMerge0042
     * @tc.number SUB_SCAN_SYNC_01_0042
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0042 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', ''),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(1);
      expect(result.ids).assertEqual('3');
      expect(result.modes).assertEqual('TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0042 end');
    });

    /**
     * @tc.name   testDirectoryMerge0043
     * @tc.number SUB_SCAN_SYNC_01_0043
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0043 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,3');
      expect(result.modes).assertEqual('TCP,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0043 end');
    });

    /**
     * @tc.name   testDirectoryMerge0044
     * @tc.number SUB_SCAN_SYNC_01_0044
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0044 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', ''),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,3');
      expect(result.modes).assertEqual('TCP,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0044 end');
    });

    /**
     * @tc.name   testDirectoryMerge0045
     * @tc.number SUB_SCAN_SYNC_01_0045
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0045 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,2');
      expect(result.modes).assertEqual('TCP,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0045 end');
    });

    /**
     * @tc.name   testDirectoryMerge0046
     * @tc.number SUB_SCAN_SYNC_01_0046
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0046 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'delete', ''),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(1);
      expect(result.ids).assertEqual('1');
      expect(result.modes).assertEqual('TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0046 end');
    });

    /**
     * @tc.name   testDirectoryMerge0047
     * @tc.number SUB_SCAN_SYNC_01_0047
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0047 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0047 end');
    });

    /**
     * @tc.name   testDirectoryMerge0048
     * @tc.number SUB_SCAN_SYNC_01_0048
     * @tc.desc   merge 2 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0048 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('88', 'U88', 'TCP', 'delete', ''),
  ScanParameterBuilder.sync('2', 'U2', 'TCP', 'delete', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(2);
      expect(result.ids).assertEqual('1,3');
      expect(result.modes).assertEqual('TCP,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0048 end');
    });

    /**
     * @tc.name   testDirectoryMerge0049
     * @tc.number SUB_SCAN_SYNC_01_0049
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0049 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0049 end');
    });

    /**
     * @tc.name   testDirectoryMerge0050
     * @tc.number SUB_SCAN_SYNC_01_0050
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0050 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'USB', 'update', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('USB,USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0050 end');
    });

    /**
     * @tc.name   testDirectoryMerge0051
     * @tc.number SUB_SCAN_SYNC_01_0051
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0051 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0051 end');
    });

    /**
     * @tc.name   testDirectoryMerge0052
     * @tc.number SUB_SCAN_SYNC_01_0052
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0052 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'USB', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('USB,USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0052 end');
    });

    /**
     * @tc.name   testDirectoryMerge0053
     * @tc.number SUB_SCAN_SYNC_01_0053
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0053 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '3')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,1');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0053 end');
    });

    /**
     * @tc.name   testDirectoryMerge0054
     * @tc.number SUB_SCAN_SYNC_01_0054
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0054 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'USB', 'update', '3')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,1');
      expect(result.modes).assertEqual('TCP,USB,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0054 end');
    });

    /**
     * @tc.name   testDirectoryMerge0055
     * @tc.number SUB_SCAN_SYNC_01_0055
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0055 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '2')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,1,3');
      expect(result.modes).assertEqual('TCP,TCP,TCP');
      expect(result.tcpCount).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0055 end');
    });

    /**
     * @tc.name   testDirectoryMerge0056
     * @tc.number SUB_SCAN_SYNC_01_0056
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0056 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'USB', 'update', '2')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,1,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0056 end');
    });

    /**
     * @tc.name   testDirectoryMerge0057
     * @tc.number SUB_SCAN_SYNC_01_0057
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0057 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '77')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0057 end');
    });

    /**
     * @tc.name   testDirectoryMerge0058
     * @tc.number SUB_SCAN_SYNC_01_0058
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0058 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('1', 'U1', 'USB', 'update', '77')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('USB,USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0058 end');
    });

    /**
     * @tc.name   testDirectoryMerge0059
     * @tc.number SUB_SCAN_SYNC_01_0059
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0059 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,TCP,TCP');
      expect(result.tcpCount).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0059 end');
    });

    /**
     * @tc.name   testDirectoryMerge0060
     * @tc.number SUB_SCAN_SYNC_01_0060
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0060 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'USB', 'update', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0060 end');
    });

    /**
     * @tc.name   testDirectoryMerge0061
     * @tc.number SUB_SCAN_SYNC_01_0061
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0061 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('2,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0061 end');
    });

    /**
     * @tc.name   testDirectoryMerge0062
     * @tc.number SUB_SCAN_SYNC_01_0062
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0062 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'USB', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('2,2,3');
      expect(result.modes).assertEqual('USB,USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0062 end');
    });

    /**
     * @tc.name   testDirectoryMerge0063
     * @tc.number SUB_SCAN_SYNC_01_0063
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0063 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '3')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,2');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0063 end');
    });

    /**
     * @tc.name   testDirectoryMerge0064
     * @tc.number SUB_SCAN_SYNC_01_0064
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0064 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'USB', 'update', '3')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,2');
      expect(result.modes).assertEqual('TCP,USB,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0064 end');
    });

    /**
     * @tc.name   testDirectoryMerge0065
     * @tc.number SUB_SCAN_SYNC_01_0065
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0065 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '2')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,TCP,TCP');
      expect(result.tcpCount).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0065 end');
    });

    /**
     * @tc.name   testDirectoryMerge0066
     * @tc.number SUB_SCAN_SYNC_01_0066
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0066 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'USB', 'update', '2')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0066 end');
    });

    /**
     * @tc.name   testDirectoryMerge0067
     * @tc.number SUB_SCAN_SYNC_01_0067
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0067 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '77')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,TCP,TCP');
      expect(result.tcpCount).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0067 end');
    });

    /**
     * @tc.name   testDirectoryMerge0068
     * @tc.number SUB_SCAN_SYNC_01_0068
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0068 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('2', 'U2', 'USB', 'update', '77')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0068 end');
    });

    /**
     * @tc.name   testDirectoryMerge0069
     * @tc.number SUB_SCAN_SYNC_01_0069
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0069 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0069 end');
    });

    /**
     * @tc.name   testDirectoryMerge0070
     * @tc.number SUB_SCAN_SYNC_01_0070
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0070 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'USB', 'update', '')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0070 end');
    });

    /**
     * @tc.name   testDirectoryMerge0071
     * @tc.number SUB_SCAN_SYNC_01_0071
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0071 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('3,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0071 end');
    });

    /**
     * @tc.name   testDirectoryMerge0072
     * @tc.number SUB_SCAN_SYNC_01_0072
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0072 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'USB', 'update', '1')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('3,2,3');
      expect(result.modes).assertEqual('USB,USB,TCP');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0072 end');
    });

    /**
     * @tc.name   testDirectoryMerge0073
     * @tc.number SUB_SCAN_SYNC_01_0073
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0073 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '3')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0073 end');
    });

    /**
     * @tc.name   testDirectoryMerge0074
     * @tc.number SUB_SCAN_SYNC_01_0074
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0074 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'USB', 'update', '3')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0074 end');
    });

    /**
     * @tc.name   testDirectoryMerge0075
     * @tc.number SUB_SCAN_SYNC_01_0075
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0075 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '2')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,3,3');
      expect(result.modes).assertEqual('TCP,TCP,TCP');
      expect(result.tcpCount).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0075 end');
    });

    /**
     * @tc.name   testDirectoryMerge0076
     * @tc.number SUB_SCAN_SYNC_01_0076
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0076 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'USB', 'update', '2')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,3,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0076 end');
    });

    /**
     * @tc.name   testDirectoryMerge0077
     * @tc.number SUB_SCAN_SYNC_01_0077
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0077 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', '77')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,TCP');
      expect(result.tcpCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0077 end');
    });

    /**
     * @tc.name   testDirectoryMerge0078
     * @tc.number SUB_SCAN_SYNC_01_0078
     * @tc.desc   merge 1 sync event(s) over 3 device(s)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryMerge0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0078 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
      ScanParameterBuilder.sync('3', 'U3', 'USB', 'update', '77')
        );
      const result: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(result.count).assertEqual(3);
      expect(result.ids).assertEqual('1,2,3');
      expect(result.modes).assertEqual('TCP,USB,USB');
      expect(result.tcpCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryMerge0078 end');
    });

  });
}
