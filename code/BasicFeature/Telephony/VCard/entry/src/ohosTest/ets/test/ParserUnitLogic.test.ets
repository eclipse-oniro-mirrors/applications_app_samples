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
 * Field-by-field parse matrix fixtures. Every fixture is a plain string
 * literal with '\r\n' line endings so the suite stays independent from any
 * file or context helper.
 */
const CARD_N_FIVE: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nN:Li;Ming;Wei;Dr.;;\r\nFN:Ming Li\r\nEND:VCARD\r\n';
const CARD_TEL_TRIPLE: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Duo Han\r\nTEL:+8613600001111\r\n' +
  'TEL:010-6688 8888\r\nTEL:+1 (415) 555-0199\r\nEND:VCARD\r\n';
const CARD_TEL_TYPED: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Typed Han\r\n' +
  'TEL;TYPE=CELL,VOICE:+8613700002222\r\nTEL;TYPE=HOME,VOICE:0571-8811 2233\r\nEND:VCARD\r\n';
const CARD_ORG_TREE: string = 'BEGIN:VCARD\r\nVERSION:4.0\r\nFN:Lin Qiao\r\n' +
  'ORG:Sunrise Tech;Mobile Dev;Platform\r\nTITLE:Platform Engineer\r\nEND:VCARD\r\n';
const CARD_ADR_FULL: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Yun Bo\r\n' +
  'ADR:;;88 Innovation Road;Hangzhou;Zhejiang;310000;China\r\nEND:VCARD\r\n';
const CARD_ADR_SPARSE: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Yun Bo\r\n' +
  'ADR:;;;Shanghai;;200000;\r\nEND:VCARD\r\n';
const CARD_ADR_PAIR: string = 'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Yun Bo\r\n' +
  'ADR:;;1 Harbor View;Shanghai;;200080;China\r\n' +
  'ADR:;;9 Lake Side;Suzhou;;215000;China\r\n' +
  'ADR:;;;;;\r\nEND:VCARD\r\n';
const CARD_VERSION_21: string = 'BEGIN:VCARD\r\nVERSION:2.1\r\nN:He;Lei;;;\r\n' +
  'TEL;TYPE=CELL:+8613800004444\r\nEND:VCARD\r\n';
const CARD_VERSION_40: string = 'BEGIN:VCARD\r\nVERSION:4.0\r\nFN:Su Wan\r\n' +
  'TEL;TYPE=cell:+8613900005555\r\nEND:VCARD\r\n';
const CARD_COMBO_40: string = 'BEGIN:VCARD\r\nVERSION:4.0\r\nN:Chen;Jing;Hua;Ms.;;\r\nFN:Jing Chen\r\n' +
  'ORG:Northwind;Design\r\nTITLE:UX Lead\r\nTEL;TYPE=cell:+8618600003333\r\nTEL;TYPE=work:021-96888\r\n' +
  'EMAIL:jing.chen@northwind.example\r\nADR:;;1 Harbor View;Shanghai;;200080;China\r\n' +
  'NOTE:Combo card\r\nURL:https://northwind.example/jing\r\nEND:VCARD\r\n';

export default function parserUnitLogicTest() {
  describe('ParserUnitLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0100
     * @tc.name      testParserFieldN0001
     * @tc.desc      Verify a five-component N structure keeps FN as the display
     *               name and reports the declared VERSION value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldN0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldN0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_N_FIVE, 'pars_n_five.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.cards[0].fullName).assertEqual('Ming Li');
      expect(preview.cards[0].version).assertEqual('3.0');
      expect(preview.cards[0].phones.length).assertEqual(0);
      expect(preview.cards[0].emails.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0200
     * @tc.name      testParserFieldN0002
     * @tc.desc      Verify the N fallback joins family and given, keeps a
     *               given-only N and yields an empty name when N is blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldN0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldN0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const familyFirst: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nN:Zhou;Kai;;;\r\nEND:VCARD\r\n', 'pars_n_family.vcf');
      expect(familyFirst.cardCount).assertEqual(1);
      expect(familyFirst.cards[0].fullName).assertEqual('Zhou Kai');
      const givenOnly: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nN:;Yan;;;;\r\nEND:VCARD\r\n', 'pars_n_given.vcf');
      expect(givenOnly.cards[0].fullName).assertEqual('Yan');
      const blankN: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nN:;;;;\r\nEND:VCARD\r\n', 'pars_n_blank.vcf');
      expect(blankN.cards[0].fullName).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0300
     * @tc.name      testParserFieldN0003
     * @tc.desc      Verify an escaped semicolon inside the N family component
     *               survives component splitting and decodes to a literal ';'.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldN0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldN0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nN:Ma\\;Rui;Jie;;;\r\nEND:VCARD\r\n', 'pars_n_escape.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Ma;Rui Jie');
      expect(preview.cards[0].phones.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0400
     * @tc.name      testParserFieldN0004
     * @tc.desc      Verify FN always beats the N fallback even when N follows
     *               FN, and a repeated N line overwrites the earlier one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldN0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldN0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fnFirst: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Wang Fang\r\nN:Zhao;Lan;;;\r\nEND:VCARD\r\n', 'pars_n_after_fn.vcf');
      expect(fnFirst.cards[0].fullName).assertEqual('Wang Fang');
      const twiceN: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nN:Old;Name;;;\r\nN:New;Name;;;\r\nEND:VCARD\r\n', 'pars_n_twice.vcf');
      expect(twiceN.cardCount).assertEqual(1);
      expect(twiceN.cards[0].fullName).assertEqual('New Name');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0500
     * @tc.name      testParserFieldFn0001
     * @tc.desc      Verify FN values are trimmed on both ends and an escaped
     *               comma decodes into a real comma inside the display name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldFn0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldFn0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const trimmed: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:  Grace Lee  \r\nEND:VCARD\r\n', 'pars_fn_trim.vcf');
      expect(trimmed.cardCount).assertEqual(1);
      expect(trimmed.cards[0].fullName).assertEqual('Grace Lee');
      const comma: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Liu\\, Bei\r\nEND:VCARD\r\n', 'pars_fn_comma.vcf');
      expect(comma.cards[0].fullName).assertEqual('Liu, Bei');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0600
     * @tc.name      testParserFieldFn0002
     * @tc.desc      Verify a doubled backslash decodes to one backslash and an
     *               unknown escape pair is preserved verbatim in FN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldFn0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldFn0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const backslash: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Path\\\\End\r\nEND:VCARD\r\n', 'pars_fn_bslash.vcf');
      expect(backslash.cardCount).assertEqual(1);
      expect(backslash.cards[0].fullName).assertEqual('Path\\End');
      const unknown: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:A\\Xb\r\nEND:VCARD\r\n', 'pars_fn_unknown_esc.vcf');
      expect(unknown.cards[0].fullName).assertEqual('A\\Xb');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0700
     * @tc.name      testParserFieldTel0001
     * @tc.desc      Verify three plain TEL lines produce three ordered phone
     *               entries and the preview phone count matches.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldTel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldTel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_TEL_TRIPLE, 'pars_tel_triple.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(3);
      expect(preview.cards[0].phones.length).assertEqual(3);
      expect(preview.cards[0].phones[0]).assertEqual('+8613600001111');
      expect(preview.cards[0].phones[1]).assertEqual('010-6688 8888');
      expect(preview.cards[0].phones[2]).assertEqual('+1 (415) 555-0199');
      expect(preview.cards[0].emails.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0800
     * @tc.name      testParserFieldTel0002
     * @tc.desc      Verify TEL lines carrying TYPE parameters are accepted and
     *               only the value part is stored as the phone number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldTel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldTel0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_TEL_TYPED, 'pars_tel_typed.vcf');
      expect(preview.phoneCount).assertEqual(2);
      expect(preview.cards[0].phones.length).assertEqual(2);
      expect(preview.cards[0].phones[0]).assertEqual('+8613700002222');
      expect(preview.cards[0].phones[1]).assertEqual('0571-8811 2233');
      expect(preview.cards[0].fullName).assertEqual('Typed Han');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_0900
     * @tc.name      testParserFieldTel0003
     * @tc.desc      Verify duplicated TEL lines are both kept because the
     *           parser does not de-duplicate phone entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldTel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldTel0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Hotline\r\nTEL:400-000-1234\r\nTEL:400-000-1234\r\nEND:VCARD\r\n',
        'pars_tel_dup.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(2);
      expect(preview.cards[0].phones.length).assertEqual(2);
      expect(preview.cards[0].phones[0]).assertEqual('400-000-1234');
      expect(preview.cards[0].phones[1]).assertEqual('400-000-1234');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1000
     * @tc.name      testParserFieldEmail0001
     * @tc.desc      Verify two EMAIL lines with TYPE parameters are collected
     *               in order and counted by the preview email total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldEmail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldEmail0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Wei Gong\r\n' +
        'EMAIL;TYPE=HOME:wei.gong@corp.example.cn\r\n' +
        'EMAIL;TYPE=WORK:gong.wei@mail.example.cn\r\nEND:VCARD\r\n', 'pars_email_pair.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.emailCount).assertEqual(2);
      expect(preview.cards[0].emails.length).assertEqual(2);
      expect(preview.cards[0].emails[0]).assertEqual('wei.gong@corp.example.cn');
      expect(preview.cards[0].emails[1]).assertEqual('gong.wei@mail.example.cn');
      expect(preview.cards[0].phones.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1100
     * @tc.name      testParserFieldEmail0002
     * @tc.desc      Verify a quoted-printable EMAIL decodes =2E and =40 into
     *               dot and at-sign while a following plain email stays intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldEmail0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldEmail0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Lu Han\r\n' +
        'EMAIL;ENCODING=QUOTED-PRINTABLE:lu=2Ehan=40mail.example.cn\r\n' +
        'EMAIL:work@example.cn\r\nEND:VCARD\r\n', 'pars_email_qp.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.emailCount).assertEqual(2);
      expect(preview.cards[0].emails[0]).assertEqual('lu.han@mail.example.cn');
      expect(preview.cards[0].emails[1]).assertEqual('work@example.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1200
     * @tc.name      testParserFieldOrg0001
     * @tc.desc      Verify a multi-level ORG keeps only the first component as
     *               organization while TITLE maps to the job title field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldOrg0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldOrg0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_ORG_TREE, 'pars_org_tree.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.organizationCount).assertEqual(1);
      expect(preview.cards[0].organization).assertEqual('Sunrise Tech');
      expect(preview.cards[0].jobTitle).assertEqual('Platform Engineer');
      expect(preview.cards[0].version).assertEqual('4.0');
      expect(preview.cards[0].note).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1300
     * @tc.name      testParserFieldOrg0002
     * @tc.desc      Verify an escaped semicolon inside ORG stays within the
     *               first component instead of starting a second level.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldOrg0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldOrg0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Org Case\r\nORG:B\\;C Co;Team\r\nEND:VCARD\r\n', 'pars_org_escape.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].organization).assertEqual('B;C Co');
      expect(preview.cards[0].jobTitle).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1400
     * @tc.name      testParserFieldNote0001
     * @tc.desc      Verify the NOTE escaped newline sequence decodes into a
     *               real line break inside the stored note text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldNote0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldNote0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Note Case\r\nNOTE:First\\nSecond\r\nEND:VCARD\r\n',
        'pars_note_nl.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('First\nSecond');
      expect(preview.cards[0].note).assertContain('\n');
      expect(preview.cards[0].note.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1500
     * @tc.name      testParserFieldNote0002
     * @tc.desc      Verify a repeated NOTE line overwrites the earlier note so
     *               the last occurrence wins for single-value fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldNote0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldNote0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Note Twice\r\nNOTE:draft note\r\nNOTE:final note\r\nEND:VCARD\r\n',
        'pars_note_dup.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('final note');
      expect(preview.cards[0].note).assertContain('final');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1600
     * @tc.name      testParserFieldAdr0001
     * @tc.desc      Verify a full ADR joins street, city, region, postal code
     *               and country components with single spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldAdr0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldAdr0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_ADR_FULL, 'pars_adr_full.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(1);
      expect(preview.cards[0].addresses.length).assertEqual(1);
      expect(preview.cards[0].addresses[0]).assertEqual('88 Innovation Road Hangzhou Zhejiang 310000 China');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1700
     * @tc.name      testParserFieldAdr0002
     * @tc.desc      Verify an ADR with empty components keeps only the non
     *               empty city and postal parts in the joined address text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldAdr0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldAdr0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_ADR_SPARSE, 'pars_adr_sparse.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(1);
      expect(preview.cards[0].addresses[0]).assertEqual('Shanghai 200000');
      expect(preview.cards[0].addresses[0]).assertContain('Shanghai');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1800
     * @tc.name      testParserFieldAdr0003
     * @tc.desc      Verify multiple ADR lines each become one address entry
     *               while an ADR with all empty components adds nothing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldAdr0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldAdr0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_ADR_PAIR, 'pars_adr_pair.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(2);
      expect(preview.cards[0].addresses.length).assertEqual(2);
      expect(preview.cards[0].addresses[0]).assertEqual('1 Harbor View Shanghai 200080 China');
      expect(preview.cards[0].addresses[1]).assertEqual('9 Lake Side Suzhou 215000 China');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_1900
     * @tc.name      testParserFieldBday0001
     * @tc.desc      Verify a BDAY line is silently ignored and never leaks
     *               into any stored contact field of the parsed card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldBday0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldBday0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Ann Lee\r\nBDAY:1990-05-20\r\nEND:VCARD\r\n',
        'pars_bday.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Ann Lee');
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].jobTitle).assertEqual('');
      expect(preview.cards[0].phones.length).assertEqual(0);
      expect(preview.cards[0].emails.length).assertEqual(0);
      expect(preview.cards[0].websites.length).assertEqual(0);
      expect(preview.cards[0].addresses.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2000
     * @tc.name      testParserFieldPhoto0001
     * @tc.desc      Verify PHOTO without an encoding parameter and PHOTO with
     *               ENCODING=B are both dropped without breaking other fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldPhoto0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldPhoto0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const plainPhoto: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Media Case\r\nPHOTO:JPEGDATA\r\nNOTE:clean note\r\nEND:VCARD\r\n',
        'pars_photo_plain.vcf');
      expect(plainPhoto.cardCount).assertEqual(1);
      expect(plainPhoto.cards[0].fullName).assertEqual('Media Case');
      expect(plainPhoto.cards[0].note).assertEqual('clean note');
      const binaryPhoto: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Media Case\r\nPHOTO;ENCODING=B:XYZ\r\nNOTE:clean note\r\nEND:VCARD\r\n',
        'pars_photo_b.vcf');
      expect(binaryPhoto.cardCount).assertEqual(1);
      expect(binaryPhoto.cards[0].fullName).assertEqual('Media Case');
      expect(binaryPhoto.cards[0].note).assertEqual('clean note');
      expect(binaryPhoto.cards[0].phones.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2100
     * @tc.name      testParserFieldTitle0001
     * @tc.desc      Verify TITLE values are trimmed into jobTitle and repeated
     *               URL lines all land in the websites list in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserFieldTitle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserFieldTitle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION:3.0\r\nFN:Url Case\r\nTITLE:  QA Lead  \r\n' +
        'URL:http://dev.example.cn/blog\r\nURL:http://dev.example.cn/docs\r\nEND:VCARD\r\n',
        'pars_title_url.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].jobTitle).assertEqual('QA Lead');
      expect(preview.cards[0].websites.length).assertEqual(2);
      expect(preview.cards[0].websites[0]).assertEqual('http://dev.example.cn/blog');
      expect(preview.cards[0].websites[1]).assertEqual('http://dev.example.cn/docs');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2200
     * @tc.name      testParserVersionLegacy0001
     * @tc.desc      Verify a VERSION:2.1 card reports 2.1 for both the card
     *               version and the preview version text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserVersionLegacy0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserVersionLegacy0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_VERSION_21, 'pars_v21.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('2.1');
      expect(preview.cards[0].version).assertEqual('2.1');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('+8613800004444');
      expect(preview.cards[0].fullName).assertEqual('He Lei');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2300
     * @tc.name      testParserVersionFour0001
     * @tc.desc      Verify a VERSION:4.0 card keeps the 4.0 marker and accepts
     *               lowercase TYPE parameters on TEL lines.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserVersionFour0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserVersionFour0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_VERSION_40, 'pars_v40.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('4.0');
      expect(preview.cards[0].version).assertEqual('4.0');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('+8613900005555');
      expect(preview.cards[0].fullName).assertEqual('Su Wan');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2400
     * @tc.name      testParserVersionMissing0001
     * @tc.desc      Verify a card without any VERSION line still parses and the
     *               preview falls back to the built-in default version 2.1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserVersionMissing0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserVersionMissing0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:No Version\r\nEND:VCARD\r\n', 'pars_v_missing.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].version).assertEqual('');
      expect(preview.versionText).assertEqual('2.1');
      expect(preview.cards[0].fullName).assertEqual('No Version');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2500
     * @tc.name      testParserComboCard0001
     * @tc.desc      Verify one combined 4.0 card with N, FN, ORG, TITLE, two
     *               TEL, EMAIL, ADR, NOTE and URL fills every field correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParserComboCard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParserComboCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_COMBO_40, 'pars_combo.vcf');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('4.0');
      expect(preview.phoneCount).assertEqual(2);
      expect(preview.emailCount).assertEqual(1);
      expect(preview.organizationCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Jing Chen');
      expect(preview.cards[0].organization).assertEqual('Northwind');
      expect(preview.cards[0].jobTitle).assertEqual('UX Lead');
      expect(preview.cards[0].note).assertEqual('Combo card');
      expect(preview.cards[0].phones[0]).assertEqual('+8618600003333');
      expect(preview.cards[0].phones[1]).assertEqual('021-96888');
      expect(preview.cards[0].emails[0]).assertEqual('jing.chen@northwind.example');
      expect(preview.cards[0].addresses[0]).assertEqual('1 Harbor View Shanghai 200080 China');
      expect(preview.cards[0].websites[0]).assertEqual('https://northwind.example/jing');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2600
     * @tc.name      testParserFieldNote0003
     * @tc.desc      Verify a quoted-printable NOTE decodes =20 and =21 hex
     *               sequences into space and exclamation characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldNote0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldNote0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Qp Note\r\nNOTE;ENCODING=QUOTED-PRINTABLE:See=20you=21\r\nEND:VCARD\r\n',
        'pars_note_qp.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('See you!');
      expect(preview.cards[0].note).assertContain('you');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2700
     * @tc.name      testParserFieldTel0004
     * @tc.desc      Verify TEL values survive a quoted colon inside parameters
     *               and a group prefix, keeping the value text untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldTel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldTel0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Tel Param\r\nTEL;X="a:1":+8613600008888\r\n' +
        'item1.TEL:010-0000\r\nEND:VCARD\r\n', 'pars_tel_param.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(2);
      expect(preview.cards[0].phones[0]).assertEqual('+8613600008888');
      expect(preview.cards[0].phones[1]).assertEqual('010-0000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2800
     * @tc.name      testParserFieldUrl0001
     * @tc.desc      Verify an unknown escape pair inside a URL value is kept
     *               verbatim instead of being stripped by the unescape pass.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldUrl0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldUrl0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Url Case\r\nURL:https://a.example.cn/p?q=1\\\\&r=2\r\nEND:VCARD\r\n',
        'pars_url_escape.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].websites.length).assertEqual(1);
      expect(preview.cards[0].websites[0]).assertEqual('https://a.example.cn/p?q=1\\&r=2');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_2900
     * @tc.name      testParserFieldOrg0003
     * @tc.desc      Verify empty and whitespace-only ORG values never create an
     *               organization entry and the preview counter stays zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldOrg0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldOrg0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Org Blank\r\nORG:\r\nORG:   \r\nEND:VCARD\r\n', 'pars_org_blank.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.organizationCount).assertEqual(0);
      expect(preview.cards[0].organization).assertEqual('');
      expect(preview.cards[0].fullName).assertEqual('Org Blank');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3000
     * @tc.name      testParserFieldAdr0004
     * @tc.desc      Verify an escaped semicolon inside the ADR street component
     *               decodes to a literal semicolon within the joined address.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldAdr0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldAdr0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Adr Escape\r\nADR:;;5\\;6 Lane;Suzhou;;;\r\nEND:VCARD\r\n',
        'pars_adr_escape.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(1);
      expect(preview.cards[0].addresses[0]).assertEqual('5;6 Lane Suzhou');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3100
     * @tc.name      testParserFieldEmail0003
     * @tc.desc      Verify empty and whitespace-only EMAIL values are skipped
     *               so neither the card list nor the counter grows.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldEmail0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldEmail0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Email Blank\r\nEMAIL:\r\nEMAIL:   \r\nEND:VCARD\r\n', 'pars_email_blank.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.cards[0].emails.length).assertEqual(0);
      expect(preview.cards[0].fullName).assertEqual('Email Blank');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3200
     * @tc.name      testParserFieldFn0003
     * @tc.desc      Verify a repeated FN keeps the last value, leading and
     *               trailing tabs are trimmed and inner tabs are preserved.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldFn0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldFn0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const repeated: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:First Name\r\nFN:Last Name\r\nEND:VCARD\r\n', 'pars_fn_dup.vcf');
      expect(repeated.cards[0].fullName).assertEqual('Last Name');
      const tabs: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:\tSpaced\t\r\nEND:VCARD\r\n', 'pars_fn_tab.vcf');
      expect(tabs.cards[0].fullName).assertEqual('Spaced');
      const inner: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:A\tB\r\nEND:VCARD\r\n', 'pars_fn_inner_tab.vcf');
      expect(inner.cards[0].fullName).assertEqual('A\tB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3300
     * @tc.name      testParserVersionSpaces0001
     * @tc.desc      Verify a VERSION value surrounded by spaces is trimmed so
     *               the preview version text still reports the clean number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserVersionSpaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserVersionSpaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nVERSION: 3.0 \r\nFN:Space Version\r\nEND:VCARD\r\n', 'pars_v_spaces.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.cards[0].version).assertEqual('3.0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3400
     * @tc.name      testParserFieldNote0004
     * @tc.desc      Verify several escaped newline sequences inside one NOTE
     *               decode into multiple real line breaks at exact positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldNote0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldNote0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Note Lines\r\nNOTE:A\\nB\\nC\r\nEND:VCARD\r\n', 'pars_note_multi.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('A\nB\nC');
      expect(preview.cards[0].note.length).assertEqual(5);
      expect(preview.cards[0].note.charAt(1)).assertEqual('\n');
      expect(preview.cards[0].note.charAt(3)).assertEqual('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3500
     * @tc.name      testParserFieldTel0005
     * @tc.desc      Verify TEL values keep internal spaces verbatim while
     *               leading and trailing whitespace around the value is trimmed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldTel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldTel0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Tel Spaces\r\nTEL:+86 139 0000 9999\r\nTEL: 10086 \r\nEND:VCARD\r\n',
        'pars_tel_spaces.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(2);
      expect(preview.cards[0].phones[0]).assertEqual('+86 139 0000 9999');
      expect(preview.cards[0].phones[1]).assertEqual('10086');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3600
     * @tc.name      testParserFieldEmail0004
     * @tc.desc      Verify a group prefixed EMAIL and an escaped comma inside
     *               the address both survive parsing into the email list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldEmail0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldEmail0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Email Group\r\nitem1.EMAIL:group@example.cn\r\n' +
        'EMAIL:a\\,b@c.example.cn\r\nEND:VCARD\r\n', 'pars_email_group.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.emailCount).assertEqual(2);
      expect(preview.cards[0].emails[0]).assertEqual('group@example.cn');
      expect(preview.cards[0].emails[1]).assertEqual('a,b@c.example.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3700
     * @tc.name      testParserFieldAdr0005
     * @tc.desc      Verify an escaped newline inside the ADR street component
     *               decodes to a real line break inside the joined address.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldAdr0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldAdr0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Adr Lines\r\nADR:;;Line1\\nLine2 Rd;City;;;\r\nEND:VCARD\r\n',
        'pars_adr_lines.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(1);
      expect(preview.cards[0].addresses[0]).assertEqual('Line1\nLine2 Rd City');
      expect(preview.cards[0].addresses[0]).assertContain('\n');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3800
     * @tc.name      testParserFieldNote0005
     * @tc.desc      Verify an escaped colon inside a NOTE value decodes into a
     *               literal colon without confusing the line splitter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldNote0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldNote0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nFN:Colon Note\r\nNOTE:Time\\:12\\:30\r\nEND:VCARD\r\n', 'pars_note_colon.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('Time:12:30');
      expect(preview.cards[0].note).assertContain(':');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PARS_3900
     * @tc.name      testParserFieldN0005
     * @tc.desc      Verify N family components decode escaped newlines and
     *               surrounding spaces in both name parts are trimmed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParserFieldN0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParserFieldN0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const folded: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nN:Sun\\nRise;Kai;;;\r\nEND:VCARD\r\n', 'pars_n_fold.vcf');
      expect(folded.cards[0].fullName).assertEqual('Sun\nRise Kai');
      expect(folded.cards[0].fullName).assertContain('\n');
      const padded: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\r\nN:  Duo ;  Wei  ;;;\r\nEND:VCARD\r\n', 'pars_n_pad.vcf');
      expect(padded.cards[0].fullName).assertEqual('Duo Wei');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
