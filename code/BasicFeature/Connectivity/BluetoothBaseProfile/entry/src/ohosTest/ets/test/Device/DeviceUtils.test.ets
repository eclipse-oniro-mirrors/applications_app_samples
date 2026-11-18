/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DeviceUtils } from 'library';

/**
 * Test suite for DeviceUtils.
 * @since 26.0.0
 */
const KNOWN_DEVICE_TYPES: string[] = ['phone', 'default', 'tablet', 'tv', 'wearable', '2in1'];
const ID_SEPARATOR_COUNT: number = 3;

export default function deviceUtilsTest(): void {
  describe('DeviceUtilsTest', () => {
    // ==================== single-value device belong property (3 cases) ====================

    /*
     * @tc.number: SUB_DEVICE_UTILS_0100
     * @tc.name: testDeviceUtils0001
     * @tc.desc: Read brand, model and OS version of the running device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0001', 'begin');
      const brand: string = DeviceUtils.getBrand();
      const model: string = DeviceUtils.getModel();
      const osVersion: string = DeviceUtils.getOsVersion();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#1 ' + "brand.length" + ' = ' + JSON.stringify(brand.length));
      expect(brand.length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#2 ' + "model.length" + ' = ' + JSON.stringify(model.length));
      expect(model.length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#3 ' + "osVersion.length" + ' = ' + JSON.stringify(osVersion.length));
      expect(osVersion.length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#4 ' + "brand" + ' = ' + JSON.stringify(brand));
      expect(brand).assertEqual(DeviceUtils.getBrand());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#5 ' + "model" + ' = ' + JSON.stringify(model));
      expect(model).assertEqual(DeviceUtils.getModel());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#6 ' + "osVersion" + ' = ' + JSON.stringify(osVersion));
      expect(osVersion).assertEqual(DeviceUtils.getOsVersion());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#7 assert ' + "expect(brand.indexOf(',')).assertEqual(-1)");
      expect(brand.indexOf(',')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0001',
        '#8 assert ' + "expect(model.indexOf('\\n')).assertEqual(-1)");
      expect(model.indexOf('\n')).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0001', 'end');
    });

    /*
     * @tc.number: SUB_DEVICE_UTILS_0200
     * @tc.name: testDeviceUtils0002
     * @tc.desc: Read the SDK API version as a positive numeric string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0002', 'begin');
      const apiVersion: string = DeviceUtils.getApiVersion();
      const parsed: number = Number(apiVersion);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0002',
        '#1 ' + "apiVersion.length" + ' = ' + JSON.stringify(apiVersion.length));
      expect(apiVersion.length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0002',
        '#2 ' + "apiVersion" + ' = ' + JSON.stringify(apiVersion));
      expect(apiVersion).assertEqual(DeviceUtils.getApiVersion());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0002',
        '#3 assert ' + "expect(Number.isNaN(parsed)).assertFalse()");
      expect(Number.isNaN(parsed)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0002',
        '#4 ' + "parsed > 0" + ' = ' + JSON.stringify(parsed > 0));
      expect(parsed > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0002',
        '#5 assert ' + "expect(apiVersion.indexOf('.')).assertEqual(-1)");
      expect(apiVersion.indexOf('.')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0002',
        '#6 assert ' + "expect(apiVersion.indexOf('e')).assertEqual(-1)");
      expect(apiVersion.indexOf('e')).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0002', 'end');
    });

    /*
     * @tc.number: SUB_DEVICE_UTILS_0300
     * @tc.name: testDeviceUtils0003
     * @tc.desc: Read the device type and confirm it belongs to the supported type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0003', 'begin');
      const deviceType: string = DeviceUtils.getDeviceType();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0003',
        '#1 ' + "deviceType.length" + ' = ' + JSON.stringify(deviceType.length));
      expect(deviceType.length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0003',
        '#2 ' + "deviceType" + ' = ' + JSON.stringify(deviceType));
      expect(deviceType).assertEqual(DeviceUtils.getDeviceType());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0003',
        '#3 assert ' + "expect(KNOWN_DEVICE_TYPES.indexOf(deviceType)).assertLargerOrEqual(0)");
      expect(KNOWN_DEVICE_TYPES.indexOf(deviceType)).assertLargerOrEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0003',
        '#4 ' + "deviceType" + ' = ' + JSON.stringify(deviceType));
      expect(deviceType).assertEqual(deviceType.toLowerCase());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0003',
        '#5 assert ' + "expect(deviceType.indexOf(' ')).assertEqual(-1)");
      expect(deviceType.indexOf(' ')).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0003', 'end');
    });

    // ==================== device form judge specify (2 cases) ====================

    /*
     * @tc.number: SUB_DEVICE_UTILS_0400
     * @tc.name: testDeviceUtils0004
     * @tc.desc: Compare the tablet and phone flags against the reported device type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0004', 'begin');
      const deviceType: string = DeviceUtils.getDeviceType();
      const isTablet: boolean = DeviceUtils.isTablet();
      const isPhone: boolean = DeviceUtils.isPhone();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0004',
        '#1 ' + "isTablet" + ' = ' + JSON.stringify(isTablet));
      expect(isTablet).assertEqual(deviceType === 'tablet');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0004',
        '#2 ' + "isPhone" + ' = ' + JSON.stringify(isPhone));
      expect(isPhone).assertEqual(deviceType === 'phone' || deviceType === 'default');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0004',
        '#3 ' + "isTablet && isPhone" + ' = ' + JSON.stringify(isTablet && isPhone));
      expect(isTablet && isPhone).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0004',
        '#4 assert ' + "expect(DeviceUtils.isTablet()).assertEqual(isTablet)");
      expect(DeviceUtils.isTablet()).assertEqual(isTablet);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0004',
        '#5 assert ' + "expect(DeviceUtils.isPhone()).assertEqual(isPhone)");
      expect(DeviceUtils.isPhone()).assertEqual(isPhone);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0004', 'end');
    });

    /*
     * @tc.number: SUB_DEVICE_UTILS_0500
     * @tc.name: testDeviceUtils0005
     * @tc.desc: Confirm the bluetooth capability flags stay enabled on the test device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDeviceUtils0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0005', 'begin');
      const supportClassic: boolean = DeviceUtils.supportsBluetooth();
      const supportBle: boolean = DeviceUtils.supportsBle();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0005',
        '#1 ' + "supportClassic" + ' = ' + JSON.stringify(supportClassic));
      expect(supportClassic).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0005',
        '#2 ' + "supportBle" + ' = ' + JSON.stringify(supportBle));
      expect(supportBle).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0005',
        '#3 assert ' + "expect(DeviceUtils.supportsBluetooth()).assertTrue()");
      expect(DeviceUtils.supportsBluetooth()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0005',
        '#4 assert ' + "expect(DeviceUtils.supportsBle()).assertTrue()");
      expect(DeviceUtils.supportsBle()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0005',
        '#5 ' + "supportBle" + ' = ' + JSON.stringify(supportBle));
      expect(supportBle).assertEqual(supportClassic);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0005',
        '#6 assert ' + "expect(DeviceUtils.isTablet() && !supportClassic).assertFalse()");
      expect(DeviceUtils.isTablet() && !supportClassic).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0005', 'end');
    });

    // ==================== aggregate device info (3 cases) ====================

    /*
     * @tc.number: SUB_DEVICE_UTILS_0600
     * @tc.name: testDeviceUtils0006
     * @tc.desc: Collect the full device info object and match every field with its single getter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0006', 'begin');
      const info = DeviceUtils.getDeviceInfo();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#1 ' + "info.brand" + ' = ' + JSON.stringify(info.brand));
      expect(info.brand).assertEqual(DeviceUtils.getBrand());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#2 ' + "info.model" + ' = ' + JSON.stringify(info.model));
      expect(info.model).assertEqual(DeviceUtils.getModel());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#3 ' + "info.osVersion" + ' = ' + JSON.stringify(info.osVersion));
      expect(info.osVersion).assertEqual(DeviceUtils.getOsVersion());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#4 ' + "info.deviceType" + ' = ' + JSON.stringify(info.deviceType));
      expect(info.deviceType).assertEqual(DeviceUtils.getDeviceType());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#5 ' + "info.apiVersion" + ' = ' + JSON.stringify(info.apiVersion));
      expect(info.apiVersion).assertEqual(DeviceUtils.getApiVersion());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#6 ' + "info.deviceId.length" + ' = ' + JSON.stringify(info.deviceId.length));
      expect(info.deviceId.length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#7 ' + "info.deviceId" + ' = ' + JSON.stringify(info.deviceId));
      expect(info.deviceId).assertEqual(info.deviceId.toLowerCase());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0006',
        '#8 assert ' + "expect(info.deviceId.split(':').length).assertEqual(1)");
      expect(info.deviceId.split(':').length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0006', 'end');
    });

    /*
     * @tc.number: SUB_DEVICE_UTILS_0700
     * @tc.name: testDeviceUtils0007
     * @tc.desc: Confirm the collected device id is rebuilt from the brand and model prefix.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDeviceUtils0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0007', 'begin');
      const info = DeviceUtils.getDeviceInfo();
      const segments: string[] = info.deviceId.split('-');
      const expectedPrefix: string = (DeviceUtils.getBrand() + '-' + DeviceUtils.getModel()).toLowerCase();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0007',
        '#1 ' + "segments.length" + ' = ' + JSON.stringify(segments.length));
      expect(segments.length).assertLargerOrEqual(ID_SEPARATOR_COUNT + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0007',
        '#2 assert ' + "expect(info.deviceId.startsWith(expectedPrefix)).assertTrue()");
      expect(info.deviceId.startsWith(expectedPrefix)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0007',
        '#3 ' + "segments[segments.length - 1].length" + ' = ' + JSON.stringify(segments[segments.length - 1].length));
      expect(segments[segments.length - 1].length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0007',
        '#4 ' + "segments[segments.length - 2].length" + ' = ' + JSON.stringify(segments[segments.length - 2].length));
      expect(segments[segments.length - 2].length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0007',
        '#5 assert ' + "expect(Number.isNaN(Number.parseInt(segments[segments.length - 2], 36))).assertFalse()");
      expect(Number.isNaN(Number.parseInt(segments[segments.length - 2], 36))).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0007',
        '#6 ' + "info.deviceId" + ' = ' + JSON.stringify(info.deviceId));
      expect(info.deviceId).assertEqual(info.deviceId.toLowerCase());
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0007', 'end');
    });

    /*
     * @tc.number: SUB_DEVICE_UTILS_0800
     * @tc.name: testDeviceUtils0008
     * @tc.desc: Generate successive device identifiers and keep every one of them unique.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDeviceUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0008', 'begin');
      const generated: string[] = [];
      let uniqueCount: number = 0;
      for (let i: number = 0; i < 12; i++) {
        const candidate: string = DeviceUtils.generateDeviceId();
        if (generated.indexOf(candidate) === -1) {
          uniqueCount++;
        }
        generated.push(candidate);
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0008',
        '#1 ' + "generated.length" + ' = ' + JSON.stringify(generated.length));
      expect(generated.length).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0008',
        '#2 ' + "uniqueCount" + ' = ' + JSON.stringify(uniqueCount));
      expect(uniqueCount).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0008',
        '#3 ' + "generated[0]" + ' = ' + JSON.stringify(generated[0]));
      expect(generated[0]).assertEqual(generated[0].toLowerCase());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0008',
        '#4 assert ' + "expect(generated[0].split('-').length).assertLargerOrEqual(ID_SEPARATOR_COUNT + 1)");
      expect(generated[0].split('-').length).assertLargerOrEqual(ID_SEPARATOR_COUNT + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0008',
        '#5 ' + "generated[0].length" + ' = ' + JSON.stringify(generated[0].length));
      expect(generated[0].length).assertLarger(DeviceUtils.getBrand().length + DeviceUtils.getModel().length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0008',
        '#6 ' + "generated[11] === generated[10]" + ' = ' + JSON.stringify(generated[11] === generated[10]));
      expect(generated[11] === generated[10]).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0008',
        '#7 ' + "generated[11].length > 6" + ' = ' + JSON.stringify(generated[11].length > 6));
      expect(generated[11].length > 6).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0008', 'end');
    });

    // ==================== fixed specify capability describe describe (2 cases) ====================

    /*
     * @tc.number: SUB_DEVICE_UTILS_0900
     * @tc.name: testDeviceUtils0009
     * @tc.desc: Read the memory and storage descriptions exposed by the device helper.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDeviceUtils0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0009', 'begin');
      const memory: string = DeviceUtils.getMemoryInfo();
      const storage: string = DeviceUtils.getStorageInfo();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0009',
        '#1 ' + "memory" + ' = ' + JSON.stringify(memory));
      expect(memory).assertEqual('Unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0009',
        '#2 ' + "storage" + ' = ' + JSON.stringify(storage));
      expect(storage).assertEqual('Available');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0009',
        '#3 assert ' + "expect(DeviceUtils.getMemoryInfo()).assertEqual(memory)");
      expect(DeviceUtils.getMemoryInfo()).assertEqual(memory);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0009',
        '#4 assert ' + "expect(DeviceUtils.getStorageInfo()).assertEqual(storage)");
      expect(DeviceUtils.getStorageInfo()).assertEqual(storage);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0009',
        '#5 assert ' + "expect(memory.indexOf('GB')).assertEqual(-1)");
      expect(memory.indexOf('GB')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0009',
        '#6 ' + "storage.length" + ' = ' + JSON.stringify(storage.length));
      expect(storage.length).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0009',
        '#7 assert ' + "expect(DeviceUtils.getDeviceInfo().deviceId.length > 0).assertTrue()");
      expect(DeviceUtils.getDeviceInfo().deviceId.length > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0009', 'end');
    });

    /*
     * @tc.number: SUB_DEVICE_UTILS_1000
     * @tc.name: testDeviceUtils0010
     * @tc.desc: Format the device info into six labelled lines and verify every label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDeviceUtils0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0010', 'begin');
      const info = DeviceUtils.getDeviceInfo();
      const formatted: string = DeviceUtils.formatDeviceInfo(info);
      const lines: string[] = formatted.split('\n');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#1 ' + "lines.length" + ' = ' + JSON.stringify(lines.length));
      expect(lines.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#2 ' + "lines[0]" + ' = ' + JSON.stringify(lines[0]));
      expect(lines[0]).assertEqual('Brand: ' + info.brand);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#3 ' + "lines[1]" + ' = ' + JSON.stringify(lines[1]));
      expect(lines[1]).assertEqual('Model: ' + info.model);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#4 ' + "lines[2]" + ' = ' + JSON.stringify(lines[2]));
      expect(lines[2]).assertEqual('OS: ' + info.osVersion);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#5 ' + "lines[3]" + ' = ' + JSON.stringify(lines[3]));
      expect(lines[3]).assertEqual('Type: ' + info.deviceType);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#6 ' + "lines[4]" + ' = ' + JSON.stringify(lines[4]));
      expect(lines[4]).assertEqual('API: ' + info.apiVersion);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#7 ' + "lines[5]" + ' = ' + JSON.stringify(lines[5]));
      expect(lines[5]).assertEqual('ID: ' + info.deviceId);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0010',
        '#8 assert ' + "expect(formatted.indexOf('Brand')).assertEqual(0)");
      expect(formatted.indexOf('Brand')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0010', 'end');
    });

    /*
     * @tc.number: SUB_DEVICE_UTILS_1100
     * @tc.name: testDeviceUtils0011
     * @tc.desc: Format a modified device info object and reflect the new field values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDeviceUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0011', 'begin');
      const info = DeviceUtils.getDeviceInfo();
      info.brand = 'SampleBrand';
      info.model = 'SampleModel';
      info.apiVersion = '99';
      const formatted: string = DeviceUtils.formatDeviceInfo(info);
      const lines: string[] = formatted.split('\n');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0011',
        '#1 ' + "lines[0]" + ' = ' + JSON.stringify(lines[0]));
      expect(lines[0]).assertEqual('Brand: SampleBrand');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0011',
        '#2 ' + "lines[1]" + ' = ' + JSON.stringify(lines[1]));
      expect(lines[1]).assertEqual('Model: SampleModel');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0011',
        '#3 ' + "lines[4]" + ' = ' + JSON.stringify(lines[4]));
      expect(lines[4]).assertEqual('API: 99');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0011',
        '#4 assert ' + "expect(formatted.indexOf('SampleBrand')).assertEqual(7)");
      expect(formatted.indexOf('SampleBrand')).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0011',
        '#5 assert ' + "expect(formatted.indexOf('Unknown')).assertEqual(-1)");
      expect(formatted.indexOf('Unknown')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0011',
        '#6 ' + "lines.length" + ' = ' + JSON.stringify(lines.length));
      expect(lines.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDeviceUtils0011',
        '#7 ' + "lines[2]" + ' = ' + JSON.stringify(lines[2]));
      expect(lines[2]).assertEqual('OS: ' + info.osVersion);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDeviceUtils0011', 'end');
    });
  });
}
