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
import { Constants, PageConstants } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * Constants application-level constant test suite.
 * Covers API version constants, default value constants, time/byte units,
 * regex validation and initialize/getVersionInfo methods.
 */
export default function ConstantsTest(): void {
  describe('ConstantsTest', () => {

    // ========================================
    // API version constants
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0100
     * @tc.name testUtilsConstants0001
     * @tc.desc Verify each API version field value is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0001 begin');
      expect(Constants.API_VERSION_MAJOR).assertEqual(1);
      expect(Constants.API_VERSION_MINOR).assertEqual(0);
      expect(Constants.API_VERSION_PATCH).assertEqual(0);
      expect(Constants.API_VERSION_CODE).assertEqual(100);
      expect(Constants.API_VERSION_STRING).assertEqual('1.0.0');
    });

    // ========================================
    // Default value constants
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0200
     * @tc.name testUtilsConstants0002
     * @tc.desc Verify each default value constant matches expectations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0002 begin');
      expect(Constants.DEFAULT_PAGE_SIZE).assertEqual(20);
      expect(Constants.DEFAULT_TIMEOUT_MS).assertEqual(30000);
      expect(Constants.DEFAULT_RETRY_COUNT).assertEqual(3);
      expect(Constants.DEFAULT_ANIMATION_DURATION).assertEqual(300);
      expect(Constants.DEFAULT_FONT_SIZE).assertEqual(14);
      expect(Constants.DEFAULT_BORDER_RADIUS).assertEqual(8);
      expect(Constants.DEFAULT_SPACING).assertEqual(12);
      expect(Constants.DEFAULT_MAX_CACHE_SIZE).assertEqual(100);
    });

    // ========================================
    // Time unit constants
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0300
     * @tc.name testUtilsConstants0003
     * @tc.desc Verify time unit constant conversions are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0003 begin');
      expect(Constants.MILLISECONDS_PER_SECOND).assertEqual(1000);
      expect(Constants.MILLISECONDS_PER_MINUTE).assertEqual(60000);
      expect(Constants.MILLISECONDS_PER_HOUR).assertEqual(3600000);
      expect(Constants.MILLISECONDS_PER_DAY).assertEqual(86400000);
      expect(Constants.MILLISECONDS_PER_WEEK).assertEqual(604800000);
      expect(Constants.SECONDS_PER_MINUTE).assertEqual(60);
      expect(Constants.SECONDS_PER_HOUR).assertEqual(3600);
      expect(Constants.SECONDS_PER_DAY).assertEqual(86400);
    });

    // ========================================
    // Byte unit constants
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0400
     * @tc.name testUtilsConstants0004
     * @tc.desc Verify byte unit constant conversions are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0004 begin');
      expect(Constants.KB).assertEqual(1024);
      expect(Constants.MB).assertEqual(1048576);
      expect(Constants.GB).assertEqual(1073741824);
      expect(Constants.TB).assertEqual(1099511627776);
      expect(Constants.MB).assertEqual(Constants.KB * Constants.KB);
      expect(Constants.GB).assertEqual(Constants.KB * Constants.KB * Constants.KB);
    });

    // ========================================
    // Empty string constants
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0500
     * @tc.name testUtilsConstants0005
     * @tc.desc Verify empty-string related constant values are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0005 begin');
      expect(Constants.EMPTY_STRING).assertEqual('');
      expect(Constants.EMPTY_STRING.length).assertEqual(0);
      expect(Constants.SPACE_STRING).assertEqual(' ');
      expect(Constants.SPACE_STRING.length).assertEqual(1);
      expect(Constants.NEWLINE).assertEqual('\n');
      expect(Constants.TAB).assertEqual('\t');
    });

    // ========================================
    // Regex constants
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0600
     * @tc.name testUtilsConstants0006
     * @tc.desc Verify regex strings are non-empty and constructible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0006 begin');
      expect(Constants.EMAIL_REGEX.length).assertLarger(0);
      expect(Constants.PHONE_REGEX.length).assertLarger(0);
      expect(Constants.URL_REGEX.length).assertLarger(0);
      expect(Constants.ID_CARD_REGEX.length).assertLarger(0);
      const emailRegex: RegExp = new RegExp(Constants.EMAIL_REGEX);
      expect(emailRegex.test('test@example.com')).assertTrue();
      expect(emailRegex.test('invalid')).assertFalse();
    });

    // ========================================
    // isValidEmail / isValidPhone / isValidUrl
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0700
     * @tc.name testUtilsConstants0007
     * @tc.desc Verify isValidEmail validates valid/invalid emails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0007 begin');
      expect(Constants.isValidEmail('user@example.com')).assertTrue();
      expect(Constants.isValidEmail('a.b+c@domain.org')).assertTrue();
      expect(Constants.isValidEmail('invalid-email')).assertFalse();
      expect(Constants.isValidEmail('@no-local.com')).assertFalse();
      expect(Constants.isValidEmail('')).assertFalse();
    });

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0800
     * @tc.name testUtilsConstants0008
     * @tc.desc Verify isValidPhone validates valid/invalid phone numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0008 begin');
      expect(Constants.isValidPhone('13800138000')).assertTrue();
      expect(Constants.isValidPhone('15912345678')).assertTrue();
      expect(Constants.isValidPhone('12345678901')).assertFalse();
      expect(Constants.isValidPhone('1380013800')).assertFalse();
      expect(Constants.isValidPhone('')).assertFalse();
    });

    /**
     * @tc.number SUB_UTILS_CONSTANTS_0900
     * @tc.name testUtilsConstants0009
     * @tc.desc Verify isValidUrl validates valid/invalid URLs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0009 begin');
      expect(Constants.isValidUrl('https://www.example.com')).assertEqual(true);
      expect(Constants.isValidUrl('http://www.test.org')).assertEqual(true);
      expect(Constants.isValidUrl('https://sub.domain.com/path')).assertEqual(true);
      expect(Constants.isValidUrl('not a url')).assertEqual(false);
      expect(Constants.isValidUrl('')).assertEqual(false);
    });

    // ========================================
    // getVersionInfo / initialize
    // ========================================

    /**
     * @tc.number SUB_UTILS_CONSTANTS_1000
     * @tc.name testUtilsConstants0010
     * @tc.desc Verify getVersionInfo returns complete version info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0010 begin');
      const info = Constants.getVersionInfo();
      expect(info.major).assertEqual(1);
      expect(info.minor).assertEqual(0);
      expect(info.patch).assertEqual(0);
      expect(info.versionString).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(100);
    });

    /**
     * @tc.number SUB_UTILS_CONSTANTS_1100
     * @tc.name testUtilsConstants0011
     * @tc.desc Verify calling initialize does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0011 begin');
      Constants.initialize();
      expect(Constants.API_VERSION_MAJOR).assertEqual(1);
      expect(Constants.API_VERSION_STRING).assertEqual('1.0.0');
      expect(Constants.DEFAULT_PAGE_SIZE).assertEqual(20);
    });

    /**
     * @tc.number SUB_UTILS_CONSTANTS_1200
     * @tc.name testUtilsConstants0012
     * @tc.desc Verify exact page color constants used by the sample pages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0012 begin');
      expect(PageConstants.COLOR_PRIMARY).assertEqual('#007DFF');
      expect(PageConstants.COLOR_BACKGROUND).assertEqual('#F5F5F5');
      expect(PageConstants.COLOR_CARD).assertEqual('#FFFFFF');
      expect(PageConstants.COLOR_ERROR).assertEqual('#F44336');
      expect(PageConstants.COLOR_SUCCESS).assertEqual('#4CAF50');
      expect(PageConstants.COLOR_WARNING).assertEqual('#FF9800');
      expect(PageConstants.COLOR_TEXT_PRIMARY).assertEqual('#333333');
      expect(PageConstants.COLOR_TEXT_SECONDARY).assertEqual('#666666');
      expect(PageConstants.COLOR_TEXT_HINT).assertEqual('#999999');
    });

    /**
     * @tc.number SUB_UTILS_CONSTANTS_1300
     * @tc.name testUtilsConstants0013
     * @tc.desc Verify exact font and component dimensions used by the sample pages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsConstants0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0013 begin');
      expect(PageConstants.FONT_SIZE_TITLE).assertEqual(20);
      expect(PageConstants.FONT_SIZE_SUBTITLE).assertEqual(16);
      expect(PageConstants.FONT_SIZE_BODY).assertEqual(14);
      expect(PageConstants.FONT_SIZE_SMALL).assertEqual(12);
      expect(PageConstants.BUTTON_HEIGHT).assertEqual(40);
      expect(PageConstants.BUTTON_BORDER_RADIUS).assertEqual(8);
      expect(PageConstants.CARD_PADDING).assertEqual(16);
      expect(PageConstants.CARD_BORDER_RADIUS).assertEqual(12);
    });

    /**
     * @tc.number SUB_UTILS_CONSTANTS_1400
     * @tc.name testUtilsConstants0014
     * @tc.desc Verify exact item, section and page spacing constants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsConstants0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0014 begin');
      expect(PageConstants.ITEM_SPACING).assertEqual(12);
      expect(PageConstants.SECTION_SPACING).assertEqual(16);
      expect(PageConstants.PAGE_PADDING).assertEqual(16);
    });

    /**
     * @tc.number SUB_UTILS_CONSTANTS_1500
     * @tc.name testUtilsConstants0015
     * @tc.desc Verify exact bold, normal and medium font weight constants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsConstants0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsConstants0015 begin');
      expect(PageConstants.FONT_WEIGHT_BOLD).assertEqual(700);
      expect(PageConstants.FONT_WEIGHT_NORMAL).assertEqual(400);
      expect(PageConstants.FONT_WEIGHT_MEDIUM).assertEqual(500);
    });
  });
}
