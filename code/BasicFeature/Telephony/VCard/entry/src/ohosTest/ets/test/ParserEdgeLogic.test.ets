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
import { VCardManager, VCardPreview } from 'library';

const DOMAIN: number = 0xF811;

/**
 * Edge case fixtures for the parser. Everything is a plain string literal so
 * the suite never touches files, contexts or helpers.
 */
const LF_CARD: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Lin An\nTEL:10086\nEND:VCARD\n';
const CR_CARD: string = 'BEGIN:VCARD\rFN:Cr Card\rEND:VCARD\r';
const MIXED_CARD: string = 'BEGIN:VCARD\r\nVERSION:3.0\nFN:Mix\r\nTEL:10010\nEND:VCARD\r\n';

export default function parserEdgeLogicTest() {
  describe('ParserEdgeLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0100
     * @tc.name      testParserEdgeMissingBegin0001
     * @tc.desc      Verify an END marker without a BEGIN yields NO_CARD while
     *               stray lines before a valid BEGIN are simply ignored.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeMissingBegin0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeMissingBegin0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lonely: VCardPreview = VCardManager.previewContent('END:VCARD\r\n', 'parx_lonely_end.vcf');
      expect(lonely.errorMessage).assertEqual('NO_CARD');
      expect(lonely.cardCount).assertEqual(0);
      const stray: VCardPreview = VCardManager.previewContent(
        'STRAY NOTE\r\nBEGIN:VCARD\r\nFN:Clean Entry\r\nEND:VCARD\r\n', 'parx_stray.vcf');
      expect(stray.cardCount).assertEqual(1);
      expect(stray.cards[0].fullName).assertEqual('Clean Entry');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0200
     * @tc.name      testParserEdgeMissingEnd0001
     * @tc.desc      Verify a card block that never reaches END:VCARD is dropped
     *               and the preview reports NO_CARD with zero counters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeMissingEnd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeMissingEnd0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const ghost: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Ghost Card\r\nTEL:123456\r\n', 'parx_ghost.vcf');
      expect(ghost.errorMessage).assertEqual('NO_CARD');
      expect(ghost.cardCount).assertEqual(0);
      expect(ghost.phoneCount).assertEqual(0);
      expect(ghost.versionText).assertEqual('');
      expect(ghost.cards.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0300
     * @tc.name      testParserEdgeEmptyContent0001
     * @tc.desc      Verify an empty string and a CRLF whitespace-only payload
     *               both report EMPTY_CONTENT while keeping size and file name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeEmptyContent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeEmptyContent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: VCardPreview = VCardManager.previewContent('', 'parx_empty.vcf');
      expect(empty.errorMessage).assertEqual('EMPTY_CONTENT');
      expect(empty.cardCount).assertEqual(0);
      expect(empty.sizeBytes).assertEqual(0);
      expect(empty.fileName).assertEqual('parx_empty.vcf');
      const blank: VCardPreview = VCardManager.previewContent('  \r\n ', 'parx_blank_crlf.vcf');
      expect(blank.errorMessage).assertEqual('EMPTY_CONTENT');
      expect(blank.sizeBytes).assertEqual(5);
      expect(blank.cardCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0400
     * @tc.name      testParserEdgeSingleLine0001
     * @tc.desc      Verify single line inputs, whether a bare BEGIN or a data
     *               property, never produce a card and report NO_CARD.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeSingleLine0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeSingleLine0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const onlyBegin: VCardPreview = VCardManager.previewContent('BEGIN:VCARD', 'parx_begin_only.vcf');
      expect(onlyBegin.errorMessage).assertEqual('NO_CARD');
      expect(onlyBegin.cardCount).assertEqual(0);
      const onlyField: VCardPreview = VCardManager.previewContent('FN:Alone', 'parx_field_only.vcf');
      expect(onlyField.errorMessage).assertEqual('NO_CARD');
      expect(onlyField.cardCount).assertEqual(0);
      expect(onlyField.sizeBytes).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0500
     * @tc.name      testParserEdgeLfOnly0001
     * @tc.desc      Verify a card written with bare LF endings parses exactly
     *               like the CRLF variant, keeping name, version and phones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeLfOnly0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeLfOnly0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lf: VCardPreview = VCardManager.previewContent(LF_CARD, 'parx_lf.vcf');
      expect(lf.errorMessage).assertEqual('');
      expect(lf.cardCount).assertEqual(1);
      expect(lf.versionText).assertEqual('3.0');
      expect(lf.cards[0].fullName).assertEqual('Lin An');
      expect(lf.phoneCount).assertEqual(1);
      expect(lf.cards[0].phones[0]).assertEqual('10086');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0600
     * @tc.name      testParserEdgeCrOnly0001
     * @tc.desc      Verify legacy carriage-return-only line endings are
     *               normalized so every field of the card still parses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeCrOnly0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeCrOnly0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const cr: VCardPreview = VCardManager.previewContent(CR_CARD, 'parx_cr.vcf');
      expect(cr.errorMessage).assertEqual('');
      expect(cr.cardCount).assertEqual(1);
      expect(cr.cards[0].fullName).assertEqual('Cr Card');
      expect(cr.phoneCount).assertEqual(0);
      expect(cr.versionText).assertEqual('2.1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0700
     * @tc.name      testParserEdgeMixedEol0001
     * @tc.desc      Verify a payload mixing CRLF and LF endings parses every
     *               line, so no field is lost across the boundary styles.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeMixedEol0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeMixedEol0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mixed: VCardPreview = VCardManager.previewContent(MIXED_CARD, 'parx_mixed.vcf');
      expect(mixed.errorMessage).assertEqual('');
      expect(mixed.cardCount).assertEqual(1);
      expect(mixed.versionText).assertEqual('3.0');
      expect(mixed.cards[0].fullName).assertEqual('Mix');
      expect(mixed.phoneCount).assertEqual(1);
      expect(mixed.cards[0].phones[0]).assertEqual('10010');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0800
     * @tc.name      testParserEdgeDuplicateFn0001
     * @tc.desc      Verify duplicate FN and VERSION lines overwrite earlier
     *               values, so the last occurrence wins for both fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeDuplicateFn0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeDuplicateFn0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const dupFn: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:First Name\r\nFN:Second Name\r\nEND:VCARD\r\n', 'parx_dup_fn.vcf');
      expect(dupFn.cardCount).assertEqual(1);
      expect(dupFn.cards[0].fullName).assertEqual('Second Name');
      const dupVersion: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:2.1\r\nVERSION:3.0\r\nFN:Version Dup\r\nEND:VCARD\r\n', 'parx_dup_v.vcf');
      expect(dupVersion.cardCount).assertEqual(1);
      expect(dupVersion.cards[0].version).assertEqual('3.0');
      expect(dupVersion.versionText).assertEqual('3.0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_0900
     * @tc.name      testParserEdgeDuplicateNote0001
     * @tc.desc      Verify duplicate NOTE and TITLE properties keep only the
     *               last value while single-value fields never accumulate.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeDuplicateNote0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeDuplicateNote0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const dup: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Note Dup\r\nNOTE:note a\r\nNOTE:note b\r\n' +
        'TITLE:title a\r\nTITLE:title b\r\nEND:VCARD\r\n', 'parx_dup_note.vcf');
      expect(dup.cardCount).assertEqual(1);
      expect(dup.cards[0].note).assertEqual('note b');
      expect(dup.cards[0].jobTitle).assertEqual('title b');
      expect(dup.cards[0].fullName).assertEqual('Note Dup');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1000
     * @tc.name      testParserEdgeLongLine0001
     * @tc.desc      Verify a 5000 character FN line parses completely and the
     *               preview content snapshot stays untruncated below 8KB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeLongLine0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeLongLine0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let longName: string = '';
      for (let i = 0; i < 5000; i++) {
        longName += 'X';
      }
      const text: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:' + longName + '\r\nEND:VCARD\r\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'parx_long_fn.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName.length).assertEqual(5000);
      expect(preview.content.length).assertEqual(text.length);
      expect(preview.sizeBytes).assertLarger(5000);
      expect(preview.errorMessage).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1100
     * @tc.name      testParserEdgeLongNote0001
     * @tc.desc      Verify a NOTE longer than the 8KB snapshot window keeps its
     *               full value while preview.content is truncated to 8192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeLongNote0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeLongNote0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let longNote: string = '';
      for (let i = 0; i < 9000; i++) {
        longNote += 'N';
      }
      const text: string = 'BEGIN:VCARD\r\nFN:Long Note\r\nNOTE:' + longNote + '\r\nEND:VCARD\r\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'parx_long_note.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note.length).assertEqual(9000);
      expect(preview.cards[0].note.length).assertLarger(8192);
      expect(preview.content.length).assertEqual(8192);
      expect(preview.sizeBytes).assertEqual(text.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1200
     * @tc.name      testParserEdgeUnknownVersion0001
     * @tc.desc      Verify unknown VERSION numbers such as 9.9 and 3 are stored
     *               verbatim without validation or rejection.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeUnknownVersion0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeUnknownVersion0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const v99: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:9.9\r\nFN:Future Card\r\nEND:VCARD\r\n', 'parx_v99.vcf');
      expect(v99.cardCount).assertEqual(1);
      expect(v99.versionText).assertEqual('9.9');
      expect(v99.cards[0].version).assertEqual('9.9');
      const v3: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3\r\nFN:Bare Version\r\nEND:VCARD\r\n', 'parx_v3.vcf');
      expect(v3.cardCount).assertEqual(1);
      expect(v3.versionText).assertEqual('3');
      expect(v3.cards[0].version).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1300
     * @tc.name      testParserEdgeUnknownProp0001
     * @tc.desc      Verify X- extensions and common ignored properties leave
     *               every parsed text field untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeUnknownProp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeUnknownProp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Prop Case\r\n' +
        'X-EXT-CODE:42\r\nX-KEEP:true\r\nSOUND:proposal\r\nKEY:secret\r\n' +
        'UID:urn-1234\r\nREV:20260101T000000Z\r\nEND:VCARD\r\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'parx_unknown.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Prop Case');
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].jobTitle).assertEqual('');
      expect(preview.cards[0].organization).assertEqual('');
      expect(preview.cards[0].phones.length).assertEqual(0);
      expect(preview.cards[0].emails.length).assertEqual(0);
      expect(preview.cards[0].websites.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1400
     * @tc.name      testParserEdgeEmptyValue0001
     * @tc.desc      Verify fields with empty values are skipped entirely while
     *               the N fallback still builds the display name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeEmptyValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeEmptyValue0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:\r\nTEL:\r\nEMAIL:\r\nORG:\r\nNOTE:\r\nN:Qian;Tu;;;\r\nEND:VCARD\r\n',
        'parx_empty_values.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Qian Tu');
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.organizationCount).assertEqual(0);
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].organization).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1500
     * @tc.name      testParserEdgeCaseName0001
     * @tc.desc      Verify mixed case property names are matched case
     *               insensitively and routed to the right card fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeCaseName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeCaseName0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nvErSiOn:4.0\r\nFN:Mix Case\r\nTeL:10086\r\nEmaiL:mix@case.example\r\n' +
        'NoTe:mixed notes\r\nTiTlE:tester\r\nEND:VCARD\r\n', 'parx_case_names.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('4.0');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('10086');
      expect(preview.emailCount).assertEqual(1);
      expect(preview.cards[0].emails[0]).assertEqual('mix@case.example');
      expect(preview.cards[0].note).assertEqual('mixed notes');
      expect(preview.cards[0].jobTitle).assertEqual('tester');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1600
     * @tc.name      testParserEdgeBeginSpace0001
     * @tc.desc      Verify BEGIN and END marker values survive trailing spaces
     *               and mixed case because the value is trimmed and uppercased.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeBeginSpace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeBeginSpace0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const spaced: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD  \r\nFN:Spacey Markers\r\nEND:VCARD  \r\n', 'parx_markers_space.vcf');
      expect(spaced.cardCount).assertEqual(1);
      expect(spaced.cards[0].fullName).assertEqual('Spacey Markers');
      const mixedValue: VCardPreview = VCardManager.previewContent(
        'BEGIN: Vcard\r\nFN:Lower Marker\r\nEND: vcard\r\n', 'parx_markers_case.vcf');
      expect(mixedValue.cardCount).assertEqual(1);
      expect(mixedValue.cards[0].fullName).assertEqual('Lower Marker');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1700
     * @tc.name      testParserEdgeGroupPrefix0001
     * @tc.desc      Verify group prefixes on TEL, EMAIL, URL and N are stripped
     *               so the properties still reach their card fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeGroupPrefix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeGroupPrefix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nitem1.TEL:+8613600006666\r\nhome.EMAIL:home@example.cn\r\n' +
        'item7.URL:http://g.example.cn\r\nitem1.N:Deng;Xiao;;;\r\nEND:VCARD\r\n', 'parx_group.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('+8613600006666');
      expect(preview.emailCount).assertEqual(1);
      expect(preview.cards[0].emails[0]).assertEqual('home@example.cn');
      expect(preview.cards[0].websites[0]).assertEqual('http://g.example.cn');
      expect(preview.cards[0].fullName).assertEqual('Deng Xiao');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1800
     * @tc.name      testParserEdgeNestedBegin0001
     * @tc.desc      Verify a second BEGIN:VCARD inside an open card restarts
     *               parsing, abandoning the unfinished outer card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeNestedBegin0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeNestedBegin0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Outer\r\nBEGIN:VCARD\r\nFN:Inner\r\nEND:VCARD\r\n', 'parx_nested.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Inner');
      expect(preview.cards[0].version).assertEqual('');
      expect(preview.versionText).assertEqual('2.1');
      expect(preview.phoneCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_1900
     * @tc.name      testParserEdgeBlankLines0001
     * @tc.desc      Verify blank lines scattered inside a card are skipped and
     *               neighboring properties still parse into the same card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeBlankLines0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeBlankLines0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\n\r\nFN:Gap Card\r\n\r\nTEL:12345\r\n\r\nEND:VCARD\r\n', 'parx_gaps.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Gap Card');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('12345');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2000
     * @tc.name      testParserEdgeNoColon0001
     * @tc.desc      Verify a line without a colon and a whitespace-only line
     *               inside a card are ignored without breaking the card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeNoColon0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeNoColon0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Ok Card\r\nGARBAGE LINE\r\n   \r\nEND:VCARD\r\n', 'parx_no_colon.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Ok Card');
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].phones.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2100
     * @tc.name      testParserEdgeQuotedColon0001
     * @tc.desc      Verify colons inside quoted parameter values do not split
     *               the property, so the real value after them is kept whole.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeQuotedColon0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeQuotedColon0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN;X="a:b":Quoted Name\r\nTEL;NOTE="x:y":555\r\nEND:VCARD\r\n',
        'parx_quoted_colon.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Quoted Name');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('555');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2200
     * @tc.name      testParserEdgeBadEnd0001
     * @tc.desc      Verify an END value that is not exactly VCARD keeps the
     *               card open while a spaced lowercase END still closes it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeBadEnd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeBadEnd0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bad: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Lost Card\r\nEND:VCARD:\r\n', 'parx_bad_end.vcf');
      expect(bad.errorMessage).assertEqual('NO_CARD');
      expect(bad.cardCount).assertEqual(0);
      const lower: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Lower End\r\nEND:vcard \r\n', 'parx_lower_end.vcf');
      expect(lower.cardCount).assertEqual(1);
      expect(lower.cards[0].fullName).assertEqual('Lower End');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2300
     * @tc.name      testParserEdgeBackslash0001
     * @tc.desc      Verify doubled backslashes decode to one literal backslash
     *               and unknown escape pairs are preserved character by character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeBackslash0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeBackslash0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const back: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Back\\\\\r\nEND:VCARD\r\n', 'parx_backslash.vcf');
      expect(back.cardCount).assertEqual(1);
      expect(back.cards[0].fullName).assertEqual('Back\\');
      const odd: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Odd Case\r\nNOTE:A\\Xb\r\nEND:VCARD\r\n', 'parx_odd_escape.vcf');
      expect(odd.cards[0].note).assertEqual('A\\Xb');
      expect(odd.cards[0].fullName).assertEqual('Odd Case');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2400
     * @tc.name      testParserEdgeFoldAfterBegin0001
     * @tc.desc      Verify a continuation line right after BEGIN merges into
     *               the BEGIN line so no valid card is recognized at all.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeFoldAfterBegin0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeFoldAfterBegin0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\n FN:Folded\r\nEND:VCARD\r\n', 'parx_fold_begin.vcf');
      expect(preview.errorMessage).assertEqual('NO_CARD');
      expect(preview.cardCount).assertEqual(0);
      expect(preview.cards.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2500
     * @tc.name      testParserEdgeCjkValue0001
     * @tc.desc      Verify CJK values in FN, ORG and ADR parse exactly without
     *               corruption from trimming or component joining.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserEdgeCjkValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserEdgeCjkValue0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:李白\r\nORG:云途科技\r\n' +
        'ADR:;;西湖区文一路;;杭州;310012;\r\nEND:VCARD\r\n', 'parx_cjk.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('李白');
      expect(preview.cards[0].organization).assertEqual('云途科技');
      expect(preview.addressCount).assertEqual(1);
      expect(preview.cards[0].addresses[0]).assertEqual('西湖区文一路 杭州 310012');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2600
     * @tc.name      testParserEdgeBinaryTel0001
     * @tc.desc      Verify TEL lines carrying BASE64 or ENCODING=B parameters
     *               are skipped as binary so the phone count stays zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeBinaryTel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeBinaryTel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Binary Tel\r\nTEL;ENCODING=B:+8613600007777\r\n' +
        'TEL;BASE64:8888\r\nEND:VCARD\r\n', 'parx_binary_tel.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.cards[0].phones.length).assertEqual(0);
      expect(preview.cards[0].fullName).assertEqual('Binary Tel');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2700
     * @tc.name      testParserEdgeParamOnly0001
     * @tc.desc      Verify a parameter-only TEL line without a colon carries an
     *               empty value, is skipped and leaves the card intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeParamOnly0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeParamOnly0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:No Value\r\nTEL;TYPE=CELL\r\nEND:VCARD\r\n', 'parx_param_only.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.cards[0].fullName).assertEqual('No Value');
      expect(preview.errorMessage).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2800
     * @tc.name      testParserEdgeDeepGroup0001
     * @tc.desc      Verify a multi-dot group prefix resolves to the property
     *               after the last dot and grouped unknown props stay ignored.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeDeepGroup0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeDeepGroup0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Deep Group\r\na.b.TEL:123\r\ng1.X-FOO:bar\r\nEND:VCARD\r\n',
        'parx_deep_group.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('123');
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].jobTitle).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_2900
     * @tc.name      testParserEdgeTabMarkers0001
     * @tc.desc      Verify BEGIN and END markers still open and close a card
     *               when the VCARD value is followed by trailing tab spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeTabMarkers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeTabMarkers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\t\r\nVERSION:3.0\r\nFN:Tab Marker\r\nEND:VCARD\t\r\n', 'parx_tab_marker.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.cards[0].fullName).assertEqual('Tab Marker');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3000
     * @tc.name      testParserEdgeDuplicateAdr0001
     * @tc.desc      Verify two identical ADR lines both survive as separate
     *               address entries without de-duplication.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeDuplicateAdr0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeDuplicateAdr0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Dup Adr\r\nADR:;;Twin Tower;Beijing;;100000;\r\n' +
        'ADR:;;Twin Tower;Beijing;;100000;\r\nEND:VCARD\r\n', 'parx_dup_adr.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(2);
      expect(preview.cards[0].addresses.length).assertEqual(2);
      expect(preview.cards[0].addresses[0]).assertEqual('Twin Tower Beijing 100000');
      expect(preview.cards[0].addresses[1]).assertEqual('Twin Tower Beijing 100000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3100
     * @tc.name      testParserEdgeDuplicateTelEmail0001
     * @tc.desc      Verify duplicated EMAIL and URL lines each append another
     *               list entry and bump the preview counters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeDuplicateTelEmail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeDuplicateTelEmail0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Dup Fields\r\nEMAIL:same@example.cn\r\nEMAIL:same@example.cn\r\n' +
        'URL:http://dup.example.cn\r\nURL:http://dup.example.cn\r\nEND:VCARD\r\n',
        'parx_dup_email_url.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.emailCount).assertEqual(2);
      expect(preview.cards[0].emails[0]).assertEqual('same@example.cn');
      expect(preview.cards[0].emails[1]).assertEqual('same@example.cn');
      expect(preview.cards[0].websites.length).assertEqual(2);
      expect(preview.cards[0].websites[1]).assertEqual('http://dup.example.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3200
     * @tc.name      testParserEdgeManyCardsNoEnd0001
     * @tc.desc      Verify a trailing card without END is dropped while the
     *               earlier closed card is still returned and counted.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeManyCardsNoEnd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeManyCardsNoEnd0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Open One\r\nEND:VCARD\r\nBEGIN:VCARD\r\nFN:Open Two\r\n',
        'parx_open_two.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards.length).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Open One');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3300
     * @tc.name      testParserEdgeQpTrailingEquals0001
     * @tc.desc      Verify a quoted-printable value ending with a bare equals
     *               sign keeps the literal character when nothing follows.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeQpTrailingEquals0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeQpTrailingEquals0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Qp Tail\r\nNOTE;ENCODING=QUOTED-PRINTABLE:End=\r\nEND:VCARD\r\n',
        'parx_qp_tail.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('End=');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3400
     * @tc.name      testParserEdgeQpLowerHex0001
     * @tc.desc      Verify lowercase hex digits in quoted-printable escapes
     *               decode correctly into the matching punctuation characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeQpLowerHex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeQpLowerHex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Qp Lower\r\nNOTE;ENCODING=QUOTED-PRINTABLE:a=2fb=3fc\r\nEND:VCARD\r\n',
        'parx_qp_lower.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('a/b?c');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3500
     * @tc.name      testParserEdgeUnescapeColon0001
     * @tc.desc      Verify an escaped colon sequence in a NOTE value becomes a
     *               plain colon and the value is stored once, not split.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeUnescapeColon0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeUnescapeColon0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Esc Colon\r\nNOTE:At\\:home\r\nEND:VCARD\r\n', 'parx_esc_colon.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('At:home');
      expect(preview.cards[0].fullName).assertEqual('Esc Colon');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3600
     * @tc.name      testParserEdgeVersionOrder0001
     * @tc.desc      Verify the preview version text comes from the first card
     *               declaring a version while later cards keep their own value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeVersionOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeVersionOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Head Card\r\nEND:VCARD\r\n' +
        'BEGIN:VCARD\r\nVERSION:4.0\r\nFN:Tail Card\r\nEND:VCARD\r\n', 'parx_v_order.vcf');
      expect(preview.cardCount).assertEqual(2);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.cards[0].version).assertEqual('3.0');
      expect(preview.cards[1].version).assertEqual('4.0');
      expect(preview.cards[1].fullName).assertEqual('Tail Card');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARX_3700
     * @tc.name      testParserEdgeEmptyParams0001
     * @tc.desc      Verify parameterized fields with empty values are skipped
     *               exactly like bare empty fields and the name fallback runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserEdgeEmptyParams0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserEdgeEmptyParams0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN;X=1:\r\nTEL;TYPE=CELL:\r\nEMAIL;TYPE=HOME: \r\n' +
        'N:Rui;Xin;;;\r\nEND:VCARD\r\n', 'parx_empty_params.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.cards[0].fullName).assertEqual('Rui Xin');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
