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
import { ScannerDirectory } from '../../../main/ets/scan/model/ScannerDirectory';
import { ScanDirectoryProbe, ScanDirectorySnapshot } from '../../../main/ets/scan/model/ScanDirectoryProbe';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanDirectoryRealTest() {
  describe('ScannerDirectory', () => {

    /**
     * @tc.name   testDirectoryReal0001
     * @tc.number SUB_SCAN_SYNC_02_0001
     * @tc.desc   findIndex and findById report hits and misses by scannerId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0001 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      expect(ScannerDirectory.findIndex(devices, '3')).assertEqual(2);
      expect(ScannerDirectory.findIndex(devices, '99')).assertEqual(-1);
      expect(ScannerDirectory.findById(devices, '2') === undefined).assertFalse();
      expect(ScannerDirectory.findById(devices, '99') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0001 end');
    });

    /**
     * @tc.name   testDirectoryReal0002
     * @tc.number SUB_SCAN_SYNC_02_0002
     * @tc.desc   removeById returns a filtered copy and leaves the input untouched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0002 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const removed: scan.ScannerDevice[] = ScannerDirectory.removeById(devices, '2');
      expect(removed.length).assertEqual(2);
      expect(ScannerDirectory.uniqueIds(removed).join(',')).assertEqual('U1');
      expect(devices.length).assertEqual(3);
      expect(ScannerDirectory.removeById(devices, '99').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0002 end');
    });

    /**
     * @tc.name   testDirectoryReal0003
     * @tc.number SUB_SCAN_SYNC_02_0003
     * @tc.desc   applyUpdate rewrites id and mode but keeps vendor fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0003 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const updated: scan.ScannerDevice[] = ScannerDirectory.applyUpdate(devices,
        ScanParameterBuilder.sync('9', 'U9', 'USB', 'update', '1'));
      expect(updated.length).assertEqual(3);
      expect(updated[0].scannerId).assertEqual('9');
      expect(updated[0].uniqueId).assertEqual('U9');
      expect(updated[0].manufacturer).assertEqual('Acme');
      expect(updated[0].model).assertEqual('X100');
      expect(updated[0].discoveryMode === ScanParameterBuilder.discoveryMode('USB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0003 end');
    });

    /**
     * @tc.name   testDirectoryReal0004
     * @tc.number SUB_SCAN_SYNC_02_0004
     * @tc.desc   oldScannerId takes priority over the new scannerId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0004 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const updated: scan.ScannerDevice[] = ScannerDirectory.applyUpdate(devices,
        ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '3'));
      expect(updated[2].scannerId).assertEqual('2');
      expect(updated[1].scannerId).assertEqual('2');
      expect(updated[2].model).assertEqual('');
      expect(ScannerDirectory.findIndex(updated, '3')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0004 end');
    });

    /**
     * @tc.name   testDirectoryReal0005
     * @tc.number SUB_SCAN_SYNC_02_0005
     * @tc.desc   applyUpdate falls back to the new id when the old one is unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0005 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const updated: scan.ScannerDevice[] = ScannerDirectory.applyUpdate(devices,
        ScanParameterBuilder.sync('1', 'U7', 'USB', 'update', '77'));
      expect(updated[0].uniqueId).assertEqual('U7');
      expect(updated[0].deviceName).assertEqual('Scanner A');
      expect(updated[0].discoveryMode === ScanParameterBuilder.discoveryMode('USB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0005 end');
    });

    /**
     * @tc.name   testDirectoryReal0006
     * @tc.number SUB_SCAN_SYNC_02_0006
     * @tc.desc   applyUpdate returns an unchanged copy when nothing matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0006 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const updated: scan.ScannerDevice[] = ScannerDirectory.applyUpdate(devices,
        ScanParameterBuilder.sync('88', 'U88', 'USB', 'update', '99'));
      expect(updated.length).assertEqual(3);
      expect(ScannerDirectory.findIndex(updated, '88')).assertEqual(-1);
      expect(updated[0].scannerId).assertEqual(devices[0].scannerId);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0006 end');
    });

    /**
     * @tc.name   testDirectoryReal0007
     * @tc.number SUB_SCAN_SYNC_02_0007
     * @tc.desc   merge removes the device on a delete event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0007 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const merged: scan.ScannerDevice[] = ScannerDirectory.merge(devices,
        ScanParameterBuilder.sync('1', 'U1', 'TCP', 'delete', ''));
      expect(merged.length).assertEqual(2);
      expect(ScannerDirectory.findIndex(merged, '1')).assertEqual(-1);
      expect(ScannerDirectory.countByMode(merged, ScanParameterBuilder.discoveryMode('USB'))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0007 end');
    });

    /**
     * @tc.name   testDirectoryReal0008
     * @tc.number SUB_SCAN_SYNC_02_0008
     * @tc.desc   merge delegates update events to applyUpdate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0008 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const merged: scan.ScannerDevice[] = ScannerDirectory.merge(devices,
        ScanParameterBuilder.sync('5', 'U5', 'USB', 'update', '2'));
      expect(merged.length).assertEqual(3);
      expect(merged[1].scannerId).assertEqual('5');
      expect(merged[1].model).assertEqual('Y200');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0008 end');
    });

    /**
     * @tc.name   testDirectoryReal0009
     * @tc.number SUB_SCAN_SYNC_02_0009
     * @tc.desc   mergeAll on empty events returns a copy of the directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0009 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const merged: scan.ScannerDevice[] = ScannerDirectory.mergeAll(devices, ScanParameterBuilder.syncList());
      expect(merged.length).assertEqual(3);
      expect(merged[2].scannerId).assertEqual('3');
      expect(ScanParameterBuilder.syncList().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0009 end');
    });

    /**
     * @tc.name   testDirectoryReal0010
     * @tc.number SUB_SCAN_SYNC_02_0010
     * @tc.desc   mergeAll applies events in order, so a later delete targets the new id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0010 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
        ScanParameterBuilder.sync('7', 'U7', 'TCP', 'update', '1'),
        ScanParameterBuilder.sync('7', 'U7', 'TCP', 'delete', ''));
      const merged: scan.ScannerDevice[] = ScannerDirectory.mergeAll(devices, events);
      expect(merged.length).assertEqual(2);
      expect(ScannerDirectory.findIndex(merged, '7')).assertEqual(-1);
      expect(merged[0].scannerId).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0010 end');
    });

    /**
     * @tc.name   testDirectoryReal0011
     * @tc.number SUB_SCAN_SYNC_02_0011
     * @tc.desc   labelOf falls back from vendor and model to model, name, then key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0011 begin');
      expect(ScannerDirectory.labelOf(ScanParameterBuilder.device('1', 'U1', 'Acme', 'X100', 'A', 'TCP')))
        .assertEqual('Acme X100');
      expect(ScannerDirectory.labelOf(ScanParameterBuilder.device('2', 'U2', '', 'Y200', 'B', 'USB')))
        .assertEqual('Y200');
      expect(ScannerDirectory.labelOf(ScanParameterBuilder.device('3', 'U3', '', '', 'C', 'TCP')))
        .assertEqual('C');
      expect(ScannerDirectory.labelOf(ScanParameterBuilder.device('4', 'U4', '', '', '', 'TCP')))
        .assertEqual('scan_device_unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0011 end');
    });

    /**
     * @tc.name   testDirectoryReal0012
     * @tc.number SUB_SCAN_SYNC_02_0012
     * @tc.desc   uniqueIds keeps the first occurrence order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0012 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      expect(ScannerDirectory.uniqueIds(devices).join(',')).assertEqual('U1,U2');
      expect(ScannerDirectory.uniqueIds(devices).length).assertEqual(2);
      expect(ScannerDirectory.uniqueIds(ScanParameterBuilder.devices()).length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0012 end');
    });

    /**
     * @tc.name   testDirectoryReal0013
     * @tc.number SUB_SCAN_SYNC_02_0013
     * @tc.desc   sortByName sorts a copy and leaves the input order untouched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0013 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.devices(
        ScanParameterBuilder.device('2', 'U2', '', '', 'Beta', 'TCP'),
        ScanParameterBuilder.device('1', 'U1', '', '', 'Alpha', 'USB'));
      const sorted: scan.ScannerDevice[] = ScannerDirectory.sortByName(devices);
      expect(sorted[0].scannerId).assertEqual('1');
      expect(sorted[1].scannerId).assertEqual('2');
      expect(devices[0].scannerId).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0013 end');
    });

    /**
     * @tc.name   testDirectoryReal0014
     * @tc.number SUB_SCAN_SYNC_02_0014
     * @tc.desc   countByMode counts each discovery mode independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0014 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      expect(ScannerDirectory.countByMode(devices, ScanParameterBuilder.discoveryMode('TCP'))).assertEqual(2);
      expect(ScannerDirectory.countByMode(devices, ScanParameterBuilder.discoveryMode('USB'))).assertEqual(1);
      const vacant: scan.ScannerDevice[] = ScanParameterBuilder.devices();
      expect(ScannerDirectory.countByMode(vacant, ScanParameterBuilder.discoveryMode('TCP'))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0014 end');
    });

    /**
     * @tc.name   testDirectoryReal0015
     * @tc.number SUB_SCAN_SYNC_02_0015
     * @tc.desc   isFull flips exactly at the documented capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0015 begin');
      expect(ScannerDirectory.isFull(ScanParameterBuilder.fillDevices(15))).assertFalse();
      expect(ScannerDirectory.isFull(ScanParameterBuilder.fillDevices(16))).assertTrue();
      expect(ScanParameterBuilder.fillDevices(16).length).assertEqual(ScannerDirectory.CAPACITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0015 end');
    });

    /**
     * @tc.name   testDirectoryReal0016
     * @tc.number SUB_SCAN_SYNC_02_0016
     * @tc.desc   isKnownMode accepts only the two documented discovery modes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0016 begin');
      expect(ScannerDirectory.isKnownMode('TCP')).assertTrue();
      expect(ScannerDirectory.isKnownMode('USB')).assertTrue();
      expect(ScannerDirectory.isKnownMode('BT')).assertFalse();
      expect(ScannerDirectory.isKnownMode('')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0016 end');
    });

    /**
     * @tc.name   testDirectoryReal0017
     * @tc.number SUB_SCAN_SYNC_02_0017
     * @tc.desc   documented constants stay stable for the resource binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0017 begin');
      expect(ScannerDirectory.CAPACITY).assertEqual(16);
      expect(ScannerDirectory.UNKNOWN_LABEL).assertEqual('scan_device_unknown');
      expect(ScannerDirectory.findIndex(ScanParameterBuilder.fillDevices(3), 'S2')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0017 end');
    });

    /**
     * @tc.name   testDirectoryReal0018
     * @tc.number SUB_SCAN_SYNC_02_0018
     * @tc.desc   probe snapshot packs ids, labels, modes and unique count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0018 begin');
      const snapshot: ScanDirectorySnapshot = ScanDirectoryProbe.take(ScanParameterBuilder.sampleDevices());
      expect(snapshot.count).assertEqual(3);
      expect(snapshot.ids).assertEqual('1,2,3');
      expect(snapshot.labels).assertEqual('Acme X100|Y200|scan_device_unknown');
      expect(snapshot.modes).assertEqual('TCP,USB,TCP');
      expect(snapshot.tcpCount).assertEqual(2);
      expect(snapshot.usbCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0018 end');
    });

    /**
     * @tc.name   testDirectoryReal0019
     * @tc.number SUB_SCAN_SYNC_02_0019
     * @tc.desc   probe snapshot of an empty directory stays neutral
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0019 begin');
      const snapshot: ScanDirectorySnapshot = ScanDirectoryProbe.take(ScanParameterBuilder.devices());
      expect(snapshot.count).assertEqual(0);
      expect(snapshot.ids).assertEqual('');
      expect(snapshot.labels).assertEqual('');
      expect(snapshot.uniqueCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0019 end');
    });

    /**
     * @tc.name   testDirectoryReal0020
     * @tc.number SUB_SCAN_SYNC_02_0020
     * @tc.desc   mergeTake agrees with merging manually and then taking a snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0020 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
        ScanParameterBuilder.sync('4', 'U4', 'USB', 'update', '1'));
      const snapshot: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      const manual: ScanDirectorySnapshot = ScanDirectoryProbe.take(ScannerDirectory.mergeAll(devices, events));
      expect(snapshot.ids).assertEqual(manual.ids);
      expect(snapshot.modes).assertEqual(manual.modes);
      expect(snapshot.ids).assertEqual('4,2,3');
      expect(snapshot.usbCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0020 end');
    });

    /**
     * @tc.name   testDirectoryReal0021
     * @tc.number SUB_SCAN_SYNC_02_0021
     * @tc.desc   sortedTake orders devices by their display label
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0021 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.devices(
        ScanParameterBuilder.device('2', 'U2', '', '', 'Beta', 'TCP'),
        ScanParameterBuilder.device('1', 'U1', '', '', 'Alpha', 'TCP'));
      const snapshot: ScanDirectorySnapshot = ScanDirectoryProbe.sortedTake(devices);
      expect(snapshot.ids).assertEqual('1,2');
      expect(snapshot.labels).assertEqual('Alpha|Beta');
      expect(snapshot.count).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0021 end');
    });

    /**
     * @tc.name   testDirectoryReal0022
     * @tc.number SUB_SCAN_SYNC_02_0022
     * @tc.desc   an update event never adds a device that is not in the directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0022 begin');
      const merged: scan.ScannerDevice[] = ScannerDirectory.mergeAll(ScanParameterBuilder.devices(),
        ScanParameterBuilder.syncList(ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '')));
      expect(merged.length).assertEqual(0);
      expect(ScannerDirectory.uniqueIds(merged).length).assertEqual(0);
      expect(ScannerDirectory.isFull(merged)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0022 end');
    });

    /**
     * @tc.name   testDirectoryReal0023
     * @tc.number SUB_SCAN_SYNC_02_0023
     * @tc.desc   a delete event for an unknown id keeps every device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0023 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const merged: scan.ScannerDevice[] = ScannerDirectory.merge(devices,
        ScanParameterBuilder.sync('99', 'U99', 'TCP', 'delete', ''));
      expect(merged.length).assertEqual(3);
      expect(merged[1].scannerId).assertEqual('2');
      expect(merged[2].deviceName).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0023 end');
    });

    /**
     * @tc.name   testDirectoryReal0024
     * @tc.number SUB_SCAN_SYNC_02_0024
     * @tc.desc   discovery then rename then remove keeps the directory consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDirectoryReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0024 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const events: scan.ScannerSyncDevice[] = ScanParameterBuilder.syncList(
        ScanParameterBuilder.sync('11', 'U1', 'USB', 'update', '1'),
        ScanParameterBuilder.sync('12', 'U2', 'TCP', 'update', '2'),
        ScanParameterBuilder.sync('3', 'U1', 'TCP', 'delete', ''));
      const snapshot: ScanDirectorySnapshot = ScanDirectoryProbe.mergeTake(devices, events);
      expect(snapshot.count).assertEqual(2);
      expect(snapshot.ids).assertEqual('11,12');
      expect(snapshot.modes).assertEqual('USB,TCP');
      expect(snapshot.uniqueCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDirectoryReal0024 end');
    });
  });
}
