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
import { ContactSummary, ImportResult, PickedFile, VCardManager, VCardPreview } from 'library';

const DOMAIN: number = 0xF811;

function repeatChar(ch: string, count: number): string {
  let out: string = '';
  for (let i = 0; i < count; i++) {
    out += ch;
  }
  return out;
}

export default function importLogicTest() {
  describe('ImportLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0100
     * @tc.name      testImportPickedDefaults0001
     * @tc.desc      Verify PickedFile starts empty and stores the picked uri,
     *               name and size exactly as assigned by the import flow.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportPickedDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportPickedDefaults0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const picked: PickedFile = new PickedFile();
      expect(picked.uri).assertEqual('');
      expect(picked.name).assertEqual('');
      expect(picked.sizeBytes).assertEqual(0);
      picked.uri = 'file://docs/import/contacts.vcf';
      picked.name = 'contacts.vcf';
      picked.sizeBytes = 2048;
      expect(picked.uri).assertContain('contacts.vcf');
      expect(picked.name).assertEqual('contacts.vcf');
      expect(picked.sizeBytes).assertEqual(2048);
      const other: PickedFile = new PickedFile();
      expect(other.sizeBytes).assertEqual(0);
      expect(other.name === '').assertTrue();
      expect(picked === other).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0200
     * @tc.name      testImportResultStrings0001
     * @tc.desc      Verify ImportResult message, file path and file name start
     *               empty and accept the values the import flow assigns.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportResultStrings0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportResultStrings0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ImportResult = new ImportResult();
      expect(result.message).assertEqual('');
      expect(result.filePath).assertEqual('');
      expect(result.fileName).assertEqual('');
      result.fileName = 'batch.vcf';
      result.filePath = 'file://docs/import/batch.vcf';
      result.message = '';
      expect(result.fileName).assertEqual('batch.vcf');
      expect(result.filePath).assertContain('batch.vcf');
      const renamed: ImportResult = new ImportResult();
      renamed.fileName = 'team.vcf';
      expect(renamed.fileName).assertEqual('team.vcf');
      expect(renamed.fileName === result.fileName).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0300
     * @tc.name      testImportRejectShape0001
     * @tc.desc      Verify the oversized-file rejection keeps success false,
     *               leaves the card count at zero and carries code and message.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImportRejectShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testImportRejectShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ImportResult = new ImportResult();
      result.fileName = 'big.vcf';
      result.code = 401;
      result.message = 'FILE_TOO_LARGE';
      expect(result.success).assertFalse();
      expect(result.fileName).assertEqual('big.vcf');
      expect(result.code).assertEqual(401);
      expect(result.message).assertEqual('FILE_TOO_LARGE');
      expect(result.cardCount).assertEqual(0);
      expect(result.filePath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0400
     * @tc.name      testImportPreviewDefaults0001
     * @tc.desc      Verify every VCardPreview field starts from a safe default
     *               so pages can render before any parse result arrives.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportPreviewDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportPreviewDefaults0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = new VCardPreview();
      expect(preview.fileName).assertEqual('');
      expect(preview.filePath).assertEqual('');
      expect(preview.content).assertEqual('');
      expect(preview.sizeBytes).assertEqual(0);
      expect(preview.versionText).assertEqual('');
      expect(preview.cardCount).assertEqual(0);
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.organizationCount).assertEqual(0);
      expect(preview.addressCount).assertEqual(0);
      expect(preview.errorMessage).assertEqual('');
      expect(preview.cards.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0500
     * @tc.name      testImportPreviewNaming0001
     * @tc.desc      Verify parse copies the file name, mirrors the content into
     *               the snapshot and reports sizeBytes equal to text length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImportPreviewNaming0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testImportPreviewNaming0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Size Check\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'size_check.vcf');
      expect(preview.fileName).assertEqual('size_check.vcf');
      expect(preview.sizeBytes).assertEqual(48);
      expect(preview.content).assertEqual(text);
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.errorMessage).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0600
     * @tc.name      testImportPreviewBoundary0001
     * @tc.desc      Verify content of exactly 8192 characters is kept whole in
     *               the preview snapshot with no truncation at the boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportPreviewBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportPreviewBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const body: string = repeatChar('A', 8166);
      const text: string = 'BEGIN:VCARD\nFN:' + body + '\nEND:VCARD\n';
      expect(text.length).assertEqual(8192);
      const preview: VCardPreview = VCardManager.previewContent(text, 'boundary.vcf');
      expect(preview.content.length).assertEqual(8192);
      expect(preview.content).assertEqual(text);
      expect(preview.sizeBytes).assertEqual(8192);
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName.length).assertEqual(8166);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0700
     * @tc.name      testImportUnclosedCard0001
     * @tc.desc      Verify a card without END plus a bare BEGIN both report
     *               NO_CARD and a restarted BEGIN closes only the last card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImportUnclosedCard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testImportUnclosedCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const unclosed: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nVERSION:3.0\nFN:NoEnd\n', 'unclosed.vcf');
      expect(unclosed.errorMessage).assertEqual('NO_CARD');
      expect(unclosed.cardCount).assertEqual(0);
      const bare: VCardPreview = VCardManager.previewContent('BEGIN:VCARD', 'bare.vcf');
      expect(bare.errorMessage).assertEqual('NO_CARD');
      const restarted: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION:2.1\nBEGIN:VCARD\nVERSION:3.0\nFN:Double\nEND:VCARD\n', 'restart.vcf');
      expect(restarted.cardCount).assertEqual(1);
      expect(restarted.cards[0].fullName).assertEqual('Double');
      expect(restarted.versionText).assertEqual('3.0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0800
     * @tc.name      testImportStrayLines0001
     * @tc.desc      Verify fields outside a card and an END without BEGIN are
     *               ignored and the enclosed card still parses cleanly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImportStrayLines0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testImportStrayLines0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const outside: VCardPreview =
        VCardManager.previewContent('NOTE:outside\nBEGIN:VCARD\nFN:Inside\nEND:VCARD\n', 'outside.vcf');
      expect(outside.cardCount).assertEqual(1);
      expect(outside.cards[0].fullName).assertEqual('Inside');
      expect(outside.cards[0].note).assertEqual('');
      const strayEnd: VCardPreview =
        VCardManager.previewContent('END:VCARD\nBEGIN:VCARD\nFN:After\nEND:VCARD\n', 'strayend.vcf');
      expect(strayEnd.cardCount).assertEqual(1);
      expect(strayEnd.cards[0].fullName).assertEqual('After');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_0900
     * @tc.name      testImportLeadingFold0001
     * @tc.desc      Verify a continuation line before any card is treated as a
     *               standalone line and never breaks the following card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportLeadingFold0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportLeadingFold0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const leading: VCardPreview =
        VCardManager.previewContent(' FN:Outside\nBEGIN:VCARD\nFN:Real\nEND:VCARD\n', 'lead.vcf');
      expect(leading.cardCount).assertEqual(1);
      expect(leading.errorMessage).assertEqual('');
      expect(leading.cards[0].fullName).assertEqual('Real');
      const tabLead: VCardPreview =
        VCardManager.previewContent('\tFN:Outside\nBEGIN:VCARD\nFN:Tabbed\nEND:VCARD\n', 'lead2.vcf');
      expect(tabLead.cardCount).assertEqual(1);
      expect(tabLead.cards[0].fullName).assertEqual('Tabbed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1000
     * @tc.name      testImportVersionFallback0001
     * @tc.desc      Verify a missing VERSION falls back to 2.1 and the first
     *               card that declares a version wins for the preview header.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportVersionFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportVersionFallback0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const secondWins: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:NoVer\nEND:VCARD\nBEGIN:VCARD\nVERSION:4.0\nFN:HasVer\nEND:VCARD\n', 'ver.vcf');
      expect(secondWins.cardCount).assertEqual(2);
      expect(secondWins.versionText).assertEqual('4.0');
      expect(secondWins.cards[0].version).assertEqual('');
      expect(secondWins.cards[1].version).assertEqual('4.0');
      const fallback: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nFN:Only\nEND:VCARD\n', 'fallback.vcf');
      expect(fallback.versionText).assertEqual('2.1');
      expect(fallback.cards[0].version).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1100
     * @tc.name      testImportDuplicateFields0001
     * @tc.desc      Verify repeated FN, NOTE and VERSION lines keep the last
     *               value because each assignment overwrites the previous one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportDuplicateFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportDuplicateFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const dup: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION:2.1\nVERSION:3.0\nFN:First\nFN:Second\nNOTE:alpha\nNOTE:beta\nEND:VCARD\n',
        'dup.vcf');
      expect(dup.cardCount).assertEqual(1);
      expect(dup.cards[0].fullName).assertEqual('Second');
      expect(dup.cards[0].note).assertEqual('beta');
      expect(dup.versionText).assertEqual('3.0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1200
     * @tc.name      testImportBinaryLower0001
     * @tc.desc      Verify lowercase base64 and encoding=b parameters are still
     *               recognized as binary and skipped from the text fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportBinaryLower0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportBinaryLower0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:2.1\nPHOTO;encoding=base64:AAAA\n' +
        'LOGO;encoding=b:BBBB\nFN:Lower Bin\nTEL:+8613800001234\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'lowerbin.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Lower Bin');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('+8613800001234');
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].emails.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1300
     * @tc.name      testImportGroupParams0001
     * @tc.desc      Verify grouped properties with parameters such as
     *               item1.TEL;TYPE=CELL are routed to the right field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportGroupParams0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportGroupParams0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Group User\n' +
        'item1.TEL;TYPE=CELL:+8613800001234\nitem2.EMAIL;TYPE=HOME:group.user@mail.example\n' +
        'item3.URL:https://group.example/user\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'group.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('+8613800001234');
      expect(preview.emailCount).assertEqual(1);
      expect(preview.cards[0].emails[0]).assertEqual('group.user@mail.example');
      expect(preview.cards[0].websites[0]).assertEqual('https://group.example/user');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1400
     * @tc.name      testImportEmptyValues0001
     * @tc.desc      Verify fields with empty values and empty address parts
     *               never contribute entries to the parsed card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportEmptyValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportEmptyValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Empty Fields\nTEL:\nEMAIL:\nNOTE:\n' +
        'URL:\nADR:\nADR;;;;;\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'emptyfields.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.addressCount).assertEqual(0);
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].websites.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1500
     * @tc.name      testImportQuotedColon0001
     * @tc.desc      Verify a colon inside quotes is not a field separator while
     *               the first unquoted colon always splits name and value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportQuotedColon0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportQuotedColon0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const quoted: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nFN:"John:Doe"\nEND:VCARD\n', 'quoted.vcf');
      expect(quoted.cardCount).assertEqual(1);
      expect(quoted.cards[0].fullName).assertEqual('"John:Doe"');
      const note: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nFN:Note User\nNOTE:logged at 12:30\nEND:VCARD\n', 'note.vcf');
      expect(note.cards[0].note).assertEqual('logged at 12:30');
      expect(note.cards[0].fullName).assertEqual('Note User');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1600
     * @tc.name      testImportQpEmail0001
     * @tc.desc      Verify quoted-printable decoding applies to email values
     *               and lowercase encoding parameters still trigger decoding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportQpEmail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportQpEmail0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const email: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Qp User\nEMAIL;ENCODING=QUOTED-PRINTABLE:qp=2Buser@mail.example\nEND:VCARD\n',
        'qpemail.vcf');
      expect(email.cardCount).assertEqual(1);
      expect(email.cards[0].emails[0]).assertEqual('qp+user@mail.example');
      const lower: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Qp Lower\nNOTE;encoding=quoted-printable:soft=20pack\nEND:VCARD\n', 'qplower.vcf');
      expect(lower.cards[0].note).assertEqual('soft pack');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1700
     * @tc.name      testImportMultiBlank0001
     * @tc.desc      Verify cards separated by CRLF blank lines and LF endings
     *               in the same text are both recognized as separate cards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportMultiBlank0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportMultiBlank0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\r\nFN:Ann\r\nEND:VCARD\r\n\r\nBEGIN:VCARD\nFN:Ben\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'blank.vcf');
      expect(preview.cardCount).assertEqual(2);
      expect(preview.cards[0].fullName).assertEqual('Ann');
      expect(preview.cards[1].fullName).assertEqual('Ben');
      expect(preview.errorMessage).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1800
     * @tc.name      testImportBareCard0001
     * @tc.desc      Verify an empty card body still counts as one card with
     *               empty fields and the 2.1 version fallback header.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportBareCard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportBareCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent('BEGIN:VCARD\nEND:VCARD\n', 'barecard.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('2.1');
      expect(preview.cards[0].fullName).assertEqual('');
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.organizationCount).assertEqual(0);
      expect(preview.addressCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_1900
     * @tc.name      testImportPreviewCounts0001
     * @tc.desc      Verify phone, email and organization counters accumulate
     *               across every parsed card in one preview pass.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImportPreviewCounts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testImportPreviewCounts0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:C One\nTEL:+8613900001001\n' +
        'TEL:+8613900001002\nEMAIL:c1@mail.example\nORG:Alpha\nEND:VCARD\n' +
        'BEGIN:VCARD\nVERSION:3.0\nFN:C Two\nTEL:+8613900001003\nEMAIL:c2@mail.example\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'counts.vcf');
      expect(preview.cardCount).assertEqual(2);
      expect(preview.phoneCount).assertEqual(3);
      expect(preview.emailCount).assertEqual(2);
      expect(preview.organizationCount).assertEqual(1);
      expect(preview.addressCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2000
     * @tc.name      testImportUnknownFields0001
     * @tc.desc      Verify unrecognized X- prefixed and UID properties are
     *               ignored without affecting the standard parsed fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportUnknownFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportUnknownFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Custom\nX-CUSTOM:hidden\n' +
        'X-ABDATE:2026-01-01\nUID:abc-123\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'custom.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Custom');
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.cards[0].note).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2100
     * @tc.name      testImportLineEndings0001
     * @tc.desc      Verify lone CR endings are normalized like CRLF and a tab
     *               continuation joins onto the previous folded line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportLineEndings0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportLineEndings0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const solo: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\rVERSION:3.0\rFN:Solo\rEND:VCARD\r', 'solo.vcf');
      expect(solo.cardCount).assertEqual(1);
      expect(solo.versionText).assertEqual('3.0');
      expect(solo.cards[0].fullName).assertEqual('Solo');
      const tabFold: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\r\nFN:Part\r\n\tTwo\r\nEND:VCARD\r\n', 'tab.vcf');
      expect(tabFold.cards[0].fullName).assertEqual('PartTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2200
     * @tc.name      testImportInitialDerive0001
     * @tc.desc      Verify preview contacts derive the grouping initial from
     *               parsed names including CJK and padded inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportInitialDerive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportInitialDerive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lower: VCardPreview = VCardManager.previewContent('BEGIN:VCARD\nFN:zoe\nEND:VCARD\n', 'init1.vcf');
      const lowerContacts: ContactSummary[] = VCardManager.previewToContacts(lower);
      expect(lowerContacts.length).assertEqual(1);
      expect(lowerContacts[0].initial).assertEqual('Z');
      const cjk: VCardPreview = VCardManager.previewContent('BEGIN:VCARD\nFN:张三\nEND:VCARD\n', 'init2.vcf');
      const cjkContacts: ContactSummary[] = VCardManager.previewToContacts(cjk);
      expect(cjkContacts[0].initial).assertEqual('#');
      const padded: VCardPreview = VCardManager.previewContent('BEGIN:VCARD\nFN: ada \nEND:VCARD\n', 'init3.vcf');
      const paddedContacts: ContactSummary[] = VCardManager.previewToContacts(padded);
      expect(paddedContacts[0].fullName).assertEqual('ada');
      expect(paddedContacts[0].initial).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2300
     * @tc.name      testImportGroupedName0001
     * @tc.desc      Verify a grouped N property such as item1.N still feeds the
     *               family and given name fallback for the display name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportGroupedName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportGroupedName0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const grouped: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nitem1.N:He;Lei;;;\nEND:VCARD\n', 'groupn.vcf');
      expect(grouped.cardCount).assertEqual(1);
      expect(grouped.cards[0].fullName).assertEqual('He Lei');
      expect(grouped.cards[0].phones.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2400
     * @tc.name      testImportVersionParams0001
     * @tc.desc      Verify a VERSION line carrying extra parameters still
     *               reports its value as the preview version text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportVersionParams0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportVersionParams0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION;X-APP=1:3.0\nFN:Param Ver\nEND:VCARD\n', 'paramver.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.cards[0].version).assertEqual('3.0');
      expect(preview.cards[0].fullName).assertEqual('Param Ver');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2500
     * @tc.name      testImportOrgEscape0001
     * @tc.desc      Verify an escaped semicolon inside the first ORG component
     *               decodes to a literal semicolon in the organization value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportOrgEscape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportOrgEscape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Org Esc\nORG:Compa\\;ny;Team\nEND:VCARD\n', 'orgesc.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.organizationCount).assertEqual(1);
      expect(preview.cards[0].organization).assertEqual('Compa;ny');
      expect(preview.cards[0].jobTitle).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2600
     * @tc.name      testImportNoteColonEscape0001
     * @tc.desc      Verify an escaped colon inside a note value decodes to a
     *               real colon after the field has been split once.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportNoteColonEscape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportNoteColonEscape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Note Esc\nNOTE:at\\:noon\nEND:VCARD\n', 'noteesc.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].note).assertEqual('at:noon');
      expect(preview.cards[0].fullName).assertEqual('Note Esc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2700
     * @tc.name      testImportFileNameSpaces0001
     * @tc.desc      Verify a file name containing spaces is preserved on the
     *               preview together with exact size bookkeeping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportFileNameSpaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportFileNameSpaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Space Name\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'my file.vcf');
      expect(preview.fileName).assertEqual('my file.vcf');
      expect(preview.sizeBytes).assertEqual(text.length);
      expect(preview.content).assertEqual(text);
      expect(preview.cardCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2800
     * @tc.name      testImportVersionOnlyCard0001
     * @tc.desc      Verify a card carrying only VERSION parses with the version
     *               header set and every personal field left empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportVersionOnlyCard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportVersionOnlyCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nVERSION:3.0\nEND:VCARD\n', 'veronly.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.cards[0].fullName).assertEqual('');
      expect(preview.cards[0].version).assertEqual('3.0');
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_2900
     * @tc.name      testImportTelValueTrim0001
     * @tc.desc      Verify phone values are trimmed at both ends while spaces
     *               inside the number are preserved verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportTelValueTrim0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportTelValueTrim0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Trim User\nTEL;TYPE=WORK: 010 8888 7777 \nEND:VCARD\n', 'trim.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.cards[0].phones[0]).assertEqual('010 8888 7777');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_3000
     * @tc.name      testImportMarkerParams0001
     * @tc.desc      Verify BEGIN and END markers carrying extra parameters
     *               still open and close the card correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportMarkerParams0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportMarkerParams0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN;X=1:VCARD\nVERSION:2.1\nFN:Marked\nEND;X=1:VCARD\n', 'marked.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.versionText).assertEqual('2.1');
      expect(preview.cards[0].fullName).assertEqual('Marked');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_3100
     * @tc.name      testImportQpLeading0001
     * @tc.desc      Verify a quoted-printable value starting with a hex escape
     *               decodes from the first character of the field value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportQpLeading0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportQpLeading0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN;ENCODING=QUOTED-PRINTABLE:=41dam\nEND:VCARD\n', 'qplead.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Adam');
      expect(preview.cards[0].fullName.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_3200
     * @tc.name      testImportMultiBookkeeping0001
     * @tc.desc      Verify size and snapshot bookkeeping stay exact for a
     *               multi-card text that stays below the preview limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportMultiBookkeeping0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportMultiBookkeeping0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Book One\nEND:VCARD\n' +
        'BEGIN:VCARD\nVERSION:3.0\nFN:Book Two\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'books.vcf');
      expect(preview.sizeBytes).assertEqual(text.length);
      expect(preview.content).assertEqual(text);
      expect(preview.cardCount).assertEqual(2);
      expect(preview.cards.length).assertEqual(2);
      expect(preview.cards[1].fullName).assertEqual('Book Two');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_3300
     * @tc.name      testImportResultReady0001
     * @tc.desc      Verify the success-shaped result keeps the file name and
     *               reports zero code with a positive card count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportResultReady0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportResultReady0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ImportResult = new ImportResult();
      result.fileName = 'ok.vcf';
      result.filePath = 'file://docs/import/ok.vcf';
      result.success = true;
      result.code = 0;
      result.cardCount = 2;
      expect(result.success).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.cardCount).assertEqual(2);
      expect(result.fileName).assertEqual('ok.vcf');
      expect(result.filePath).assertContain('ok.vcf');
      expect(result.message).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_3400
     * @tc.name      testImportPickedPair0001
     * @tc.desc      Verify two PickedFile instances stay independent so one
     *               picked document never mutates another pending import.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportPickedPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportPickedPair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: PickedFile = new PickedFile();
      const right: PickedFile = new PickedFile();
      left.uri = 'file://docs/import/left.vcf';
      left.name = 'left.vcf';
      left.sizeBytes = 512;
      expect(right.uri).assertEqual('');
      expect(right.sizeBytes).assertEqual(0);
      right.name = 'right.vcf';
      right.sizeBytes = 1024;
      expect(left.name).assertEqual('left.vcf');
      expect(left.sizeBytes).assertEqual(512);
      expect(left.uri).assertContain('left.vcf');
      expect(right.name).assertEqual('right.vcf');
      expect(left === right).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_3500
     * @tc.name      testImportFirstVersionWins0001
     * @tc.desc      Verify the preview version text comes from the first card
     *               that declares a version across a two-card file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportFirstVersionWins0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportFirstVersionWins0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:2.1\nFN:Early\nEND:VCARD\n' +
        'BEGIN:VCARD\nVERSION:4.0\nFN:Late\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'order.vcf');
      expect(preview.cardCount).assertEqual(2);
      expect(preview.versionText).assertEqual('2.1');
      expect(preview.cards[0].version).assertEqual('2.1');
      expect(preview.cards[1].version).assertEqual('4.0');
      expect(preview.cards[1].fullName).assertEqual('Late');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IMPT_3600
     * @tc.name      testImportWhitespaceValues0001
     * @tc.desc      Verify whitespace-only field values are treated as empty
     *               and never become phone or note entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportWhitespaceValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportWhitespaceValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Blank Fields\nTEL:   \nEMAIL:\t\nNOTE:    \nEND:VCARD\n', 'ws.vcf');
      expect(preview.cardCount).assertEqual(1);
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.cards[0].note).assertEqual('');
      expect(preview.cards[0].fullName).assertEqual('Blank Fields');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
