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
 * Decoding and round trip suite for TextCodecUtils. The decode cases
 * reuse the canonical RFC 4648 vectors and an exhaustive rejection
 * matrix for malformed inputs; the round trip cases prove that every
 * encoder and its inverse restore the original text exactly.
 */
export default function codecDecodeLogicTest() {
  describe('CodecDecodeLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0100
     * @tc.name      testBase64Decode0001
     * @tc.desc      Verify the RFC 4648 padded and unpadded vectors
     *               'Zm9vYmFy', 'Zg==', 'Zm8=' and 'Zm9v' decode to
     *               foobar, f, fo and foo.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('Zm9vYmFy')).assertEqual('foobar');
      expect(TextCodecUtils.base64Decode('Zg==')).assertEqual('f');
      expect(TextCodecUtils.base64Decode('Zm8=')).assertEqual('fo');
      expect(TextCodecUtils.base64Decode('Zm9v')).assertEqual('foo');
      const padded: string = TextCodecUtils.base64Decode('Zg==');
      expect(padded.length).assertEqual(1);
      expect(padded.charAt(0)).assertEqual('f');
      const unpadded: string = TextCodecUtils.base64Decode('Zm9v');
      expect(unpadded.length).assertEqual(3);
      expect(unpadded).assertContain('foo');
      expect(TextCodecUtils.base64Decode('Zm9vYmFy').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0200
     * @tc.name      testBase64Decode0002
     * @tc.desc      Verify the remaining RFC vectors 'Zm9vYg==',
     *               'Zm9vYmE=' decode to foob and fooba, and the letter
     *               group 'QQ==', 'QUI=', 'QUJD' decode to A, AB, ABC.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('Zm9vYg==')).assertEqual('foob');
      expect(TextCodecUtils.base64Decode('Zm9vYmE=')).assertEqual('fooba');
      expect(TextCodecUtils.base64Decode('QQ==')).assertEqual('A');
      expect(TextCodecUtils.base64Decode('QUI=')).assertEqual('AB');
      expect(TextCodecUtils.base64Decode('QUJD')).assertEqual('ABC');
      const ab: string = TextCodecUtils.base64Decode('QUI=');
      expect(ab.length).assertEqual(2);
      expect(ab.charAt(0)).assertEqual('A');
      expect(ab.charAt(1)).assertEqual('B');
      const abc: string = TextCodecUtils.base64Decode('QUJD');
      expect(abc.length).assertEqual(3);
      expect(abc).assertContain('ABC');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0300
     * @tc.name      testBase64Decode0003
     * @tc.desc      Verify the mixed case and digit vectors 'SGVsbG8=',
     *               'aGVsbG8gd29ybGQ=', 'MTIz' and 'dGVzdA==' decode to
     *               their original words including the space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('SGVsbG8=')).assertEqual('Hello');
      expect(TextCodecUtils.base64Decode('aGVsbG8gd29ybGQ=')).assertEqual('hello world');
      expect(TextCodecUtils.base64Decode('MTIz')).assertEqual('123');
      expect(TextCodecUtils.base64Decode('dGVzdA==')).assertEqual('test');
      const phrase: string = TextCodecUtils.base64Decode('aGVsbG8gd29ybGQ=');
      expect(phrase.length).assertEqual(11);
      expect(phrase).assertContain('hello');
      expect(phrase).assertContain('world');
      expect(phrase.charAt(5)).assertEqual(' ');
      const digits: string = TextCodecUtils.base64Decode('MTIz');
      expect(digits.length).assertEqual(3);
      expect(digits.charAt(0)).assertEqual('1');
      expect(digits.charAt(2)).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0400
     * @tc.name      testBase64Decode0004
     * @tc.desc      Verify characters outside the base64 alphabet such
     *               as punctuation or CJK reject the whole input with
     *               '' even when the length is a multiple of four.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testBase64Decode0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testBase64Decode0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('ABCD!')).assertEqual('');
      expect(TextCodecUtils.base64Decode('****')).assertEqual('');
      expect(TextCodecUtils.base64Decode('Zg!=')).assertEqual('');
      expect(TextCodecUtils.base64Decode('中文中文')).assertEqual('');
      expect(TextCodecUtils.base64Decode('----')).assertEqual('');
      expect(TextCodecUtils.base64Decode('....')).assertEqual('');
      const bad: string = TextCodecUtils.base64Decode('ABCD!');
      expect(bad.length).assertEqual(0);
      expect(bad).not().assertNull();
      expect(TextCodecUtils.base64Decode('ABCD')).assertEqual(String.fromCharCode(0, 16, 131));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0500
     * @tc.name      testBase64Decode0005
     * @tc.desc      Verify every length that is not a multiple of four
     *               fails immediately regardless of the characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('A')).assertEqual('');
      expect(TextCodecUtils.base64Decode('AB')).assertEqual('');
      expect(TextCodecUtils.base64Decode('ABC')).assertEqual('');
      expect(TextCodecUtils.base64Decode('Zg===')).assertEqual('');
      expect(TextCodecUtils.base64Decode('Zg==A')).assertEqual('');
      expect(TextCodecUtils.base64Decode('Zm9vYmF')).assertEqual('');
      const five: string = TextCodecUtils.base64Decode('Zg===');
      expect(five.length).assertEqual(0);
      const six: string = TextCodecUtils.base64Decode('Zg==A');
      expect(six).not().assertNull();
      expect(six.length).assertEqual(0);
      expect(TextCodecUtils.base64Decode('Zg==').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0600
     * @tc.name      testBase64Decode0006
     * @tc.desc      Verify '=' is only accepted as a suffix: padding in
     *               the middle or a four pad input rejects with ''.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('Z==g')).assertEqual('');
      expect(TextCodecUtils.base64Decode('Zg=Z')).assertEqual('');
      expect(TextCodecUtils.base64Decode('====')).assertEqual('');
      expect(TextCodecUtils.base64Decode('=Zg=')).assertEqual('');
      const midPad: string = TextCodecUtils.base64Decode('Z==g');
      expect(midPad.length).assertEqual(0);
      const allPad: string = TextCodecUtils.base64Decode('====');
      expect(allPad).not().assertNull();
      expect(allPad).assertEqual('');
      expect(TextCodecUtils.base64Decode('QQ==').charAt(0)).assertEqual('A');
      expect(TextCodecUtils.base64Decode('Qg==').charAt(0)).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0700
     * @tc.name      testBase64Decode0007
     * @tc.desc      Verify the empty encoding decodes to the empty text
     *               and the long unpadded words decode correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('')).assertEqual('');
      expect(TextCodecUtils.base64Decode('YWJj')).assertEqual('abc');
      expect(TextCodecUtils.base64Decode('YWJjZGVm')).assertEqual('abcdef');
      const empty: string = TextCodecUtils.base64Decode('');
      expect(empty.length).assertEqual(0);
      expect(empty).not().assertNull();
      const six: string = TextCodecUtils.base64Decode('YWJjZGVm');
      expect(six.length).assertEqual(6);
      expect(six.charAt(0)).assertEqual('a');
      expect(six.charAt(5)).assertEqual('f');
      expect(six).assertContain('abc');
      expect(six).assertContain('def');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0800
     * @tc.name      testBase64RoundTrip0001
     * @tc.desc      Verify decode(encode(text)) restores plain ASCII
     *               sample texts of length one up to ten exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64RoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64RoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: string[] = ['vCard', 'hello world', 'A', 'ab', '1234567890', 'OpenHarmony'];
      for (let i: number = 0; i < samples.length; i++) {
        const encoded: string = TextCodecUtils.base64Encode(samples[i]);
        expect(encoded.length).assertLarger(0);
        const decoded: string = TextCodecUtils.base64Decode(encoded);
        expect(decoded).assertEqual(samples[i]);
        expect(decoded.length).assertEqual(samples[i].length);
      }
      expect(TextCodecUtils.base64Encode('A').length).assertEqual(4);
      expect(TextCodecUtils.base64Encode('1234567890').length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_0900
     * @tc.name      testBase64RoundTrip0002
     * @tc.desc      Verify decode(encode(text)) restores punctuation,
     *               control byte samples and the vCard structural trio.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64RoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64RoundTrip0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: string[] = ['+/=', '~!?', '@#$%^&*()', 'a\tb', 'BEGIN:VCARD'];
      for (let i: number = 0; i < samples.length; i++) {
        const encoded: string = TextCodecUtils.base64Encode(samples[i]);
        expect(encoded.length).assertLarger(0);
        const decoded: string = TextCodecUtils.base64Decode(encoded);
        expect(decoded).assertEqual(samples[i]);
      }
      expect(TextCodecUtils.base64Encode('+/=')).assertEqual('Ky89');
      expect(TextCodecUtils.base64Decode('Ky89')).assertEqual('+/=');
      expect(TextCodecUtils.base64Encode('~!?')).assertEqual('fiE/');
      expect(TextCodecUtils.base64Decode('fiE/')).assertEqual('~!?');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1000
     * @tc.name      testVcardRoundTrip0001
     * @tc.desc      Verify unescape(escape(text)) restores every sample
     *               containing none, some and all of the escapable
     *               characters exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: string[] = ['plain', 'a;b', 'a,b', 'a\\b', 'a\nb', 'x;y,z\nw\\v', ''];
      for (let i: number = 0; i < samples.length; i++) {
        const escaped: string = TextCodecUtils.vcardEscape(samples[i]);
        const restored: string = TextCodecUtils.vcardUnescape(escaped);
        expect(restored).assertEqual(samples[i]);
      }
      const escapedCompound: string = TextCodecUtils.vcardEscape('x;y,z\nw\\v');
      expect(escapedCompound).assertEqual('x\\;y\\,z\\nw\\\\v');
      expect(escapedCompound.length).assertEqual(13);
      expect(TextCodecUtils.vcardUnescape('x\\;y\\,z\\nw\\\\v')).assertEqual('x;y,z\nw\\v');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1100
     * @tc.name      testVcardRoundTrip0002
     * @tc.desc      Verify vcardUnescape maps every escaped pair back to
     *               its raw character while unknown and dangling
     *               escape sequences stay verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardRoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardRoundTrip0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.vcardUnescape('a\\;b')).assertEqual('a;b');
      expect(TextCodecUtils.vcardUnescape('a\\,b')).assertEqual('a,b');
      expect(TextCodecUtils.vcardUnescape('a\\nb')).assertEqual('a\nb');
      expect(TextCodecUtils.vcardUnescape('a\\\\b')).assertEqual('a\\b');
      expect(TextCodecUtils.vcardUnescape('a\\')).assertEqual('a\\');
      expect(TextCodecUtils.vcardUnescape('\\x')).assertEqual('\\x');
      expect(TextCodecUtils.vcardUnescape('plain')).assertEqual('plain');
      const restored: string = TextCodecUtils.vcardUnescape('a\\nb');
      expect(restored.length).assertEqual(3);
      expect(restored.charAt(1)).assertEqual('\n');
      const unknown: string = TextCodecUtils.vcardUnescape('\\x');
      expect(unknown.length).assertEqual(2);
      expect(unknown.charAt(0)).assertEqual('\\');
      expect(unknown.charAt(1)).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1200
     * @tc.name      testUnfoldText0001
     * @tc.desc      Verify the CRLF-space folding marker is removed so
     *               folded physical lines rejoin into one logical line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUnfoldText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testUnfoldText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.unfoldText('AB\r\n CD')).assertEqual('ABCD');
      expect(TextCodecUtils.unfoldText('A\r\n B\r\n C')).assertEqual('ABC');
      expect(TextCodecUtils.unfoldText('begin\r\n end')).assertEqual('beginend');
      const unfolded: string = TextCodecUtils.unfoldText('A\r\n B\r\n C');
      expect(unfolded.length).assertEqual(3);
      expect(unfolded.charAt(0)).assertEqual('A');
      expect(unfolded.charAt(1)).assertEqual('B');
      expect(unfolded.charAt(2)).assertEqual('C');
      const long: string = TextCodecUtils.unfoldText('AB\r\n CD\r\n EF\r\n GH');
      expect(long).assertEqual('ABCDEFGH');
      expect(long.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1300
     * @tc.name      testUnfoldText0002
     * @tc.desc      Verify the bare LF-space marker is also removed so
     *               Unix style folded lines rejoin correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUnfoldText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testUnfoldText0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.unfoldText('AB\n CD')).assertEqual('ABCD');
      expect(TextCodecUtils.unfoldText('X\n Y\n Z')).assertEqual('XYZ');
      expect(TextCodecUtils.unfoldText('head\n tail')).assertEqual('headtail');
      const triple: string = TextCodecUtils.unfoldText('X\n Y\n Z');
      expect(triple.length).assertEqual(3);
      expect(triple).assertContain('XYZ');
      const mixed: string = TextCodecUtils.unfoldText('A\r\n B\n C');
      expect(mixed).assertEqual('ABC');
      expect(mixed.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1400
     * @tc.name      testUnfoldText0003
     * @tc.desc      Verify texts without markers pass unchanged, a bare
     *               CRLF without the space is preserved and a space
     *               before LF survives while the marker pair is eaten.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUnfoldText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testUnfoldText0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.unfoldText('plain')).assertEqual('plain');
      expect(TextCodecUtils.unfoldText('')).assertEqual('');
      expect(TextCodecUtils.unfoldText('A B C')).assertEqual('A B C');
      expect(TextCodecUtils.unfoldText('A\r\nB')).assertEqual('A\r\nB');
      expect(TextCodecUtils.unfoldText('AB \n CD')).assertEqual('AB CD');
      const bare: string = TextCodecUtils.unfoldText('A\r\nB');
      expect(bare.length).assertEqual(4);
      expect(bare.charAt(1)).assertEqual('\r');
      expect(bare.charAt(2)).assertEqual('\n');
      const spaced: string = TextCodecUtils.unfoldText('AB \n CD');
      expect(spaced.length).assertEqual(5);
      expect(spaced.charAt(2)).assertEqual(' ');
      expect(spaced.charAt(3)).assertEqual('C');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1500
     * @tc.name      testFoldLine0001
     * @tc.desc      Verify foldLine returns the input unchanged for a
     *               non positive width, a degenerate equal width and a
     *               line already shorter than the width.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldLine0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldLine0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.foldLine('abc', 0)).assertEqual('abc');
      expect(TextCodecUtils.foldLine('abc', -5)).assertEqual('abc');
      expect(TextCodecUtils.foldLine('abc', 3)).assertEqual('abc');
      expect(TextCodecUtils.foldLine('ab', 10)).assertEqual('ab');
      expect(TextCodecUtils.foldLine('', 10)).assertEqual('');
      const zeroWidth: string = TextCodecUtils.foldLine('abc', 0);
      expect(zeroWidth.length).assertEqual(3);
      expect(zeroWidth).assertContain('abc');
      const equalWidth: string = TextCodecUtils.foldLine('abc', 3);
      expect(equalWidth.indexOf('\r')).assertEqual(-1);
      expect(equalWidth.indexOf('\n')).assertEqual(-1);
      expect(TextCodecUtils.foldLine('short', 74)).assertEqual('short');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1600
     * @tc.name      testFoldLine0002
     * @tc.desc      Verify a one hundred character line folded at width
     *               ten splits into chunks of 10, 74 and 16 characters
     *               joined by the CRLF-space marker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldLine0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldLine0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const line: string = TextCodecUtils.repeatConcat('abcdefghij', 10, '');
      expect(line.length).assertEqual(100);
      const folded: string = TextCodecUtils.foldLine(line, 10);
      expect(folded.length).assertEqual(106);
      expect(folded.charAt(10)).assertEqual('\r');
      expect(folded.charAt(11)).assertEqual('\n');
      expect(folded.charAt(12)).assertEqual(' ');
      expect(folded.charAt(13)).assertEqual('a');
      expect(folded.slice(0, 10)).assertEqual('abcdefghij');
      expect(folded.slice(13, 87)).assertEqual(line.slice(10, 84));
      expect(folded.slice(90, 106)).assertEqual(line.slice(84, 100));
      expect(TextCodecUtils.unfoldText(folded)).assertEqual(line);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1700
     * @tc.name      testFoldLine0003
     * @tc.desc      Verify a one hundred sixty character line folded at
     *               width one splits into chunks of 1, 74, 74 and 11
     *               with exactly three continuation markers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldLine0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldLine0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const line: string = TextCodecUtils.repeatConcat('0123456789', 16, '');
      expect(line.length).assertEqual(160);
      const folded: string = TextCodecUtils.foldLine(line, 1);
      expect(folded.length).assertEqual(169);
      expect(folded.charAt(0)).assertEqual('0');
      expect(folded.charAt(1)).assertEqual('\r');
      expect(folded.charAt(2)).assertEqual('\n');
      expect(folded.charAt(3)).assertEqual(' ');
      expect(folded.slice(4, 78)).assertEqual(line.slice(1, 75));
      expect(folded.slice(81, 155)).assertEqual(line.slice(75, 149));
      expect(folded.slice(158, 169)).assertEqual(line.slice(149, 160));
      let crCount: number = 0;
      for (let i: number = 0; i < folded.length; i++) {
        if (folded.charAt(i) === '\r') {
          crCount += 1;
        }
      }
      expect(crCount).assertEqual(3);
      expect(TextCodecUtils.unfoldText(folded)).assertEqual(line);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1800
     * @tc.name      testFoldLine0004
     * @tc.desc      Verify a line exactly as long as the width is not
     *               folded while one extra character produces a single
     *               continuation chunk.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldLine0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldLine0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const line74: string = TextCodecUtils.repeatConcat('x', 74, '');
      expect(line74.length).assertEqual(74);
      expect(TextCodecUtils.foldLine(line74, 74)).assertEqual(line74);
      const line75: string = line74 + 'y';
      const folded: string = TextCodecUtils.foldLine(line75, 74);
      expect(folded.length).assertEqual(78);
      expect(folded.charAt(74)).assertEqual('\r');
      expect(folded.charAt(75)).assertEqual('\n');
      expect(folded.charAt(76)).assertEqual(' ');
      expect(folded.charAt(77)).assertEqual('y');
      expect(folded.slice(0, 74)).assertEqual(line74);
      expect(TextCodecUtils.foldLine(line75, 75)).assertEqual(line75);
      expect(TextCodecUtils.unfoldText(folded)).assertEqual(line75);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_1900
     * @tc.name      testFoldLine0005
     * @tc.desc      Verify unfoldText(foldLine(line, w)) restores a one
     *               hundred twenty character line for the widths 30, 1,
     *               74, 119 and 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldLine0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldLine0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const line: string = TextCodecUtils.repeatConcat('ABCDEFGHIJ', 12, '');
      expect(line.length).assertEqual(120);
      const widths: number[] = [30, 1, 74, 119, 120];
      for (let i: number = 0; i < widths.length; i++) {
        const folded: string = TextCodecUtils.foldLine(line, widths[i]);
        const unfolded: string = TextCodecUtils.unfoldText(folded);
        expect(unfolded).assertEqual(line);
        expect(unfolded.length).assertEqual(120);
      }
      const at30: string = TextCodecUtils.foldLine(line, 30);
      expect(at30.length).assertEqual(126);
      const at119: string = TextCodecUtils.foldLine(line, 119);
      expect(at119.length).assertEqual(123);
      expect(TextCodecUtils.foldLine(line, 120)).assertEqual(line);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2000
     * @tc.name      testCodecRoundTrip0001
     * @tc.desc      Verify the combined chains escape-fold-unfold-
     *               unescape and encode-decode restore their inputs
     *               exactly for representative vCard style texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCodecRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCodecRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const raw: string = 'a;b\nc\\d';
      const escaped: string = TextCodecUtils.vcardEscape(raw);
      const folded: string = TextCodecUtils.foldLine(escaped, 10);
      const unfolded: string = TextCodecUtils.unfoldText(folded);
      expect(unfolded).assertEqual(escaped);
      expect(TextCodecUtils.vcardUnescape(unfolded)).assertEqual(raw);
      const target: string = 'OpenHarmony vCard';
      const encoded: string = TextCodecUtils.base64Encode(target);
      expect(TextCodecUtils.base64Decode(encoded)).assertEqual(target);
      expect(encoded.length).assertLarger(0);
      const triple: string = TextCodecUtils.repeatConcat('ab', 3, '-');
      expect(triple).assertEqual('ab-ab-ab');
      expect(TextCodecUtils.repeatConcat(triple, 1, ',')).assertEqual('ab-ab-ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2100
     * @tc.name      testBase64Decode0008
     * @tc.desc      Verify single byte encodings decode back exactly:
     *               'IA==' to space, 'CQ==' to tab and 'fg==' to tilde.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('IA==')).assertEqual(' ');
      expect(TextCodecUtils.base64Decode('CQ==')).assertEqual('\t');
      expect(TextCodecUtils.base64Decode('fg==')).assertEqual('~');
      const space: string = TextCodecUtils.base64Decode('IA==');
      expect(space.length).assertEqual(1);
      expect(space.charCodeAt(0)).assertEqual(32);
      const tab: string = TextCodecUtils.base64Decode('CQ==');
      expect(tab.charCodeAt(0)).assertEqual(9);
      const tilde: string = TextCodecUtils.base64Decode('fg==');
      expect(tilde.charCodeAt(0)).assertEqual(126);
      expect(TextCodecUtils.base64Decode('Zg==').charCodeAt(0)).assertEqual(102);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2200
     * @tc.name      testBase64Decode0009
     * @tc.desc      Verify the four byte word 'abcd' and the doubled
     *               foobar vector decode back to their exact sources.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('YWJjZA==')).assertEqual('abcd');
      expect(TextCodecUtils.base64Decode('Zm9vYmFyZm9vYmFy')).assertEqual('foobarfoobar');
      const word: string = TextCodecUtils.base64Decode('YWJjZA==');
      expect(word.length).assertEqual(4);
      expect(word.charAt(3)).assertEqual('d');
      expect(word).assertContain('abc');
      const doubled: string = TextCodecUtils.base64Decode('Zm9vYmFyZm9vYmFy');
      expect(doubled.length).assertEqual(12);
      expect(doubled).assertContain('foobar');
      expect(doubled.charAt(6)).assertEqual('f');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2300
     * @tc.name      testBase64Decode0010
     * @tc.desc      Verify lowercase alphabet entries decode correctly,
     *               covering 'YQ==' to a, 'Yg==' to b and 'Y2Q=' to cd.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('YQ==')).assertEqual('a');
      expect(TextCodecUtils.base64Decode('Yg==')).assertEqual('b');
      expect(TextCodecUtils.base64Decode('Y2Q=')).assertEqual('cd');
      const pair: string = TextCodecUtils.base64Decode('Y2Q=');
      expect(pair.length).assertEqual(2);
      expect(pair.charAt(0)).assertEqual('c');
      expect(pair.charAt(1)).assertEqual('d');
      expect(TextCodecUtils.base64Decode('YQ==').length).assertEqual(1);
      expect(TextCodecUtils.base64Decode('Yg==').length).assertEqual(1);
      expect(TextCodecUtils.base64Decode('YQ==') + TextCodecUtils.base64Decode('Yg==')).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2400
     * @tc.name      testBase64RoundTrip0003
     * @tc.desc      Verify digits, base64 meta characters and path like
     *               samples survive the encode and decode round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64RoundTrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64RoundTrip0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: string[] = ['9Lives!', 'c+d/e=f', 'back\\slash', 'end?', 'a b c'];
      for (let i: number = 0; i < samples.length; i++) {
        const encoded: string = TextCodecUtils.base64Encode(samples[i]);
        expect(encoded.length).assertLarger(0);
        const decoded: string = TextCodecUtils.base64Decode(encoded);
        expect(decoded).assertEqual(samples[i]);
        expect(decoded.length).assertEqual(samples[i].length);
      }
      expect(TextCodecUtils.base64Decode(TextCodecUtils.base64Encode('9Lives!'))).assertEqual('9Lives!');
      expect(TextCodecUtils.base64Encode('c+d/e=f').length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2500
     * @tc.name      testBase64RoundTrip0004
     * @tc.desc      Verify an eight entry sample matrix of words, digits
     *               and punctuation all round trip without any change.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64RoundTrip0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64RoundTrip0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: string[] = ['A', 'AB', 'ABC', 'ABCD', 'Hello', 'hello world', '123', 'vCard'];
      for (let i: number = 0; i < samples.length; i++) {
        const encoded: string = TextCodecUtils.base64Encode(samples[i]);
        const decoded: string = TextCodecUtils.base64Decode(encoded);
        expect(decoded).assertEqual(samples[i]);
        expect(decoded).assertContain(samples[i].charAt(0));
      }
      const long: string = TextCodecUtils.base64Encode('ABCD');
      expect(long.length).assertEqual(8);
      const longest: string = TextCodecUtils.base64Encode('hello world');
      expect(longest.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2600
     * @tc.name      testVcardRoundTrip0003
     * @tc.desc      Verify a six entry escape matrix including repeated
     *               punctuation restores every original text exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVcardRoundTrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVcardRoundTrip0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: string[] = [';;', ',,', '\\\\', '\n\n', 'a;b,c', 'plain'];
      for (let i: number = 0; i < samples.length; i++) {
        const escaped: string = TextCodecUtils.vcardEscape(samples[i]);
        const restored: string = TextCodecUtils.vcardUnescape(escaped);
        expect(restored).assertEqual(samples[i]);
      }
      const semi: string = TextCodecUtils.vcardEscape(';;');
      expect(semi.length).assertEqual(4);
      expect(TextCodecUtils.vcardUnescape(semi)).assertEqual(';;');
      const commas: string = TextCodecUtils.vcardEscape(',,');
      expect(commas.length).assertEqual(4);
      expect(TextCodecUtils.vcardUnescape(commas)).assertEqual(',,');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2700
     * @tc.name      testUnfoldText0004
     * @tc.desc      Verify a longer folded body with alternating CRLF
     *               and LF markers unfolds to the exact logical text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUnfoldText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testUnfoldText0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const folded: string = 'AA\r\n BB\n CC\r\n DD\n EE';
      const unfolded: string = TextCodecUtils.unfoldText(folded);
      expect(unfolded).assertEqual('AABBCCDDEE');
      expect(unfolded.length).assertEqual(10);
      expect(unfolded).assertContain('AA');
      expect(unfolded).assertContain('EE');
      expect(unfolded.indexOf('\r')).assertEqual(-1);
      const noMarker: boolean = unfolded.indexOf('\n') < 0;
      expect(noMarker).assertTrue();
      expect(TextCodecUtils.unfoldText('X')).assertEqual('X');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2800
     * @tc.name      testFoldLine0006
     * @tc.desc      Verify a three hundred character line folded at
     *               width twenty produces chunks of 20, 74, 74, 74 and
     *               58 characters with four markers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldLine0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldLine0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const line: string = TextCodecUtils.repeatConcat('abc', 100, '');
      expect(line.length).assertEqual(300);
      const folded: string = TextCodecUtils.foldLine(line, 20);
      expect(folded.length).assertEqual(312);
      expect(folded.slice(0, 20)).assertEqual(line.slice(0, 20));
      expect(folded.slice(23, 97)).assertEqual(line.slice(20, 94));
      let crCount: number = 0;
      for (let i: number = 0; i < folded.length; i++) {
        if (folded.charAt(i) === '\r') {
          crCount += 1;
        }
      }
      expect(crCount).assertEqual(4);
      expect(TextCodecUtils.unfoldText(folded)).assertEqual(line);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_2900
     * @tc.name      testFoldLine0007
     * @tc.desc      Verify a three hundred character line folded at the
     *               standard width 74 splits into 74, 74, 74, 74 and 4
     *               sized chunks and unfolds losslessly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldLine0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldLine0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const line: string = TextCodecUtils.repeatConcat('xy', 150, '');
      expect(line.length).assertEqual(300);
      const folded: string = TextCodecUtils.foldLine(line, 74);
      expect(folded.length).assertEqual(312);
      expect(folded.charAt(74)).assertEqual('\r');
      expect(folded.charAt(151)).assertEqual('\r');
      expect(folded.slice(0, 74)).assertEqual(line.slice(0, 74));
      let crCount: number = 0;
      for (let i: number = 0; i < folded.length; i++) {
        if (folded.charAt(i) === '\r') {
          crCount += 1;
        }
      }
      expect(crCount).assertEqual(4);
      expect(TextCodecUtils.unfoldText(folded)).assertEqual(line);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_3000
     * @tc.name      testCodecRoundTrip0002
     * @tc.desc      Verify quoted-printable and short fold samples keep
     *               their content invariant through encode, fold and
     *               unfold combinations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCodecRoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCodecRoundTrip0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const plain: string = 'abcdefghij';
      const folded: string = TextCodecUtils.foldLine(plain, 5);
      expect(folded.length).assertEqual(13);
      expect(folded.charAt(5)).assertEqual('\r');
      expect(folded.charAt(6)).assertEqual('\n');
      expect(folded.charAt(7)).assertEqual(' ');
      expect(TextCodecUtils.unfoldText(folded)).assertEqual(plain);
      const printable: string = TextCodecUtils.quotedPrintableEncode('a b');
      expect(printable).assertEqual('a=20b');
      const decoded: string = TextCodecUtils.base64Decode(TextCodecUtils.base64Encode('a=20b'));
      expect(decoded).assertEqual('a=20b');
      expect(TextCodecUtils.repeatConcat('ab', 2, '-')).assertEqual('ab-ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CDEC_3100
     * @tc.name      testBase64Decode0011
     * @tc.desc      Verify padded decodes expose the byte count rule:
     *               two data characters give one byte, three give two
     *               and four give three.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testBase64Decode0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(TextCodecUtils.base64Decode('YQ==').length).assertEqual(1);
      expect(TextCodecUtils.base64Decode('YWI=').length).assertEqual(2);
      expect(TextCodecUtils.base64Decode('YWJj').length).assertEqual(3);
      expect(TextCodecUtils.base64Decode('YWJjZA==').length).assertEqual(4);
      expect(TextCodecUtils.base64Decode('YWJjZGU=').length).assertEqual(5);
      expect(TextCodecUtils.base64Decode('YWJjZGVm').length).assertEqual(6);
      const one: string = TextCodecUtils.base64Decode('YQ==');
      expect(one).assertEqual('a');
      const two: string = TextCodecUtils.base64Decode('YWI=');
      expect(two).assertEqual('ab');
      const five: string = TextCodecUtils.base64Decode('YWJjZGU=');
      expect(five).assertEqual('abcde');
      expect(five.charAt(4)).assertEqual('e');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
