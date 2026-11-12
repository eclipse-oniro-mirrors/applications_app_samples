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
      const brand: string = DeviceUtils.getBrand();
      const model: string = DeviceUtils.getModel();
      const osVersion: string = DeviceUtils.getOsVersion();

      expect(brand.length).assertLarger(0);
      expect(model.length).assertLarger(0);
      expect(osVersion.length).assertLarger(0);
      expect(brand).assertEqual(DeviceUtils.getBrand());
      expect(model).assertEqual(DeviceUtils.getModel());
      expect(osVersion).assertEqual(DeviceUtils.getOsVersion());
      expect(brand.indexOf(',')).assertEqual(-1);
      expect(model.indexOf('\n')).assertEqual(-1);
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
      const apiVersion: string = DeviceUtils.getApiVersion();
      const parsed: number = Number(apiVersion);

      expect(apiVersion.length).assertLarger(0);
      expect(apiVersion).assertEqual(DeviceUtils.getApiVersion());
      expect(Number.isNaN(parsed)).assertFalse();
      expect(parsed > 0).assertTrue();
      expect(apiVersion.indexOf('.')).assertEqual(-1);
      expect(apiVersion.indexOf('e')).assertEqual(-1);
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
      const deviceType: string = DeviceUtils.getDeviceType();

      expect(deviceType.length).assertLarger(0);
      expect(deviceType).assertEqual(DeviceUtils.getDeviceType());
      expect(KNOWN_DEVICE_TYPES.indexOf(deviceType)).assertLargerOrEqual(0);
      expect(deviceType).assertEqual(deviceType.toLowerCase());
      expect(deviceType.indexOf(' ')).assertEqual(-1);
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
      const deviceType: string = DeviceUtils.getDeviceType();
      const isTablet: boolean = DeviceUtils.isTablet();
      const isPhone: boolean = DeviceUtils.isPhone();

      expect(isTablet).assertEqual(deviceType === 'tablet');
      expect(isPhone).assertEqual(deviceType === 'phone' || deviceType === 'default');
      expect(isTablet && isPhone).assertFalse();
      expect(DeviceUtils.isTablet()).assertEqual(isTablet);
      expect(DeviceUtils.isPhone()).assertEqual(isPhone);
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
      const supportClassic: boolean = DeviceUtils.supportsBluetooth();
      const supportBle: boolean = DeviceUtils.supportsBle();

      expect(supportClassic).assertTrue();
      expect(supportBle).assertTrue();
      expect(DeviceUtils.supportsBluetooth()).assertTrue();
      expect(DeviceUtils.supportsBle()).assertTrue();
      expect(supportBle).assertEqual(supportClassic);
      expect(DeviceUtils.isTablet() && !supportClassic).assertFalse();
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
      const info = DeviceUtils.getDeviceInfo();

      expect(info.brand).assertEqual(DeviceUtils.getBrand());
      expect(info.model).assertEqual(DeviceUtils.getModel());
      expect(info.osVersion).assertEqual(DeviceUtils.getOsVersion());
      expect(info.deviceType).assertEqual(DeviceUtils.getDeviceType());
      expect(info.apiVersion).assertEqual(DeviceUtils.getApiVersion());
      expect(info.deviceId.length).assertLarger(0);
      expect(info.deviceId).assertEqual(info.deviceId.toLowerCase());
      expect(info.deviceId.split(':').length).assertEqual(1);
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
      const info = DeviceUtils.getDeviceInfo();
      const segments: string[] = info.deviceId.split('-');
      const expectedPrefix: string = (DeviceUtils.getBrand() + '-' + DeviceUtils.getModel()).toLowerCase();

      expect(segments.length).assertLargerOrEqual(ID_SEPARATOR_COUNT + 1);
      expect(info.deviceId.startsWith(expectedPrefix)).assertTrue();
      expect(segments[segments.length - 1].length).assertLarger(0);
      expect(segments[segments.length - 2].length).assertLarger(0);
      expect(Number.isNaN(Number.parseInt(segments[segments.length - 2], 36))).assertFalse();
      expect(info.deviceId).assertEqual(info.deviceId.toLowerCase());
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
      const generated: string[] = [];
      let uniqueCount: number = 0;
      for (let i: number = 0; i < 12; i++) {
        const candidate: string = DeviceUtils.generateDeviceId();
        if (generated.indexOf(candidate) === -1) {
          uniqueCount++;
        }
        generated.push(candidate);
      }

      expect(generated.length).assertEqual(12);
      expect(uniqueCount).assertEqual(12);
      expect(generated[0]).assertEqual(generated[0].toLowerCase());
      expect(generated[0].split('-').length).assertLargerOrEqual(ID_SEPARATOR_COUNT + 1);
      expect(generated[0].length).assertLarger(DeviceUtils.getBrand().length + DeviceUtils.getModel().length);
      expect(generated[11] === generated[10]).assertFalse();
      expect(generated[11].length > 6).assertTrue();
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
      const memory: string = DeviceUtils.getMemoryInfo();
      const storage: string = DeviceUtils.getStorageInfo();

      expect(memory).assertEqual('Unknown');
      expect(storage).assertEqual('Available');
      expect(DeviceUtils.getMemoryInfo()).assertEqual(memory);
      expect(DeviceUtils.getStorageInfo()).assertEqual(storage);
      expect(memory.indexOf('GB')).assertEqual(-1);
      expect(storage.length).assertLarger(0);
      expect(DeviceUtils.getDeviceInfo().deviceId.length > 0).assertTrue();
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
      const info = DeviceUtils.getDeviceInfo();
      const formatted: string = DeviceUtils.formatDeviceInfo(info);
      const lines: string[] = formatted.split('\n');

      expect(lines.length).assertEqual(6);
      expect(lines[0]).assertEqual('Brand: ' + info.brand);
      expect(lines[1]).assertEqual('Model: ' + info.model);
      expect(lines[2]).assertEqual('OS: ' + info.osVersion);
      expect(lines[3]).assertEqual('Type: ' + info.deviceType);
      expect(lines[4]).assertEqual('API: ' + info.apiVersion);
      expect(lines[5]).assertEqual('ID: ' + info.deviceId);
      expect(formatted.indexOf('Brand')).assertEqual(0);
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
      const info = DeviceUtils.getDeviceInfo();
      info.brand = 'SampleBrand';
      info.model = 'SampleModel';
      info.apiVersion = '99';
      const formatted: string = DeviceUtils.formatDeviceInfo(info);
      const lines: string[] = formatted.split('\n');

      expect(lines[0]).assertEqual('Brand: SampleBrand');
      expect(lines[1]).assertEqual('Model: SampleModel');
      expect(lines[4]).assertEqual('API: 99');
      expect(formatted.indexOf('SampleBrand')).assertEqual(7);
      expect(formatted.indexOf('Unknown')).assertEqual(-1);
      expect(lines.length).assertEqual(6);
      expect(lines[2]).assertEqual('OS: ' + info.osVersion);
    });
  });
}
