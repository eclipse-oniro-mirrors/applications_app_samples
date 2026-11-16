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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BluetoothDeviceModel,
  BluetoothDeviceType,
  BluetoothScanService,
  BluetoothScanState
} from 'library';

const EXPECTED_DEVICE_COUNT: number = 10;
const CLASSIC_DEVICE_COUNT: number = 5;
const BLE_DEVICE_COUNT: number = 3;
const DUAL_MODE_DEVICE_COUNT: number = 2;

/**
 * start one full scan and return scanned devices.
 * @param {BluetoothScanService} service - scan service
 * @returns {Promise<BluetoothDeviceModel[]>} scan result
 */
async function scanDevices(service: BluetoothScanService): Promise<BluetoothDeviceModel[]> {
  const started: boolean = await service.startScan();
  expect(started).assertTrue();
  return service.getDiscoveredDevices();
}

/**
 * Bluetooth Scan Service tests
 */
export default function bluetoothScanServiceTest(): void {
  describe('BluetoothScanServiceTest', () => {
    /*
     * @tc.number: SUB_BT_SCAN_0100
     * @tc.name: testBluetoothScan0001
     * @tc.desc: Verify the initial idle state exposes empty scan results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothScan0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0001', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0001',
        '#1 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0001',
        '#2 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0001',
        '#3 assert ' + "expect(service.getDeviceCount()).assertEqual(0)");
      expect(service.getDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0001',
        '#4 assert ' + "expect(service.getDiscoveredDevices().length).assertEqual(0)");
      expect(service.getDiscoveredDevices().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0001',
        '#5 assert ' + "expect(service.getDevicesSortedByRssi().length).assertEqual(0)");
      expect(service.getDevicesSortedByRssi().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0001',
        '#6 assert ' + "expect(service.filterDevicesByName('BT').length).assertEqual(0)");
      expect(service.filterDevicesByName('BT').length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0001',
        '#7 assert ' + "expect(service.filterDevicesByType(BluetoothDeviceType.CLASSIC).length).assertEqual(0)");
      expect(service.filterDevicesByType(BluetoothDeviceType.CLASSIC).length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0001', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0200
     * @tc.name: testBluetoothScan0002
     * @tc.desc: Verify a full scan discovers the expected mock devices and completes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothScan0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0002', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      const result: boolean = await service.startScan();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#2 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#3 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#4 assert ' + "expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);

      const devices: BluetoothDeviceModel[] = service.getDiscoveredDevices();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#5 ' + "devices.length" + ' = ' + JSON.stringify(devices.length));
      expect(devices.length).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#6 ' + "devices[0].deviceName" + ' = ' + JSON.stringify(devices[0].deviceName));
      expect(devices[0].deviceName).assertEqual('BT-Speaker-Pro');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#7 ' + "devices[EXPECTED_DEVICE_COUNT - 1].deviceName" + ' = ' +
        JSON.stringify(devices[EXPECTED_DEVICE_COUNT - 1].deviceName));
      expect(devices[EXPECTED_DEVICE_COUNT - 1].deviceName).assertEqual('BT-Gamepad-Pro');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#8 ' + "devices[0].macAddress.length" + ' = ' + JSON.stringify(devices[0].macAddress.length));
      expect(devices[0].macAddress.length).assertEqual(17);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#9 ' + "devices[0].rssi <= -30" + ' = ' + JSON.stringify(devices[0].rssi <= -30));
      expect(devices[0].rssi <= -30).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#10 ' + "devices[0].rssi >= -99" + ' = ' + JSON.stringify(devices[0].rssi >= -99));
      expect(devices[0].rssi >= -99).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0002',
        '#11 ' + "devices[0].bondState === 0 || devices[0].bondState === 12" + ' = ' +
        JSON.stringify(devices[0].bondState === 0 || devices[0].bondState === 12));
      expect(devices[0].bondState === 0 || devices[0].bondState === 12).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0002', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0300
     * @tc.name: testBluetoothScan0003
     * @tc.desc: Verify a second start request is rejected while a scan is running.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothScan0003', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0003', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      const runningScan: Promise<boolean> = service.startScan();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0003',
        '#1 assert ' + "expect(service.getIsScanning()).assertTrue()");
      expect(service.getIsScanning()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0003',
        '#2 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCANNING)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCANNING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0003',
        '#3 assert ' + "expect(await service.startScan()).assertFalse()");
      expect(await service.startScan()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0003',
        '#4 assert ' + "expect(await runningScan).assertTrue()");
      expect(await runningScan).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0003',
        '#5 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0003',
        '#6 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0003',
        '#7 assert ' + "expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0003', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0400
     * @tc.name: testBluetoothScan0004
     * @tc.desc: Verify scan callbacks receive every device and complete notification, isolating listener errors.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothScan0004', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0004', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      const foundDeviceIds: string[] = [];
      const foundDeviceNames: string[] = [];
      let completedDeviceCount: number = -1;
      let failedMessage: string = '';

      service.addCallback({
        onDeviceFound: (device: BluetoothDeviceModel): void => {
          throw new Error('listener failure');
        },
        onScanComplete: (devices: BluetoothDeviceModel[]): void => {
          throw new Error('listener failure');
        },
        onScanFailed: (error: string): void => {
          throw new Error('listener failure');
        }
      });
      service.addCallback({
        onDeviceFound: (device: BluetoothDeviceModel): void => {
          foundDeviceIds.push(device.deviceId);
          foundDeviceNames.push(device.deviceName);
        },
        onScanComplete: (devices: BluetoothDeviceModel[]): void => {
          completedDeviceCount = devices.length;
        },
        onScanFailed: (error: string): void => {
          failedMessage = error;
        }
      });

      const result: boolean = await service.startScan();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#1 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#2 ' + "foundDeviceIds.length" + ' = ' + JSON.stringify(foundDeviceIds.length));
      expect(foundDeviceIds.length).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#3 ' + "foundDeviceNames.length" + ' = ' + JSON.stringify(foundDeviceNames.length));
      expect(foundDeviceNames.length).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#4 ' + "foundDeviceNames[0]" + ' = ' + JSON.stringify(foundDeviceNames[0]));
      expect(foundDeviceNames[0]).assertEqual('BT-Speaker-Pro');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#5 ' + "completedDeviceCount" + ' = ' + JSON.stringify(completedDeviceCount));
      expect(completedDeviceCount).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#6 ' + "failedMessage" + ' = ' + JSON.stringify(failedMessage));
      expect(failedMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#7 assert ' + "expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0004',
        '#8 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0004', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0500
     * @tc.name: testBluetoothScan0005
     * @tc.desc: Verify stopScan switches the state immediately and is safe to call repeatedly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothScan0005', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0005', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      const runningScan: Promise<boolean> = service.startScan();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#1 assert ' + "expect(service.getIsScanning()).assertTrue()");
      expect(service.getIsScanning()).assertTrue();

      service.stopScan();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#2 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#3 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);

      service.stopScan();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#4 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#5 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#6 assert ' + "expect(await runningScan).assertTrue()");
      expect(await runningScan).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#7 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0005',
        '#8 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0005', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0600
     * @tc.name: testBluetoothScan0006
     * @tc.desc: Verify name filtering is case insensitive and handles empty and unmatched keywords.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothScan0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0006', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#1 assert ' + "expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      const lowerCaseMatch: BluetoothDeviceModel[] = service.filterDevicesByName('speaker');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#2 ' + "lowerCaseMatch.length" + ' = ' + JSON.stringify(lowerCaseMatch.length));
      expect(lowerCaseMatch.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#3 ' + "lowerCaseMatch[0].deviceName" + ' = ' + JSON.stringify(lowerCaseMatch[0].deviceName));
      expect(lowerCaseMatch[0].deviceName).assertEqual('BT-Speaker-Pro');

      const upperCaseMatch: BluetoothDeviceModel[] = service.filterDevicesByName('SPEAKER');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#4 ' + "upperCaseMatch.length" + ' = ' + JSON.stringify(upperCaseMatch.length));
      expect(upperCaseMatch.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#5 ' + "upperCaseMatch[0].deviceName" + ' = ' + JSON.stringify(upperCaseMatch[0].deviceName));
      expect(upperCaseMatch[0].deviceName).assertEqual('BT-Speaker-Pro');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#6 assert ' + "expect(service.filterDevicesByName('').length).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect(service.filterDevicesByName('').length).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#7 assert ' + "expect(service.filterDevicesByName('BT-').length).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect(service.filterDevicesByName('BT-').length).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0006',
        '#8 assert ' + "expect(service.filterDevicesByName('zzz-none').length).assertEqual(0)");
      expect(service.filterDevicesByName('zzz-none').length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0006', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0700
     * @tc.name: testBluetoothScan0007
     * @tc.desc: Verify type filtering returns devices of the requested type only.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothScan0007', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0007', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#1 assert ' + "expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      const classicDevices: BluetoothDeviceModel[] = service.filterDevicesByType(BluetoothDeviceType.CLASSIC);
      const bleDevices: BluetoothDeviceModel[] = service.filterDevicesByType(BluetoothDeviceType.BLE);
      const dualModeDevices: BluetoothDeviceModel[] = service.filterDevicesByType(BluetoothDeviceType.DUAL_MODE);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#2 ' + "classicDevices.length" + ' = ' + JSON.stringify(classicDevices.length));
      expect(classicDevices.length).assertEqual(CLASSIC_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#3 ' + "bleDevices.length" + ' = ' + JSON.stringify(bleDevices.length));
      expect(bleDevices.length).assertEqual(BLE_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#4 ' + "dualModeDevices.length" + ' = ' + JSON.stringify(dualModeDevices.length));
      expect(dualModeDevices.length).assertEqual(DUAL_MODE_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#5 ' + "classicDevices.length + bleDevices.length + dualModeDevices.length" + ' = ' +
        JSON.stringify(classicDevices.length + bleDevices.length + dualModeDevices.length));
      expect(classicDevices.length + bleDevices.length + dualModeDevices.length).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#6 assert ' +
        "expect(classicDevices.every((device: BluetoothDeviceModel) => device.deviceType === BluetoothDeviceType.CLA" +
        "SSIC)).assertTrue()");
      expect(classicDevices.every((device: BluetoothDeviceModel) =>
        device.deviceType === BluetoothDeviceType.CLASSIC)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#7 assert ' +
        "expect(bleDevices.every((device: BluetoothDeviceModel) => device.deviceType === BluetoothDeviceType.BLE)).a" +
        "ssertTrue()");
      expect(bleDevices.every((device: BluetoothDeviceModel) =>
        device.deviceType === BluetoothDeviceType.BLE)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0007',
        '#8 assert ' + "expect(service.filterDevicesByType(BluetoothDeviceType.UNKNOWN).length).assertEqual(0)");
      expect(service.filterDevicesByType(BluetoothDeviceType.UNKNOWN).length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0007', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0800
     * @tc.name: testBluetoothScan0008
     * @tc.desc: Verify RSSI sorting is descending and the discovered list is returned as a copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothScan0008', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0008', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0008',
        '#1 assert ' + "expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      const sortedDevices: BluetoothDeviceModel[] = service.getDevicesSortedByRssi();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0008',
        '#2 ' + "sortedDevices.length" + ' = ' + JSON.stringify(sortedDevices.length));
      expect(sortedDevices.length).assertEqual(EXPECTED_DEVICE_COUNT);
      for (let i: number = 1; i < sortedDevices.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testBluetoothScan0008',
          '#3 ' + "sortedDevices[i - 1].rssi >= sortedDevices[i].rssi" + ' = ' +
          JSON.stringify(sortedDevices[i - 1].rssi >= sortedDevices[i].rssi));
        expect(sortedDevices[i - 1].rssi >= sortedDevices[i].rssi).assertTrue();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0008',
        '#4 ' + "sortedDevices[0].rssi <= -30" + ' = ' + JSON.stringify(sortedDevices[0].rssi <= -30));
      expect(sortedDevices[0].rssi <= -30).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0008',
        '#5 ' + "sortedDevices[sortedDevices.length - 1].rssi >= -99" + ' = ' +
        JSON.stringify(sortedDevices[sortedDevices.length - 1].rssi >= -99));
      expect(sortedDevices[sortedDevices.length - 1].rssi >= -99).assertTrue();

      const snapshot: BluetoothDeviceModel[] = service.getDiscoveredDevices();
      snapshot.pop();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0008',
        '#6 ' + "snapshot.length" + ' = ' + JSON.stringify(snapshot.length));
      expect(snapshot.length).assertEqual(EXPECTED_DEVICE_COUNT - 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0008',
        '#7 assert ' + "expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0008', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_0900
     * @tc.name: testBluetoothScan0009
     * @tc.desc: Verify clearDevices empties results without touching state and reset restores the idle state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothScan0009', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0009', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#1 assert ' + "expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      service.clearDevices();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#2 assert ' + "expect(service.getDeviceCount()).assertEqual(0)");
      expect(service.getDeviceCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#3 assert ' + "expect(service.getDiscoveredDevices().length).assertEqual(0)");
      expect(service.getDiscoveredDevices().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#4 assert ' + "expect(service.filterDevicesByName('BT').length).assertEqual(0)");
      expect(service.filterDevicesByName('BT').length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#5 assert ' + "expect(service.getDevicesSortedByRssi().length).assertEqual(0)");
      expect(service.getDevicesSortedByRssi().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#6 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);

      service.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#7 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#8 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0009',
        '#9 assert ' + "expect(service.getDeviceCount()).assertEqual(0)");
      expect(service.getDeviceCount()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0009', 'end');
    });

    /*
     * @tc.number: SUB_BT_SCAN_1000
     * @tc.name: testBluetoothScan0010
     * @tc.desc: Verify reset removes registered callbacks so later scans deliver no notifications.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothScan0010', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0010', 'begin');
      const service: BluetoothScanService = new BluetoothScanService();
      let callbackCalls: number = 0;

      service.addCallback({
        onDeviceFound: (device: BluetoothDeviceModel): void => {
          callbackCalls += 1;
        },
        onScanComplete: (devices: BluetoothDeviceModel[]): void => {
          callbackCalls += 1;
        },
        onScanFailed: (error: string): void => {
          callbackCalls += 1;
        }
      });
      service.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0010',
        '#1 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0010',
        '#2 assert ' + "expect(service.getIsScanning()).assertFalse()");
      expect(service.getIsScanning()).assertFalse();

      const result: boolean = await service.startScan();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0010',
        '#3 ' + "result" + ' = ' + JSON.stringify(result));
      expect(result).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0010',
        '#4 assert ' + "expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT)");
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0010',
        '#5 assert ' + "expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE)");
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothScan0010',
        '#6 ' + "callbackCalls" + ' = ' + JSON.stringify(callbackCalls));
      expect(callbackCalls).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothScan0010', 'end');
    });
  });
}
