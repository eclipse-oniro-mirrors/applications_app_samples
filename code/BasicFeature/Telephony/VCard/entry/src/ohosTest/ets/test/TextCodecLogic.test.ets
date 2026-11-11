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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TextCodecUtils } from '../testutils/TextCodecUtils';

const DOMAIN: number = 0xF811;

/**
 * Encoding logic suite for TextCodecUtils. Every base64 expectation is
 * a canonical RFC 4648 test vector, every escape and quoted-printable
 * expectation was derived byte by byte from the ASCII table, and the
 * repetition expectations follow the documented separator joining rule.
 */
export default function textCodecLogicTest() {
  describe('TextCodecLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0100
     * @tc.name      testBase64Encode0001
     * @tc.desc      Verify base64Encode maps the empty text to the empty
     *               encoding and does not invent padding for it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: string = TextCodecUtils.base64Encode('');
      expect(empty).assertEqual('');
      expect(empty.length).assertEqual(0);
      expect(empty).not().assertNull();
      const blank: string = TextCodecUtils.base64Encode(' ');
      expect(blank).assertEqual('IA==');
      expect(blank.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0200
     * @tc.name      testBase64Encode0002
     * @tc.desc      Verify the RFC 4648 vectors 'f', 'fo' and 'foo' map
     *               onto 'Zg==', 'Zm8=' and 'Zm9v' exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode('f')).assertEqual('Zg==');
      expect(TextCodecUtils.base64Encode('fo')).assertEqual('Zm8=');
      expect(TextCodecUtils.base64Encode('foo')).assertEqual('Zm9v');
      const one: string = TextCodecUtils.base64Encode('f');
      expect(one.length).assertEqual(4);
      expect(one.charAt(2)).assertEqual('=');
      expect(one.charAt(3)).assertEqual('=');
      const two: string = TextCodecUtils.base64Encode('fo');
      expect(two.length).assertEqual(4);
      expect(two.charAt(3)).assertEqual('=');
      expect(two.charAt(2)).assertEqual('8');
      const three: string = TextCodecUtils.base64Encode('foo');
      expect(three.length).assertEqual(4);
      expect(three.charAt(3)).assertEqual('v');
      expect(three).assertContain('Zm9v');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0300
     * @tc.name      testBase64Encode0003
     * @tc.desc      Verify the RFC 4648 vectors 'foob', 'fooba' and
     *               'foobar' map onto 'Zm9vYg==', 'Zm9vYmE=' and the
     *               famous 'Zm9vYmFy' without padding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode('foob')).assertEqual('Zm9vYg==');
      expect(TextCodecUtils.base64Encode('fooba')).assertEqual('Zm9vYmE=');
      expect(TextCodecUtils.base64Encode('foobar')).assertEqual('Zm9vYmFy');
      const four: string = TextCodecUtils.base64Encode('foob');
      expect(four.length).assertEqual(8);
      expect(four.charAt(6)).assertEqual('=');
      const five: string = TextCodecUtils.base64Encode('fooba');
      expect(five.length).assertEqual(8);
      expect(five.charAt(7)).assertEqual('=');
      const six: string = TextCodecUtils.base64Encode('foobar');
      expect(six.length).assertEqual(8);
      expect(six.charAt(6)).assertEqual('F');
      expect(six.charAt(7)).assertEqual('y');
      expect(six).assertContain('Zm9v');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0400
     * @tc.name      testBase64Encode0004
     * @tc.desc      Verify single byte 'A' and the pairs 'AB' and 'ABC'
     *               produce the hand computed groups 'QQ==', 'QUI=' and
     *               'QUJD' with the documented padding growth.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode('A')).assertEqual('QQ==');
      expect(TextCodecUtils.base64Encode('AB')).assertEqual('QUI=');
      expect(TextCodecUtils.base64Encode('ABC')).assertEqual('QUJD');
      const single: string = TextCodecUtils.base64Encode('A');
      expect(single.charAt(0)).assertEqual('Q');
      expect(single.charAt(1)).assertEqual('Q');
      const pair: string = TextCodecUtils.base64Encode('AB');
      expect(pair.charAt(0)).assertEqual('Q');
      expect(pair.charAt(1)).assertEqual('U');
      expect(pair.charAt(2)).assertEqual('I');
      const triple: string = TextCodecUtils.base64Encode('ABC');
      expect(triple.charAt(0)).assertEqual('Q');
      expect(triple.charAt(1)).assertEqual('U');
      expect(triple.charAt(2)).assertEqual('J');
      expect(triple.charAt(3)).assertEqual('D');
      const noPadding: boolean = triple.indexOf('=') < 0;
      expect(noPadding).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0500
     * @tc.name      testBase64Encode0005
     * @tc.desc      Verify the mixed case words 'Hello' and the classic
     *               phrase 'hello world' map onto 'SGVsbG8=' and
     *               'aGVsbG8gd29ybGQ=' including the escaped space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode('Hello')).assertEqual('SGVsbG8=');
      expect(TextCodecUtils.base64Encode('hello world')).assertEqual('aGVsbG8gd29ybGQ=');
      const word: string = TextCodecUtils.base64Encode('Hello');
      expect(word.length).assertEqual(8);
      expect(word.charAt(0)).assertEqual('S');
      expect(word.charAt(7)).assertEqual('=');
      const phrase: string = TextCodecUtils.base64Encode('hello world');
      expect(phrase.length).assertEqual(16);
      expect(phrase).assertContain('d29y');
      expect(phrase).assertContain('bG8g');
      expect(phrase.charAt(15)).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0600
     * @tc.name      testBase64Encode0006
     * @tc.desc      Verify lowercase, digit and five byte inputs produce
     *               'YQ==', 'YWI=', 'YWJj', 'YWJjZGU=', 'YWJjZGVm',
     *               'MTIz' and 'dGVzdA==' respectively.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode('a')).assertEqual('YQ==');
      expect(TextCodecUtils.base64Encode('ab')).assertEqual('YWI=');
      expect(TextCodecUtils.base64Encode('abc')).assertEqual('YWJj');
      expect(TextCodecUtils.base64Encode('abcde')).assertEqual('YWJjZGU=');
      expect(TextCodecUtils.base64Encode('abcdef')).assertEqual('YWJjZGVm');
      expect(TextCodecUtils.base64Encode('123')).assertEqual('MTIz');
      expect(TextCodecUtils.base64Encode('test')).assertEqual('dGVzdA==');
      const digits: string = TextCodecUtils.base64Encode('123');
      expect(digits).assertContain('MTIz');
      const five: string = TextCodecUtils.base64Encode('abcde');
      expect(five.length).assertEqual(8);
      expect(five).assertContain('YWJj');
      expect(five).assertContain('ZGU=');
      const word: string = TextCodecUtils.base64Encode('test');
      expect(word).assertContain('dGVz');
      expect(word.charAt(6)).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0700
     * @tc.name      testBase64Encode0007
     * @tc.desc      Verify any char code above 127 rejects the whole
     *               conversion with the empty string, even when the
     *               offending character appears after ASCII letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testBase64Encode0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testBase64Encode0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const cjk: string = TextCodecUtils.base64Encode('中');
      expect(cjk).assertEqual('');
      expect(cjk.length).assertEqual(0);
      const mixed: string = TextCodecUtils.base64Encode('a中');
      expect(mixed).assertEqual('');
      const accented: string = TextCodecUtils.base64Encode('caf\u00E9');
      expect(accented).assertEqual('');
      expect(TextCodecUtils.base64Encode('abc')).assertEqual('YWJj');
      expect(TextCodecUtils.base64Encode('vCard')).assertEqual('dkNhcmQ=');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0800
     * @tc.name      testVcardEscape0001
     * @tc.desc      Verify texts without any of the four escapable
     *               characters pass through vcardEscape unchanged,
     *               including spaces, dots and digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardEscape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardEscape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.vcardEscape('plain')).assertEqual('plain');
      expect(TextCodecUtils.vcardEscape('')).assertEqual('');
      expect(TextCodecUtils.vcardEscape('abc DEF 123')).assertEqual('abc DEF 123');
      expect(TextCodecUtils.vcardEscape('vCard')).assertEqual('vCard');
      expect(TextCodecUtils.vcardEscape('OpenHarmony')).assertEqual('OpenHarmony');
      const spaced: string = TextCodecUtils.vcardEscape('two  spaces');
      expect(spaced).assertEqual('two  spaces');
      expect(spaced.length).assertEqual(11);
      expect(TextCodecUtils.vcardEscape('a.b:c?d!e')).assertEqual('a.b:c?d!e');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_0900
     * @tc.name      testVcardEscape0002
     * @tc.desc      Verify semicolons and commas each grow into their
     *               backslash prefixed two character form, including
     *               consecutive punctuation runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardEscape0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardEscape0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.vcardEscape('a;b')).assertEqual('a\\;b');
      expect(TextCodecUtils.vcardEscape('a,b')).assertEqual('a\\,b');
      expect(TextCodecUtils.vcardEscape('x;;y')).assertEqual('x\\;\\;y');
      expect(TextCodecUtils.vcardEscape('x,,y')).assertEqual('x\\,\\,y');
      expect(TextCodecUtils.vcardEscape(';')).assertEqual('\\;');
      expect(TextCodecUtils.vcardEscape(',')).assertEqual('\\,');
      const semi: string = TextCodecUtils.vcardEscape('a;b');
      expect(semi.length).assertEqual(4);
      expect(semi.charAt(1)).assertEqual('\\');
      expect(semi.charAt(2)).assertEqual(';');
      const compound: string = TextCodecUtils.vcardEscape('a;b,c');
      expect(compound).assertEqual('a\\;b\\,c');
      expect(compound.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1000
     * @tc.name      testVcardEscape0003
     * @tc.desc      Verify a literal backslash doubles first in the
     *               escaping order so already escaped texts keep their
     *               backslash count deterministic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardEscape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardEscape0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.vcardEscape('a\\b')).assertEqual('a\\\\b');
      expect(TextCodecUtils.vcardEscape('\\')).assertEqual('\\\\');
      expect(TextCodecUtils.vcardEscape('\\\\')).assertEqual('\\\\\\\\');
      const single: string = TextCodecUtils.vcardEscape('a\\b');
      expect(single.length).assertEqual(4);
      expect(single.charAt(1)).assertEqual('\\');
      expect(single.charAt(2)).assertEqual('\\');
      expect(single.charAt(3)).assertEqual('b');
      const doubled: string = TextCodecUtils.vcardEscape('a\\\\b');
      expect(doubled.length).assertEqual(6);
      expect(doubled.charAt(1)).assertEqual('\\');
      expect(doubled.charAt(4)).assertEqual('\\');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1100
     * @tc.name      testVcardEscape0004
     * @tc.desc      Verify the newline character becomes the literal two
     *               character backslash-n sequence and plain line text
     *               around it stays untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardEscape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardEscape0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.vcardEscape('a\nb')).assertEqual('a\\nb');
      expect(TextCodecUtils.vcardEscape('line1\nline2')).assertEqual('line1\\nline2');
      expect(TextCodecUtils.vcardEscape('\n')).assertEqual('\\n');
      const split: string = TextCodecUtils.vcardEscape('a\nb');
      expect(split.length).assertEqual(4);
      expect(split.charAt(1)).assertEqual('\\');
      expect(split.charAt(2)).assertEqual('n');
      expect(split.charAt(3)).assertEqual('b');
      const twoLines: string = TextCodecUtils.vcardEscape('line1\nline2');
      expect(twoLines.length).assertEqual(12);
      expect(twoLines).assertContain('\\n');
      expect(twoLines).assertContain('line1');
      expect(twoLines).assertContain('line2');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1200
     * @tc.name      testVcardEscape0005
     * @tc.desc      Verify the combined matrix where semicolon, comma,
     *               newline and backslash all appear in one text and
     *               every one of them is rewritten in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardEscape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardEscape0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.vcardEscape('x;y,z\nw\\v')).assertEqual('x\\;y\\,z\\nw\\\\v');
      const combined: string = TextCodecUtils.vcardEscape('x;y,z\nw\\v');
      expect(combined.length).assertEqual(13);
      expect(combined.charAt(1)).assertEqual('\\');
      expect(combined.charAt(2)).assertEqual(';');
      expect(combined.charAt(4)).assertEqual('\\');
      expect(combined.charAt(5)).assertEqual(',');
      expect(combined.charAt(7)).assertEqual('\\');
      expect(combined.charAt(8)).assertEqual('n');
      expect(combined.charAt(10)).assertEqual('\\');
      expect(combined.charAt(11)).assertEqual('\\');
      expect(TextCodecUtils.vcardEscape('a;b,c\\d')).assertEqual('a\\;b\\,c\\\\d');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1300
     * @tc.name      testQuotedPrintable0001
     * @tc.desc      Verify purely alphanumeric texts pass through
     *               quotedPrintableEncode unchanged, including the
     *               empty text and mixed case words.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('abc')).assertEqual('abc');
      expect(TextCodecUtils.quotedPrintableEncode('')).assertEqual('');
      expect(TextCodecUtils.quotedPrintableEncode('vCard123')).assertEqual('vCard123');
      expect(TextCodecUtils.quotedPrintableEncode('OpenHarmony2026')).assertEqual('OpenHarmony2026');
      const word: string = TextCodecUtils.quotedPrintableEncode('vCard123');
      expect(word.length).assertEqual(8);
      expect(word).assertContain('vCard');
      expect(word.charAt(5)).assertEqual('1');
      const lower: string = TextCodecUtils.quotedPrintableEncode('xyz');
      expect(lower).assertEqual('xyz');
      const upper: string = TextCodecUtils.quotedPrintableEncode('XYZ');
      expect(upper).assertEqual('XYZ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1400
     * @tc.name      testQuotedPrintable0002
     * @tc.desc      Verify the space byte becomes '=20' in every
     *               position, including leading and doubled spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('a b')).assertEqual('a=20b');
      expect(TextCodecUtils.quotedPrintableEncode('hello world')).assertEqual('hello=20world');
      expect(TextCodecUtils.quotedPrintableEncode('  ')).assertEqual('=20=20');
      expect(TextCodecUtils.quotedPrintableEncode(' ')).assertEqual('=20');
      const inner: string = TextCodecUtils.quotedPrintableEncode('a b');
      expect(inner.length).assertEqual(5);
      expect(inner.charAt(1)).assertEqual('=');
      expect(inner.charAt(2)).assertEqual('2');
      expect(inner.charAt(3)).assertEqual('0');
      const phrase: string = TextCodecUtils.quotedPrintableEncode('hello world');
      expect(phrase).assertContain('=20');
      expect(phrase.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1500
     * @tc.name      testQuotedPrintable0003
     * @tc.desc      Verify the structural punctuation '=' ';' and ','
     *               map onto '=3D', '=3B' and '=2C' with uppercase hex.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('a=b')).assertEqual('a=3Db');
      expect(TextCodecUtils.quotedPrintableEncode('a;b')).assertEqual('a=3Bb');
      expect(TextCodecUtils.quotedPrintableEncode('a,b')).assertEqual('a=2Cb');
      expect(TextCodecUtils.quotedPrintableEncode('=')).assertEqual('=3D');
      const eq: string = TextCodecUtils.quotedPrintableEncode('a=b');
      expect(eq.length).assertEqual(5);
      expect(eq.charAt(1)).assertEqual('=');
      expect(eq.charAt(2)).assertEqual('3');
      expect(eq.charAt(3)).assertEqual('D');
      const semi: string = TextCodecUtils.quotedPrintableEncode('a;b');
      expect(semi).assertContain('3B');
      const comma: string = TextCodecUtils.quotedPrintableEncode('a,b');
      expect(comma).assertContain('2C');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1600
     * @tc.name      testQuotedPrintable0004
     * @tc.desc      Verify the control bytes LF and CR map onto '=0A'
     *               and '=0D' and a CRLF pair renders as two groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('a\nb')).assertEqual('a=0Ab');
      expect(TextCodecUtils.quotedPrintableEncode('a\rb')).assertEqual('a=0Db');
      expect(TextCodecUtils.quotedPrintableEncode('a\r\nb')).assertEqual('a=0D=0Ab');
      const lf: string = TextCodecUtils.quotedPrintableEncode('a\nb');
      expect(lf.length).assertEqual(5);
      expect(lf.charAt(1)).assertEqual('=');
      expect(lf.charAt(2)).assertEqual('0');
      expect(lf.charAt(3)).assertEqual('A');
      const crlf: string = TextCodecUtils.quotedPrintableEncode('a\r\nb');
      expect(crlf.length).assertEqual(8);
      expect(crlf).assertContain('0D');
      expect(crlf).assertContain('0A');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1700
     * @tc.name      testQuotedPrintable0005
     * @tc.desc      Verify underscore, dot, dash and at-sign map onto
     *               '=5F', '=2E', '=2D' and '=40' respectively.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('a_b')).assertEqual('a=5Fb');
      expect(TextCodecUtils.quotedPrintableEncode('a.b')).assertEqual('a=2Eb');
      expect(TextCodecUtils.quotedPrintableEncode('a-b')).assertEqual('a=2Db');
      expect(TextCodecUtils.quotedPrintableEncode('a@b')).assertEqual('a=40b');
      const under: string = TextCodecUtils.quotedPrintableEncode('a_b');
      expect(under).assertContain('5F');
      expect(under.length).assertEqual(5);
      const dotted: string = TextCodecUtils.quotedPrintableEncode('a.b');
      expect(dotted).assertContain('2E');
      const dashed: string = TextCodecUtils.quotedPrintableEncode('a-b');
      expect(dashed).assertContain('2D');
      const mail: string = TextCodecUtils.quotedPrintableEncode('a@b');
      expect(mail).assertContain('40');
      expect(TextCodecUtils.quotedPrintableEncode('Test_Value.1')).assertEqual('Test=5FValue=2E1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1800
     * @tc.name      testQuotedPrintable0006
     * @tc.desc      Verify non ASCII input rejects with '' while the
     *               punctuation samples '~!?#' and '+/' produce the
     *               uppercase groups '=7E=21=3F=23' and '=2B=2F'.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testQuotedPrintable0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testQuotedPrintable0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('中')).assertEqual('');
      expect(TextCodecUtils.quotedPrintableEncode('a\u00E9b')).assertEqual('');
      expect(TextCodecUtils.quotedPrintableEncode('abc')).assertEqual('abc');
      const bangs: string = TextCodecUtils.quotedPrintableEncode('~!?#');
      expect(bangs).assertEqual('=7E=21=3F=23');
      expect(bangs.length).assertEqual(12);
      expect(bangs).assertContain('7E');
      expect(bangs).assertContain('21');
      expect(bangs).assertContain('3F');
      expect(bangs).assertContain('23');
      const slashPlus: string = TextCodecUtils.quotedPrintableEncode('+/');
      expect(slashPlus).assertEqual('=2B=2F');
      expect(slashPlus).assertContain('2B');
      expect(slashPlus).assertContain('2F');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_1900
     * @tc.name      testRepeatConcat0001
     * @tc.desc      Verify repeatConcat joins three, one and two copies
     *               with the requested separators exactly as documented.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRepeatConcat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRepeatConcat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.repeatConcat('ab', 3, '-')).assertEqual('ab-ab-ab');
      expect(TextCodecUtils.repeatConcat('x', 1, ',')).assertEqual('x');
      expect(TextCodecUtils.repeatConcat('ab,cd', 2, '|')).assertEqual('ab,cd|ab,cd');
      const tripled: string = TextCodecUtils.repeatConcat('ab', 3, '-');
      expect(tripled.length).assertEqual(8);
      expect(tripled.charAt(2)).assertEqual('-');
      expect(tripled.charAt(5)).assertEqual('-');
      const single: string = TextCodecUtils.repeatConcat('x', 1, ',');
      expect(single.length).assertEqual(1);
      expect(single).assertContain('x');
      const twice: string = TextCodecUtils.repeatConcat('ab,cd', 2, '|');
      expect(twice.length).assertEqual(11);
      expect(twice.charAt(5)).assertEqual('|');
      expect(TextCodecUtils.repeatConcat('zz', 4, '')).assertEqual('zzzzzzzz');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2000
     * @tc.name      testRepeatConcat0002
     * @tc.desc      Verify non positive counts yield '' while an empty
     *               text still emits separators between empty copies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRepeatConcat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRepeatConcat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.repeatConcat('x', 0, ',')).assertEqual('');
      expect(TextCodecUtils.repeatConcat('x', -2, ',')).assertEqual('');
      expect(TextCodecUtils.repeatConcat('', 3, '-')).assertEqual('--');
      const zero: string = TextCodecUtils.repeatConcat('x', 0, ',');
      expect(zero.length).assertEqual(0);
      const negative: string = TextCodecUtils.repeatConcat('x', -2, ',');
      expect(negative).not().assertNull();
      const emptyText: string = TextCodecUtils.repeatConcat('', 3, '-');
      expect(emptyText.length).assertEqual(2);
      expect(emptyText.charAt(0)).assertEqual('-');
      expect(emptyText.charAt(1)).assertEqual('-');
      const once: string = TextCodecUtils.repeatConcat('', 1, '-');
      expect(once).assertEqual('');
      expect(once.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2100
     * @tc.name      testBase64Encode0008
     * @tc.desc      Verify single control and punctuation bytes encode
     *               to 'IA==' for space, 'CQ==' for tab and 'fg==' for
     *               tilde with correct six bit groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode(' ')).assertEqual('IA==');
      expect(TextCodecUtils.base64Encode('\t')).assertEqual('CQ==');
      expect(TextCodecUtils.base64Encode('~')).assertEqual('fg==');
      const space: string = TextCodecUtils.base64Encode(' ');
      expect(space.charAt(0)).assertEqual('I');
      expect(space.charAt(1)).assertEqual('A');
      const tab: string = TextCodecUtils.base64Encode('\t');
      expect(tab.charAt(0)).assertEqual('C');
      expect(tab.charAt(1)).assertEqual('Q');
      const tilde: string = TextCodecUtils.base64Encode('~');
      expect(tilde.charAt(0)).assertEqual('f');
      expect(tilde.charAt(1)).assertEqual('g');
      expect(space.length).assertEqual(4);
      expect(tilde.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2200
     * @tc.name      testBase64Encode0009
     * @tc.desc      Verify the four byte word 'abcd' encodes to the
     *               hand computed 'YWJjZA==' with a single pad sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode('abcd')).assertEqual('YWJjZA==');
      const encoded: string = TextCodecUtils.base64Encode('abcd');
      expect(encoded.length).assertEqual(8);
      expect(encoded).assertContain('YWJj');
      expect(encoded.charAt(4)).assertEqual('Z');
      expect(encoded.charAt(5)).assertEqual('A');
      expect(encoded.charAt(6)).assertEqual('=');
      expect(encoded.charAt(7)).assertEqual('=');
      expect(TextCodecUtils.base64Encode('abcd').charAt(4)).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2300
     * @tc.name      testBase64Encode0010
     * @tc.desc      Verify a doubled twelve character input encodes to
     *               the concatenation of the two half encodings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const doubled: string = TextCodecUtils.base64Encode('foobarfoobar');
      expect(doubled).assertEqual('Zm9vYmFyZm9vYmFy');
      expect(doubled.length).assertEqual(16);
      expect(doubled).assertContain('Zm9vYmFy');
      const half: string = TextCodecUtils.base64Encode('foobar');
      expect(half + half).assertEqual(doubled);
      const twiceAbc: string = TextCodecUtils.base64Encode('abcabc');
      expect(twiceAbc).assertEqual('YWJjYWJj');
      expect(TextCodecUtils.base64Encode('abc') + TextCodecUtils.base64Encode('abc')).assertEqual(twiceAbc);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2400
     * @tc.name      testVcardEscape0006
     * @tc.desc      Verify a multi line text escapes every newline into
     *               the literal backslash-n sequence and keeps length
     *               growth equal to two per newline.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardEscape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardEscape0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.vcardEscape('a\nb\nc')).assertEqual('a\\nb\\nc');
      const escaped: string = TextCodecUtils.vcardEscape('a\nb\nc');
      expect(escaped.length).assertEqual(7);
      expect(escaped.charAt(1)).assertEqual('\\');
      expect(escaped.charAt(2)).assertEqual('n');
      expect(escaped.charAt(4)).assertEqual('\\');
      expect(escaped.charAt(5)).assertEqual('n');
      expect(TextCodecUtils.vcardEscape('\n\n\n')).assertEqual('\\n\\n\\n');
      expect(TextCodecUtils.vcardEscape('\n\n\n').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2500
     * @tc.name      testVcardEscape0007
     * @tc.desc      Verify re-escaping an already escaped text doubles
     *               the backslashes and re-escapes the punctuation so
     *               the escape operation is not idempotent by design.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardEscape0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardEscape0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const once: string = TextCodecUtils.vcardEscape('a\\;b');
      expect(once.length).assertEqual(6);
      expect(once.charAt(0)).assertEqual('a');
      expect(once.charAt(1)).assertEqual('\\');
      expect(once.charAt(4)).assertEqual(';');
      expect(once.charAt(5)).assertEqual('b');
      const twice: string = TextCodecUtils.vcardEscape(once);
      expect(twice.length).assertEqual(10);
      expect(twice.charAt(0)).assertEqual('a');
      expect(twice.charAt(7)).assertEqual('\\');
      expect(twice.charAt(8)).assertEqual(';');
      expect(twice.charAt(9)).assertEqual('b');
      expect(TextCodecUtils.vcardEscape('\\')).assertEqual('\\\\');
      expect(TextCodecUtils.vcardEscape('\\\\').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2600
     * @tc.name      testQuotedPrintable0007
     * @tc.desc      Verify mixed space and structural bytes encode in
     *               one pass as 'a=20b=3Dc' and control bytes render
     *               as 'x=0Ay=0Dz' in sequence.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('a b=c')).assertEqual('a=20b=3Dc');
      expect(TextCodecUtils.quotedPrintableEncode('x\ny\rz')).assertEqual('x=0Ay=0Dz');
      const mixed: string = TextCodecUtils.quotedPrintableEncode('a b=c');
      expect(mixed.length).assertEqual(9);
      expect(mixed).assertContain('=20');
      expect(mixed).assertContain('=3D');
      const controls: string = TextCodecUtils.quotedPrintableEncode('x\ny\rz');
      expect(controls.length).assertEqual(9);
      expect(controls).assertContain('=0A');
      expect(controls).assertContain('=0D');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2700
     * @tc.name      testQuotedPrintable0008
     * @tc.desc      Verify a mail like sample encodes the at-sign and
     *               dot as '=40' and '=2E' keeping letters as-is.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('user@example.com')).assertEqual('user=40example=2Ecom');
      const mail: string = TextCodecUtils.quotedPrintableEncode('user@example.com');
      expect(mail.length).assertEqual(20);
      expect(mail).assertContain('=40');
      expect(mail).assertContain('=2E');
      expect(mail).assertContain('user');
      expect(mail).assertContain('example');
      expect(mail).assertContain('com');
      expect(mail.charAt(4)).assertEqual('=');
      expect(TextCodecUtils.quotedPrintableEncode('call:123')).assertEqual('call=3A123');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2800
     * @tc.name      testRepeatConcat0003
     * @tc.desc      Verify repeatConcat builds fold stress inputs of the
     *               exact requested length and joins with dash and
     *               space separators as documented.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRepeatConcat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRepeatConcat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const block: string = TextCodecUtils.repeatConcat('ab', 10, '');
      expect(block.length).assertEqual(20);
      expect(block).assertEqual('abababababababababab');
      const dashed: string = TextCodecUtils.repeatConcat('x', 5, '-');
      expect(dashed).assertEqual('x-x-x-x-x');
      expect(dashed.length).assertEqual(9);
      const spaced: string = TextCodecUtils.repeatConcat('hi', 3, ' ');
      expect(spaced).assertEqual('hi hi hi');
      expect(spaced.length).assertEqual(8);
      expect(spaced.charAt(2)).assertEqual(' ');
      expect(spaced.charAt(5)).assertEqual(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_2900
     * @tc.name      testRepeatConcat0004
     * @tc.desc      Verify a one time repeat returns its input verbatim
     *               and repeated joined blocks recombine into the same
     *               structure as a direct repeat.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRepeatConcat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRepeatConcat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.repeatConcat('ab', 2, '-')).assertEqual('ab-ab');
      const once: string = TextCodecUtils.repeatConcat('ab-ab', 1, '|');
      expect(once).assertEqual('ab-ab');
      const twice: string = TextCodecUtils.repeatConcat('ab-ab', 2, '|');
      expect(twice).assertEqual('ab-ab|ab-ab');
      expect(twice.length).assertEqual(11);
      expect(once.length).assertEqual(5);
      expect(TextCodecUtils.repeatConcat('ab', 4, '-')).assertEqual('ab-ab-ab-ab');
      expect(TextCodecUtils.repeatConcat('ab', 4, '-').length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_3000
     * @tc.name      testBase64Encode0011
     * @tc.desc      Verify encoded length follows the RFC padding rule:
     *               groups of three bytes map onto four characters and
     *               each dangling byte adds one pad character pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Encode0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Encode('').length).assertEqual(0);
      expect(TextCodecUtils.base64Encode('a').length).assertEqual(4);
      expect(TextCodecUtils.base64Encode('ab').length).assertEqual(4);
      expect(TextCodecUtils.base64Encode('abc').length).assertEqual(4);
      expect(TextCodecUtils.base64Encode('abcd').length).assertEqual(8);
      expect(TextCodecUtils.base64Encode('abcde').length).assertEqual(8);
      expect(TextCodecUtils.base64Encode('abcdef').length).assertEqual(8);
      expect(TextCodecUtils.base64Encode('abcdefg').length).assertEqual(12);
      expect(TextCodecUtils.base64Encode('abcdefgh').length).assertEqual(12);
      expect(TextCodecUtils.base64Encode('abcdefghi').length).assertEqual(12);
      expect(TextCodecUtils.base64Encode('abcdefghi')).assertEqual('YWJjZGVmZ2hp');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CODE_3100
     * @tc.name      testQuotedPrintable0009
     * @tc.desc      Verify repeated spaces and an inner equals sign
     *               encode into consecutive '=20' and '=3D' groups of
     *               the exact documented lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testQuotedPrintable0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testQuotedPrintable0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.quotedPrintableEncode('a b c')).assertEqual('a=20b=20c');
      expect(TextCodecUtils.quotedPrintableEncode('v=Card')).assertEqual('v=3DCard');
      const spaced: string = TextCodecUtils.quotedPrintableEncode('a b c');
      expect(spaced.length).assertEqual(9);
      expect(spaced.charAt(1)).assertEqual('=');
      expect(spaced.charAt(5)).assertEqual('=');
      expect(spaced).assertContain('a=20b');
      expect(spaced).assertContain('b=20c');
      const inner: string = TextCodecUtils.quotedPrintableEncode('v=Card');
      expect(inner.length).assertEqual(8);
      expect(inner).assertContain('=3D');
      expect(inner.charAt(1)).assertEqual('=');
      expect(inner.charAt(7)).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
