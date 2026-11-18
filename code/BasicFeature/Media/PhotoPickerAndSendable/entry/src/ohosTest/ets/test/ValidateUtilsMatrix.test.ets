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
import { ValidateUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Registers the matrix cases of the ValidateUtils helpers. Every validator is
 * driven through the accepted and the rejected input classes that the sample
 * screens produce. All methods under test are pure static helpers, so no
 * ability context and no file system access is required.
 */
export default function validateUtilsMatrixTest() {
  describe('ValidateUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0100
     * @tc.name      testValidateMatrix0001
     * @tc.desc      Verify isPhone accepts valid mainland China mobile numbers
     *               across several carrier prefixes and trims padded blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plain eleven digit mobile number of a common carrier is accepted.
      expect(ValidateUtils.isPhone('13812345678')).assertTrue();
      // The carrier digit four is inside the assigned block as well.
      expect(ValidateUtils.isPhone('14812345678')).assertTrue();
      // The carrier digit five is accepted.
      expect(ValidateUtils.isPhone('15912345678')).assertTrue();
      // The carrier digit seven is accepted.
      expect(ValidateUtils.isPhone('17912345678')).assertTrue();
      // The upper carrier prefix nine is accepted.
      expect(ValidateUtils.isPhone('19912345678')).assertTrue();
      // Padded blanks around the number are trimmed before the pattern runs.
      expect(ValidateUtils.isPhone('  15812345678  ')).assertTrue();
      // A tab padded number passes too because trim removes tab characters.
      expect(ValidateUtils.isPhone('\t18612345678\t')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0200
     * @tc.name      testValidateMatrix0002
     * @tc.desc      Verify isPhone rejects numbers outside the numbering plan:
     *               wrong carrier digit, wrong leading digit, wrong length,
     *               letter tails and inner blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The carrier digit two is outside the assigned three to nine block.
      expect(ValidateUtils.isPhone('12812345678')).assertFalse();
      // A leading zero is not a mobile number at all.
      expect(ValidateUtils.isPhone('03812345678')).assertFalse();
      // Ten digits are one short of the numbering plan.
      expect(ValidateUtils.isPhone('1381234567')).assertFalse();
      // Twelve digits are one too many for the plan.
      expect(ValidateUtils.isPhone('138123456789')).assertFalse();
      // A trailing letter breaks the digit pattern.
      expect(ValidateUtils.isPhone('1381234567a')).assertFalse();
      // Inner blanks are not trimmed away and break the pattern.
      expect(ValidateUtils.isPhone('138 1234 5678')).assertFalse();
      // A plus sign is not part of the accepted pattern.
      expect(ValidateUtils.isPhone('+8613812345678')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0300
     * @tc.name      testValidateMatrix0003
     * @tc.desc      Verify isPhone degrades missing, empty and blank only input
     *               to false instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isPhone(undefined)).assertFalse();
      // Explicit null is rejected as well.
      expect(ValidateUtils.isPhone(null)).assertFalse();
      // An empty text is rejected.
      expect(ValidateUtils.isPhone('')).assertFalse();
      // A text of spaces has no digits and is rejected.
      expect(ValidateUtils.isPhone('   ')).assertFalse();
      // A text of tab and newline is rejected.
      expect(ValidateUtils.isPhone('\t\n')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0400
     * @tc.name      testValidateMatrix0004
     * @tc.desc      Verify isEmail accepts the address shapes produced by real
     *               call sites: dotted locals, plus tags, upper case text and
     *               multi label domains.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plain address with a single label domain is accepted.
      expect(ValidateUtils.isEmail('user@example.com')).assertTrue();
      // Dots in the local part and a hyphen label in the domain are accepted.
      expect(ValidateUtils.isEmail('first.last@sub.domain-x.org')).assertTrue();
      // A plus tag in the local part is accepted.
      expect(ValidateUtils.isEmail('user+tag@example.co')).assertTrue();
      // Upper case text is accepted by the case insensitive pattern.
      expect(ValidateUtils.isEmail('USER@EXAMPLE.COM')).assertTrue();
      // Every allowed special character of the local part is accepted.
      expect(ValidateUtils.isEmail('a_b%c-d@mx1.example.org')).assertTrue();
      // Padded blanks around the address are trimmed before the check.
      expect(ValidateUtils.isEmail('  user@example.com  ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0500
     * @tc.name      testValidateMatrix0005
     * @tc.desc      Verify isEmail rejects malformed addresses: bare words,
     *               missing domain labels, empty local parts, blanks inside the
     *               local part and a doubled at sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A text without an at sign is rejected.
      expect(ValidateUtils.isEmail('plainaddress')).assertFalse();
      // A domain without a dot label is rejected.
      expect(ValidateUtils.isEmail('missing@tld')).assertFalse();
      // An empty local part is rejected.
      expect(ValidateUtils.isEmail('@example.com')).assertFalse();
      // A missing domain after the at sign is rejected.
      expect(ValidateUtils.isEmail('user@')).assertFalse();
      // A blank inside the local part is rejected.
      expect(ValidateUtils.isEmail('a b@example.com')).assertFalse();
      // A doubled at sign is rejected because the second one cannot join a domain.
      expect(ValidateUtils.isEmail('user@@example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0600
     * @tc.name      testValidateMatrix0006
     * @tc.desc      Verify isEmail degrades missing, empty and blank only input
     *               to false instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isEmail(undefined)).assertFalse();
      // Explicit null is rejected as well.
      expect(ValidateUtils.isEmail(null)).assertFalse();
      // An empty text is rejected.
      expect(ValidateUtils.isEmail('')).assertFalse();
      // A text of spaces is rejected.
      expect(ValidateUtils.isEmail('   ')).assertFalse();
      // A text of tab, space and newline is rejected.
      expect(ValidateUtils.isEmail('\t \n')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0700
     * @tc.name      testValidateMatrix0007
     * @tc.desc      Verify isUrl accepts http and https addresses with hosts,
     *               ports, paths and queries as produced by real call sites.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plain https address with a bare host is accepted.
      expect(ValidateUtils.isUrl('https://example.com')).assertTrue();
      // A http address with port, path and query is accepted.
      expect(ValidateUtils.isUrl('http://example.com:8080/photo/album?count=3')).assertTrue();
      // A multi label host with a nested path is accepted.
      expect(ValidateUtils.isUrl('https://sub.domain-x.org/path/to/item')).assertTrue();
      // A literal ip host with a port and a file path is accepted.
      expect(ValidateUtils.isUrl('http://192.168.1.10:80/index.html')).assertTrue();
      // Upper case host and path text is accepted.
      expect(ValidateUtils.isUrl('https://EXAMPLE.com/Path')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0800
     * @tc.name      testValidateMatrix0008
     * @tc.desc      Verify isUrl rejects foreign schemes, hostless texts, scheme
     *               less hosts, blanks inside the path and non numeric ports.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The ftp scheme is outside the supported http and https set.
      expect(ValidateUtils.isUrl('ftp://example.com')).assertFalse();
      // A scheme without any host is rejected.
      expect(ValidateUtils.isUrl('https://')).assertFalse();
      // A protocol relative host reference is rejected.
      expect(ValidateUtils.isUrl('//example.com')).assertFalse();
      // A host without a scheme is rejected.
      expect(ValidateUtils.isUrl('example.com/path')).assertFalse();
      // A blank inside the path is rejected by the non space path rule.
      expect(ValidateUtils.isUrl('http://example.com/path with space')).assertFalse();
      // A port built from letters is rejected.
      expect(ValidateUtils.isUrl('https://example.com:port')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_0900
     * @tc.name      testValidateMatrix0009
     * @tc.desc      Verify isUrl degrades missing and blank input to false and
     *               still accepts minimal hosts and a bare trailing slash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isUrl(undefined)).assertFalse();
      // Explicit null is rejected as well.
      expect(ValidateUtils.isUrl(null)).assertFalse();
      // An empty text is rejected.
      expect(ValidateUtils.isUrl('')).assertFalse();
      // A blank text is rejected.
      expect(ValidateUtils.isUrl('   ')).assertFalse();
      // A host with only the root slash path is accepted.
      expect(ValidateUtils.isUrl('https://example.com/')).assertTrue();
      // A two label host without port and path is accepted.
      expect(ValidateUtils.isUrl('http://a.b')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1000
     * @tc.name      testValidateMatrix0010
     * @tc.desc      Verify isNumber accepts integer and fraction texts with an
     *               optional minus sign, padded blanks and leading zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plain integer text is accepted.
      expect(ValidateUtils.isNumber('123')).assertTrue();
      // A negative value with a fraction is accepted.
      expect(ValidateUtils.isNumber('-12.50')).assertTrue();
      // Padded blanks around the digits are trimmed before the check.
      expect(ValidateUtils.isNumber(' 42 ')).assertTrue();
      // Zero alone is accepted.
      expect(ValidateUtils.isNumber('0')).assertTrue();
      // Minus zero is accepted because the sign is optional and the digits follow.
      expect(ValidateUtils.isNumber('-0')).assertTrue();
      // Leading zeros keep the text a plain decimal number.
      expect(ValidateUtils.isNumber('007')).assertTrue();
      // A longer fraction is accepted.
      expect(ValidateUtils.isNumber('3.14159')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1100
     * @tc.name      testValidateMatrix0011
     * @tc.desc      Verify isNumber rejects exponent, hexadecimal, plus sign,
     *               multi dot, comma and blank separated number forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The plus sign is outside the accepted sign forms.
      expect(ValidateUtils.isNumber('+5')).assertFalse();
      // The exponent form is rejected on purpose.
      expect(ValidateUtils.isNumber('1e5')).assertFalse();
      // The hexadecimal form is rejected on purpose.
      expect(ValidateUtils.isNumber('0x1f')).assertFalse();
      // A second dot breaks the single fraction group.
      expect(ValidateUtils.isNumber('12.3.4')).assertFalse();
      // A dot without fraction digits is rejected.
      expect(ValidateUtils.isNumber('5.')).assertFalse();
      // A dot without an integer part is rejected.
      expect(ValidateUtils.isNumber('-.5')).assertFalse();
      // A decimal comma is not a decimal point.
      expect(ValidateUtils.isNumber('12,5')).assertFalse();
      // An inner blank is not trimmed away and breaks the pattern.
      expect(ValidateUtils.isNumber('12 345')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1200
     * @tc.name      testValidateMatrix0012
     * @tc.desc      Verify isNumber degrades missing, empty and blank only input
     *               to false instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isNumber(undefined)).assertFalse();
      // Explicit null is rejected as well.
      expect(ValidateUtils.isNumber(null)).assertFalse();
      // An empty text is rejected.
      expect(ValidateUtils.isNumber('')).assertFalse();
      // A text of spaces is rejected.
      expect(ValidateUtils.isNumber('   ')).assertFalse();
      // A single tab is rejected.
      expect(ValidateUtils.isNumber('\t')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1300
     * @tc.name      testValidateMatrix0013
     * @tc.desc      Verify isEmptyString treats missing, empty and whitespace
     *               only texts as empty and keeps any visible character non
     *               empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty text counts as empty.
      expect(ValidateUtils.isEmptyString('')).assertTrue();
      // A text of spaces counts as empty.
      expect(ValidateUtils.isEmptyString('   ')).assertTrue();
      // A text of tab, space and newline counts as empty.
      expect(ValidateUtils.isEmptyString('\t \n')).assertTrue();
      // Missing input counts as empty.
      expect(ValidateUtils.isEmptyString(undefined)).assertTrue();
      // Explicit null counts as empty.
      expect(ValidateUtils.isEmptyString(null)).assertTrue();
      // A text with letters is not empty.
      expect(ValidateUtils.isEmptyString('data')).assertFalse();
      // A text with blanks around a letter is not empty either.
      expect(ValidateUtils.isEmptyString(' x ')).assertFalse();
      // A single digit character is visible and not empty.
      expect(ValidateUtils.isEmptyString('0')).assertFalse();
      // A single dot is visible and not empty.
      expect(ValidateUtils.isEmptyString('.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1400
     * @tc.name      testValidateMatrix0014
     * @tc.desc      Verify isHexColor accepts six digit colors in upper case,
     *               lower case, mixed case and with padded blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An upper case six digit color is accepted.
      expect(ValidateUtils.isHexColor('#FF00AA')).assertTrue();
      // A lower case six digit color is accepted as well.
      expect(ValidateUtils.isHexColor('#ff00aa')).assertTrue();
      // A mixed case color is accepted.
      expect(ValidateUtils.isHexColor('#123ABC')).assertTrue();
      // Padded blanks around the color are trimmed before the check.
      expect(ValidateUtils.isHexColor(' #ABCDEF ')).assertTrue();
      // The black color is a valid six digit value.
      expect(ValidateUtils.isHexColor('#000000')).assertTrue();
      // The white color is a valid six digit value.
      expect(ValidateUtils.isHexColor('#FFFFFF')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1500
     * @tc.name      testValidateMatrix0015
     * @tc.desc      Verify isHexColor rejects five and seven digit texts, a
     *               missing hash, non hexadecimal letters, short hashes and
     *               missing input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five digits are one short of the color format.
      expect(ValidateUtils.isHexColor('#F00AA')).assertFalse();
      // Seven digits are one too many for the format.
      expect(ValidateUtils.isHexColor('#FF00ABC')).assertFalse();
      // The leading hash is mandatory.
      expect(ValidateUtils.isHexColor('FF00AA')).assertFalse();
      // The letter G is not a hexadecimal digit.
      expect(ValidateUtils.isHexColor('#GG00AA')).assertFalse();
      // A bare hash without digits is rejected.
      expect(ValidateUtils.isHexColor('#')).assertFalse();
      // A five digit value is rejected again with plain digits.
      expect(ValidateUtils.isHexColor('#12345')).assertFalse();
      // A seven digit value is rejected again with plain digits.
      expect(ValidateUtils.isHexColor('#1234567')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isHexColor(undefined)).assertFalse();
      // Explicit null is rejected as well.
      expect(ValidateUtils.isHexColor(null)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1600
     * @tc.name      testValidateMatrix0016
     * @tc.desc      Verify isValidIndex accepts whole indexes inside the list
     *               bounds including the first and the last position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The first index of a three entry list is valid.
      expect(ValidateUtils.isValidIndex(0, 3)).assertTrue();
      // The last valid index is one below the length.
      expect(ValidateUtils.isValidIndex(2, 3)).assertTrue();
      // The only index of a one entry list is valid.
      expect(ValidateUtils.isValidIndex(0, 1)).assertTrue();
      // A large index inside a large list is valid.
      expect(ValidateUtils.isValidIndex(999, 1000)).assertTrue();
      // The index before the length of a six entry list is valid.
      expect(ValidateUtils.isValidIndex(5, 6)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1700
     * @tc.name      testValidateMatrix0017
     * @tc.desc      Verify isValidIndex rejects the upper boundary, negative,
     *               fractional, non finite and out of range indexes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The index equal to the length is outside the bounds.
      expect(ValidateUtils.isValidIndex(3, 3)).assertFalse();
      // A negative index cannot address an entry.
      expect(ValidateUtils.isValidIndex(-1, 3)).assertFalse();
      // A fractional index is rejected even inside the bounds.
      expect(ValidateUtils.isValidIndex(1.5, 3)).assertFalse();
      // Any index is invalid for an empty list.
      expect(ValidateUtils.isValidIndex(0, 0)).assertFalse();
      // A NaN index fails the finite guard.
      expect(ValidateUtils.isValidIndex(Number.NaN, 5)).assertFalse();
      // An infinite index fails the finite guard.
      expect(ValidateUtils.isValidIndex(Number.POSITIVE_INFINITY, 5)).assertFalse();
      // A negative infinite index fails both guards.
      expect(ValidateUtils.isValidIndex(Number.NEGATIVE_INFINITY, 5)).assertFalse();
      // A large index beyond the length is out of range.
      expect(ValidateUtils.isValidIndex(100, 3)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1800
     * @tc.name      testValidateMatrix0018
     * @tc.desc      Verify isPositiveInteger accepts strictly positive whole
     *               numbers and rejects zero, negatives, fractions, infinities
     *               and NaN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One is the smallest positive integer.
      expect(ValidateUtils.isPositiveInteger(1)).assertTrue();
      // A larger whole number is accepted.
      expect(ValidateUtils.isPositiveInteger(100)).assertTrue();
      // A single digit whole number is accepted.
      expect(ValidateUtils.isPositiveInteger(7)).assertTrue();
      // Zero is not strictly positive.
      expect(ValidateUtils.isPositiveInteger(0)).assertFalse();
      // A negative whole number is rejected.
      expect(ValidateUtils.isPositiveInteger(-4)).assertFalse();
      // A fractional value is rejected even when positive.
      expect(ValidateUtils.isPositiveInteger(2.5)).assertFalse();
      // Positive infinity is rejected by the finite guard.
      expect(ValidateUtils.isPositiveInteger(Number.POSITIVE_INFINITY)).assertFalse();
      // Negative infinity is rejected by the finite guard.
      expect(ValidateUtils.isPositiveInteger(Number.NEGATIVE_INFINITY)).assertFalse();
      // NaN is rejected by the finite guard.
      expect(ValidateUtils.isPositiveInteger(Number.NaN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_1900
     * @tc.name      testValidateMatrix0019
     * @tc.desc      Verify isMediaUri accepts the picker granted media scheme,
     *               the datashare share scheme and sandbox file uris with an
     *               extension, including trimmed input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The picker granted media uri is accepted directly.
      expect(ValidateUtils.isMediaUri('file://media/photo/1.jpg')).assertTrue();
      // The datashare uri is accepted as the share form.
      expect(ValidateUtils.isMediaUri('datashare://media/album/12')).assertTrue();
      // A sandbox file uri with a jpg extension is accepted.
      expect(ValidateUtils.isMediaUri('file://data/storage/el2/base/files/export.jpg')).assertTrue();
      // Padded blanks around a picker uri are trimmed before the scheme check.
      expect(ValidateUtils.isMediaUri(' file://media/2.png ')).assertTrue();
      // A short datashare uri is accepted because the prefix branch returns first.
      expect(ValidateUtils.isMediaUri('datashare://x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_2000
     * @tc.name      testValidateMatrix0020
     * @tc.desc      Verify isMediaUri rejects foreign schemes, extensionless
     *               sandbox paths, the bare media prefix and missing input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testValidateMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A foreign http scheme is rejected.
      expect(ValidateUtils.isMediaUri('http://media/photo/1.jpg')).assertFalse();
      // A sandbox path without an extension is rejected.
      expect(ValidateUtils.isMediaUri('file://data/files/noextension')).assertFalse();
      // The media prefix without the trailing slash falls to the sandbox branch
      // and is rejected because the name carries no dot.
      expect(ValidateUtils.isMediaUri('file://media')).assertFalse();
      // A content scheme is rejected.
      expect(ValidateUtils.isMediaUri('content://media/1.jpg')).assertFalse();
      // An empty text is rejected.
      expect(ValidateUtils.isMediaUri('')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isMediaUri(undefined)).assertFalse();
      // Explicit null is rejected as well.
      expect(ValidateUtils.isMediaUri(null)).assertFalse();
      // A blank text is rejected after trimming.
      expect(ValidateUtils.isMediaUri('   ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_2100
     * @tc.name      testValidateMatrix0021
     * @tc.desc      Verify isPhoneByDigits accepts valid mobile numbers across
     *               the carrier block and trims padded blanks like the regex
     *               variant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A valid mobile number with the carrier digit eight is accepted.
      expect(ValidateUtils.isPhoneByDigits('18912345678')).assertTrue();
      // A valid mobile number with the carrier digit three is accepted.
      expect(ValidateUtils.isPhoneByDigits('13812345678')).assertTrue();
      // Padded blanks around the number are trimmed before the digit walk.
      expect(ValidateUtils.isPhoneByDigits(' 15812345678 ')).assertTrue();
      // The lowest carrier prefix three is accepted.
      expect(ValidateUtils.isPhoneByDigits('13000000000')).assertTrue();
      // The highest carrier prefix nine is accepted.
      expect(ValidateUtils.isPhoneByDigits('19345678901')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALMAT_2200
     * @tc.name      testValidateMatrix0022
     * @tc.desc      Verify isPhoneByDigits rejects wrong carrier digits, letter
     *               tails, wrong lengths, leading letters, inner blanks and
     *               missing input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Carrier digit two is rejected by the range check.
      expect(ValidateUtils.isPhoneByDigits('12912345678')).assertFalse();
      // A trailing letter breaks the digit walk at the last position.
      expect(ValidateUtils.isPhoneByDigits('1381234567a')).assertFalse();
      // Ten digits are rejected by the length guard.
      expect(ValidateUtils.isPhoneByDigits('1381234567')).assertFalse();
      // A leading letter fails the first digit check.
      expect(ValidateUtils.isPhoneByDigits('abc12345678')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isPhoneByDigits(undefined)).assertFalse();
      // An empty text is rejected as well.
      expect(ValidateUtils.isPhoneByDigits('')).assertFalse();
      // Twelve digits are rejected by the length guard.
      expect(ValidateUtils.isPhoneByDigits('138123456789')).assertFalse();
      // An inner blank is not trimmed away and fails the digit walk.
      expect(ValidateUtils.isPhoneByDigits('138 1234 567')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
