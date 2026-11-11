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
 * 启动一次完整扫描并返回扫描到的设备。
 * @param {BluetoothScanService} service - 扫描服务
 * @returns {Promise<BluetoothDeviceModel[]>} 扫描结果
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
      const service = new BluetoothScanService();
      expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE);
      expect(service.getIsScanning()).assertFalse();
      expect(service.getDeviceCount()).assertEqual(0);
      expect(service.getDiscoveredDevices().length).assertEqual(0);
      expect(service.getDevicesSortedByRssi().length).assertEqual(0);
      expect(service.filterDevicesByName('BT').length).assertEqual(0);
      expect(service.filterDevicesByType(BluetoothDeviceType.CLASSIC).length).assertEqual(0);
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
      const service = new BluetoothScanService();
      const result: boolean = await service.startScan();

      expect(result).assertTrue();
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      expect(service.getIsScanning()).assertFalse();
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);

      const devices: BluetoothDeviceModel[] = service.getDiscoveredDevices();
      expect(devices.length).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(devices[0].deviceName).assertEqual('BT-Speaker-Pro');
      expect(devices[EXPECTED_DEVICE_COUNT - 1].deviceName).assertEqual('BT-Gamepad-Pro');
      expect(devices[0].macAddress.length).assertEqual(17);
      expect(devices[0].rssi <= -30).assertTrue();
      expect(devices[0].rssi >= -99).assertTrue();
      expect(devices[0].bondState === 0 || devices[0].bondState === 12).assertTrue();
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
      const service = new BluetoothScanService();
      const runningScan: Promise<boolean> = service.startScan();

      expect(service.getIsScanning()).assertTrue();
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCANNING);
      expect(await service.startScan()).assertFalse();

      expect(await runningScan).assertTrue();
      expect(service.getIsScanning()).assertFalse();
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
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
      const service = new BluetoothScanService();
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
      expect(result).assertTrue();
      expect(foundDeviceIds.length).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(foundDeviceNames.length).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(foundDeviceNames[0]).assertEqual('BT-Speaker-Pro');
      expect(completedDeviceCount).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(failedMessage).assertEqual('');
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
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
      const service = new BluetoothScanService();
      const runningScan: Promise<boolean> = service.startScan();
      expect(service.getIsScanning()).assertTrue();

      service.stopScan();
      expect(service.getIsScanning()).assertFalse();
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);

      service.stopScan();
      expect(service.getIsScanning()).assertFalse();
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);

      expect(await runningScan).assertTrue();
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      expect(service.getIsScanning()).assertFalse();
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
      const service = new BluetoothScanService();
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      const lowerCaseMatch: BluetoothDeviceModel[] = service.filterDevicesByName('speaker');
      expect(lowerCaseMatch.length).assertEqual(1);
      expect(lowerCaseMatch[0].deviceName).assertEqual('BT-Speaker-Pro');

      const upperCaseMatch: BluetoothDeviceModel[] = service.filterDevicesByName('SPEAKER');
      expect(upperCaseMatch.length).assertEqual(1);
      expect(upperCaseMatch[0].deviceName).assertEqual('BT-Speaker-Pro');

      expect(service.filterDevicesByName('').length).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(service.filterDevicesByName('BT-').length).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(service.filterDevicesByName('zzz-none').length).assertEqual(0);
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
      const service = new BluetoothScanService();
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      const classicDevices: BluetoothDeviceModel[] = service.filterDevicesByType(BluetoothDeviceType.CLASSIC);
      const bleDevices: BluetoothDeviceModel[] = service.filterDevicesByType(BluetoothDeviceType.BLE);
      const dualModeDevices: BluetoothDeviceModel[] = service.filterDevicesByType(BluetoothDeviceType.DUAL_MODE);

      expect(classicDevices.length).assertEqual(CLASSIC_DEVICE_COUNT);
      expect(bleDevices.length).assertEqual(BLE_DEVICE_COUNT);
      expect(dualModeDevices.length).assertEqual(DUAL_MODE_DEVICE_COUNT);
      expect(classicDevices.length + bleDevices.length + dualModeDevices.length).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(classicDevices.every((device: BluetoothDeviceModel) =>
        device.deviceType === BluetoothDeviceType.CLASSIC)).assertTrue();
      expect(bleDevices.every((device: BluetoothDeviceModel) =>
        device.deviceType === BluetoothDeviceType.BLE)).assertTrue();
      expect(service.filterDevicesByType(BluetoothDeviceType.UNKNOWN).length).assertEqual(0);
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
      const service = new BluetoothScanService();
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      const sortedDevices: BluetoothDeviceModel[] = service.getDevicesSortedByRssi();
      expect(sortedDevices.length).assertEqual(EXPECTED_DEVICE_COUNT);
      for (let i: number = 1; i < sortedDevices.length; i++) {
        expect(sortedDevices[i - 1].rssi >= sortedDevices[i].rssi).assertTrue();
      }
      expect(sortedDevices[0].rssi <= -30).assertTrue();
      expect(sortedDevices[sortedDevices.length - 1].rssi >= -99).assertTrue();

      const snapshot: BluetoothDeviceModel[] = service.getDiscoveredDevices();
      snapshot.pop();
      expect(snapshot.length).assertEqual(EXPECTED_DEVICE_COUNT - 1);
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
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
      const service = new BluetoothScanService();
      expect((await scanDevices(service)).length).assertEqual(EXPECTED_DEVICE_COUNT);

      service.clearDevices();
      expect(service.getDeviceCount()).assertEqual(0);
      expect(service.getDiscoveredDevices().length).assertEqual(0);
      expect(service.filterDevicesByName('BT').length).assertEqual(0);
      expect(service.getDevicesSortedByRssi().length).assertEqual(0);
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);

      service.reset();
      expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE);
      expect(service.getIsScanning()).assertFalse();
      expect(service.getDeviceCount()).assertEqual(0);
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
      const service = new BluetoothScanService();
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
      expect(service.getScanState()).assertEqual(BluetoothScanState.IDLE);
      expect(service.getIsScanning()).assertFalse();

      const result: boolean = await service.startScan();
      expect(result).assertTrue();
      expect(service.getDeviceCount()).assertEqual(EXPECTED_DEVICE_COUNT);
      expect(service.getScanState()).assertEqual(BluetoothScanState.SCAN_COMPLETE);
      expect(callbackCalls).assertEqual(0);
    });
  });
}
