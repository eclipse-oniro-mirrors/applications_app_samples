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
import {
  ContactDraft,
  ContactLoadState,
  ContactSummary,
  Formatter,
  VCardManager,
  VCardPreview
} from 'library';

const DOMAIN: number = 0xF811;
const CARD_RICH: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:momo Lee\nORG:Cloud Nine;Platform\nTITLE:Lead\n' +
  'TEL:+8613900008001\nTEL:+8613900008002\nTEL:+8613900008003\n' +
  'EMAIL:p1.team@example.com\nEMAIL:p2.team@example.com\nEMAIL:p3.team@example.com\n' +
  'URL:https://team.example/momo\nNOTE:team note\nEND:VCARD\n';

function buildCardText(name: string, phone: string): string {
  return 'BEGIN:VCARD\nVERSION:3.0\nFN:' + name + '\nTEL:' + phone + '\nEND:VCARD\n';
}

export default function contactServiceLogicTest() {
  describe('ContactServiceLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0100
     * @tc.name      testContactSummaryDefaults0001
     * @tc.desc      Verify a fresh contact summary keeps the sentinel id, the
     *               hash initial and empty arrays for every grouped field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactSummaryDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactSummaryDefaults0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const summary: ContactSummary = new ContactSummary();
      expect(summary.id).assertEqual(-1);
      expect(summary.key).assertEqual('');
      expect(summary.fullName).assertEqual('');
      expect(summary.initial).assertEqual('#');
      expect(summary.organization).assertEqual('');
      expect(summary.jobTitle).assertEqual('');
      expect(summary.note).assertEqual('');
      expect(summary.phones.length).assertEqual(0);
      expect(summary.emails.length).assertEqual(0);
      expect(summary.addresses.length).assertEqual(0);
      expect(summary.websites.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0200
     * @tc.name      testContactDraftDefaults0001
     * @tc.desc      Verify the edit draft starts blank and stores every field
     *               typed by the user without transformation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactDraftDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactDraftDefaults0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const draft: ContactDraft = new ContactDraft();
      expect(draft.fullName).assertEqual('');
      expect(draft.phone).assertEqual('');
      expect(draft.email).assertEqual('');
      expect(draft.organization).assertEqual('');
      expect(draft.jobTitle).assertEqual('');
      expect(draft.note).assertEqual('');
      draft.fullName = 'Alice Wang';
      draft.phone = '13800000000';
      draft.email = 'alice@mail.example';
      draft.organization = 'Acme';
      draft.jobTitle = 'Developer';
      draft.note = 'vip user';
      expect(draft.fullName).assertEqual('Alice Wang');
      expect(draft.phone).assertEqual('13800000000');
      expect(draft.email).assertEqual('alice@mail.example');
      expect(draft.organization).assertEqual('Acme');
      expect(draft.jobTitle).assertEqual('Developer');
      expect(draft.note).assertEqual('vip user');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0300
     * @tc.name      testContactLoadStateEnum0001
     * @tc.desc      Verify the contact load state enum maps every page state
     *               to its documented numeric value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactLoadStateEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactLoadStateEnum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ContactLoadState.IDLE).assertEqual(0);
      expect(ContactLoadState.LOADING).assertEqual(1);
      expect(ContactLoadState.READY).assertEqual(2);
      expect(ContactLoadState.DENIED).assertEqual(3);
      expect(ContactLoadState.ERROR).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0400
     * @tc.name      testContactInitialLower0001
     * @tc.desc      Verify lowercase ASCII names normalize to the uppercase
     *               first letter used for grouped avatar initials.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactInitialLower0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactInitialLower0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('lily')).assertEqual('L');
      expect(Formatter.initial('oscar')).assertEqual('O');
      expect(Formatter.initial('uma')).assertEqual('U');
      expect(Formatter.initial('momo Lee')).assertEqual('M');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0500
     * @tc.name      testContactInitialWhitespace0001
     * @tc.desc      Verify leading tabs, newline and spaced padding are trimmed
     *               before the first letter is picked for the avatar.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactInitialWhitespace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactInitialWhitespace0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('\tNina')).assertEqual('N');
      expect(Formatter.initial('  PJ  ')).assertEqual('P');
      expect(Formatter.initial('\nOmar')).assertEqual('O');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0600
     * @tc.name      testContactInitialNonAscii0001
     * @tc.desc      Verify accented, Greek and emoji names fall back to the
     *               hash bucket because their codes leave the A-Z range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactInitialNonAscii0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactInitialNonAscii0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('Élodie')).assertEqual('#');
      expect(Formatter.initial('βeta')).assertEqual('#');
      expect(Formatter.initial('😊moji')).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0700
     * @tc.name      testContactInitialSingle0001
     * @tc.desc      Verify single letter names and names already uppercase
     *               keep their letter while mixed case picks the first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactInitialSingle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactInitialSingle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('x')).assertEqual('X');
      expect(Formatter.initial('Z')).assertEqual('Z');
      expect(Formatter.initial('aA')).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0800
     * @tc.name      testContactParseInitial0001
     * @tc.desc      Verify parsed preview cards derive contact initials from
     *               the display name after parser trimming.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParseInitial0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParseInitial0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const rich: VCardPreview = VCardManager.previewContent(CARD_RICH, 'rich.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(rich);
      expect(contacts.length).assertEqual(1);
      expect(contacts[0].fullName).assertEqual('momo Lee');
      expect(contacts[0].initial).assertEqual('M');
      const cjk: VCardPreview = VCardManager.previewContent(buildCardText('李雷', '+8613800001234'), 'cjk.vcf');
      const cjkContacts: ContactSummary[] = VCardManager.previewToContacts(cjk);
      expect(cjkContacts[0].initial).assertEqual('#');
      const tabbed: VCardPreview =
        VCardManager.previewContent('BEGIN:VCARD\nFN:\tnina \nEND:VCARD\n', 'tabname.vcf');
      const tabContacts: ContactSummary[] = VCardManager.previewToContacts(tabbed);
      expect(tabContacts[0].fullName).assertEqual('nina');
      expect(tabContacts[0].initial).assertEqual('N');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_0900
     * @tc.name      testContactParseNameSpecial0001
     * @tc.desc      Verify names containing an ampersand survive parsing and
     *               group under their uppercase first letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParseNameSpecial0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParseNameSpecial0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview =
        VCardManager.previewContent(buildCardText('R&D Team', '+8613800004444'), 'rnd.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].fullName).assertEqual('R&D Team');
      expect(contacts[0].initial).assertEqual('R');
      expect(contacts[0].phones[0]).assertEqual('+8613800004444');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1000
     * @tc.name      testContactParseOrg0001
     * @tc.desc      Verify organization and title mapping keeps the first ORG
     *               component and the full TITLE on the contact summary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParseOrg0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParseOrg0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_RICH, 'org.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].organization).assertEqual('Cloud Nine');
      expect(contacts[0].jobTitle).assertEqual('Lead');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1100
     * @tc.name      testContactParseUrlNote0001
     * @tc.desc      Verify website and note fields flow into the summary lists
     *               without losing their original text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParseUrlNote0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParseUrlNote0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_RICH, 'urlnote.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].websites.length).assertEqual(1);
      expect(contacts[0].websites[0]).assertEqual('https://team.example/momo');
      expect(contacts[0].note).assertEqual('team note');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1200
     * @tc.name      testContactParsePhoneOrder0001
     * @tc.desc      Verify three phone numbers keep their source order on the
     *               converted contact summary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParsePhoneOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParsePhoneOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_RICH, 'phones.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].phones.length).assertEqual(3);
      expect(contacts[0].phones[0]).assertEqual('+8613900008001');
      expect(contacts[0].phones[1]).assertEqual('+8613900008002');
      expect(contacts[0].phones[2]).assertEqual('+8613900008003');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1300
     * @tc.name      testContactParseEmailOrder0001
     * @tc.desc      Verify three mail addresses keep their source order on the
     *               converted contact summary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParseEmailOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParseEmailOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_RICH, 'emails.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].emails.length).assertEqual(3);
      expect(contacts[0].emails[0]).assertEqual('p1.team@example.com');
      expect(contacts[0].emails[1]).assertEqual('p2.team@example.com');
      expect(contacts[0].emails[2]).assertEqual('p3.team@example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1400
     * @tc.name      testContactCopyIndependence0001
     * @tc.desc      Verify converted summaries copy card arrays so editing a
     *               summary never rewrites the parsed preview card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactCopyIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactCopyIndependence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_RICH, 'copy.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      const beforePhones: number = preview.cards[0].phones.length;
      contacts[0].phones.push('+8613900009999');
      expect(preview.cards[0].phones.length).assertEqual(beforePhones);
      const beforeEmails: number = preview.cards[0].emails.length;
      contacts[0].emails.push('extra@example.com');
      expect(preview.cards[0].emails.length).assertEqual(beforeEmails);
      expect(contacts[0].phones.length).assertEqual(4);
      expect(contacts[0].emails.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1500
     * @tc.name      testContactBareCard0001
     * @tc.desc      Verify a bare lowercase card converts into one contact
     *               with hash initial and every list still empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactBareCard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactBareCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview =
        VCardManager.previewContent('begin:vcard\nend:vcard\n', 'bare_contact.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts.length).assertEqual(1);
      expect(contacts[0].fullName).assertEqual('');
      expect(contacts[0].initial).assertEqual('#');
      expect(contacts[0].phones.length).assertEqual(0);
      expect(contacts[0].emails.length).assertEqual(0);
      expect(contacts[0].organization).assertEqual('');
      expect(contacts[0].key).assertEqual('preview_0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1600
     * @tc.name      testContactPreviewZero0001
     * @tc.desc      Verify previews that fail parsing convert to an empty
     *               contact list so the page renders no rows.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactPreviewZero0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactPreviewZero0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: VCardPreview = VCardManager.previewContent('', 'none.vcf');
      expect(VCardManager.previewToContacts(empty).length).assertEqual(0);
      const noCard: VCardPreview = VCardManager.previewContent('plain text', 'no.vcf');
      expect(noCard.errorMessage).assertEqual('NO_CARD');
      expect(VCardManager.previewToContacts(noCard).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1700
     * @tc.name      testContactParsePair0001
     * @tc.desc      Verify a two card file converts into two summaries with
     *               sequential ids, preview keys and copied names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParsePair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParsePair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string =
        buildCardText('Ivy Zhao', '+8613700007001') + buildCardText('Noah Li', '+8613700007002');
      const preview: VCardPreview = VCardManager.previewContent(text, 'pair_contacts.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts.length).assertEqual(2);
      expect(contacts[0].id).assertEqual(0);
      expect(contacts[0].key).assertEqual('preview_0');
      expect(contacts[0].fullName).assertEqual('Ivy Zhao');
      expect(contacts[1].id).assertEqual(1);
      expect(contacts[1].key).assertEqual('preview_1');
      expect(contacts[1].fullName).assertEqual('Noah Li');
      expect(contacts[1].phones[0]).assertEqual('+8613700007002');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1800
     * @tc.name      testContactDraftRaw0001
     * @tc.desc      Verify the draft stores surrounding spaces untouched so
     *               trimming stays the responsibility of the write service.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactDraftRaw0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactDraftRaw0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const draft: ContactDraft = new ContactDraft();
      draft.fullName = '  Alice Wang  ';
      draft.phone = ' 13800000000 ';
      draft.organization = ' Acme ';
      expect(draft.fullName).assertEqual('  Alice Wang  ');
      expect(draft.phone).assertEqual(' 13800000000 ');
      expect(draft.organization).assertEqual(' Acme ');
      expect(draft.email).assertEqual('');
      expect(draft.jobTitle).assertEqual('');
      expect(draft.note).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_1900
     * @tc.name      testContactSummaryArrays0001
     * @tc.desc      Verify summary lists accept pushed values and keep the
     *               inserted order for later rendering.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactSummaryArrays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactSummaryArrays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const summary: ContactSummary = new ContactSummary();
      summary.phones.push('+8613800001111');
      summary.emails.push('sum@mail.example');
      summary.addresses.push('1 Road Town');
      summary.websites.push('https://sum.example');
      expect(summary.phones.length).assertEqual(1);
      expect(summary.emails.length).assertEqual(1);
      expect(summary.addresses.length).assertEqual(1);
      expect(summary.websites.length).assertEqual(1);
      expect(summary.phones[0]).assertEqual('+8613800001111');
      expect(summary.addresses[0]).assertEqual('1 Road Town');
      expect(summary.websites[0]).assertEqual('https://sum.example');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2000
     * @tc.name      testContactSummaryPair0001
     * @tc.desc      Verify two contact summaries never share their list
     *               storage so appending to one leaves the other empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactSummaryPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactSummaryPair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: ContactSummary = new ContactSummary();
      const right: ContactSummary = new ContactSummary();
      left.phones.push('+8613800002222');
      expect(right.phones.length).assertEqual(0);
      right.emails.push('right@mail.example');
      expect(left.emails.length).assertEqual(0);
      expect(left.phones.length).assertEqual(1);
      expect(left === right).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2100
     * @tc.name      testContactIdKeySentinel0001
     * @tc.desc      Verify the unmatched contact sentinel id differs from real
     *               preview ids and preview keys carry the preview prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactIdKeySentinel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactIdKeySentinel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fresh: ContactSummary = new ContactSummary();
      expect(fresh.id).assertEqual(-1);
      expect(fresh.key).assertEqual('');
      const preview: VCardPreview =
        VCardManager.previewContent(buildCardText('Pia Xu', '+8613800005555'), 'pia.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].id).assertLarger(fresh.id);
      expect(contacts[0].key).assertContain('preview_');
      expect(contacts[0].key).assertEqual('preview_0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2200
     * @tc.name      testContactNoteAddress0001
     * @tc.desc      Verify an escaped note newline and a structured address
     *               reach the summary with components joined by spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactNoteAddress0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactNoteAddress0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Address User\nNOTE:Meet at 10\\nRoom 5\n' +
        'ADR:;;9 Sunshine Ave;Ningbo;;315000;China\nEND:VCARD\n';
      const preview: VCardPreview = VCardManager.previewContent(text, 'addr.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].note).assertContain('\n');
      expect(contacts[0].note).assertContain('Meet at 10');
      expect(contacts[0].addresses.length).assertEqual(1);
      expect(contacts[0].addresses[0]).assertEqual('9 Sunshine Ave Ningbo 315000 China');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2300
     * @tc.name      testContactParseIds0001
     * @tc.desc      Verify five parsed cards get ascending ids starting at
     *               zero and keep their own names in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactParseIds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactParseIds0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const names: string[] = ['Ann One', 'Ben Two', 'Cara Three', 'Dan Four', 'Eve Five'];
      let text: string = '';
      for (let i = 0; i < names.length; i++) {
        text += buildCardText(names[i], '+86137000060' + i);
      }
      const preview: VCardPreview = VCardManager.previewContent(text, 'five.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts.length).assertEqual(5);
      for (let i = 0; i < contacts.length; i++) {
        expect(contacts[i].id).assertEqual(i);
        expect(contacts[i].fullName).assertEqual(names[i]);
        expect(contacts[i].key).assertEqual('preview_' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2400
     * @tc.name      testContactNFallback0001
     * @tc.desc      Verify the structured N pair fills the display name when
     *               FN is missing and still groups under the first letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactNFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactNFallback0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION:3.0\nN:Bo;Li;;;\nTEL:+8613800002222\nEND:VCARD\n', 'n_fallback.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].fullName).assertEqual('Bo Li');
      expect(contacts[0].initial).assertEqual('B');
      expect(contacts[0].phones[0]).assertEqual('+8613800002222');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2500
     * @tc.name      testContactOrgOnly0001
     * @tc.desc      Verify an organization without TITLE leaves the job title
     *               empty while the company name is kept.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactOrgOnly0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactOrgOnly0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION:3.0\nFN:Org User\nORG:Harbor Works\nEND:VCARD\n', 'orgonly.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].organization).assertEqual('Harbor Works');
      expect(contacts[0].jobTitle).assertEqual('');
      expect(contacts[0].fullName).assertEqual('Org User');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2600
     * @tc.name      testContactTitleOnly0001
     * @tc.desc      Verify a TITLE without ORG records the job title and the
     *               organization counter stays at zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactTitleOnly0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactTitleOnly0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION:3.0\nFN:Title Only\nTITLE:Coach\nEND:VCARD\n', 'titleonly.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].jobTitle).assertEqual('Coach');
      expect(contacts[0].organization).assertEqual('');
      expect(preview.organizationCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2700
     * @tc.name      testContactMultiUrl0001
     * @tc.desc      Verify two website lines are preserved in order on the
     *               contact summary list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactMultiUrl0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactMultiUrl0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION:3.0\nFN:Link User\nURL:https://a.example/x\n' +
        'URL:https://b.example/y\nEND:VCARD\n', 'links.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].websites.length).assertEqual(2);
      expect(contacts[0].websites[0]).assertEqual('https://a.example/x');
      expect(contacts[0].websites[1]).assertEqual('https://b.example/y');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2800
     * @tc.name      testContactDraftOverwrite0001
     * @tc.desc      Verify re-typing a draft field replaces the previous value
     *               so the last user input always wins.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactDraftOverwrite0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactDraftOverwrite0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const draft: ContactDraft = new ContactDraft();
      draft.fullName = 'First Name';
      expect(draft.fullName).assertEqual('First Name');
      draft.fullName = 'Second Name';
      expect(draft.fullName).assertEqual('Second Name');
      draft.phone = '13800000001';
      draft.phone = '13800000002';
      expect(draft.phone).assertEqual('13800000002');
      expect(draft.fullName).assertEqual('Second Name');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_2900
     * @tc.name      testContactInitialStatic0001
     * @tc.desc      Verify the summary initial is not auto derived on field
     *               assignment so loaded data controls the grouping letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactInitialStatic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactInitialStatic0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const summary: ContactSummary = new ContactSummary();
      summary.fullName = 'beta';
      expect(summary.initial).assertEqual('#');
      expect(summary.fullName).assertEqual('beta');
      summary.initial = 'B';
      expect(summary.initial).assertEqual('B');
      expect(summary.fullName).assertEqual('beta');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3000
     * @tc.name      testContactPhoneSpaces0001
     * @tc.desc      Verify a phone with padded spaces and inner groups keeps
     *               the inner spacing after the service level trim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactPhoneSpaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactPhoneSpaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Space Phone\nTEL: 010 8888 7777 \nEND:VCARD\n', 'spacephone.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].phones.length).assertEqual(1);
      expect(contacts[0].phones[0]).assertEqual('010 8888 7777');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3100
     * @tc.name      testContactDraftPair0001
     * @tc.desc      Verify two drafts stay independent so editing one contact
     *               never leaks text into another pending draft.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactDraftPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactDraftPair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: ContactDraft = new ContactDraft();
      const right: ContactDraft = new ContactDraft();
      left.fullName = 'Left User';
      left.phone = '13800000003';
      expect(right.fullName).assertEqual('');
      expect(right.phone).assertEqual('');
      right.fullName = 'Right User';
      expect(left.fullName).assertEqual('Left User');
      expect(right.fullName).assertEqual('Right User');
      expect(left === right).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3200
     * @tc.name      testContactDraftFields0001
     * @tc.desc      Verify job title and note draft fields round trip the
     *               exact text prepared for the write path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactDraftFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactDraftFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const draft: ContactDraft = new ContactDraft();
      draft.jobTitle = 'Senior Dev';
      draft.note = 'call after 6pm';
      expect(draft.jobTitle).assertEqual('Senior Dev');
      expect(draft.note).assertEqual('call after 6pm');
      draft.jobTitle = 'Architect';
      draft.note = '';
      expect(draft.jobTitle).assertEqual('Architect');
      expect(draft.note).assertEqual('');
      expect(draft.fullName).assertEqual('');
      expect(draft.phone).assertEqual('');
      expect(draft.email).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3300
     * @tc.name      testContactStateOrder0001
     * @tc.desc      Verify the load state enum stays strictly ordered so page
     *               transitions compare reliably.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactStateOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactStateOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ContactLoadState.IDLE).assertLess(ContactLoadState.LOADING);
      expect(ContactLoadState.LOADING).assertLess(ContactLoadState.READY);
      expect(ContactLoadState.READY).assertLess(ContactLoadState.DENIED);
      expect(ContactLoadState.DENIED).assertLess(ContactLoadState.ERROR);
      expect(ContactLoadState.ERROR).assertLarger(ContactLoadState.IDLE);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3400
     * @tc.name      testContactKeyPrefix0001
     * @tc.desc      Verify preview keys start with the preview prefix and stay
     *               unique per converted contact row.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactKeyPrefix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactKeyPrefix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const text: string =
        buildCardText('Rae Sun', '+8613700009001') + buildCardText('Kim Fox', '+8613700009002');
      const preview: VCardPreview = VCardManager.previewContent(text, 'keys.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].key.indexOf('preview_')).assertEqual(0);
      expect(contacts[1].key.indexOf('preview_')).assertEqual(0);
      expect(contacts[0].key === contacts[1].key).assertFalse();
      expect(contacts[0].id).assertEqual(0);
      expect(contacts[1].id).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3500
     * @tc.name      testContactOrgMulti0001
     * @tc.desc      Verify a three component organization keeps only the first
     *               unit as the summary organization field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactOrgMulti0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactOrgMulti0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Multi Org\nORG:Alpha;Beta;Gamma\nEND:VCARD\n', 'multiorg.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].organization).assertEqual('Alpha');
      expect(contacts[0].jobTitle).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3600
     * @tc.name      testContactEmailSpaces0001
     * @tc.desc      Verify a padded email address is trimmed at both ends and
     *               lands in the summary emails exactly once.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactEmailSpaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactEmailSpaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nFN:Pad Mail\nEMAIL:  spaced@mail.example  \nEND:VCARD\n', 'padmail.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].emails.length).assertEqual(1);
      expect(contacts[0].emails[0]).assertEqual('spaced@mail.example');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CTSV_3700
     * @tc.name      testContactMixedCounts0001
     * @tc.desc      Verify a card mixing phone, emails, organization and title
     *               fills every summary field with matching counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactMixedCounts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactMixedCounts0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(
        'BEGIN:VCARD\nVERSION:3.0\nFN:Mixed User\nTEL:+8613800007777\n' +
        'EMAIL:m1@mail.example\nEMAIL:m2@mail.example\nORG:Mixed Corp\nTITLE:Planner\nEND:VCARD\n',
        'mixed.vcf');
      expect(preview.phoneCount).assertEqual(1);
      expect(preview.emailCount).assertEqual(2);
      expect(preview.organizationCount).assertEqual(1);
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts[0].phones.length).assertEqual(1);
      expect(contacts[0].emails.length).assertEqual(2);
      expect(contacts[0].organization).assertEqual('Mixed Corp');
      expect(contacts[0].jobTitle).assertEqual('Planner');
      expect(contacts[0].fullName).assertEqual('Mixed User');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
