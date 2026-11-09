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
import { VCardFactoryUtils } from '../testutils/VCardFactoryUtils';

const DOMAIN: number = 0xF811;

function countToken(text: string, token: string): number {
  let count: number = 0;
  let pos: number = text.indexOf(token);
  while (pos >= 0) {
    count = count + 1;
    pos = text.indexOf(token, pos + token.length);
  }
  return count;
}

function buildPattern(total: number): string {
  const alphabet: string = 'abcdefghijklmnopqrstuvwxyz';
  let out: string = '';
  let i: number = 0;
  while (i < total) {
    out = out + alphabet.charAt(i % 26);
    i = i + 1;
  }
  return out;
}

export default function vCardFactoryLogicTest() {
  describe('VCardFactoryLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0100
     * @tc.name      testSingleContactV210001
     * @tc.desc      Verify singleContactV21 emits the six canonical 2.1
     *               lines with the given name and telephone embedded.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV210001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV210001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV21('张三', '13800138000');
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('VERSION:2.1');
      expect(card).assertContain('N:张三;;;');
      expect(card).assertContain('FN:张三');
      expect(card).assertContain('TEL:13800138000');
      expect(card).assertContain('END:VCARD');
      const begin: number = card.indexOf('BEGIN:VCARD');
      const version: number = card.indexOf('VERSION:2.1');
      const end: number = card.indexOf('END:VCARD');
      expect(begin).assertEqual(0);
      expect(begin).assertLess(version);
      expect(version).assertLess(end);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0200
     * @tc.name      testSingleContactV210002
     * @tc.desc      Verify singleContactV21 produces exactly six logical
     *               lines in the documented order plus the trailing split
     *               entry caused by the final CRLF.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV210002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV210002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV21('李四', '13900139000');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(7);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:2.1');
      expect(lines[2]).assertEqual('N:李四;;;');
      expect(lines[3]).assertEqual('FN:李四');
      expect(lines[4]).assertEqual('TEL:13900139000');
      expect(lines[5]).assertEqual('END:VCARD');
      expect(lines[6]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0300
     * @tc.name      testSingleContactV210003
     * @tc.desc      Verify each structural token of singleContactV21 occurs
     *               exactly once and the card ends with a CRLF pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV210003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV210003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV21('Alice', '13700137000');
      expect(countToken(card, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(card, 'VERSION:2.1')).assertEqual(1);
      expect(countToken(card, 'TEL:')).assertEqual(1);
      expect(countToken(card, 'END:VCARD')).assertEqual(1);
      expect(countToken(card, 'Alice')).assertEqual(2);
      expect(countToken(card, '13700137000')).assertEqual(1);
      expect(card.charAt(card.length - 2)).assertEqual('\r');
      expect(card.charAt(card.length - 1)).assertEqual('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0400
     * @tc.name      testSingleContactV300001
     * @tc.desc      Verify singleContactV30 emits the 3.0 structure including
     *               an EMAIL line between TEL and END.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV300001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV300001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV30('Bob', '13600136000', 'bob@example.com');
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('VERSION:3.0');
      expect(card).assertContain('N:Bob;;;');
      expect(card).assertContain('FN:Bob');
      expect(card).assertContain('TEL:13600136000');
      expect(card).assertContain('EMAIL:bob@example.com');
      expect(card).assertContain('END:VCARD');
      const tel: number = card.indexOf('TEL:13600136000');
      const email: number = card.indexOf('EMAIL:bob@example.com');
      const end: number = card.indexOf('END:VCARD');
      expect(tel).assertLess(email);
      expect(email).assertLess(end);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0500
     * @tc.name      testSingleContactV300002
     * @tc.desc      Verify singleContactV30 yields seven logical lines in the
     *               documented order plus the trailing empty split entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV300002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV300002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV30('Carol', '13500135000', 'carol@example.com');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(8);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:3.0');
      expect(lines[2]).assertEqual('N:Carol;;;');
      expect(lines[3]).assertEqual('FN:Carol');
      expect(lines[4]).assertEqual('TEL:13500135000');
      expect(lines[5]).assertEqual('EMAIL:carol@example.com');
      expect(lines[6]).assertEqual('END:VCARD');
      expect(lines[7]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0600
     * @tc.name      testSingleContactV300003
     * @tc.desc      Verify the mailbox value and structural tokens appear
     *               exactly once in the generated 3.0 card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV300003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV300003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV30('Dave', '13400134000', 'dave@example.com');
      expect(countToken(card, 'EMAIL:')).assertEqual(1);
      expect(countToken(card, 'dave@example.com')).assertEqual(1);
      expect(countToken(card, 'VERSION:3.0')).assertEqual(1);
      expect(countToken(card, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(card, 'END:VCARD')).assertEqual(1);
      expect(countToken(card, 'Dave')).assertEqual(2);
      expect(countToken(card, 'VERSION:2.1')).assertEqual(0);
      expect(countToken(card, 'VERSION:4.0')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0700
     * @tc.name      testSingleContactV400001
     * @tc.desc      Verify singleContactV40 emits VERSION:4.0 and carries no
     *               EMAIL, PHOTO or NOTE lines.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV400001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV400001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV40('Eve', '13300133000');
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('VERSION:4.0');
      expect(card).assertContain('N:Eve;;;');
      expect(card).assertContain('FN:Eve');
      expect(card).assertContain('TEL:13300133000');
      expect(card).assertContain('END:VCARD');
      expect(card.indexOf('EMAIL:')).assertEqual(-1);
      expect(card.indexOf('PHOTO;')).assertEqual(-1);
      expect(card.indexOf('NOTE:')).assertEqual(-1);
      expect(card.indexOf('ORG:')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0800
     * @tc.name      testSingleContactV400002
     * @tc.desc      Verify singleContactV40 has the same six-line layout as
     *               the 2.1 card apart from the version value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSingleContactV400002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSingleContactV400002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV40('Frank', '13200132000');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(7);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:4.0');
      expect(lines[2]).assertEqual('N:Frank;;;');
      expect(lines[3]).assertEqual('FN:Frank');
      expect(lines[4]).assertEqual('TEL:13200132000');
      expect(lines[5]).assertEqual('END:VCARD');
      expect(lines[6]).assertEqual('');
      expect(card.charAt(card.length - 1)).assertEqual('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_0900
     * @tc.name      testMultiContactStream0001
     * @tc.desc      Verify multiContactStream returns the empty string for a
     *               count of zero or any negative value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const zero: string = VCardFactoryUtils.multiContactStream(0, '3.0');
      expect(zero).assertEqual('');
      expect(zero.length).assertEqual(0);
      const negativeOne: string = VCardFactoryUtils.multiContactStream(-1, '3.0');
      expect(negativeOne).assertEqual('');
      const negativeHundred: string = VCardFactoryUtils.multiContactStream(-100, '2.1');
      expect(negativeHundred).assertEqual('');
      const negativeFifty: string = VCardFactoryUtils.multiContactStream(-50, '4.0');
      expect(negativeFifty).assertEqual('');
      expect(negativeFifty.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1000
     * @tc.name      testMultiContactStream0002
     * @tc.desc      Verify a one-contact stream is a single complete 3.0
     *               card with the first generated identity values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(1, '3.0');
      expect(countToken(stream, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(stream, 'END:VCARD')).assertEqual(1);
      expect(countToken(stream, 'VERSION:3.0')).assertEqual(1);
      expect(countToken(stream, 'EMAIL:')).assertEqual(1);
      expect(stream).assertContain('Person0001');
      expect(stream).assertContain('N:Person0001;;;');
      expect(stream).assertContain('FN:Person0001');
      expect(stream).assertContain('TEL:13800000001');
      expect(stream).assertContain('person0001@example.com');
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(8);
      expect(lines[7]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1100
     * @tc.name      testMultiContactStream0003
     * @tc.desc      Verify a three-contact stream repeats the version and
     *               addressable identity tokens exactly three times each.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(3, '3.0');
      expect(countToken(stream, 'BEGIN:VCARD')).assertEqual(3);
      expect(countToken(stream, 'END:VCARD')).assertEqual(3);
      expect(countToken(stream, 'VERSION:3.0')).assertEqual(3);
      expect(countToken(stream, 'EMAIL:')).assertEqual(3);
      expect(countToken(stream, 'TEL:')).assertEqual(3);
      expect(countToken(stream, 'FN:')).assertEqual(3);
      expect(stream).assertContain('Person0001');
      expect(stream).assertContain('Person0002');
      expect(stream).assertContain('Person0003');
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(22);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[lines.length - 1]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1200
     * @tc.name      testMultiContactStream0004
     * @tc.desc      Verify a five-contact stream assigns unique telephone
     *               numbers and mailboxes in strictly increasing order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(5, '3.0');
      expect(countToken(stream, 'TEL:')).assertEqual(5);
      expect(stream).assertContain('TEL:13800000001');
      expect(stream).assertContain('TEL:13800000002');
      expect(stream).assertContain('TEL:13800000003');
      expect(stream).assertContain('TEL:13800000004');
      expect(stream).assertContain('TEL:13800000005');
      expect(stream).assertContain('person0005@example.com');
      const first: number = stream.indexOf('Person0001');
      const last: number = stream.indexOf('Person0005');
      expect(first).assertLess(last);
      expect(countToken(stream, 'person0004@example.com')).assertEqual(1);
      expect(countToken(stream, 'person0005@example.com')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1300
     * @tc.name      testMultiContactStream0005
     * @tc.desc      Verify multiContactStream writes the version parameter
     *               verbatim into every VERSION line of the stream.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const v21Stream: string = VCardFactoryUtils.multiContactStream(2, '2.1');
      expect(countToken(v21Stream, 'VERSION:2.1')).assertEqual(2);
      expect(v21Stream.indexOf('VERSION:3.0')).assertEqual(-1);
      expect(v21Stream.indexOf('VERSION:4.0')).assertEqual(-1);
      const v40Stream: string = VCardFactoryUtils.multiContactStream(2, '4.0');
      expect(countToken(v40Stream, 'VERSION:4.0')).assertEqual(2);
      expect(v40Stream.indexOf('VERSION:3.0')).assertEqual(-1);
      const v30Stream: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      expect(countToken(v30Stream, 'VERSION:3.0')).assertEqual(2);
      expect(countToken(v30Stream, 'VERSION:2.1')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1400
     * @tc.name      testMultiContactStream0006
     * @tc.desc      Verify stream card boundaries: the text starts with
     *               BEGIN, ends with END plus CRLF, and consecutive cards
     *               are joined by an END-to-BEGIN CRLF junction.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const single: string = VCardFactoryUtils.multiContactStream(1, '3.0');
      expect(single.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(single).assertContain('END:VCARD\r\n');
      expect(single.indexOf('END:VCARD\r\nBEGIN:VCARD')).assertEqual(-1);
      const double: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      expect(double).assertContain('END:VCARD\r\nBEGIN:VCARD');
      expect(countToken(double, 'END:VCARD\r\nBEGIN:VCARD')).assertEqual(1);
      expect(double.charAt(double.length - 2)).assertEqual('\r');
      expect(double.charAt(double.length - 1)).assertEqual('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1500
     * @tc.name      testPhotoContact0001
     * @tc.desc      Verify photoContactV30 embeds the base64 payload behind
     *               the PHOTO;ENCODING=b;TYPE=JPEG prefix unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhotoContact0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPhotoContact0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.photoContactV30('Gina', '13100131000', 'QUJDREVG');
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('VERSION:3.0');
      expect(card).assertContain('FN:Gina');
      expect(card).assertContain('TEL:13100131000');
      expect(card).assertContain('PHOTO;ENCODING=b;TYPE=JPEG:QUJDREVG');
      expect(card).assertContain('END:VCARD');
      const photoLine: number = card.indexOf('PHOTO;ENCODING=b;TYPE=JPEG:QUJDREVG');
      expect(photoLine).assertLarger(0);
      expect(countToken(card, 'QUJDREVG')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1600
     * @tc.name      testPhotoContact0002
     * @tc.desc      Verify the photo line is placed after the TEL line and
     *               appears exactly once inside the 3.0 photo card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhotoContact0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPhotoContact0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.photoContactV30('Hank', '13000130000', 'WFlaWg==');
      const tel: number = card.indexOf('TEL:13000130000');
      const photo: number = card.indexOf('PHOTO;ENCODING=b;TYPE=JPEG:');
      const end: number = card.indexOf('END:VCARD');
      expect(tel).assertLess(photo);
      expect(photo).assertLess(end);
      expect(countToken(card, 'PHOTO;ENCODING=b;TYPE=JPEG:')).assertEqual(1);
      expect(countToken(card, 'WFlaWg==')).assertEqual(1);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(8);
      expect(lines[5]).assertEqual('PHOTO;ENCODING=b;TYPE=JPEG:WFlaWg==');
      expect(lines[6]).assertEqual('END:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1700
     * @tc.name      testPhotoContact0003
     * @tc.desc      Verify an empty photo payload still produces a complete
     *               PHOTO prefix line terminated by CRLF.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhotoContact0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPhotoContact0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.photoContactV30('Ivy', '12900129000', '');
      expect(card).assertContain('PHOTO;ENCODING=b;TYPE=JPEG:\r\n');
      expect(card).assertContain('FN:Ivy');
      expect(card).assertContain('END:VCARD');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(8);
      expect(lines[5]).assertEqual('PHOTO;ENCODING=b;TYPE=JPEG:');
      const photo: number = card.indexOf('PHOTO;ENCODING=b;TYPE=JPEG:');
      expect(photo).assertLarger(0);
      expect(card.charAt(card.length - 1)).assertEqual('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1800
     * @tc.name      testEscapedContact0001
     * @tc.desc      Verify escapedContactV30 escapes a semicolon inside the
     *               ORG value with exactly one backslash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEscapedContact0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEscapedContact0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.escapedContactV30('Jack', 'A;B');
      expect(card).assertContain('ORG:A\\;B');
      expect(card).assertContain('VERSION:3.0');
      expect(card).assertContain('FN:Jack');
      expect(card.indexOf('ORG:A;B')).assertEqual(-1);
      expect(countToken(card, '\\;')).assertEqual(1);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(7);
      expect(lines[4]).assertEqual('ORG:A\\;B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_1900
     * @tc.name      testEscapedContact0002
     * @tc.desc      Verify escapedContactV30 escapes a comma inside the ORG
     *               value with exactly one backslash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEscapedContact0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEscapedContact0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.escapedContactV30('Kate', 'A,B');
      expect(card).assertContain('ORG:A\\,B');
      expect(card.indexOf('ORG:A,B')).assertEqual(-1);
      expect(countToken(card, '\\,')).assertEqual(1);
      expect(countToken(card, '\\;')).assertEqual(0);
      const lines: string[] = card.split('\r\n');
      expect(lines[4]).assertEqual('ORG:A\\,B');
      expect(lines[5]).assertEqual('END:VCARD');
      const org: number = card.indexOf('ORG:A\\,B');
      expect(org).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2000
     * @tc.name      testEscapedContact0003
     * @tc.desc      Verify escapedContactV30 escapes both the semicolon and
     *               the comma of a mixed organization string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEscapedContact0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEscapedContact0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.escapedContactV30('Liam', 'R&D;Mobile,Dev');
      expect(card).assertContain('ORG:R&D\\;Mobile\\,Dev');
      expect(card.indexOf('ORG:R&D;Mobile')).assertEqual(-1);
      expect(countToken(card, '\\;')).assertEqual(1);
      expect(countToken(card, '\\,')).assertEqual(1);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(7);
      expect(lines[4]).assertEqual('ORG:R&D\\;Mobile\\,Dev');
      expect(card).assertContain('FN:Liam');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2100
     * @tc.name      testEscapedContact0004
     * @tc.desc      Verify escapedContactV30 doubles a literal backslash
     *               before escaping the semicolon behind it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEscapedContact0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEscapedContact0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.escapedContactV30('Mia', 'A\\B;C');
      expect(card).assertContain('ORG:A\\\\B\\;C');
      expect(countToken(card, '\\\\')).assertEqual(1);
      expect(countToken(card, '\\;')).assertEqual(1);
      const lines: string[] = card.split('\r\n');
      expect(lines[4]).assertEqual('ORG:A\\\\B\\;C');
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('END:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2200
     * @tc.name      testEscapedContact0005
     * @tc.desc      Verify a plain organization string without special
     *               characters is emitted unchanged on the ORG line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEscapedContact0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEscapedContact0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.escapedContactV30('Noah', 'Huawei');
      expect(card).assertContain('ORG:Huawei');
      expect(card.indexOf('\\;')).assertEqual(-1);
      expect(card.indexOf('\\,')).assertEqual(-1);
      expect(card.indexOf('\\\\')).assertEqual(-1);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(7);
      expect(lines[4]).assertEqual('ORG:Huawei');
      expect(countToken(card, 'Huawei')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2300
     * @tc.name      testFoldedNote0001
     * @tc.desc      Verify foldedNoteV30 keeps a note shorter than the first
     *               line width on one physical line without fold markers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldedNote0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldedNote0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.foldedNoteV30('Olivia', 'hello note', 20);
      expect(card).assertContain('NOTE:hello note\r\n');
      expect(card).assertContain('VERSION:3.0');
      expect(card).assertContain('FN:Olivia');
      expect(card).assertContain('END:VCARD');
      expect(card.indexOf('\r\n ')).assertEqual(-1);
      expect(countToken(card, '\r\n ')).assertEqual(0);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(7);
      expect(lines[4]).assertEqual('NOTE:hello note');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2400
     * @tc.name      testFoldedNote0002
     * @tc.desc      Verify a note whose length equals the first line width
     *               stays unfolded with no continuation marker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldedNote0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldedNote0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const note: string = buildPattern(20);
      const card: string = VCardFactoryUtils.foldedNoteV30('Peter', note, 20);
      expect(note.length).assertEqual(20);
      expect(card).assertContain('NOTE:' + note + '\r\n');
      expect(card.indexOf('\r\n ')).assertEqual(-1);
      expect(countToken(card, '\r\n ')).assertEqual(0);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(7);
      expect(lines[4]).assertEqual('NOTE:' + note);
      expect(card).assertContain('END:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2500
     * @tc.name      testFoldedNote0003
     * @tc.desc      Verify a one-character overflow past the first line
     *               width produces exactly one continuation line carrying
     *               the last character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldedNote0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldedNote0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const note: string = buildPattern(21);
      const firstChunk: string = note.substring(0, 20);
      const lastChunk: string = note.substring(20, 21);
      const card: string = VCardFactoryUtils.foldedNoteV30('Quinn', note, 20);
      const expected: string = 'NOTE:' + firstChunk + '\r\n ' + lastChunk + '\r\n';
      expect(card).assertContain(expected);
      expect(countToken(card, '\r\n ')).assertEqual(1);
      expect(lastChunk).assertEqual('u');
      const lines: string[] = card.split('\r\n');
      expect(lines[4]).assertEqual('NOTE:' + firstChunk);
      expect(lines[5]).assertEqual(' ' + lastChunk);
      expect(lines[6]).assertEqual('END:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2600
     * @tc.name      testFoldedNote0004
     * @tc.desc      Verify a 100-character note with first width 20 folds
     *               into chunks of 20, 74 and 6 characters joined by the
     *               CRLF-space marker twice.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFoldedNote0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFoldedNote0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const note: string = buildPattern(100);
      const chunk1: string = note.substring(0, 20);
      const chunk2: string = note.substring(20, 94);
      const chunk3: string = note.substring(94, 100);
      const card: string = VCardFactoryUtils.foldedNoteV30('Rose', note, 20);
      const expected: string = 'NOTE:' + chunk1 + '\r\n ' + chunk2 + '\r\n ' + chunk3 + '\r\n';
      expect(card).assertContain(expected);
      expect(chunk2.length).assertEqual(74);
      expect(chunk3.length).assertEqual(6);
      expect(countToken(card, '\r\n ')).assertEqual(2);
      const lines: string[] = card.split('\r\n');
      expect(lines[5]).assertEqual(' ' + chunk2);
      expect(lines[6]).assertEqual(' ' + chunk3);
      expect(lines[7]).assertEqual('END:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2700
     * @tc.name      testEmptyFields0001
     * @tc.desc      Verify emptyFieldsContactV30 emits TEL, EMAIL and ORG
     *               lines whose values are empty after the colon.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmptyFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEmptyFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.emptyFieldsContactV30('Sam');
      expect(card).assertContain('\r\nTEL:\r\n');
      expect(card).assertContain('\r\nEMAIL:\r\n');
      expect(card).assertContain('\r\nORG:\r\n');
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('VERSION:3.0');
      expect(card).assertContain('N:Sam;;;');
      expect(card).assertContain('FN:Sam');
      expect(card).assertContain('END:VCARD');
      expect(card.indexOf('TEL:1')).assertEqual(-1);
      expect(card.indexOf('EMAIL:s')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2800
     * @tc.name      testEmptyFields0002
     * @tc.desc      Verify emptyFieldsContactV30 has eight logical lines in
     *               the documented order plus the trailing split entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmptyFields0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEmptyFields0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.emptyFieldsContactV30('Tina');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(9);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:3.0');
      expect(lines[2]).assertEqual('N:Tina;;;');
      expect(lines[3]).assertEqual('FN:Tina');
      expect(lines[4]).assertEqual('TEL:');
      expect(lines[5]).assertEqual('EMAIL:');
      expect(lines[6]).assertEqual('ORG:');
      expect(lines[7]).assertEqual('END:VCARD');
      expect(lines[8]).assertEqual('');
      expect(countToken(card, '\r\n')).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_2900
     * @tc.name      testCrlfEndings0001
     * @tc.desc      Verify every factory card of every version ends with the
     *               CRLF pair on its final character pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrlfEndings0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCrlfEndings0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const v21: string = VCardFactoryUtils.singleContactV21('Uma', '12800128000');
      const v30: string = VCardFactoryUtils.singleContactV30('Uma', '12800128000', 'uma@example.com');
      const v40: string = VCardFactoryUtils.singleContactV40('Uma', '12800128000');
      const photo: string = VCardFactoryUtils.photoContactV30('Uma', '12800128000', 'QUJD');
      const multi: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      expect(v21.charAt(v21.length - 2)).assertEqual('\r');
      expect(v21.charAt(v21.length - 1)).assertEqual('\n');
      expect(v30.charAt(v30.length - 2)).assertEqual('\r');
      expect(v40.charAt(v40.length - 1)).assertEqual('\n');
      expect(photo.charAt(photo.length - 2)).assertEqual('\r');
      expect(multi.charAt(multi.length - 1)).assertEqual('\n');
      expect(multi.length).assertLarger(v30.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_3000
     * @tc.name      testCrlfEndings0002
     * @tc.desc      Verify the CRLF terminator count equals the logical line
     *               count of the generated 3.0 single card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrlfEndings0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCrlfEndings0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.singleContactV30('Vera', '12700127000', 'vera@example.com');
      expect(countToken(card, '\r\n')).assertEqual(7);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(8);
      expect(lines[lines.length - 1]).assertEqual('');
      expect(countToken(card, '\n')).assertEqual(7);
      expect(countToken(card, '\r')).assertEqual(7);
      const bareNewline: number = card.indexOf('\n');
      const preceding: number = card.indexOf('\r\n');
      expect(preceding).assertEqual(11);
      expect(bareNewline).assertEqual(12);
      expect(card.length).assertEqual(98);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_3100
     * @tc.name      testMultiContactStream0007
     * @tc.desc      Verify a ten-contact stream repeats every structural
     *               token ten times and keeps the last identity addressable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(10, '3.0');
      expect(countToken(stream, 'BEGIN:VCARD')).assertEqual(10);
      expect(countToken(stream, 'END:VCARD')).assertEqual(10);
      expect(countToken(stream, 'VERSION:3.0')).assertEqual(10);
      expect(countToken(stream, 'EMAIL:')).assertEqual(10);
      expect(countToken(stream, 'FN:')).assertEqual(10);
      expect(countToken(stream, '\r\n')).assertEqual(70);
      expect(stream).assertContain('Person0010');
      expect(stream.indexOf('Person0001')).assertLess(stream.indexOf('Person0010'));
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(71);
      expect(lines[lines.length - 1]).assertEqual('');
      expect(lines[lines.length - 2]).assertEqual('END:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FACT_3200
     * @tc.name      testPhotoContact0004
     * @tc.desc      Verify the photo line carries the exact base64 payload
     *               and the fixed PHOTO property prefix length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhotoContact0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPhotoContact0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.photoContactV30('Nina', '13900139000', 'SGVsbG8=');
      const lines: string[] = card.split('\r\n');
      expect(lines[5]).assertEqual('PHOTO;ENCODING=b;TYPE=JPEG:SGVsbG8=');
      expect(lines[5].length).assertEqual(35);
      expect(countToken(card, 'SGVsbG8=')).assertEqual(1);
      expect(card).assertContain('PHOTO;ENCODING=b;TYPE=JPEG:SGVsbG8=\r\n');
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:3.0');
      expect(lines[6]).assertEqual('END:VCARD');
      expect(card.charAt(card.length - 2)).assertEqual('\r');
      expect(card.charAt(card.length - 1)).assertEqual('\n');
      expect(countToken(card, 'PHOTO;')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
