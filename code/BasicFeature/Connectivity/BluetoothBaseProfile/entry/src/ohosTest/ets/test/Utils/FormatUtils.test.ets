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
import { FormatUtils } from 'library';

/**
 * Test suite for FormatUtils.
 * @since 26.0.0
 */
export default function formatUtilsTest(): void {
  describe('FormatUtilsTest', () => {
    // ==================== character section and compare special rate (4 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_0100
     * @tc.name: testFormatUtils0001
     * @tc.desc: Format zero and single byte sizes with two decimals.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0001', 0, () => {
      expect(FormatUtils.formatBytes(0)).assertEqual('0 B');
      expect(FormatUtils.formatBytes(1)).assertEqual('1.00 B');
      expect(FormatUtils.formatBytes(512)).assertEqual('512.00 B');
      expect(FormatUtils.formatBytes(1).indexOf(' B') > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_0200
     * @tc.name: testFormatUtils0002
     * @tc.desc: Scale byte sizes up to the kilobyte unit.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0002', 0, () => {
      expect(FormatUtils.formatBytes(1024)).assertEqual('1.00 KB');
      expect(FormatUtils.formatBytes(1536)).assertEqual('1.50 KB');
      expect(FormatUtils.formatBytes(1023)).assertEqual('1023.00 B');
      expect(FormatUtils.formatBytes(1024).indexOf('KB') > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_0300
     * @tc.name: testFormatUtils0003
     * @tc.desc: Scale byte sizes through megabyte, gigabyte and terabyte units.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0003', 0, () => {
      expect(FormatUtils.formatBytes(1048576)).assertEqual('1.00 MB');
      expect(FormatUtils.formatBytes(1073741824)).assertEqual('1.00 GB');
      expect(FormatUtils.formatBytes(1099511627776)).assertEqual('1.00 TB');
      expect(FormatUtils.formatBytes(2097152)).assertEqual('2.00 MB');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_0400
     * @tc.name: testFormatUtils0004
     * @tc.desc: Switch the bit rate unit at the thousand boundaries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0004', 0, () => {
      expect(FormatUtils.formatBitRate(0)).assertEqual('0 bps');
      expect(FormatUtils.formatBitRate(999)).assertEqual('999 bps');
      expect(FormatUtils.formatBitRate(1000)).assertEqual('1.0 Kbps');
      expect(FormatUtils.formatBitRate(328000)).assertEqual('328.0 Kbps');
      expect(FormatUtils.formatBitRate(1000000)).assertEqual('1.0 Mbps');
    });

    // ==================== MAC ground address (3 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_0500
     * @tc.name: testFormatUtils0005
     * @tc.desc: Group a plain MAC address into colon separated octets.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0005', 0, () => {
      const mac: string = FormatUtils.formatMacAddress('a1b2c3d4e5f6');
      expect(mac).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(mac.length).assertEqual(17);
      expect(mac.split(':').length).assertEqual(6);
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_0600
     * @tc.name: testFormatUtils0006
     * @tc.desc: Strip existing hyphen and colon separators before grouping.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0006', 0, () => {
      expect(FormatUtils.formatMacAddress('a1-b2-c3-d4-e5-f6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(FormatUtils.formatMacAddress('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(FormatUtils.formatMacAddress('a1b2c3d4e5f6').indexOf('-')).assertEqual(-1);
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_0700
     * @tc.name: testFormatUtils0007
     * @tc.desc: Return short MAC text unchanged and group an over long one.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0007', 0, () => {
      expect(FormatUtils.formatMacAddress('A1B2')).assertEqual('A1B2');
      expect(FormatUtils.formatMacAddress('')).assertEqual('');
      expect(FormatUtils.formatMacAddress('0011223344556677')).assertEqual('00:11:22:33:44:55:66:77');
      expect(FormatUtils.formatMacAddress('0011223344556677').split(':').length).assertEqual(8);
    });

    // ==================== signal strength (2 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_0800
     * @tc.name: testFormatUtils0008
     * @tc.desc: Label the strongest RSSI band as Excellent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0008', 0, () => {
      expect(FormatUtils.formatSignalStrength(0)).assertEqual('Excellent');
      expect(FormatUtils.formatSignalStrength(-50)).assertEqual('Excellent');
      expect(FormatUtils.formatSignalStrength(-51)).assertEqual('Good');
      expect(FormatUtils.formatSignalStrength(-60)).assertEqual('Good');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_0900
     * @tc.name: testFormatUtils0009
     * @tc.desc: Walk the RSSI thresholds down to the weakest band.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0009', 0, () => {
      expect(FormatUtils.formatSignalStrength(-61)).assertEqual('Fair');
      expect(FormatUtils.formatSignalStrength(-70)).assertEqual('Fair');
      expect(FormatUtils.formatSignalStrength(-71)).assertEqual('Weak');
      expect(FormatUtils.formatSignalStrength(-80)).assertEqual('Weak');
      expect(FormatUtils.formatSignalStrength(-81)).assertEqual('Very Weak');
      expect(FormatUtils.formatSignalStrength(-127)).assertEqual('Very Weak');
    });

    // ==================== percentage and thousands separator (3 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_1000
     * @tc.name: testFormatUtils0010
     * @tc.desc: Compute the rounded percentage of a value over a total.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0010', 0, () => {
      expect(FormatUtils.formatPercentage(1, 2)).assertEqual('50%');
      expect(FormatUtils.formatPercentage(2, 3)).assertEqual('67%');
      expect(FormatUtils.formatPercentage(1, 3)).assertEqual('33%');
      expect(FormatUtils.formatPercentage(0, 5)).assertEqual('0%');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_1100
     * @tc.name: testFormatUtils0011
     * @tc.desc: Guard a zero total and a value above the total.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0011', 0, () => {
      expect(FormatUtils.formatPercentage(5, 0)).assertEqual('0%');
      expect(FormatUtils.formatPercentage(0, 0)).assertEqual('0%');
      expect(FormatUtils.formatPercentage(3, 2)).assertEqual('150%');
      expect(FormatUtils.formatPercentage(200, 200)).assertEqual('100%');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_1200
     * @tc.name: testFormatUtils0012
     * @tc.desc: Insert thousands separators for various digit counts.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0012', 0, () => {
      expect(FormatUtils.formatNumber(0)).assertEqual('0');
      expect(FormatUtils.formatNumber(999)).assertEqual('999');
      expect(FormatUtils.formatNumber(1000)).assertEqual('1,000');
      expect(FormatUtils.formatNumber(1234567)).assertEqual('1,234,567');
      expect(FormatUtils.formatNumber(-1000)).assertEqual('-1,000');
    });

    // ==================== phone and UUID(3 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_1300
     * @tc.name: testFormatUtils0013
     * @tc.desc: Split an eleven digit phone number into three groups.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0013', 0, () => {
      const phone: string = FormatUtils.formatPhoneNumber('13800138000');
      expect(phone).assertEqual('138 0013 8000');
      expect(phone.split(' ').length).assertEqual(3);
      expect(phone.length).assertEqual(13);
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_1400
     * @tc.name: testFormatUtils0014
     * @tc.desc: Return phone numbers whose length is not eleven unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0014', 0, () => {
      expect(FormatUtils.formatPhoneNumber('1380013')).assertEqual('1380013');
      expect(FormatUtils.formatPhoneNumber('')).assertEqual('');
      expect(FormatUtils.formatPhoneNumber('138001380000')).assertEqual('138001380000');
      expect(FormatUtils.formatPhoneNumber('123456789012').indexOf(' ') < 0).assertTrue();
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_1500
     * @tc.name: testFormatUtils0015
     * @tc.desc: Rebuild the canonical UUID layout from a plain hex string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0015', 0, () => {
      const uuid: string = FormatUtils.formatUuid('00112233445566778899aabbccddeeff');
      expect(uuid).assertEqual('00112233-4455-6677-8899-aabbccddeeff');
      expect(uuid.split('-').length).assertEqual(5);
      expect(uuid.length).assertEqual(36);
      expect(FormatUtils.formatUuid('')).assertEqual('');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_1600
     * @tc.name: testFormatUtils0016
     * @tc.desc: Normalize separators and case and keep invalid UUIDs untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0016', 0, () => {
      expect(FormatUtils.formatUuid('00112233-4455-6677-8899-AABBCCDDEEFF'))
        .assertEqual('00112233-4455-6677-8899-aabbccddeeff');
      expect(FormatUtils.formatUuid('not-a-uuid')).assertEqual('not-a-uuid');
      expect(FormatUtils.formatUuid('001122334455').length).assertEqual(12);
      expect(FormatUtils.formatUuid('AABB').indexOf(':')).assertEqual(-1);
    });

    // ==================== cut disconnect (3 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_1700
     * @tc.name: testFormatUtils0017
     * @tc.desc: Truncate a long device name with the default ellipsis suffix.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0017', 0, () => {
      const cut: string = FormatUtils.truncate('BluetoothHeadset', 8);
      expect(cut).assertEqual('Bluet...');
      expect(cut.length).assertEqual(8);
      expect(cut.endsWith('...')).assertTrue();
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_1800
     * @tc.name: testFormatUtils0018
     * @tc.desc: Keep a text that already fits the maximum length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0018', 0, () => {
      expect(FormatUtils.truncate('audio', 10)).assertEqual('audio');
      expect(FormatUtils.truncate('audio', 5)).assertEqual('audio');
      expect(FormatUtils.truncate('', 5)).assertEqual('');
      expect(FormatUtils.truncate('audio', 5).length).assertEqual(5);
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_1900
     * @tc.name: testFormatUtils0019
     * @tc.desc: Honor a custom suffix and the shortest allowed maximum length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0019', 0, () => {
      expect(FormatUtils.truncate('abcdefghij', 6, '>>')).assertEqual('abcd>>');
      expect(FormatUtils.truncate('abcdefghij', 3)).assertEqual('...');
      expect(FormatUtils.truncate('abcdefghij', 6, '>>').length).assertEqual(6);
      expect(FormatUtils.truncate('ab', 1)).assertEqual('...');
      expect(FormatUtils.truncate('ab', 1).length).assertEqual(3);
      expect(FormatUtils.truncate('abc', 3)).assertEqual('abc');
    });

    // ==================== time length and device class (4 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_2000
     * @tc.name: testFormatUtils0020
     * @tc.desc: Render sub hour durations as minutes and seconds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0020', 0, () => {
      expect(FormatUtils.formatTimeMs(0)).assertEqual('00:00');
      expect(FormatUtils.formatTimeMs(65000)).assertEqual('01:05');
      expect(FormatUtils.formatTimeMs(59999)).assertEqual('00:59');
      expect(FormatUtils.formatTimeMs(600000)).assertEqual('10:00');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_2100
     * @tc.name: testFormatUtils0021
     * @tc.desc: Render hour spanning durations with the three field layout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0021', 0, () => {
      expect(FormatUtils.formatTimeMs(3600000)).assertEqual('01:00:00');
      expect(FormatUtils.formatTimeMs(3661500)).assertEqual('01:01:01');
      expect(FormatUtils.formatTimeMs(3661500).split(':').length).assertEqual(3);
      expect(FormatUtils.formatTimeMs(7322000)).assertEqual('02:02:02');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_2200
     * @tc.name: testFormatUtils0022
     * @tc.desc: Resolve the major device class bits of a class value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0022', 0, () => {
      expect(FormatUtils.formatDeviceClass(0x0100)).assertEqual('Computer');
      expect(FormatUtils.formatDeviceClass(0x0200)).assertEqual('Phone');
      expect(FormatUtils.formatDeviceClass(0x0400)).assertEqual('Audio/Video');
      expect(FormatUtils.formatDeviceClass(0x0404)).assertEqual('Audio/Video');
      expect(FormatUtils.formatDeviceClass(0x0500)).assertEqual('Peripheral');
    });

    /*
     * @tc.number: SUB_FORMAT_UTILS_2300
     * @tc.name: testFormatUtils0023
     * @tc.desc: Cover the remaining major classes and the unknown fallback.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormatUtils0023', 0, () => {
      expect(FormatUtils.formatDeviceClass(0x0600)).assertEqual('Imaging');
      expect(FormatUtils.formatDeviceClass(0x0700)).assertEqual('Wearable');
      expect(FormatUtils.formatDeviceClass(0x0800)).assertEqual('Toy');
      expect(FormatUtils.formatDeviceClass(0x0900)).assertEqual('Health');
      expect(FormatUtils.formatDeviceClass(0x0000)).assertEqual('Unknown');
      expect(FormatUtils.formatDeviceClass(0x0A00)).assertEqual('Unknown');
    });

    // ==================== JSON pretty ize (1 cases) ====================

    /*
     * @tc.number: SUB_FORMAT_UTILS_2400
     * @tc.name: testFormatUtils0024
     * @tc.desc: Pretty print an object with two space indentation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormatUtils0024', 0, () => {
      const device: Record<string, string | number> = { 'name': 'Watch', 'rssi': -55 };
      const text: string = FormatUtils.formatJson(device);
      expect(text.indexOf('\n  "name": "Watch"') >= 0).assertTrue();
      expect(text.indexOf('"rssi": -55') > 0).assertTrue();
      expect(text.startsWith('{')).assertTrue();
      expect(text.endsWith('}')).assertTrue();
      expect(text.split('\n').length).assertEqual(4);
    });
  });
}
