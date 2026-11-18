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
    // ==================== version this info info (3 cases) ====================

    /*
     * @tc.number: SUB_CONSTANTS_0100
     * @tc.name: testConstants0001
     * @tc.desc: Read the published application version constants.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0001', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0001',
        '#1 ' + "Constants.API_VERSION_MAJOR" + ' = ' + JSON.stringify(Constants.API_VERSION_MAJOR));
      expect(Constants.API_VERSION_MAJOR).assertEqual(MAJOR_VERSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0001',
        '#2 ' + "Constants.API_VERSION_MINOR" + ' = ' + JSON.stringify(Constants.API_VERSION_MINOR));
      expect(Constants.API_VERSION_MINOR).assertEqual(MINOR_VERSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0001',
        '#3 ' + "Constants.API_VERSION_PATCH" + ' = ' + JSON.stringify(Constants.API_VERSION_PATCH));
      expect(Constants.API_VERSION_PATCH).assertEqual(PATCH_VERSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0001',
        '#4 ' + "Constants.API_VERSION_STRING" + ' = ' + JSON.stringify(Constants.API_VERSION_STRING));
      expect(Constants.API_VERSION_STRING).assertEqual(VERSION_TEXT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0001',
        '#5 ' + "Constants.API_VERSION_CODE" + ' = ' + JSON.stringify(Constants.API_VERSION_CODE));
      expect(Constants.API_VERSION_CODE).assertEqual(VERSION_CODE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0001',
        '#6 ' + "Constants.API_VERSION_STRING" + ' = ' + JSON.stringify(Constants.API_VERSION_STRING));
      expect(Constants.API_VERSION_STRING)
        .assertEqual(Constants.API_VERSION_MAJOR + '.' + Constants.API_VERSION_MINOR + '.' +
          Constants.API_VERSION_PATCH);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0002', 'begin');
      const version = Constants.getVersionInfo();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#1 ' + "version.major" + ' = ' + JSON.stringify(version.major));
      expect(version.major).assertEqual(Constants.API_VERSION_MAJOR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#2 ' + "version.minor" + ' = ' + JSON.stringify(version.minor));
      expect(version.minor).assertEqual(Constants.API_VERSION_MINOR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#3 ' + "version.patch" + ' = ' + JSON.stringify(version.patch));
      expect(version.patch).assertEqual(Constants.API_VERSION_PATCH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#4 ' + "version.versionString" + ' = ' + JSON.stringify(version.versionString));
      expect(version.versionString).assertEqual(Constants.API_VERSION_STRING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#5 ' + "version.versionCode" + ' = ' + JSON.stringify(version.versionCode));
      expect(version.versionCode).assertEqual(Constants.API_VERSION_CODE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#6 assert ' + "expect(version.versionString.split('.').length).assertEqual(3)");
      expect(version.versionString.split('.').length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#7 ' + "version.major > 0" + ' = ' + JSON.stringify(version.major > 0));
      expect(version.major > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0002',
        '#8 ' + "version.versionCode" + ' = ' + JSON.stringify(version.versionCode));
      expect(version.versionCode).assertEqual(VERSION_CODE);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0003', 'begin');
      const first = Constants.getVersionInfo();
      const second = Constants.getVersionInfo();
      first.major = 99;
      first.versionString = 'tampered';

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0003',
        '#1 ' + "second.major" + ' = ' + JSON.stringify(second.major));
      expect(second.major).assertEqual(MAJOR_VERSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0003',
        '#2 ' + "second.versionString" + ' = ' + JSON.stringify(second.versionString));
      expect(second.versionString).assertEqual(VERSION_TEXT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0003',
        '#3 ' + "first.major" + ' = ' + JSON.stringify(first.major));
      expect(first.major).assertEqual(99);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0003',
        '#4 ' + "second.minor" + ' = ' + JSON.stringify(second.minor));
      expect(second.minor).assertEqual(MINOR_VERSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0003',
        '#5 ' + "second.patch" + ' = ' + JSON.stringify(second.patch));
      expect(second.patch).assertEqual(PATCH_VERSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0003',
        '#6 ' + "second.versionCode" + ' = ' + JSON.stringify(second.versionCode));
      expect(second.versionCode).assertEqual(VERSION_CODE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0003',
        '#7 assert ' + "expect(Constants.getVersionInfo().versionString).assertEqual(VERSION_TEXT)");
      expect(Constants.getVersionInfo().versionString).assertEqual(VERSION_TEXT);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0003', 'end');
    });

    // ==================== default business params (2 cases) ====================

    /*
     * @tc.number: SUB_CONSTANTS_0400
     * @tc.name: testConstants0004
     * @tc.desc: Verify the default paging, timeout, retry and cache parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0004', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0004',
        '#1 ' + "Constants.DEFAULT_PAGE_SIZE" + ' = ' + JSON.stringify(Constants.DEFAULT_PAGE_SIZE));
      expect(Constants.DEFAULT_PAGE_SIZE).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0004',
        '#2 ' + "Constants.DEFAULT_TIMEOUT_MS" + ' = ' + JSON.stringify(Constants.DEFAULT_TIMEOUT_MS));
      expect(Constants.DEFAULT_TIMEOUT_MS).assertEqual(30000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0004',
        '#3 ' + "Constants.DEFAULT_RETRY_COUNT" + ' = ' + JSON.stringify(Constants.DEFAULT_RETRY_COUNT));
      expect(Constants.DEFAULT_RETRY_COUNT).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0004',
        '#4 ' + "Constants.DEFAULT_MAX_CACHE_SIZE" + ' = ' + JSON.stringify(Constants.DEFAULT_MAX_CACHE_SIZE));
      expect(Constants.DEFAULT_MAX_CACHE_SIZE).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0004',
        '#5 ' + "Constants.DEFAULT_LOG_LEVEL" + ' = ' + JSON.stringify(Constants.DEFAULT_LOG_LEVEL));
      expect(Constants.DEFAULT_LOG_LEVEL).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0004',
        '#6 ' + "Constants.DEFAULT_PAGE_SIZE < Constants.DEFAULT_MAX_CACHE_SIZE" + ' = ' +
        JSON.stringify(Constants.DEFAULT_PAGE_SIZE < Constants.DEFAULT_MAX_CACHE_SIZE));
      expect(Constants.DEFAULT_PAGE_SIZE < Constants.DEFAULT_MAX_CACHE_SIZE).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0004',
        '#7 ' + "Constants.DEFAULT_TIMEOUT_MS > 0" + ' = ' + JSON.stringify(Constants.DEFAULT_TIMEOUT_MS > 0));
      expect(Constants.DEFAULT_TIMEOUT_MS > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0005', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0005',
        '#1 ' + "Constants.DEFAULT_ANIMATION_DURATION" + ' = ' + JSON.stringify(Constants.DEFAULT_ANIMATION_DURATION));
      expect(Constants.DEFAULT_ANIMATION_DURATION).assertEqual(300);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0005',
        '#2 ' + "Constants.DEFAULT_FONT_SIZE" + ' = ' + JSON.stringify(Constants.DEFAULT_FONT_SIZE));
      expect(Constants.DEFAULT_FONT_SIZE).assertEqual(14);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0005',
        '#3 ' + "Constants.DEFAULT_BORDER_RADIUS" + ' = ' + JSON.stringify(Constants.DEFAULT_BORDER_RADIUS));
      expect(Constants.DEFAULT_BORDER_RADIUS).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0005',
        '#4 ' + "Constants.DEFAULT_SPACING" + ' = ' + JSON.stringify(Constants.DEFAULT_SPACING));
      expect(Constants.DEFAULT_SPACING).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0005',
        '#5 ' + "Constants.DEFAULT_SPACING > Constants.DEFAULT_BORDER_RADIUS" + ' = ' +
        JSON.stringify(Constants.DEFAULT_SPACING > Constants.DEFAULT_BORDER_RADIUS));
      expect(Constants.DEFAULT_SPACING > Constants.DEFAULT_BORDER_RADIUS).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0005',
        '#6 ' + "Constants.DEFAULT_FONT_SIZE > Constants.DEFAULT_BORDER_RADIUS" + ' = ' +
        JSON.stringify(Constants.DEFAULT_FONT_SIZE > Constants.DEFAULT_BORDER_RADIUS));
      expect(Constants.DEFAULT_FONT_SIZE > Constants.DEFAULT_BORDER_RADIUS).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0005',
        '#7 ' + "Constants.DEFAULT_ANIMATION_DURATION < Constants.DEFAULT_TIMEOUT_MS" + ' = ' +
        JSON.stringify(Constants.DEFAULT_ANIMATION_DURATION < Constants.DEFAULT_TIMEOUT_MS));
      expect(Constants.DEFAULT_ANIMATION_DURATION < Constants.DEFAULT_TIMEOUT_MS).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0005', 'end');
    });

    // ==================== unit conversion constant amount (2 cases) ====================

    /*
     * @tc.number: SUB_CONSTANTS_0600
     * @tc.name: testConstants0006
     * @tc.desc: Keep the millisecond constants consistent across the whole time scale.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0006', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#1 ' + "Constants.MILLISECONDS_PER_SECOND" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_SECOND));
      expect(Constants.MILLISECONDS_PER_SECOND).assertEqual(1000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#2 ' + "Constants.MILLISECONDS_PER_MINUTE" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_MINUTE));
      expect(Constants.MILLISECONDS_PER_MINUTE).assertEqual(60000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#3 ' + "Constants.MILLISECONDS_PER_HOUR" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_HOUR));
      expect(Constants.MILLISECONDS_PER_HOUR).assertEqual(3600000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#4 ' + "Constants.MILLISECONDS_PER_DAY" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_DAY));
      expect(Constants.MILLISECONDS_PER_DAY).assertEqual(86400000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#5 ' + "Constants.MILLISECONDS_PER_WEEK" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_WEEK));
      expect(Constants.MILLISECONDS_PER_WEEK).assertEqual(604800000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#6 ' + "Constants.MILLISECONDS_PER_MINUTE" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_MINUTE));
      expect(Constants.MILLISECONDS_PER_MINUTE)
        .assertEqual(Constants.MILLISECONDS_PER_SECOND * SECONDS_IN_MINUTE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#7 ' + "Constants.MILLISECONDS_PER_HOUR" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_HOUR));
      expect(Constants.MILLISECONDS_PER_HOUR).assertEqual(Constants.MILLISECONDS_PER_MINUTE * SECONDS_IN_MINUTE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0006',
        '#8 ' + "Constants.MILLISECONDS_PER_WEEK" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_WEEK));
      expect(Constants.MILLISECONDS_PER_WEEK)
        .assertEqual(Constants.MILLISECONDS_PER_DAY * 7);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0007', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#1 ' + "Constants.SECONDS_PER_MINUTE" + ' = ' + JSON.stringify(Constants.SECONDS_PER_MINUTE));
      expect(Constants.SECONDS_PER_MINUTE).assertEqual(SECONDS_IN_MINUTE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#2 ' + "Constants.SECONDS_PER_HOUR" + ' = ' + JSON.stringify(Constants.SECONDS_PER_HOUR));
      expect(Constants.SECONDS_PER_HOUR).assertEqual(3600);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#3 ' + "Constants.SECONDS_PER_DAY" + ' = ' + JSON.stringify(Constants.SECONDS_PER_DAY));
      expect(Constants.SECONDS_PER_DAY).assertEqual(86400);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#4 ' + "Constants.KB" + ' = ' + JSON.stringify(Constants.KB));
      expect(Constants.KB).assertEqual(UNIT_FACTOR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#5 ' + "Constants.MB" + ' = ' + JSON.stringify(Constants.MB));
      expect(Constants.MB).assertEqual(UNIT_FACTOR * UNIT_FACTOR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#6 ' + "Constants.GB" + ' = ' + JSON.stringify(Constants.GB));
      expect(Constants.GB).assertEqual(UNIT_FACTOR * UNIT_FACTOR * UNIT_FACTOR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#7 ' + "Constants.TB" + ' = ' + JSON.stringify(Constants.TB));
      expect(Constants.TB).assertEqual(Constants.GB * UNIT_FACTOR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0007',
        '#8 ' + "Constants.MILLISECONDS_PER_DAY" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_DAY));
      expect(Constants.MILLISECONDS_PER_DAY).assertEqual(Constants.SECONDS_PER_DAY * Constants.MILLISECONDS_PER_SECOND);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0008', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#1 ' + "Constants.EMPTY_STRING" + ' = ' + JSON.stringify(Constants.EMPTY_STRING));
      expect(Constants.EMPTY_STRING).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#2 ' + "Constants.SPACE_STRING" + ' = ' + JSON.stringify(Constants.SPACE_STRING));
      expect(Constants.SPACE_STRING).assertEqual(' ');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#3 ' + "Constants.NEWLINE" + ' = ' + JSON.stringify(Constants.NEWLINE));
      expect(Constants.NEWLINE).assertEqual('\n');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#4 ' + "Constants.TAB" + ' = ' + JSON.stringify(Constants.TAB));
      expect(Constants.TAB).assertEqual('\t');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#5 ' + "Constants.SPACE_STRING.length" + ' = ' + JSON.stringify(Constants.SPACE_STRING.length));
      expect(Constants.SPACE_STRING.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#6 ' + "Constants.NEWLINE.length" + ' = ' + JSON.stringify(Constants.NEWLINE.length));
      expect(Constants.NEWLINE.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#7 ' + "Constants.TAB.length" + ' = ' + JSON.stringify(Constants.TAB.length));
      expect(Constants.TAB.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0008',
        '#8 ' + "Constants.EMPTY_STRING.length" + ' = ' + JSON.stringify(Constants.EMPTY_STRING.length));
      expect(Constants.EMPTY_STRING.length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0008', 'end');
    });

    // ==================== email validation (2 cases) ====================

    /*
     * @tc.number: SUB_CONSTANTS_0900
     * @tc.name: testConstants0009
     * @tc.desc: Accept the well formed electronic mail addresses.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0009', 'begin');
      const validAddresses: string[] = ['user@example.com', 'a.b+c@sub.domain.org', 'USER-1@example.co.uk',
        'x_y%1@mail-server.io', 'name+tag@host.edu'];
      let accepted: number = 0;
      for (const address of validAddresses) {
        if (Constants.isValidEmail(address)) {
          accepted++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0009',
        '#1 ' + "accepted" + ' = ' + JSON.stringify(accepted));
      expect(accepted).assertEqual(validAddresses.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0009',
        '#2 assert ' + "expect(Constants.isValidEmail('user@example.com')).assertTrue()");
      expect(Constants.isValidEmail('user@example.com')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0009',
        '#3 assert ' + "expect(Constants.isValidEmail('a.b+c@sub.domain.org')).assertTrue()");
      expect(Constants.isValidEmail('a.b+c@sub.domain.org')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0009',
        '#4 assert ' + "expect(Constants.EMAIL_REGEX.startsWith('^')).assertTrue()");
      expect(Constants.EMAIL_REGEX.startsWith('^')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0009',
        '#5 assert ' + "expect(Constants.EMAIL_REGEX.endsWith('$')).assertTrue()");
      expect(Constants.EMAIL_REGEX.endsWith('$')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0009',
        '#6 assert ' + "expect(Constants.EMAIL_REGEX.indexOf('@')).assertLarger(0)");
      expect(Constants.EMAIL_REGEX.indexOf('@')).assertLarger(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0010', 'begin');
      const invalidAddresses: string[] = ['', 'user', 'user@', '@example.com', 'user @example.com',
        'user@domain', 'user@domain.c', 'user@@domain.com', 'user@.com', 'user@example.com '];
      let rejected: number = 0;
      for (const address of invalidAddresses) {
        if (!Constants.isValidEmail(address)) {
          rejected++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0010',
        '#1 ' + "rejected" + ' = ' + JSON.stringify(rejected));
      expect(rejected).assertEqual(invalidAddresses.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0010',
        '#2 assert ' + "expect(Constants.isValidEmail('user@example.com')).assertTrue()");
      expect(Constants.isValidEmail('user@example.com')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0010',
        '#3 assert ' + "expect(Constants.isValidEmail('user@domain')).assertFalse()");
      expect(Constants.isValidEmail('user@domain')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0010',
        '#4 assert ' + "expect(Constants.isValidEmail('user@.com')).assertFalse()");
      expect(Constants.isValidEmail('user@.com')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0010',
        '#5 assert ' + "expect(Constants.isValidEmail(' user@example.com')).assertFalse()");
      expect(Constants.isValidEmail('  user@example.com')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0010',
        '#6 assert ' + "expect(new RegExp(Constants.EMAIL_REGEX).test('a@b.co')).assertTrue()");
      expect(new RegExp(Constants.EMAIL_REGEX).test('a@b.co')).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0010', 'end');
    });

    // ==================== Bluetooth address validation (3 cases) ====================

    /*
     * @tc.number: SUB_CONSTANTS_1100
     * @tc.name: testConstants0011
     * @tc.desc: Accept six colon separated hexadecimal byte pairs in any letter case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0011', 'begin');
      const validAddresses: string[] = ['00:1A:2B:3C:4D:5E', '00:1a:2b:3c:4d:5e', 'FF:FF:FF:FF:FF:FF',
        '0A:0B:0C:0D:0E:0F', 'a1:b2:c3:d4:e5:f6'];
      let accepted: number = 0;
      for (const address of validAddresses) {
        if (Constants.isValidMacAddress(address)) {
          accepted++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0011',
        '#1 ' + "accepted" + ' = ' + JSON.stringify(accepted));
      expect(accepted).assertEqual(validAddresses.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0011',
        '#2 assert ' + "expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue()");
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0011',
        '#3 assert ' + "expect(Constants.isValidMacAddress('FF:FF:FF:FF:FF:FF')).assertTrue()");
      expect(Constants.isValidMacAddress('FF:FF:FF:FF:FF:FF')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0011',
        '#4 assert ' + "expect(Constants.BLUETOOTH_ADDRESS_REGEX.startsWith('^')).assertTrue()");
      expect(Constants.BLUETOOTH_ADDRESS_REGEX.startsWith('^')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0011',
        '#5 assert ' + "expect(Constants.BLUETOOTH_ADDRESS_REGEX.endsWith('$')).assertTrue()");
      expect(Constants.BLUETOOTH_ADDRESS_REGEX.endsWith('$')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0011',
        '#6 assert ' + "expect(Constants.BLUETOOTH_ADDRESS_REGEX.split(':').length).assertLarger(1)");
      expect(Constants.BLUETOOTH_ADDRESS_REGEX.split(':').length).assertLarger(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0012', 'begin');
      const invalidAddresses: string[] = ['', '00:1A:2B:3C:4D', '00:1A:2B:3C:4D:5E:5F', '00-1A-2B-3C-4D-5E',
        '00:1A-2B:3C:4D:5E', '0G:1A:2B:3C:4D:5E', '0:1A:2B:3C:4D:5E', '00:1A:2B:3C:4D:5E ', 'gg:hh:ii:jj:kk:ll'];
      let rejected: number = 0;
      for (const address of invalidAddresses) {
        if (!Constants.isValidMacAddress(address)) {
          rejected++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0012',
        '#1 ' + "rejected" + ' = ' + JSON.stringify(rejected));
      expect(rejected).assertEqual(invalidAddresses.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0012',
        '#2 assert ' + "expect(Constants.isValidMacAddress('00-1A-2B-3C-4D-5E')).assertFalse()");
      expect(Constants.isValidMacAddress('00-1A-2B-3C-4D-5E')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0012',
        '#3 assert ' + "expect(Constants.isValidMacAddress('00:1A:2B:3C:4D')).assertFalse()");
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0012',
        '#4 assert ' + "expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E:5F')).assertFalse()");
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E:5F')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0012',
        '#5 assert ' + "expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue()");
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0013', 'begin');
      const bluetoothPattern: RegExp = new RegExp(Constants.BLUETOOTH_ADDRESS_REGEX);
      const genericPattern: RegExp = new RegExp(Constants.MAC_ADDRESS_REGEX);
      const colonAddress: string = '00:1A:2B:3C:4D:5E';
      const dashAddress: string = '00-1A-2B-3C-4D-5E';

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#1 assert ' + "expect(bluetoothPattern.test(colonAddress)).assertTrue()");
      expect(bluetoothPattern.test(colonAddress)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#2 assert ' + "expect(genericPattern.test(colonAddress)).assertTrue()");
      expect(genericPattern.test(colonAddress)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#3 assert ' + "expect(bluetoothPattern.test(dashAddress)).assertFalse()");
      expect(bluetoothPattern.test(dashAddress)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#4 assert ' + "expect(genericPattern.test(dashAddress)).assertTrue()");
      expect(genericPattern.test(dashAddress)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#5 assert ' + "expect(genericPattern.test('00:1A-2B:3C:4D:5E')).assertTrue()");
      expect(genericPattern.test('00:1A-2B:3C:4D:5E')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#6 assert ' + "expect(bluetoothPattern.test('')).assertFalse()");
      expect(bluetoothPattern.test('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#7 assert ' + "expect(genericPattern.test('00:1A:2B:3C:4D')).assertFalse()");
      expect(genericPattern.test('00:1A:2B:3C:4D')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0013',
        '#8 assert ' + "expect(Constants.isValidMacAddress(dashAddress)).assertFalse()");
      expect(Constants.isValidMacAddress(dashAddress)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0014', 'begin');
      const phonePattern: RegExp = new RegExp(Constants.PHONE_REGEX);
      const urlPattern: RegExp = new RegExp(Constants.URL_REGEX);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#1 assert ' + "expect(phonePattern.test('13800138000')).assertTrue()");
      expect(phonePattern.test('13800138000')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#2 assert ' + "expect(phonePattern.test('12345678901')).assertFalse()");
      expect(phonePattern.test('12345678901')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#3 assert ' + "expect(phonePattern.test('1380013800')).assertFalse()");
      expect(phonePattern.test('1380013800')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#4 assert ' + "expect(Constants.PHONE_REGEX.startsWith('^1')).assertTrue()");
      expect(Constants.PHONE_REGEX.startsWith('^1')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#5 assert ' + "expect(urlPattern.test('https://example.com')).assertTrue()");
      expect(urlPattern.test('https://example.com')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#6 assert ' + "expect(urlPattern.test('http://a.b.c/path')).assertTrue()");
      expect(urlPattern.test('http://a.b.c/path')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#7 assert ' + "expect(urlPattern.test('ftp://example.com')).assertFalse()");
      expect(urlPattern.test('ftp://example.com')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#8 assert ' + "expect(urlPattern.test('https://nodot')).assertFalse()");
      expect(urlPattern.test('https://nodot')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0014',
        '#9 assert ' + "expect(Constants.URL_REGEX.endsWith('$')).assertFalse()");
      expect(Constants.URL_REGEX.endsWith('$')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0014', 'end');
    });

    // ==================== UUID validation (2 cases) ====================

    /*
     * @tc.number: SUB_CONSTANTS_1500
     * @tc.name: testConstants0015
     * @tc.desc: Accept canonical lower case universally unique identifiers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConstants0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0015', 'begin');
      const canonical: string = '123e4567-e89b-12d3-a456-426614174000';

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0015',
        '#1 assert ' + "expect(Constants.isValidUuid(canonical)).assertTrue()");
      expect(Constants.isValidUuid(canonical)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0015',
        '#2 assert ' + "expect(Constants.isValidUuid('00000000-0000-0000-0000-000000000000')).assertTrue()");
      expect(Constants.isValidUuid('00000000-0000-0000-0000-000000000000')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0015',
        '#3 assert ' + "expect(Constants.isValidUuid('ffffffff-ffff-ffff-ffff-ffffffffffff')).assertTrue()");
      expect(Constants.isValidUuid('ffffffff-ffff-ffff-ffff-ffffffffffff')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0015',
        '#4 assert ' + "expect(canonical.split('-').length).assertEqual(UUID_DASH_COUNT + 1)");
      expect(canonical.split('-').length).assertEqual(UUID_DASH_COUNT + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0015',
        '#5 assert ' + "expect(Constants.UUID_REGEX.startsWith('^')).assertTrue()");
      expect(Constants.UUID_REGEX.startsWith('^')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0015',
        '#6 assert ' + "expect(Constants.UUID_REGEX.endsWith('$')).assertTrue()");
      expect(Constants.UUID_REGEX.endsWith('$')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0015',
        '#7 assert ' + "expect(Constants.isValidUuid(EncryptionUtils.generateUuid())).assertTrue()");
      expect(Constants.isValidUuid(EncryptionUtils.generateUuid())).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0015', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0016', 'begin');
      const invalidUuids: string[] = ['', '123E4567-E89B-12D3-A456-426614174000',
        '123e4567e89b12d3a456426614174000', '123e4567-e89b-12d3-a456-42661417400',
        '123e4567-e89b-12d3-a456-4266141740000', 'zzzzzzzz-e89b-12d3-a456-426614174000'];
      let rejected: number = 0;
      for (const candidate of invalidUuids) {
        if (!Constants.isValidUuid(candidate)) {
          rejected++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0016',
        '#1 ' + "rejected" + ' = ' + JSON.stringify(rejected));
      expect(rejected).assertEqual(invalidUuids.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0016',
        '#2 assert ' + "expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-426614174000')).assertTrue()");
      expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-426614174000')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0016',
        '#3 assert ' + "expect(Constants.isValidUuid('123E4567-e89b-12d3-a456-426614174000')).assertFalse()");
      expect(Constants.isValidUuid('123E4567-e89b-12d3-a456-426614174000')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0016',
        '#4 assert ' + "expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-42661417400 ')).assertFalse()");
      expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-42661417400 ')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0016',
        '#5 assert ' + "expect(EncryptionUtils.generateUuid().length).assertEqual(36)");
      expect(EncryptionUtils.generateUuid().length).assertEqual(36);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0017', 'begin');
      const generated: string[] = [];
      let accepted: number = 0;
      for (let i: number = 0; i < 20; i++) {
        const candidate: string = EncryptionUtils.generateUuid();
        generated.push(candidate);
        if (Constants.isValidUuid(candidate)) {
          accepted++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0017',
        '#1 ' + "accepted" + ' = ' + JSON.stringify(accepted));
      expect(accepted).assertEqual(generated.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0017',
        '#2 ' + "generated.length" + ' = ' + JSON.stringify(generated.length));
      expect(generated.length).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0017',
        '#3 assert ' + "expect(generated[0].split('-').length).assertEqual(UUID_DASH_COUNT + 1)");
      expect(generated[0].split('-').length).assertEqual(UUID_DASH_COUNT + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0017',
        '#4 ' + "generated[0] === generated[1]" + ' = ' + JSON.stringify(generated[0] === generated[1]));
      expect(generated[0] === generated[1]).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0017',
        '#5 assert ' + "expect(Constants.isValidUuid(generated[19])).assertTrue()");
      expect(Constants.isValidUuid(generated[19])).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0017',
        '#6 assert ' + "expect(new RegExp(Constants.UUID_REGEX).test(generated[5])).assertTrue()");
      expect(new RegExp(Constants.UUID_REGEX).test(generated[5])).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0017', 'end');
    });

    // ==================== initialize (1 cases) ====================

    /*
     * @tc.number: SUB_CONSTANTS_1800
     * @tc.name: testConstants0018
     * @tc.desc: Initialize the constant holder repeatedly without changing any published value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConstants0018', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0018', 'begin');
      const versionBefore: string = Constants.API_VERSION_STRING;
      const pageSizeBefore: number = Constants.DEFAULT_PAGE_SIZE;
      const emailBefore: boolean = Constants.isValidEmail('user@example.com');
      Constants.initialize();
      Constants.initialize();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0018',
        '#1 ' + "Constants.API_VERSION_STRING" + ' = ' + JSON.stringify(Constants.API_VERSION_STRING));
      expect(Constants.API_VERSION_STRING).assertEqual(versionBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0018',
        '#2 ' + "Constants.DEFAULT_PAGE_SIZE" + ' = ' + JSON.stringify(Constants.DEFAULT_PAGE_SIZE));
      expect(Constants.DEFAULT_PAGE_SIZE).assertEqual(pageSizeBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0018',
        '#3 assert ' + "expect(Constants.isValidEmail('user@example.com')).assertEqual(emailBefore)");
      expect(Constants.isValidEmail('user@example.com')).assertEqual(emailBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0018',
        '#4 assert ' + "expect(Constants.getVersionInfo().versionCode).assertEqual(VERSION_CODE)");
      expect(Constants.getVersionInfo().versionCode).assertEqual(VERSION_CODE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0018',
        '#5 assert ' + "expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue()");
      expect(Constants.isValidMacAddress('00:1A:2B:3C:4D:5E')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0018',
        '#6 assert ' + "expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-426614174000')).assertTrue()");
      expect(Constants.isValidUuid('123e4567-e89b-12d3-a456-426614174000')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConstants0018',
        '#7 ' + "Constants.MILLISECONDS_PER_WEEK" + ' = ' + JSON.stringify(Constants.MILLISECONDS_PER_WEEK));
      expect(Constants.MILLISECONDS_PER_WEEK).assertEqual(604800000);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConstants0018', 'end');
    });
  });
}
