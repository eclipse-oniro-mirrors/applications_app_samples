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
import { ContactSummary, VCardManager, VCardPreview } from 'library';

const DOMAIN: number = 0xF811;
const CARD_V30: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:John Doe\nTEL:+8613800000000\n' +
  'TEL:+8613900000000\nEMAIL:john@example.com\nEMAIL:jdoe@example.com\nORG:Acme\n' +
  'TITLE:Engineer\nURL:https://acme.example\nNOTE:hello card\nEND:VCARD\n';
const CARD_PAIR: string = CARD_V30 + 'BEGIN:VCARD\nVERSION:3.0\nFN:Alice Wang\n' +
  'TEL:+8613700000000\nEMAIL:alice@example.com\nORG:Beta\nTITLE:Manager\n' +
  'URL:https://beta.example\nNOTE:second card\nEND:VCARD\n';

function buildCards(count: number): string {
  let text: string = '';
  for (let i = 0; i < count; i++) {
    text += 'BEGIN:VCARD\nVERSION:3.0\nFN:User ' + i + '\nTEL:1234567890\nEND:VCARD\n';
  }
  return text;
}

export default function vCardParserLogicTest() {
  describe('VCardParserLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0100
     * @tc.name      testParserEmpty0001
     * @tc.desc      Verify parse reports EMPTY_CONTENT and zero cards for empty
     *               or whitespace-only content while keeping the file name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEmpty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: VCardPreview = VCardManager.previewContent('', 'empty.vcf');
      expect(empty.errorMessage).assertEqual('EMPTY_CONTENT');
      expect(empty.cardCount).assertEqual(0);
      expect(empty.fileName).assertEqual('empty.vcf');
      expect(empty.sizeBytes).assertEqual(0);
      const blank: VCardPreview = VCardManager.previewContent('   \n\t ', 'blank.vcf');
      expect(blank.errorMessage).assertEqual('EMPTY_CONTENT');
      expect(blank.cardCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0200
     * @tc.name      testParserNoCard0001
     * @tc.desc      Verify parse reports NO_CARD for text without a VCARD block
     *               and leaves the version text unset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserNoCard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserNoCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent('HELLO WORLD', 'notes.txt');
      expect(preview.errorMessage).assertEqual('NO_CARD');
      expect(preview.cardCount).assertEqual(0);
      expect(preview.sizeBytes).assertEqual(11);
      expect(preview.versionText).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0300
     * @tc.name      testParserBasic0001
     * @tc.desc      Verify parse of a complete 3.0 card counts phones, emails,
     *               organization, title, url and note fields correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserBasic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserBasic0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_V30, 'john.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.phoneCount).assertEqual(2);
      expect(preview.emailCount).assertEqual(2);
      expect(preview.organizationCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(0);
      expect(preview.cards[0].fullName).assertEqual('John Doe');
      expect(preview.cards[0].jobTitle).assertEqual('Engineer');
      expect(preview.cards[0].note).assertEqual('hello card');
      expect(preview.cards[0].websites.length).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('+8613800000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0400
     * @tc.name      testParserName0001
     * @tc.desc      Verify the display name comes from FN when present and falls
     *               back to the joined N family/given pair otherwise, skipping
     *               empty FN values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserName0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const onlyN: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nN:Doe;John;;;\nEND:VCARD\n', 'n.vcf');
      expect(onlyN.cardCount).assertEqual(1);
      expect(onlyN.cards[0].fullName).assertEqual('Doe John');
      const nAndFn: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nN:Doe;John;;;\nFN:John Doe\nEND:VCARD\n', 'nf.vcf');
      expect(nAndFn.cards[0].fullName).assertEqual('John Doe');
      const emptyFn: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nFN:\nN:Doe;John;;;\nEND:VCARD\n', 'ef.vcf');
      expect(emptyFn.cards[0].fullName).assertEqual('Doe John');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0500
     * @tc.name      testParserEscape0001
     * @tc.desc      Verify escaped comma, semicolon and \n sequences in field
     *               values are decoded to real characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEscape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEscape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nFN:Zhang\\, San\nTEL:+86\\;ext=123\nNOTE:Line1\\nLine2\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'esc.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Zhang, San');
      expect(preview.cards[0].phones[0]).assertEqual('+86;ext=123');
      expect(preview.cards[0].note).assertContain('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0600
     * @tc.name      testParserFold0001
     * @tc.desc      Verify folded continuation lines starting with space or tab
     *               are joined, and the quoted-printable soft break marker is
     *               dropped before decoding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFold0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFold0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const spaceFold: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nFN:John\n Doe\nEND:VCARD\n', 'f1.vcf');
      expect(spaceFold.cardCount).assertEqual(1);
      expect(spaceFold.cards[0].fullName).assertEqual('JohnDoe');
      const tabFold: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nFN:Tom\n\tCat\nEND:VCARD\n', 'f2.vcf');
      expect(tabFold.cards[0].fullName).assertEqual('TomCat');
      const qpFold: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN;ENCODING=QUOTED-PRINTABLE:Zhang=\n San=2DXiao\nEND:VCARD\n', 'f3.vcf');
      expect(qpFold.cards[0].fullName).assertEqual('ZhangSan-Xiao');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0700
     * @tc.name      testParserQuotedPrintable0001
     * @tc.desc      Verify quoted-printable payloads decode hex escapes including
     *               a UTF-8 multi-byte character and keep invalid hex as text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserQuotedPrintable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserQuotedPrintable0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const space: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN;ENCODING=QUOTED-PRINTABLE:John=20Doe\nEND:VCARD\n', 'q1.vcf');
      expect(space.cardCount).assertEqual(1);
      expect(space.cards[0].fullName).assertEqual('John Doe');
      const cjk: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Temp\nNOTE;ENCODING=QUOTED-PRINTABLE:=E4=B8=AD\nEND:VCARD\n', 'q2.vcf');
      expect(cjk.cards[0].note).assertEqual('中');
      const invalid: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Temp\nTITLE;ENCODING=QUOTED-PRINTABLE:=ZZ\nEND:VCARD\n', 'q3.vcf');
      expect(invalid.cards[0].jobTitle).assertEqual('=ZZ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0800
     * @tc.name      testParserBinarySkip0001
     * @tc.desc      Verify BASE64 and ENCODING=B binary fields are skipped and do
     *               not pollute the parsed text fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserBinarySkip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserBinarySkip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:2.1\nPHOTO;ENCODING=BASE64:AAAA\n' +
        'LOGO;ENCODING=B:BBBB\nFN:Bob\nTEL:+8613800000000\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'bin.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Bob');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].emails.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_0900
     * @tc.name      testParserMultiCard0001
     * @tc.desc      Verify parse handles several cards including lowercase begin
     *               markers and takes the first declared VERSION as version text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserMultiCard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserMultiCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:2.1\nFN:First\nEND:VCARD\n' +
        'BEGIN:VCARD\nVERSION:3.0\nFN:Second\nEND:VCARD\n' +
        'begin:vcard\nFN:Third\nend:vcard\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'multi.vcf');
      expect(preview.cardCount).assertEqual(3);
      expect(preview.versionText).assertEqual('2.1');
      expect(preview.cards[2].fullName).assertEqual('Third');
      expect(preview.cards[2].version).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_1000
     * @tc.name      testParserPreviewLimit0001
     * @tc.desc      Verify parse keeps counting all cards but only retains the
     *               first PREVIEW_CARD_LIMIT cards for preview rendering.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserPreviewLimit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserPreviewLimit0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(buildCards(25), 'many.vcf');
      expect(preview.cardCount).assertEqual(25);
      expect(preview.cards.length).assertEqual(20);
      expect(preview.phoneCount).assertEqual(25);
      expect(preview.cards[19].fullName).assertEqual('User 19');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_1100
     * @tc.name      testParserContentLimit0001
     * @tc.desc      Verify the preview content snapshot is truncated to 8KB while
     *               card parsing still covers the full source text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserContentLimit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserContentLimit0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let big: string = '';
      for (let i = 0; i < 9000; i++) {
        big += 'A';
      }
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:' + big + '\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'big.vcf');
      expect(preview.content.length).assertEqual(8192);
      expect(preview.cardCount).assertEqual(1);
      expect(preview.sizeBytes).assertEqual(text.length);
      expect(preview.cards[0].fullName.length).assertEqual(9000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_1200
     * @tc.name      testParserToContacts0001
     * @tc.desc      Verify preview cards convert to contact summaries with stable
     *               preview ids and copied phones, emails and grouped fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserToContacts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserToContacts0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_PAIR, 'pair.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts.length).assertEqual(2);
      expect(contacts[0].id).assertEqual(0);
      expect(contacts[0].key).assertEqual('preview_0');
      expect(contacts[0].fullName).assertEqual('John Doe');
      expect(contacts[0].initial).assertEqual('J');
      expect(contacts[0].phones.length).assertEqual(2);
      expect(contacts[0].emails.length).assertEqual(2);
      expect(contacts[0].organization).assertEqual('Acme');
      expect(contacts[0].jobTitle).assertEqual('Engineer');
      expect(contacts[1].id).assertEqual(1);
      expect(contacts[1].key).assertEqual('preview_1');
      expect(contacts[1].fullName).assertEqual('Alice Wang');
      expect(contacts[1].initial).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARSER_1300
     * @tc.name      testParserCaseInsensitive0001
     * @tc.desc      Verify lowercase property names, lowercase VCARD markers and
     *               group prefixes like item1.FN are recognized, and values are
     *               trimmed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserCaseInsensitive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserCaseInsensitive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lower: VCardPreview = VCardManager.previewContent(
        'begin:vcard\nversion:3.0\nfn: alice \nend:vcard\n', 'low.vcf');
      expect(lower.cardCount).assertEqual(1);
      expect(lower.versionText).assertEqual('3.0');
      expect(lower.cards[0].fullName).assertEqual('alice');
      const grouped: VCardPreview = VCardManager.previewContent(
        'begin:vcard\nitem1.FN:Grouped\nend:vcard\n', 'grp.vcf');
      expect(grouped.cards[0].fullName).assertEqual('Grouped');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
