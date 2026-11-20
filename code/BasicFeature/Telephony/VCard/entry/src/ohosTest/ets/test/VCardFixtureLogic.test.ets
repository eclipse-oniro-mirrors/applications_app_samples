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

export default function vCardFixtureLogicTest() {
  describe('VCardFixtureLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0100
     * @tc.name      testMalformedVcard0001
     * @tc.desc      Verify malformedVcard kind 1 keeps the header and value
     *               lines but omits the END:VCARD terminator entirely.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.malformedVcard(1);
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('VERSION:3.0');
      expect(card).assertContain('N:Broken;;;');
      expect(card).assertContain('FN:Broken');
      expect(card).assertContain('TEL:13800138000');
      expect(card.indexOf('END:VCARD')).assertEqual(-1);
      expect(card.indexOf('VERSION:9.9')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0200
     * @tc.name      testMalformedVcard0002
     * @tc.desc      Verify malformedVcard kind 1 has exactly five CRLF
     *               terminated lines ending on the TEL value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.malformedVcard(1);
      expect(card.length).assertEqual(67);
      expect(countToken(card, '\r\n')).assertEqual(5);
      expect(card).assertContain('TEL:13800138000\r\n');
      expect(card.charAt(card.length - 1)).assertEqual('\n');
      expect(card.charAt(card.length - 2)).assertEqual('\r');
      expect(card.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(card.indexOf('\r\n')).assertEqual(11);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(6);
      expect(lines[4]).assertEqual('TEL:13800138000');
      expect(lines[5]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0300
     * @tc.name      testMalformedVcard0003
     * @tc.desc      Verify malformedVcard kind 2 carries BEGIN and END but
     *               no VERSION property of any kind.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.malformedVcard(2);
      expect(card).assertContain('BEGIN:VCARD');
      expect(card).assertContain('END:VCARD');
      expect(card).assertContain('TEL:13800138000');
      expect(card.indexOf('VERSION')).assertEqual(-1);
      expect(card.indexOf('2.1')).assertEqual(-1);
      expect(card.indexOf('3.0')).assertEqual(-1);
      expect(card.indexOf('4.0')).assertEqual(-1);
      expect(card.indexOf('9.9')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0400
     * @tc.name      testMalformedVcard0004
     * @tc.desc      Verify malformedVcard kind 2 keeps the NoVersion name
     *               fields exactly once inside a five-line card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.malformedVcard(2);
      expect(card).assertContain('N:NoVersion;;;');
      expect(card).assertContain('FN:NoVersion');
      expect(countToken(card, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(card, 'END:VCARD')).assertEqual(1);
      expect(countToken(card, '\r\n')).assertEqual(5);
      expect(card.length).assertEqual(71);
      expect(card.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(card.charAt(card.length - 1)).assertEqual('\n');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(6);
      expect(lines[5]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0500
     * @tc.name      testMalformedVcard0005
     * @tc.desc      Verify malformedVcard kind 3 returns the empty string
     *               with zero length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.malformedVcard(3);
      expect(card).assertEqual('');
      expect(card.length).assertEqual(0);
      expect(card.indexOf('BEGIN:VCARD')).assertEqual(-1);
      expect(card.indexOf('END:VCARD')).assertEqual(-1);
      expect(countToken(card, '\r\n')).assertEqual(0);
      const again: string = VCardFactoryUtils.malformedVcard(3);
      expect(again).assertEqual(card);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0600
     * @tc.name      testMalformedVcard0006
     * @tc.desc      Verify malformedVcard kind 4 equals the documented
     *               unsupported-version literal of length 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.malformedVcard(4);
      expect(card).assertContain('BEGIN:VCARD\r\nVERSION:9.9\r\nEND:VCARD');
      expect(card.length).assertEqual(35);
      expect(card.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(card.indexOf('VERSION:9.9')).assertEqual(13);
      expect(card.indexOf('END:VCARD')).assertEqual(26);
      expect(card).assertContain('VERSION:9.9');
      expect(card.indexOf('VERSION:3.0')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0700
     * @tc.name      testMalformedVcard0007
     * @tc.desc      Verify malformedVcard kind 4 splits into exactly three
     *               complete lines without a trailing empty entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.malformedVcard(4);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:9.9');
      expect(lines[2]).assertEqual('END:VCARD');
      expect(card.charAt(0)).assertEqual('B');
      expect(card.charAt(34)).assertEqual('D');
      expect(card.charAt(card.length - 1)).assertEqual('D');
      expect(countToken(card, '\r\n')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0800
     * @tc.name      testMalformedVcard0008
     * @tc.desc      Verify malformedVcard returns the empty string for every
     *               unregistered kind value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const kindFive: string = VCardFactoryUtils.malformedVcard(5);
      expect(kindFive).assertEqual('');
      expect(kindFive.length).assertEqual(0);
      expect(VCardFactoryUtils.malformedVcard(0)).assertEqual('');
      expect(VCardFactoryUtils.malformedVcard(-1)).assertEqual('');
      expect(VCardFactoryUtils.malformedVcard(100)).assertEqual('');
      expect(VCardFactoryUtils.malformedVcard(7)).assertEqual('');
      expect(VCardFactoryUtils.malformedVcard(-99)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_0900
     * @tc.name      testMalformedVcard0009
     * @tc.desc      Verify kind 1 and kind 2 defects are complementary: one
     *               lacks only END while the other lacks only VERSION.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const kindOne: string = VCardFactoryUtils.malformedVcard(1);
      const kindTwo: string = VCardFactoryUtils.malformedVcard(2);
      expect(kindOne.indexOf('VERSION:3.0')).assertLarger(-1);
      expect(kindTwo.indexOf('VERSION')).assertEqual(-1);
      expect(kindTwo.indexOf('END:VCARD')).assertLarger(-1);
      expect(kindOne.indexOf('END:VCARD')).assertEqual(-1);
      expect(kindOne.indexOf('TEL:13800138000')).assertLarger(-1);
      expect(kindTwo.indexOf('TEL:13800138000')).assertLarger(-1);
      expect(kindOne.length).assertEqual(67);
      expect(kindTwo.length).assertEqual(71);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1000
     * @tc.name      testMalformedVcard0010
     * @tc.desc      Verify the fixture sizes grow monotonically from the
     *               empty fixture through the two- and five-line variants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const kindThree: string = VCardFactoryUtils.malformedVcard(3);
      const kindFour: string = VCardFactoryUtils.malformedVcard(4);
      const kindOne: string = VCardFactoryUtils.malformedVcard(1);
      const kindTwo: string = VCardFactoryUtils.malformedVcard(2);
      expect(kindThree.length).assertEqual(0);
      expect(kindThree.length).assertLess(kindFour.length);
      expect(kindFour.length).assertEqual(35);
      expect(kindFour.length).assertLess(kindOne.length);
      expect(kindOne.length).assertEqual(67);
      expect(kindOne.length).assertLess(kindTwo.length);
      expect(kindTwo.length).assertEqual(71);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1100
     * @tc.name      testMalformedVcard0011
     * @tc.desc      Verify appending the missing END line repairs kind 1
     *               into a structurally complete single-card fixture.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const broken: string = VCardFactoryUtils.malformedVcard(1);
      const repaired: string = broken + 'END:VCARD\r\n';
      expect(countToken(repaired, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(repaired, 'END:VCARD')).assertEqual(1);
      expect(countToken(repaired, 'VERSION:3.0')).assertEqual(1);
      expect(repaired).assertContain('END:VCARD\r\n');
      expect(repaired.length).assertEqual(78);
      expect(repaired.charAt(repaired.length - 2)).assertEqual('\r');
      expect(repaired.charAt(repaired.length - 1)).assertEqual('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1200
     * @tc.name      testEmptyFields0001
     * @tc.desc      Verify emptyFieldsContactV30 emits TEL, EMAIL and ORG
     *               lines with nothing between colon and line break.
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
      expect(card.indexOf('TEL:1')).assertEqual(-1);
      expect(card.indexOf('EMAIL:s')).assertEqual(-1);
      expect(card.indexOf('ORG:H')).assertEqual(-1);
      expect(card.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(card).assertContain('END:VCARD\r\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1300
     * @tc.name      testEmptyFields0002
     * @tc.desc      Verify emptyFieldsContactV30 preserves the given name in
     *               both the N and FN properties exactly once each.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmptyFields0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEmptyFields0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.emptyFieldsContactV30('Sam');
      expect(card).assertContain('N:Sam;;;');
      expect(card).assertContain('FN:Sam');
      expect(countToken(card, 'Sam')).assertEqual(2);
      expect(countToken(card, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(card, 'VERSION:3.0')).assertEqual(1);
      expect(countToken(card, 'END:VCARD')).assertEqual(1);
      expect(card).assertContain('VERSION:3.0');
      expect(card).assertContain('BEGIN:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1400
     * @tc.name      testEmptyFields0003
     * @tc.desc      Verify emptyFieldsContactV30 splits into eight complete
     *               lines of exact content plus one trailing empty entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmptyFields0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEmptyFields0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.emptyFieldsContactV30('Sam');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(9);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:3.0');
      expect(lines[2]).assertEqual('N:Sam;;;');
      expect(lines[3]).assertEqual('FN:Sam');
      expect(lines[4]).assertEqual('TEL:');
      expect(lines[5]).assertEqual('EMAIL:');
      expect(lines[6]).assertEqual('ORG:');
      expect(lines[7]).assertEqual('END:VCARD');
      expect(lines[8]).assertEqual('');
      expect(card.length).assertEqual(75);
      expect(countToken(card, '\r\n')).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1500
     * @tc.name      testMultiContactStream0001
     * @tc.desc      Verify multiContactStream yields the empty string for
     *               zero and negative contact counts.
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
      const negative: string = VCardFactoryUtils.multiContactStream(-2, '3.0');
      expect(negative).assertEqual('');
      expect(negative.length).assertEqual(0);
      expect(VCardFactoryUtils.multiContactStream(-100, '2.1')).assertEqual('');
      expect(VCardFactoryUtils.multiContactStream(0, '9.9')).assertEqual(zero);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1600
     * @tc.name      testMultiContactStream0002
     * @tc.desc      Verify a one-contact stream starts with BEGIN, ends with
     *               END as the last non-empty line and splits to eight parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(1, '3.0');
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(8);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:3.0');
      expect(lines[6]).assertEqual('END:VCARD');
      expect(lines[7]).assertEqual('');
      expect(lines[lines.length - 2]).assertEqual('END:VCARD');
      expect(stream).assertContain('Person0001');
      expect(stream.charAt(stream.length - 1)).assertEqual('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1700
     * @tc.name      testMultiContactStream0003
     * @tc.desc      Verify a one-contact stream contains exactly one card
     *               boundary and no END-to-BEGIN adjacency.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(1, '3.0');
      expect(countToken(stream, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(stream, 'END:VCARD')).assertEqual(1);
      expect(countToken(stream, 'VERSION:3.0')).assertEqual(1);
      expect(stream.indexOf('END:VCARD\r\nBEGIN:VCARD')).assertEqual(-1);
      expect(stream.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(countToken(stream, '\r\n')).assertEqual(7);
      expect(stream).assertContain('person0001@example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1800
     * @tc.name      testMultiContactStream0004
     * @tc.desc      Verify a two-contact stream contains exactly one
     *               END:VCARD to BEGIN:VCARD junction.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      expect(countToken(stream, 'BEGIN:VCARD')).assertEqual(2);
      expect(countToken(stream, 'END:VCARD')).assertEqual(2);
      expect(countToken(stream, 'END:VCARD\r\nBEGIN:VCARD')).assertEqual(1);
      expect(stream).assertContain('END:VCARD\r\nBEGIN:VCARD');
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(15);
      expect(lines[7]).assertEqual('BEGIN:VCARD');
      expect(lines[lines.length - 1]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_1900
     * @tc.name      testMultiContactStream0005
     * @tc.desc      Verify a two-contact stream addresses both persons in
     *               order with the version repeated on each card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      expect(stream).assertContain('Person0001');
      expect(stream).assertContain('Person0002');
      expect(countToken(stream, 'VERSION:3.0')).assertEqual(2);
      expect(countToken(stream, 'EMAIL:')).assertEqual(2);
      expect(stream.indexOf('Person0001')).assertLess(stream.indexOf('Person0002'));
      expect(stream).assertContain('person0001@example.com');
      expect(stream).assertContain('person0002@example.com');
      expect(stream.indexOf('person0001@example.com')).assertLess(stream.indexOf('person0002@example.com'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2000
     * @tc.name      testMultiContactStream0006
     * @tc.desc      Verify a five-contact stream repeats every structural
     *               token five times with thirty-five CRLF terminators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(5, '3.0');
      expect(countToken(stream, 'BEGIN:VCARD')).assertEqual(5);
      expect(countToken(stream, 'END:VCARD')).assertEqual(5);
      expect(countToken(stream, 'EMAIL:')).assertEqual(5);
      expect(countToken(stream, 'TEL:')).assertEqual(5);
      expect(countToken(stream, 'FN:')).assertEqual(5);
      expect(countToken(stream, '\r\n')).assertEqual(35);
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(36);
      expect(lines[lines.length - 1]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2100
     * @tc.name      testMultiContactStream0007
     * @tc.desc      Verify a five-contact stream orders all five identities
     *               and starts each card with BEGIN:VCARD.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(5, '3.0');
      const first: number = stream.indexOf('Person0001');
      const second: number = stream.indexOf('Person0002');
      const third: number = stream.indexOf('Person0003');
      const fourth: number = stream.indexOf('Person0004');
      const fifth: number = stream.indexOf('Person0005');
      expect(first).assertLess(second);
      expect(second).assertLess(third);
      expect(third).assertLess(fourth);
      expect(fourth).assertLess(fifth);
      expect(fifth).assertLarger(0);
      const lines: string[] = stream.split('\r\n');
      expect(lines[7]).assertEqual('BEGIN:VCARD');
      expect(lines[14]).assertEqual('BEGIN:VCARD');
      expect(lines[21]).assertEqual('BEGIN:VCARD');
      expect(lines[28]).assertEqual('BEGIN:VCARD');
      expect(stream).assertContain('person0005@example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2200
     * @tc.name      testMultiContactStream0008
     * @tc.desc      Verify the version parameter is written verbatim into
     *               every VERSION line and EMAIL lines survive it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const v21Stream: string = VCardFactoryUtils.multiContactStream(2, '2.1');
      expect(countToken(v21Stream, 'VERSION:2.1')).assertEqual(2);
      expect(v21Stream.indexOf('VERSION:3.0')).assertEqual(-1);
      expect(v21Stream.indexOf('VERSION:4.0')).assertEqual(-1);
      const v40Stream: string = VCardFactoryUtils.multiContactStream(3, '4.0');
      expect(countToken(v40Stream, 'VERSION:4.0')).assertEqual(3);
      expect(countToken(v40Stream, 'EMAIL:')).assertEqual(3);
      expect(v40Stream.indexOf('VERSION:2.1')).assertEqual(-1);
      expect(countToken(v40Stream, 'BEGIN:VCARD')).assertEqual(3);
      expect(v40Stream).assertContain('Person0003');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2300
     * @tc.name      testFixtureStructure0001
     * @tc.desc      Verify the v21, v30 and v40 single-contact fixtures all
     *               share the BEGIN prefix, CRLF suffix and END marker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const v21: string = VCardFactoryUtils.singleContactV21('Fay', '13600136000');
      const v30: string = VCardFactoryUtils.singleContactV30('Fay', '13600136000', 'fay@example.com');
      const v40: string = VCardFactoryUtils.singleContactV40('Fay', '13600136000');
      expect(v21.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(v30.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(v40.indexOf('BEGIN:VCARD')).assertEqual(0);
      expect(v21).assertContain('END:VCARD\r\n');
      expect(v30).assertContain('END:VCARD\r\n');
      expect(v40).assertContain('END:VCARD\r\n');
      expect(v21.charAt(v21.length - 1)).assertEqual('\n');
      expect(v30.charAt(v30.length - 1)).assertEqual('\n');
      expect(v40.charAt(v40.length - 1)).assertEqual('\n');
      expect(v40.indexOf('EMAIL:')).assertEqual(-1);
      expect(v30.indexOf('EMAIL:')).assertLarger(0);
      expect(v21.indexOf('EMAIL:')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2400
     * @tc.name      testFixtureStructure0002
     * @tc.desc      Verify every factory fixture is deterministic and returns
     *               identical text for identical arguments.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first30: string = VCardFactoryUtils.singleContactV30('Dana', '13500135000', 'dana@example.com');
      const second30: string = VCardFactoryUtils.singleContactV30('Dana', '13500135000', 'dana@example.com');
      expect(first30).assertEqual(second30);
      const firstStream: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      const secondStream: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      expect(firstStream).assertEqual(secondStream);
      const firstEmpty: string = VCardFactoryUtils.emptyFieldsContactV30('Ed');
      const secondEmpty: string = VCardFactoryUtils.emptyFieldsContactV30('Ed');
      expect(firstEmpty).assertEqual(secondEmpty);
      expect(VCardFactoryUtils.malformedVcard(4)).assertEqual(VCardFactoryUtils.malformedVcard(4));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2500
     * @tc.name      testFixtureStructure0003
     * @tc.desc      Verify the photo fixture line layout puts the PHOTO
     *               property after TEL and before END:VCARD.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.photoContactV30('Gus', '13400134000', 'QUJD');
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(8);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[1]).assertEqual('VERSION:3.0');
      expect(lines[2]).assertEqual('N:Gus;;;');
      expect(lines[3]).assertEqual('FN:Gus');
      expect(lines[4].indexOf('TEL:')).assertEqual(0);
      expect(lines[5].indexOf('PHOTO;ENCODING=b;TYPE=JPEG:')).assertEqual(0);
      expect(lines[5]).assertEqual('PHOTO;ENCODING=b;TYPE=JPEG:QUJD');
      expect(lines[6]).assertEqual('END:VCARD');
      expect(lines[7]).assertEqual('');
      expect(card.indexOf('PHOTO;')).assertLarger(card.indexOf('TEL:'));
      expect(card.indexOf('PHOTO;')).assertLess(card.indexOf('END:VCARD'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2600
     * @tc.name      testFixtureStructure0004
     * @tc.desc      Verify a version 3.0 one-contact stream is byte-identical
     *               to the single V30 fixture for the same identity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(1, '3.0');
      const single: string = VCardFactoryUtils.singleContactV30('Person0001', '13800000001',
        'person0001@example.com');
      expect(stream).assertEqual(single);
      expect(stream).assertContain('N:Person0001;;;');
      expect(stream).assertContain('FN:Person0001');
      expect(stream.length).assertEqual(single.length);
      const singleV21: string = VCardFactoryUtils.singleContactV21('Person0001', '13800000001');
      expect(stream.length).assertLarger(singleV21.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2700
     * @tc.name      testFixtureStructure0005
     * @tc.desc      Verify inserting the missing VERSION line repairs kind 2
     *               into a structurally complete fixture.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const broken: string = VCardFactoryUtils.malformedVcard(2);
      const repaired: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\n' + broken.substring(13);
      expect(countToken(repaired, 'BEGIN:VCARD')).assertEqual(1);
      expect(countToken(repaired, 'VERSION:3.0')).assertEqual(1);
      expect(countToken(repaired, 'END:VCARD')).assertEqual(1);
      expect(repaired).assertContain('N:NoVersion;;;');
      expect(repaired.length).assertEqual(84);
      expect(repaired.charAt(repaired.length - 1)).assertEqual('\n');
      expect(repaired.indexOf('BEGIN:VCARD')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2800
     * @tc.name      testFixtureStructure0006
     * @tc.desc      Verify a three-contact stream begins every card at the
     *               correct split index and trails with one empty entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(3, '3.0');
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(22);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[7]).assertEqual('BEGIN:VCARD');
      expect(lines[14]).assertEqual('BEGIN:VCARD');
      expect(lines[6]).assertEqual('END:VCARD');
      expect(lines[13]).assertEqual('END:VCARD');
      expect(lines[20]).assertEqual('END:VCARD');
      expect(lines[21]).assertEqual('');
      expect(countToken(stream, 'END:VCARD\r\nBEGIN:VCARD')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_2900
     * @tc.name      testFixtureStructure0007
     * @tc.desc      Verify the version text does not change the stream length
     *               for equal-width version values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const asV21: string = VCardFactoryUtils.multiContactStream(2, '2.1');
      const asV30: string = VCardFactoryUtils.multiContactStream(2, '3.0');
      expect(asV21.length).assertEqual(asV30.length);
      expect(asV21.length).assertEqual(232);
      expect(asV21.indexOf('VERSION:2.1')).assertLarger(-1);
      expect(asV30.indexOf('VERSION:2.1')).assertEqual(-1);
      const zeroA: string = VCardFactoryUtils.multiContactStream(0, '2.1');
      const zeroB: string = VCardFactoryUtils.multiContactStream(0, '9.9');
      expect(zeroA).assertEqual(zeroB);
      expect(zeroA.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_3000
     * @tc.name      testMalformedVcard0012
     * @tc.desc      Verify the four malformed kinds differ in CRLF count and
     *               in which structural lines they still carry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMalformedVcard0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMalformedVcard0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const kindOne: string = VCardFactoryUtils.malformedVcard(1);
      const kindTwo: string = VCardFactoryUtils.malformedVcard(2);
      const kindThree: string = VCardFactoryUtils.malformedVcard(3);
      const kindFour: string = VCardFactoryUtils.malformedVcard(4);
      expect(countToken(kindOne, '\r\n')).assertEqual(5);
      expect(countToken(kindTwo, '\r\n')).assertEqual(5);
      expect(countToken(kindFour, '\r\n')).assertEqual(2);
      expect(countToken(kindThree, '\r\n')).assertEqual(0);
      expect(kindOne).assertContain('TEL:');
      expect(kindTwo).assertContain('TEL:');
      expect(kindFour.indexOf('TEL:')).assertEqual(-1);
      expect(kindOne.indexOf('FN:')).assertLarger(-1);
      expect(kindTwo.indexOf('FN:')).assertLarger(-1);
      expect(kindFour.indexOf('FN:')).assertEqual(-1);
      expect(countToken(kindThree, 'BEGIN:VCARD')).assertEqual(0);
      expect(kindFour).assertContain('END:VCARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_3100
     * @tc.name      testMultiContactStream0009
     * @tc.desc      Verify a four-contact stream opens every card at the
     *               expected split index and closes with three adjacencies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultiContactStream0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMultiContactStream0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(4, '3.0');
      expect(countToken(stream, '\r\n')).assertEqual(28);
      const lines: string[] = stream.split('\r\n');
      expect(lines.length).assertEqual(29);
      expect(lines[0]).assertEqual('BEGIN:VCARD');
      expect(lines[7]).assertEqual('BEGIN:VCARD');
      expect(lines[14]).assertEqual('BEGIN:VCARD');
      expect(lines[21]).assertEqual('BEGIN:VCARD');
      expect(lines[6]).assertEqual('END:VCARD');
      expect(lines[13]).assertEqual('END:VCARD');
      expect(lines[20]).assertEqual('END:VCARD');
      expect(lines[27]).assertEqual('END:VCARD');
      expect(countToken(stream, 'END:VCARD\r\nBEGIN:VCARD')).assertEqual(3);
      expect(stream).assertContain('Person0004');
      expect(lines[28]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_3200
     * @tc.name      testFixtureStructure0008
     * @tc.desc      Verify a 2.1 one-contact stream equals the V21 fixture
     *               plus exactly one EMAIL physical line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureStructure0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureStructure0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stream: string = VCardFactoryUtils.multiContactStream(1, '2.1');
      const single: string = VCardFactoryUtils.singleContactV21('Person0001', '13800000001');
      expect(stream.length).assertEqual(single.length + 30);
      expect(stream.length).assertEqual(116);
      expect(single.length).assertEqual(86);
      expect(stream).assertContain('VERSION:2.1');
      expect(stream.indexOf('EMAIL:')).assertLarger(-1);
      expect(single.indexOf('EMAIL:')).assertEqual(-1);
      expect(stream).assertContain('EMAIL:person0001@example.com\r\n');
      expect(single).assertContain('TEL:13800000001\r\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FIXT_3300
     * @tc.name      testEmptyFields0004
     * @tc.desc      Verify emptyFieldsContactV30 keeps the eight-line layout
     *               and exact length for a two-character display name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmptyFields0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEmptyFields0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: string = VCardFactoryUtils.emptyFieldsContactV30('Jo');
      expect(card.length).assertEqual(73);
      const lines: string[] = card.split('\r\n');
      expect(lines.length).assertEqual(9);
      expect(lines[2]).assertEqual('N:Jo;;;');
      expect(lines[3]).assertEqual('FN:Jo');
      expect(lines[4]).assertEqual('TEL:');
      expect(lines[5]).assertEqual('EMAIL:');
      expect(lines[6]).assertEqual('ORG:');
      expect(countToken(card, '\r\n')).assertEqual(8);
      expect(card.indexOf('TEL:1')).assertEqual(-1);
      expect(card).assertContain('VERSION:3.0\r\nN:Jo;;;\r\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
