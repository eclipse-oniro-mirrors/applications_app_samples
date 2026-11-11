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
import { Constants, EncryptionUtils } from 'library';

/**
 * Test suite for the application level constants.
 * @since 26.0.0
 */
const MAJOR_VERSION: number = 1;
const MINOR_VERSION: number = 0;
const PATCH_VERSION: number = 0;
const VERSION_TEXT: string = '1.0.0';
const VERSION_CODE: number = 100;
const UNIT_FACTOR: number = 1024;
const SECONDS_IN_MINUTE: number = 60;
const UUID_DASH_COUNT: number = 4;

export default function constantsTest(): void {
  describe('ConstantsTest', () => {
    // ==================== 版本信息（3 条） ====================

    /*
     * @tc.number: SUB_CONSTANTS_0100
     * @tc.name: testConstants0001
     * @tc.desc: Read the published application version constants.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0001', 0, () => {
      expect(Constants.API_VERSION_MAJOR).assertEqual(MAJOR_VERSION);
      expect(Constants.API_VERSION_MINOR).assertEqual(MINOR_VERSION);
      expect(Constants.API_VERSION_PATCH).assertEqual(PATCH_VERSION);
      expect(Constants.API_VERSION_STRING).assertEqual(VERSION_TEXT);
      expect(Constants.API_VERSION_CODE).assertEqual(VERSION_CODE);
      expect(Constants.API_VERSION_STRING)
        .assertEqual(Constants.API_VERSION_MAJOR + '.' + Constants.API_VERSION_MINOR + '.' +
          Constants.API_VERSION_PATCH);
    });

    /*
     * @tc.number: SUB_CONSTANTS_0200
     * @tc.name: testConstants0002
     * @tc.desc: Build the aggregated version object and match every field with its constant.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0002', 0, () => {
      const version = Constants.getVersionInfo();

      expect(version.major).assertEqual(Constants.API_VERSION_MAJOR);
      expect(version.minor).assertEqual(Constants.API_VERSION_MINOR);
      expect(version.patch).assertEqual(Constants.API_VERSION_PATCH);
      expect(version.versionString).assertEqual(Constants.API_VERSION_STRING);
      expect(version.versionCode).assertEqual(Constants.API_VERSION_CODE);
      expect(version.versionString.split('.').length).assertEqual(3);
      expect(version.major > 0).assertTrue();
      expect(version.versionCode).assertEqual(VERSION_CODE);
    });

    /*
     * @tc.number: SUB_CONSTANTS_0300
     * @tc.name: testConstants0003
     * @tc.desc: Request the version object twice and keep the values stable across calls.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0003', 0, () => {
      const first = Constants.getVersionInfo();
      const second = Constants.getVersionInfo();
      first.major = 99;
      first.versionString = 'tampered';

      expect(second.major).assertEqual(MAJOR_VERSION);
      expect(second.versionString).assertEqual(VERSION_TEXT);
      expect(first.major).assertEqual(99);
      expect(second.minor).assertEqual(MINOR_VERSION);
      expect(second.patch).assertEqual(PATCH_VERSION);
      expect(second.versionCode).assertEqual(VERSION_CODE);
      expect(Constants.getVersionInfo().versionString).assertEqual(VERSION_TEXT);
    });

    // ==================== 默认业务参数（2 条） ====================

    /*
     * @tc.number: SUB_CONSTANTS_0400
     * @tc.name: testConstants0004
     * @tc.desc: Verify the default paging, timeout, retry and cache parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0004', 0, () => {
      expect(Constants.DEFAULT_PAGE_SIZE).assertEqual(20);
      expect(Constants.DEFAULT_TIMEOUT_MS).assertEqual(30000);
      expect(Constants.DEFAULT_RETRY_COUNT).assertEqual(3);
      expect(Constants.DEFAULT_MAX_CACHE_SIZE).assertEqual(100);
      expect(Constants.DEFAULT_LOG_LEVEL).assertEqual(2);
      expect(Constants.DEFAULT_PAGE_SIZE < Constants.DEFAULT_MAX_CACHE_SIZE).assertTrue();
      expect(Constants.DEFAULT_TIMEOUT_MS > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_CONSTANTS_0500
     * @tc.name: testConstants0005
     * @tc.desc: Verify the default layout constants used by the sample screens.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0005', 0, () => {
      expect(Constants.DEFAULT_ANIMATION_DURATION).assertEqual(300);
      expect(Constants.DEFAULT_FONT_SIZE).assertEqual(14);
      expect(Constants.DEFAULT_BORDER_RADIUS).assertEqual(8);
      expect(Constants.DEFAULT_SPACING).assertEqual(12);
      expect(Constants.DEFAULT_SPACING > Constants.DEFAULT_BORDER_RADIUS).assertTrue();
      expect(Constants.DEFAULT_FONT_SIZE > Constants.DEFAULT_BORDER_RADIUS).assertTrue();
      expect(Constants.DEFAULT_ANIMATION_DURATION < Constants.DEFAULT_TIMEOUT_MS).assertTrue();
    });

    // ==================== 单位换算常量（2 条） ====================

    /*
     * @tc.number: SUB_CONSTANTS_0600
     * @tc.name: testConstants0006
     * @tc.desc: Keep the millisecond constants consistent across the whole time scale.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0006', 0, () => {
      expect(Constants.MILLISECONDS_PER_SECOND).assertEqual(1000);
      expect(Constants.MILLISECONDS_PER_MINUTE).assertEqual(60000);
      expect(Constants.MILLISECONDS_PER_HOUR).assertEqual(3600000);
      expect(Constants.MILLISECONDS_PER_DAY).assertEqual(86400000);
      expect(Constants.MILLISECONDS_PER_WEEK).assertEqual(604800000);
      expect(Constants.MILLISECONDS_PER_MINUTE)
        .assertEqual(Constants.MILLISECONDS_PER_SECOND * SECONDS_IN_MINUTE);
      expect(Constants.MILLISECONDS_PER_HOUR).assertEqual(Constants.MILLISECONDS_PER_MINUTE * SECONDS_IN_MINUTE);
      expect(Constants.MILLISECONDS_PER_WEEK)
        .assertEqual(Constants.MILLISECONDS_PER_DAY * 7);
    });

    /*
     * @tc.number: SUB_CONSTANTS_0700
     * @tc.name: testConstants0007
     * @tc.desc: Keep the second based and byte based constants on the same scale.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0007', 0, () => {
      expect(Constants.SECONDS_PER_MINUTE).assertEqual(SECONDS_IN_MINUTE);
      expect(Constants.SECONDS_PER_HOUR).assertEqual(3600);
      expect(Constants.SECONDS_PER_DAY).assertEqual(86400);
      expect(Constants.KB).assertEqual(UNIT_FACTOR);
      expect(Constants.MB).assertEqual(UNIT_FACTOR * UNIT_FACTOR);
      expect(Constants.GB).assertEqual(UNIT_FACTOR * UNIT_FACTOR * UNIT_FACTOR);
      expect(Constants.TB).assertEqual(Constants.GB * UNIT_FACTOR);
      expect(Constants.MILLISECONDS_PER_DAY).assertEqual(Constants.SECONDS_PER_DAY * Constants.MILLISECONDS_PER_SECOND);
    });

    /*
     * @tc.number: SUB_CONSTANTS_0800
     * @tc.name: testConstants0008
     * @tc.desc: Expose the literal whitespace and empty text constants.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0008', 0, () => {
      expect(Constants.EMPTY_STRING).assertEqual('');
      expect(Constants.SPACE_STRING).assertEqual(' ');
      expect(Constants.NEWLINE).assertEqual('\n');
      expect(Constants.TAB).assertEqual('\t');
      expect(Constants.SPACE_STRING.length).assertEqual(1);
      expect(Constants.NEWLINE.length).assertEqual(1);
      expect(Constants.TAB.length).assertEqual(1);
      expect(Constants.EMPTY_STRING.length).assertEqual(0);
    });

    // ==================== 邮箱校验（2 条） ====================

    /*
     * @tc.number: SUB_CONSTANTS_0900
     * @tc.name: testConstants0009
     * @tc.desc: Accept the well formed electronic mail addresses.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0009', 0, () => {
      const validAddresses: string[] = ['user@example.com', 'a.b+c@sub.domain.org', 'USER-1@example.co.uk',
        'x_y%1@mail-server.io', 'name+tag@host.edu'];
      let accepted: number = 0;
      for (const address of validAddresses) {
        if (Constants.isValidEmail(address)) {
          accepted++;
        }
      }

      expect(accepted).assertEqual(validAddresses.length);
      expect(Constants.isValidEmail('user@example.com')).assertTrue();
      expect(Constants.isValidEmail('a.b+c@sub.domain.org')).assertTrue();
      expect(Constants.EMAIL_REGEX.startsWith('^')).assertTrue();
      expect(Constants.EMAIL_REGEX.endsWith('$')).assertTrue();
      expect(Constants.EMAIL_REGEX.indexOf('@')).assertLarger(0);
    });

    /*
     * @tc.number: SUB_CONSTANTS_1000
     * @tc.name: testConstants0010
     * @tc.desc: Reject malformed electronic mail addresses.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0010', 0, () => {
      const invalidAddresses: string[] = ['', 'user', 'user@', '@example.com', 'user @example.com',
        'user@domain', 'user@domain.c', 'user@@domain.com', 'user@.com', 'user@example.com '];
      let rejected: number = 0;
      for (const address of invalidAddresses) {
        if (!Constants.isValidEmail(address)) {
          rejected++;
        }
      }

      expect(rejected).assertEqual(invalidAddresses.length);
      expect(Constants.isValidEmail('user@example.com')).assertTrue();
      expect(Constants.isValidEmail('user@domain')).assertFalse();
      expect(Constants.isValidEmail('user@.com')).assertFalse();
      expect(Constants.isValidEmail('  user@example.com')).assertFalse();
      expect(new RegExp(Constants.EMAIL_REGEX).test('a@b.co')).assertTrue();
    });

    // ==================== 蓝牙地址校验（3 条） ====================

    /*
     * @tc.number: SUB_CONSTANTS_1100
     * @tc.name: testConstants0011
     * @tc.desc: Accept six colon separated hexadecimal byte pairs in any letter case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0011', 0, () => {
      const validAddresses: string[] = ['00:1A:2B:3C:4D:5E', '00:1a:2b:3c:4d:5e', 'FF:FF:FF:FF:FF:FF',
        '0A:0B:0C:0D:0E:0F', 'a1:b2:c3:d4:e5:f6'];
      let accepted: number = 0;
      for (const address of validAddresses) {
        if (Constants.isValidMacAddress(address)) {
          accepted++;
        }
      }

      expect(accepted).assertEqual(validAddresses.length);
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue();
      expect(Constants.isValidMacAddress('FF:FF:FF:FF:FF:FF')).assertTrue();
      expect(Constants.BLUETOOTH_ADDRESS_REGEX.startsWith('^')).assertTrue();
      expect(Constants.BLUETOOTH_ADDRESS_REGEX.endsWith('$')).assertTrue();
      expect(Constants.BLUETOOTH_ADDRESS_REGEX.split(':').length).assertLarger(1);
    });

    /*
     * @tc.number: SUB_CONSTANTS_1200
     * @tc.name: testConstants0012
     * @tc.desc: Reject truncated, extended, dash separated and non hexadecimal device addresses.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0012', 0, () => {
      const invalidAddresses: string[] = ['', '00:1A:2B:3C:4D', '00:1A:2B:3C:4D:5E:5F', '00-1A-2B-3C-4D-5E',
        '00:1A-2B:3C:4D:5E', '0G:1A:2B:3C:4D:5E', '0:1A:2B:3C:4D:5E', '00:1A:2B:3C:4D:5E ', 'gg:hh:ii:jj:kk:ll'];
      let rejected: number = 0;
      for (const address of invalidAddresses) {
        if (!Constants.isValidMacAddress(address)) {
          rejected++;
        }
      }

      expect(rejected).assertEqual(invalidAddresses.length);
      expect(Constants.isValidMacAddress('00-1A-2B-3C-4D-5E')).assertFalse();
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D')).assertFalse();
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E:5F')).assertFalse();
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue();
    });

    /*
     * @tc.number: SUB_CONSTANTS_1300
     * @tc.name: testConstants0013
     * @tc.desc: Compare the two address patterns exposed for the Bluetooth and generic formats.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0013', 0, () => {
      const bluetoothPattern: RegExp = new RegExp(Constants.BLUETOOTH_ADDRESS_REGEX);
      const genericPattern: RegExp = new RegExp(Constants.MAC_ADDRESS_REGEX);
      const colonAddress: string = '00:1A:2B:3C:4D:5E';
      const dashAddress: string = '00-1A-2B-3C-4D-5E';

      expect(bluetoothPattern.test(colonAddress)).assertTrue();
      expect(genericPattern.test(colonAddress)).assertTrue();
      expect(bluetoothPattern.test(dashAddress)).assertFalse();
      expect(genericPattern.test(dashAddress)).assertTrue();
      expect(genericPattern.test('00:1A-2B:3C:4D:5E')).assertTrue();
      expect(bluetoothPattern.test('')).assertFalse();
      expect(genericPattern.test('00:1A:2B:3C:4D')).assertFalse();
      expect(Constants.isValidMacAddress(dashAddress)).assertFalse();
    });

    /*
     * @tc.number: SUB_CONSTANTS_1400
     * @tc.name: testConstants0014
     * @tc.desc: Validate the phone and URL patterns shipped with the constant table.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0014', 0, () => {
      const phonePattern: RegExp = new RegExp(Constants.PHONE_REGEX);
      const urlPattern: RegExp = new RegExp(Constants.URL_REGEX);

      expect(phonePattern.test('13800138000')).assertTrue();
      expect(phonePattern.test('12345678901')).assertFalse();
      expect(phonePattern.test('1380013800')).assertFalse();
      expect(Constants.PHONE_REGEX.startsWith('^1')).assertTrue();
      expect(urlPattern.test('https://example.com')).assertTrue();
      expect(urlPattern.test('http://a.b.c/path')).assertTrue();
      expect(urlPattern.test('ftp://example.com')).assertFalse();
      expect(urlPattern.test('https://nodot')).assertFalse();
      expect(Constants.URL_REGEX.endsWith('$')).assertFalse();
    });

    // ==================== UUID 校验（2 条） ====================

    /*
     * @tc.number: SUB_CONSTANTS_1500
     * @tc.name: testConstants0015
     * @tc.desc: Accept canonical lower case universally unique identifiers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0015', 0, () => {
      const canonical: string = '123e4567-e89b-12d3-a456-426614174000';

      expect(Constants.isValidUuid(canonical)).assertTrue();
      expect(Constants.isValidUuid('00000000-0000-0000-0000-000000000000')).assertTrue();
      expect(Constants.isValidUuid('ffffffff-ffff-ffff-ffff-ffffffffffff')).assertTrue();
      expect(canonical.split('-').length).assertEqual(UUID_DASH_COUNT + 1);
      expect(Constants.UUID_REGEX.startsWith('^')).assertTrue();
      expect(Constants.UUID_REGEX.endsWith('$')).assertTrue();
      expect(Constants.isValidUuid(EncryptionUtils.generateUuid())).assertTrue();
    });

    /*
     * @tc.number: SUB_CONSTANTS_1600
     * @tc.name: testConstants0016
     * @tc.desc: Reject upper case, unseparated and wrongly sized identifier strings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0016', 0, () => {
      const invalidUuids: string[] = ['', '123E4567-E89B-12D3-A456-426614174000',
        '123e4567e89b12d3a456426614174000', '123e4567-e89b-12d3-a456-42661417400',
        '123e4567-e89b-12d3-a456-4266141740000', 'zzzzzzzz-e89b-12d3-a456-426614174000'];
      let rejected: number = 0;
      for (const candidate of invalidUuids) {
        if (!Constants.isValidUuid(candidate)) {
          rejected++;
        }
      }

      expect(rejected).assertEqual(invalidUuids.length);
      expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-426614174000')).assertTrue();
      expect(Constants.isValidUuid('123E4567-e89b-12d3-a456-426614174000')).assertFalse();
      expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-42661417400 ')).assertFalse();
      expect(EncryptionUtils.generateUuid().length).assertEqual(36);
    });

    /*
     * @tc.number: SUB_CONSTANTS_1700
     * @tc.name: testConstants0017
     * @tc.desc: Validate a batch of generated identifiers against the published pattern.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0017', 0, () => {
      const generated: string[] = [];
      let accepted: number = 0;
      for (let i: number = 0; i < 20; i++) {
        const candidate: string = EncryptionUtils.generateUuid();
        generated.push(candidate);
        if (Constants.isValidUuid(candidate)) {
          accepted++;
        }
      }

      expect(accepted).assertEqual(generated.length);
      expect(generated.length).assertEqual(20);
      expect(generated[0].split('-').length).assertEqual(UUID_DASH_COUNT + 1);
      expect(generated[0] === generated[1]).assertFalse();
      expect(Constants.isValidUuid(generated[19])).assertTrue();
      expect(new RegExp(Constants.UUID_REGEX).test(generated[5])).assertTrue();
    });

    // ==================== 初始化（1 条） ====================

    /*
     * @tc.number: SUB_CONSTANTS_1800
     * @tc.name: testConstants0018
     * @tc.desc: Initialize the constant holder repeatedly without changing any published value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0018', 0, () => {
      const versionBefore: string = Constants.API_VERSION_STRING;
      const pageSizeBefore: number = Constants.DEFAULT_PAGE_SIZE;
      const emailBefore: boolean = Constants.isValidEmail('user@example.com');
      Constants.initialize();
      Constants.initialize();

      expect(Constants.API_VERSION_STRING).assertEqual(versionBefore);
      expect(Constants.DEFAULT_PAGE_SIZE).assertEqual(pageSizeBefore);
      expect(Constants.isValidEmail('user@example.com')).assertEqual(emailBefore);
      expect(Constants.getVersionInfo().versionCode).assertEqual(VERSION_CODE);
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue();
      expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-426614174000')).assertTrue();
      expect(Constants.MILLISECONDS_PER_WEEK).assertEqual(604800000);
    });
  });
}
