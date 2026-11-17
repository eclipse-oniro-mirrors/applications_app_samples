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
/** Width of the blank padding built by the padded input cases. */
const PAD_WIDTH: number = 60;
/** Length of the extremely long text inputs built by the edge cases. */
const LONG_TEXT: number = 300;

/**
 * Registers the edge and extreme input cases of the ValidateUtils helpers.
 * The cases probe the boundaries of every validator with long, padded,
 * unicode and control character inputs. All methods under test are pure
 * static helpers, so no ability context is required.
 */
export default function validateUtilsEdgeTest() {
  describe('ValidateUtilsEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0100
     * @tc.name      testValidateEdge0001
     * @tc.desc      Verify isPhone honours the exact carrier digit boundaries
     *               of the numbering plan around the three and nine limits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lowest carrier digit three is the lower boundary and is accepted.
      expect(ValidateUtils.isPhone('13000000000')).assertTrue();
      // The highest carrier digit nine is the upper boundary and is accepted.
      expect(ValidateUtils.isPhone('13999999999')).assertTrue();
      // The digit four sits directly above the boundary and is accepted.
      expect(ValidateUtils.isPhone('14000000000')).assertTrue();
      // The digit two sits directly below the boundary and is rejected.
      expect(ValidateUtils.isPhone('12999999999')).assertFalse();
      // The digit one is far below the boundary and is rejected.
      expect(ValidateUtils.isPhone('11999999999')).assertFalse();
      // The digit zero as the second digit is rejected.
      expect(ValidateUtils.isPhone('10999999999')).assertFalse();
      // A number made only of ones fails the carrier digit check.
      expect(ValidateUtils.isPhone('11111111111')).assertFalse();
      // The maximum eleven digit value inside the block is accepted.
      expect(ValidateUtils.isPhone('19999999999')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0200
     * @tc.name      testValidateEdge0002
     * @tc.desc      Verify isPhone rejects a three hundred digit text and still
     *               accepts a valid number wrapped in sixty blank pairs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build an extremely long digit text with a plain while loop.
      let longDigits: string = '1';
      let index: number = 0;
      while (index < LONG_TEXT) {
        longDigits = longDigits + '2';
        index = index + 1;
      }
      // The anchored pattern rejects the overlong text.
      expect(ValidateUtils.isPhone(longDigits)).assertFalse();
      // Build a wide blank padding around a valid number.
      let pad: string = '';
      index = 0;
      while (index < PAD_WIDTH) {
        pad = pad + ' ';
        index = index + 1;
      }
      // The trimmed number inside the wide padding is still accepted.
      expect(ValidateUtils.isPhone(pad + '13812345678' + pad)).assertTrue();
      // The padding alone is rejected because it trims to an empty text.
      expect(ValidateUtils.isPhone(pad)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0300
     * @tc.name      testValidateEdge0003
     * @tc.desc      Verify isEmail handles the shortest valid forms and the
     *               dot boundaries of the domain labels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one character local part with a two label domain is accepted.
      expect(ValidateUtils.isEmail('a@b.co')).assertTrue();
      // A one character final label is accepted as well.
      expect(ValidateUtils.isEmail('a@b.c')).assertTrue();
      // A trailing dot after the last label is rejected.
      expect(ValidateUtils.isEmail('a@b.')).assertFalse();
      // A leading dot before the first label is rejected.
      expect(ValidateUtils.isEmail('a@.b')).assertFalse();
      // Two consecutive dots inside the domain are rejected.
      expect(ValidateUtils.isEmail('a@b..c')).assertFalse();
      // A domain label starting with a hyphen is accepted by the pattern.
      expect(ValidateUtils.isEmail('a@-b.com')).assertTrue();
      // A domain label ending with a hyphen is accepted by the pattern too.
      expect(ValidateUtils.isEmail('a@b-.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0400
     * @tc.name      testValidateEdge0004
     * @tc.desc      Verify isEmail accepts a long local part, many domain
     *               labels and every special character of the local set.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a two hundred character local part with a while loop.
      let local: string = 'x';
      let index: number = 0;
      while (index < LONG_TEXT - 100) {
        local = local + 'x';
        index = index + 1;
      }
      // The long but plain local part is accepted.
      expect(ValidateUtils.isEmail(local + '@example.com')).assertTrue();
      // A chain of many one character labels is accepted.
      expect(ValidateUtils.isEmail('x@a.b.c.d.e.f.gh')).assertTrue();
      // Every special character of the local set together is accepted.
      expect(ValidateUtils.isEmail('a._%+-@example.com')).assertTrue();
      // Build a long single label domain with a while loop.
      let label: string = 'd';
      index = 0;
      while (index < LONG_TEXT - 100) {
        label = label + 'd';
        index = index + 1;
      }
      // The long single label domain is accepted.
      expect(ValidateUtils.isEmail('u@' + label + '.org')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0500
     * @tc.name      testValidateEdge0005
     * @tc.desc      Verify isUrl accepts a very long path, percent encoded
     *               blanks inside the path and a long query string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a three hundred character path with a while loop.
      let path: string = '';
      let index: number = 0;
      while (index < LONG_TEXT) {
        path = path + 'p';
        index = index + 1;
      }
      // The long path after the host is accepted.
      expect(ValidateUtils.isUrl('https://example.com/' + path)).assertTrue();
      // A percent encoded blank stays inside the path class and is accepted.
      expect(ValidateUtils.isUrl('https://example.com/p%20q')).assertTrue();
      // Build a long query string with a while loop.
      let query: string = '';
      index = 0;
      while (index < LONG_TEXT) {
        query = query + 'k';
        index = index + 1;
      }
      // The long query after the path is accepted.
      expect(ValidateUtils.isUrl('https://example.com/a?' + query)).assertTrue();
      // A raw blank inside the path is rejected because the class forbids it.
      expect(ValidateUtils.isUrl('https://example.com/a b')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0600
     * @tc.name      testValidateEdge0006
     * @tc.desc      Verify isUrl honours the port syntax boundaries: minimal
     *               and maximal digits pass, an empty or broken port fails.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single digit port one is accepted.
      expect(ValidateUtils.isUrl('http://example.com:1')).assertTrue();
      // The five digit port of the highest common value is accepted.
      expect(ValidateUtils.isUrl('http://example.com:65535')).assertTrue();
      // The port zero is accepted by the digit class.
      expect(ValidateUtils.isUrl('http://example.com:0')).assertTrue();
      // A colon without digits is rejected.
      expect(ValidateUtils.isUrl('http://example.com:')).assertFalse();
      // A port with a trailing letter is rejected.
      expect(ValidateUtils.isUrl('http://example.com:80a')).assertFalse();
      // A blank after the colon breaks the port group.
      expect(ValidateUtils.isUrl('http://example.com: 80')).assertFalse();
      // A long but plain digit port is accepted.
      expect(ValidateUtils.isUrl('http://example.com:1234567890')).assertTrue();
      // A loopback address with a port is accepted.
      expect(ValidateUtils.isUrl('https://127.0.0.1:8080')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0700
     * @tc.name      testValidateEdge0007
     * @tc.desc      Verify isNumber accepts extreme magnitudes, long digit
     *               runs and tiny fractions without limits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A twenty digit negative number is accepted by the pattern.
      expect(ValidateUtils.isNumber('-99999999999999999999')).assertTrue();
      // A thirty digit positive run is accepted as well.
      expect(ValidateUtils.isNumber('123456789012345678901234567890')).assertTrue();
      // A tiny fraction is accepted.
      expect(ValidateUtils.isNumber('0.000001')).assertTrue();
      // A zero padded fraction is accepted.
      expect(ValidateUtils.isNumber('00000.0000')).assertTrue();
      // A large negative integer is accepted.
      expect(ValidateUtils.isNumber('-1000000')).assertTrue();
      // A large positive integer is accepted.
      expect(ValidateUtils.isNumber('1000000')).assertTrue();
      // A bare dot is rejected.
      expect(ValidateUtils.isNumber('.')).assertFalse();
      // A bare minus sign is rejected.
      expect(ValidateUtils.isNumber('-')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0800
     * @tc.name      testValidateEdge0008
     * @tc.desc      Verify isNumber trims tabs and newlines around the value
     *               but rejects inner blanks inside the digit run.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tab and newline padded value is trimmed and accepted.
      expect(ValidateUtils.isNumber('\t42\n')).assertTrue();
      // Blanks around a negative fraction are trimmed and accepted.
      expect(ValidateUtils.isNumber('  -7.25  ')).assertTrue();
      // Newlines around an integer are trimmed and accepted.
      expect(ValidateUtils.isNumber('\n1\n')).assertTrue();
      // An inner blank inside the digits is rejected.
      expect(ValidateUtils.isNumber('1 2')).assertFalse();
      // A blank separated group is rejected.
      expect(ValidateUtils.isNumber(' 12 345 ')).assertFalse();
      // A whitespace only text is rejected.
      expect(ValidateUtils.isNumber('\t \n')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_0900
     * @tc.name      testValidateEdge0009
     * @tc.desc      Verify isEmptyString recognises every single whitespace
     *               character and a long blank run as empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single space counts as empty.
      expect(ValidateUtils.isEmptyString(' ')).assertTrue();
      // A single tab counts as empty.
      expect(ValidateUtils.isEmptyString('\t')).assertTrue();
      // A single newline counts as empty.
      expect(ValidateUtils.isEmptyString('\n')).assertTrue();
      // A carriage return with newline counts as empty.
      expect(ValidateUtils.isEmptyString('\r\n')).assertTrue();
      // Build a long blank run with a while loop.
      let blanks: string = '';
      let index: number = 0;
      while (index < PAD_WIDTH) {
        blanks = blanks + ' \t';
        index = index + 1;
      }
      // The long blank run counts as empty.
      expect(ValidateUtils.isEmptyString(blanks)).assertTrue();
      // A single visible character is not empty.
      expect(ValidateUtils.isEmptyString('a')).assertFalse();
      // Blanks around a character keep the text non empty.
      expect(ValidateUtils.isEmptyString('  a  ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1000
     * @tc.name      testValidateEdge0010
     * @tc.desc      Verify isHexColor honours the six digit boundary and the
     *               case insensitivity of the digit classes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five digits are one short of the format and are rejected.
      expect(ValidateUtils.isHexColor('#12345')).assertFalse();
      // Exactly six digits are accepted.
      expect(ValidateUtils.isHexColor('#123456')).assertTrue();
      // Seven digits are one too many and are rejected.
      expect(ValidateUtils.isHexColor('#1234567')).assertFalse();
      // A lower case letter run is accepted.
      expect(ValidateUtils.isHexColor('#abcdef')).assertTrue();
      // A mixed case letter run is accepted.
      expect(ValidateUtils.isHexColor('#AbCdEf')).assertTrue();
      // An inner blank breaks the six digit group.
      expect(ValidateUtils.isHexColor('# 12345')).assertFalse();
      // A trailing blank is trimmed away but five digits still fail.
      expect(ValidateUtils.isHexColor('#12345 ')).assertFalse();
      // A padded six digit color is accepted after trimming.
      expect(ValidateUtils.isHexColor('  #ABC  ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1100
     * @tc.name      testValidateEdge0011
     * @tc.desc      Verify isValidIndex treats minus zero as the first index
     *               and handles the safe integer boundary of the length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Minus zero equals zero and addresses the first entry.
      expect(ValidateUtils.isValidIndex(-0, 3)).assertTrue();
      // The first index of a one entry list is valid.
      expect(ValidateUtils.isValidIndex(0, 1)).assertTrue();
      // The index one is outside a one entry list.
      expect(ValidateUtils.isValidIndex(1, 1)).assertFalse();
      // The index below the maximal safe length is valid.
      expect(ValidateUtils.isValidIndex(Number.MAX_SAFE_INTEGER - 1, Number.MAX_SAFE_INTEGER)).assertTrue();
      // An index equal to the maximal safe length is outside the bounds.
      expect(ValidateUtils.isValidIndex(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER)).assertFalse();
      // Not a number is rejected by the finite guard.
      expect(ValidateUtils.isValidIndex(Number.NaN, 0)).assertFalse();
      // Positive infinity is rejected by the finite guard.
      expect(ValidateUtils.isValidIndex(Number.POSITIVE_INFINITY, 100)).assertFalse();
      // A plain zero indexed double is valid.
      expect(ValidateUtils.isValidIndex(0.0, 2)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1200
     * @tc.name      testValidateEdge0012
     * @tc.desc      Verify isPositiveInteger accepts the maximal safe integer
     *               and a fifteen digit value and rejects minus zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The maximal safe integer is a positive whole number.
      expect(ValidateUtils.isPositiveInteger(Number.MAX_SAFE_INTEGER)).assertTrue();
      // A fifteen digit exact integer is a positive whole number.
      expect(ValidateUtils.isPositiveInteger(1000000000000000)).assertTrue();
      // A fraction below one is rejected.
      expect(ValidateUtils.isPositiveInteger(0.999999)).assertFalse();
      // Minus zero is not strictly positive.
      expect(ValidateUtils.isPositiveInteger(-0)).assertFalse();
      // The smallest positive integer is accepted.
      expect(ValidateUtils.isPositiveInteger(1)).assertTrue();
      // Negative infinity is rejected by the finite guard.
      expect(ValidateUtils.isPositiveInteger(Number.NEGATIVE_INFINITY)).assertFalse();
      // Not a number is rejected by the finite guard.
      expect(ValidateUtils.isPositiveInteger(Number.NaN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1300
     * @tc.name      testValidateEdge0013
     * @tc.desc      Verify isMediaUri enforces the one to five character
     *               extension boundary of sandbox file uris.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one character extension is the shortest accepted form.
      expect(ValidateUtils.isMediaUri('file://a/b.c')).assertTrue();
      // A five character extension is the longest accepted form.
      expect(ValidateUtils.isMediaUri('file://a/b.12345')).assertTrue();
      // A six character extension exceeds the boundary.
      expect(ValidateUtils.isMediaUri('file://a/b.123456')).assertFalse();
      // A trailing dot without extension text is rejected.
      expect(ValidateUtils.isMediaUri('file://a/b.')).assertFalse();
      // A name starting with the dot has no visible name part.
      expect(ValidateUtils.isMediaUri('file://a/.c')).assertFalse();
      // A name without any dot is rejected.
      expect(ValidateUtils.isMediaUri('file://a/b')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1400
     * @tc.name      testValidateEdge0014
     * @tc.desc      Verify isMediaUri lets the picker media prefix branch pass
     *               without an extension check while a case changed prefix
     *               falls back to the sandbox branch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The bare media prefix with a trailing slash passes without a name.
      expect(ValidateUtils.isMediaUri('file://media/')).assertTrue();
      // An extensionless name under the media prefix passes too.
      expect(ValidateUtils.isMediaUri('file://media/noext')).assertTrue();
      // An ordinary media uri passes as well.
      expect(ValidateUtils.isMediaUri('file://media/x.jpeg')).assertTrue();
      // Without the trailing slash the prefix does not match and the
      // sandbox branch rejects the dotless name.
      expect(ValidateUtils.isMediaUri('file://media')).assertFalse();
      // An upper case media segment misses the prefix but carries a valid
      // extension and therefore passes through the sandbox branch.
      expect(ValidateUtils.isMediaUri('file://MEDIA/x.jpg')).assertTrue();
      // Padded blanks are trimmed before the prefix check.
      expect(ValidateUtils.isMediaUri(' file://media/1.jpg ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1500
     * @tc.name      testValidateEdge0015
     * @tc.desc      Verify isMediaUri accepts a long file name with a short
     *               extension and rejects a long extension while the
     *               datashare prefix accepts any tail.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a two hundred character file name with a while loop.
      let name: string = 'n';
      let index: number = 0;
      while (index < LONG_TEXT - 100) {
        name = name + 'n';
        index = index + 1;
      }
      // The long name with a three character extension is accepted.
      expect(ValidateUtils.isMediaUri('file://a/' + name + '.jpg')).assertTrue();
      // Build a three hundred character extension with a while loop.
      let ext: string = 'e';
      index = 0;
      while (index < LONG_TEXT) {
        ext = ext + 'e';
        index = index + 1;
      }
      // The long extension exceeds the five character boundary.
      expect(ValidateUtils.isMediaUri('file://a/name.' + ext)).assertFalse();
      // Build a long datashare tail with a while loop.
      let tail: string = 't';
      index = 0;
      while (index < LONG_TEXT) {
        tail = tail + 't';
        index = index + 1;
      }
      // The datashare prefix accepts any tail length.
      expect(ValidateUtils.isMediaUri('datashare://' + tail)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1600
     * @tc.name      testValidateEdge0016
     * @tc.desc      Verify isPhoneByDigits honours the carrier digit boundary
     *               and that a non numeric second digit degrades to NaN which
     *               slips through the range check as derived from the source.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Carrier digit two is directly below the boundary.
      expect(ValidateUtils.isPhoneByDigits('12345678901')).assertFalse();
      // Carrier digit three is the lower boundary.
      expect(ValidateUtils.isPhoneByDigits('13000000000')).assertTrue();
      // Carrier digit nine is the upper boundary.
      expect(ValidateUtils.isPhoneByDigits('19345678901')).assertTrue();
      // Carrier digit zero is below the boundary.
      expect(ValidateUtils.isPhoneByDigits('10999999999')).assertFalse();
      // A letter at the second position converts to NaN; both range
      // comparisons are false so the walk continues over the digits of the
      // tail and reports true. The assertion follows the source logic.
      expect(ValidateUtils.isPhoneByDigits('1a812345678')).assertTrue();
      // The same shape with a letter tail is still rejected by the walk.
      expect(ValidateUtils.isPhoneByDigits('1a81234567a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1700
     * @tc.name      testValidateEdge0017
     * @tc.desc      Verify isPhoneByDigits trims surrounding blanks and
     *               newlines but rejects inner blanks and overlong input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Blanks around the number are trimmed and the walk passes.
      expect(ValidateUtils.isPhoneByDigits(' 13812345678 ')).assertTrue();
      // Tab and newline padding is trimmed as well.
      expect(ValidateUtils.isPhoneByDigits('\t13812345678\n')).assertTrue();
      // An inner blank is not trimmed and fails the digit walk.
      expect(ValidateUtils.isPhoneByDigits('138 1234 567')).assertFalse();
      // A number one digit short after trimming is rejected.
      expect(ValidateUtils.isPhoneByDigits(' 1381234567 ')).assertFalse();
      // A number one digit too long after trimming is rejected.
      expect(ValidateUtils.isPhoneByDigits('138123456789 ')).assertFalse();
      // A blank only text is rejected by the empty guard.
      expect(ValidateUtils.isPhoneByDigits('   ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1800
     * @tc.name      testValidateEdge0018
     * @tc.desc      Verify isPhone and isPhoneByDigits agree on a shared
     *               matrix of valid and invalid phone inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both variants accept a plain valid number.
      expect(ValidateUtils.isPhone('13812345678')).assertTrue();
      expect(ValidateUtils.isPhoneByDigits('13812345678')).assertTrue();
      // Both variants accept another carrier prefix.
      expect(ValidateUtils.isPhone('15912345678')).assertTrue();
      expect(ValidateUtils.isPhoneByDigits('15912345678')).assertTrue();
      // Both variants accept padded blanks.
      expect(ValidateUtils.isPhone('  18612345678  ')).assertTrue();
      expect(ValidateUtils.isPhoneByDigits('  18612345678  ')).assertTrue();
      // Both variants reject the carrier digit two.
      expect(ValidateUtils.isPhone('23812345678')).assertFalse();
      expect(ValidateUtils.isPhoneByDigits('23812345678')).assertFalse();
      // Both variants reject a letter tail.
      expect(ValidateUtils.isPhone('1381234567a')).assertFalse();
      expect(ValidateUtils.isPhoneByDigits('1381234567a')).assertFalse();
      // Both variants reject missing and empty input.
      expect(ValidateUtils.isPhone('')).assertFalse();
      expect(ValidateUtils.isPhoneByDigits('')).assertFalse();
      expect(ValidateUtils.isPhone(undefined)).assertFalse();
      expect(ValidateUtils.isPhoneByDigits(undefined)).assertFalse();
      expect(ValidateUtils.isPhone(null)).assertFalse();
      expect(ValidateUtils.isPhoneByDigits(null)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_1900
     * @tc.name      testValidateEdge0019
     * @tc.desc      Verify the nullish input sweep of every text validator
     *               and the empty classification of isEmptyString.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every validator degrades undefined to false without throwing.
      expect(ValidateUtils.isPhone(undefined)).assertFalse();
      expect(ValidateUtils.isEmail(undefined)).assertFalse();
      expect(ValidateUtils.isUrl(undefined)).assertFalse();
      expect(ValidateUtils.isNumber(undefined)).assertFalse();
      expect(ValidateUtils.isHexColor(undefined)).assertFalse();
      expect(ValidateUtils.isMediaUri(undefined)).assertFalse();
      // Every validator degrades null to false as well.
      expect(ValidateUtils.isPhone(null)).assertFalse();
      expect(ValidateUtils.isEmail(null)).assertFalse();
      expect(ValidateUtils.isUrl(null)).assertFalse();
      expect(ValidateUtils.isNumber(null)).assertFalse();
      expect(ValidateUtils.isHexColor(null)).assertFalse();
      expect(ValidateUtils.isMediaUri(null)).assertFalse();
      // Every validator rejects the empty text and blank text.
      expect(ValidateUtils.isPhone('')).assertFalse();
      expect(ValidateUtils.isEmail('')).assertFalse();
      expect(ValidateUtils.isUrl('')).assertFalse();
      expect(ValidateUtils.isNumber('')).assertFalse();
      expect(ValidateUtils.isHexColor('')).assertFalse();
      expect(ValidateUtils.isMediaUri('')).assertFalse();
      expect(ValidateUtils.isPhone('   ')).assertFalse();
      expect(ValidateUtils.isEmail('   ')).assertFalse();
      expect(ValidateUtils.isUrl('   ')).assertFalse();
      expect(ValidateUtils.isNumber('   ')).assertFalse();
      expect(ValidateUtils.isHexColor('   ')).assertFalse();
      expect(ValidateUtils.isMediaUri('   ')).assertFalse();
      // The empty classifier reports true for the same four inputs.
      expect(ValidateUtils.isEmptyString(undefined)).assertTrue();
      expect(ValidateUtils.isEmptyString(null)).assertTrue();
      expect(ValidateUtils.isEmptyString('')).assertTrue();
      expect(ValidateUtils.isEmptyString('   ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_2000
     * @tc.name      testValidateEdge0020
     * @tc.desc      Verify that wide blank padding is trimmed by every
     *               validator before the authoritative check runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The phone validator trims the padding and accepts the number.
      expect(ValidateUtils.isPhone('      13812345678      ')).assertTrue();
      // The email validator trims the padding and accepts the address.
      expect(ValidateUtils.isEmail('      user@example.com      ')).assertTrue();
      // The url validator trims the padding and accepts the address.
      expect(ValidateUtils.isUrl('      https://example.com      ')).assertTrue();
      // The number validator trims the padding and accepts the value.
      expect(ValidateUtils.isNumber('      12.5      ')).assertTrue();
      // The color validator trims the padding and accepts the color.
      expect(ValidateUtils.isHexColor('      #AABBCC      ')).assertTrue();
      // The media uri validator trims the padding and accepts the uri.
      expect(ValidateUtils.isMediaUri('      file://media/1.jpg      ')).assertTrue();
      // The empty classifier still reports the padded blank as empty.
      expect(ValidateUtils.isEmptyString('      ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_2100
     * @tc.name      testValidateEdge0021
     * @tc.desc      Verify the validators reject full width digits and non
     *               ascii letters but accept unicode file names with a valid
     *               extension.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Full width digits are outside the ascii digit class.
      expect(ValidateUtils.isPhone('１３８１２３４５６７８')).assertFalse();
      // Chinese characters are outside the email local part class.
      expect(ValidateUtils.isEmail('用户@example.com')).assertFalse();
      // Chinese characters are outside the color digit class.
      expect(ValidateUtils.isHexColor('#红绿蓝XYZ')).assertFalse();
      // Chinese characters are outside the number digit class.
      expect(ValidateUtils.isNumber('一二三')).assertFalse();
      // A non ascii host label is outside the url host class.
      expect(ValidateUtils.isUrl('https://例子.com')).assertFalse();
      // A unicode file name with a valid extension is accepted.
      expect(ValidateUtils.isMediaUri('file://相册/照片.png')).assertTrue();
      // A visible unicode text is not empty.
      expect(ValidateUtils.isEmptyString('中文')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_VALEDGE_2200
     * @tc.name      testValidateEdge0022
     * @tc.desc      Verify that trailing control characters are trimmed away
     *               while inner control characters break every pattern.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValidateEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testValidateEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing newline is trimmed and the phone pattern passes.
      expect(ValidateUtils.isPhone('13812345678\n')).assertTrue();
      // An inner newline breaks the digit run.
      expect(ValidateUtils.isNumber('1\n2')).assertFalse();
      // An inner newline breaks the email local part.
      expect(ValidateUtils.isEmail('a\n@b.com')).assertFalse();
      // A run of control blanks counts as empty.
      expect(ValidateUtils.isEmptyString('\r\n\t ')).assertTrue();
      // A trailing newline is trimmed and the color pattern passes.
      expect(ValidateUtils.isHexColor('#AABBCC\n')).assertTrue();
      // Surrounding newlines are trimmed before the media prefix check.
      expect(ValidateUtils.isMediaUri('\nfile://media/1.jpg\n')).assertTrue();
      // A trailing tab is trimmed and the number pattern passes.
      expect(ValidateUtils.isNumber('12.5\t')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
