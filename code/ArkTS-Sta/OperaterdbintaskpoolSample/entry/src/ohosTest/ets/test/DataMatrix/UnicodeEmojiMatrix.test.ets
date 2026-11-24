'use static';
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

/**
 * DataMatrix / UnicodeEmojiMatrix suite.
 *
 * ArkTS strings are UTF-16 sequences, so a CJK name counts one unit per
 * character while an emoji counts two. The suite checks that the length cap,
 * the fingerprint, the redaction helpers and the search filter all behave
 * consistently for CJK, Latin, accented and emoji input.
 *
 * Source anchors:
 *   Contact.ets:31-47            plain string fields, no normalisation
 *   SharedDriver.ets:173-179     textFingerprint over charCodeAt
 *   SharedDriver.ets:970-996     containsChinese and redaction helpers
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  CATEGORY_A,
  CATEGORY_B,
  MAX_NAME_LENGTH,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint,
  containsChinese,
  isDigitsOnly,
  hasEmailShape,
  hasControlCharacters,
  redactPhone,
  redactEmail,
  ContactValidation,
  ContactMapper,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function unicodeEmojiMatrixTest(): void {
  describe('UnicodeEmojiMatrix', () => {
    beforeAll(() => {
      logSuite('UnicodeEmojiMatrix', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('UnicodeEmojiMatrix', 'end');
    });

    /**
     * @tc.name   cjkNameUsesOneUnitPerCharacter
     * @tc.desc   A four character CJK name reports four length units.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cjkNameUsesOneUnitPerCharacter', 0, () => {
      const row = contactOf('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', '', CATEGORY_A);
      expect(row.name.length).assertEqual(4);
      expect(row.name.charCodeAt(0)).assertEqual(0x827E);
      expect(containsChinese(row.name)).assertTrue();
      expect(row.name.substring(1, 3)).assertEqual('德里');
      logStep('unicodeEmojiMatrixTest', 'CJK name length is one unit per character');
    });

    /**
     * @tc.name   emojiAddsTwoCodeUnits
     * @tc.desc   A single emoji contributes two UTF-16 units to the name length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emojiAddsTwoCodeUnits', 0, () => {
      const row = contactOf('林岸😀', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_A);
      expect(row.name.length).assertEqual(4);
      expect('林岸'.length).assertEqual(2);
      expect(row.name.length - '林岸'.length).assertEqual(2);
      expect(containsChinese(row.name)).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'emoji adds two code units');
    });

    /**
     * @tc.name   emojiNameRoundTripsBucket
     * @tc.desc   An emoji name survives the bucket round trip without replacement characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emojiNameRoundTripsBucket', 0, () => {
      const row = contactOf('苏禾🌊', '13512345678', 'suhe@example.com', '浙江省杭州市西湖区', '', CATEGORY_A);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.name).assertEqual('苏禾🌊');
      expect(restored.name.length).assertEqual(4);
      expect(restored.name.indexOf('🌊') > 0).assertTrue();
      expect(restored.phone).assertEqual('13512345678');
      logStep('unicodeEmojiMatrixTest', 'emoji name round trips');
    });

    /**
     * @tc.name   surrogatePairIsTwoUnits
     * @tc.desc   An astral emoji is two code units and its high surrogate is above 0xD800.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('surrogatePairIsTwoUnits', 0, () => {
      const emoji = '🚀';
      expect(emoji.length).assertEqual(2);
      expect(emoji.charCodeAt(0) >= 0xD800).assertTrue();
      expect(emoji.charCodeAt(1) >= 0xDC00).assertTrue();
      expect(containsChinese(emoji)).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'surrogate pair spans two units');
    });

    /**
     * @tc.name   mixedCjkAndLatinName
     * @tc.desc   A name mixing CJK and Latin keeps both scripts and a mixed length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mixedCjkAndLatinName', 0, () => {
      const row = contactOf('艾拉Ella', '10000000001', 'ella@example.com', '辽宁省沈阳市和平区', '', CATEGORY_A);
      expect(row.name.length).assertEqual(6);
      expect(containsChinese(row.name)).assertTrue();
      expect(row.name.indexOf('Ella') > 0).assertTrue();
      expect(ContactValidation.validate(row).length).assertEqual(0);
      logStep('unicodeEmojiMatrixTest', 'mixed scripts stay intact');
    });

    /**
     * @tc.name   containsChineseOnSeedNames
     * @tc.desc   All fifteen seed names contain CJK characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('containsChineseOnSeedNames', 0, () => {
      const seed = createSeedContacts();
      let cjk = 0;
      for (let index = 0; index < seed.length; index++) {
        if (containsChinese(seed[index].name)) {
          cjk = cjk + 1;
        }
      }
      expect(cjk).assertEqual(15);
      expect(containsChinese(seed[0].address)).assertTrue();
      expect(containsChinese(seed[0].email)).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'seed names are CJK');
    });

    /**
     * @tc.name   containsChineseFalseForLatin
     * @tc.desc   Latin names, emails and phone numbers report no CJK characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('containsChineseFalseForLatin', 0, () => {
      expect(containsChinese('Alice')).assertFalse();
      expect(containsChinese('alice@example.com')).assertFalse();
      expect(containsChinese('13800138000')).assertFalse();
      expect(containsChinese('')).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'Latin text has no CJK');
    });

    /**
     * @tc.name   fingerprintStableForRepeatedText
     * @tc.desc   The same CJK text always yields the same fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintStableForRepeatedText', 0, () => {
      const text = '贝拉';
      expect(textFingerprint(text)).assertEqual(textFingerprint('贝拉'));
      expect(textFingerprint(text)).assertEqual(textFingerprint(text));
      expect(textFingerprint(text) > 0).assertTrue();
      expect(textFingerprint(text) < 1000003).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'fingerprint is stable');
    });

    /**
     * @tc.name   fingerprintDiffersForEmojiName
     * @tc.desc   A name with and without an emoji produce different fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintDiffersForEmojiName', 0, () => {
      const plain = textFingerprint('林岸');
      const withEmoji = textFingerprint('林岸😀');
      expect(plain === withEmoji).assertFalse();
      expect(withEmoji > 0).assertTrue();
      expect(textFingerprint('林岸✨') === withEmoji).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'emoji changes the fingerprint');
    });

    /**
     * @tc.name   emojiPhoneIsNotNumeric
     * @tc.desc   A phone carrying an emoji is rejected as non numeric.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emojiPhoneIsNotNumeric', 0, () => {
      const row = contactOf('贝拉', '1111😀1111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B);
      expect(isDigitsOnly(row.phone)).assertFalse();
      const errors = ContactValidation.validate(row);
      expect(errors.indexOf('phone-not-numeric') >= 0).assertTrue();
      expect(errors.length).assertEqual(1);
      logStep('unicodeEmojiMatrixTest', 'emoji phone is not numeric');
    });

    /**
     * @tc.name   unicodeAddressIsAccepted
     * @tc.desc   A long CJK address inside the cap produces no error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unicodeAddressIsAccepted', 0, () => {
      const address = '江苏省南京市鼓楼区湖南路街道山西路社区';
      const row = contactOf('沈川', '13700000001', 'shenchuan@example.com', address, '', CATEGORY_A);
      expect(address.length).assertEqual(19);
      expect(address.length <= 100).assertTrue();
      expect(ContactValidation.validate(row).length).assertEqual(0);
      expect(containsChinese(address)).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'unicode address is accepted');
    });

    /**
     * @tc.name   redactPhoneKeepsLastThree
     * @tc.desc   The masked phone keeps three trailing digits and drops the rest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactPhoneKeepsLastThree', 0, () => {
      expect(redactPhone('13333333333')).assertEqual('***333');
      expect(redactPhone('10000000000')).assertEqual('***000');
      expect(redactPhone('12')).assertEqual('***');
      expect(redactPhone('13333333333').length).assertEqual(6);
      logStep('unicodeEmojiMatrixTest', 'phone redaction keeps three digits');
    });

    /**
     * @tc.name   redactEmailKeepsFirstAndDomain
     * @tc.desc   Email masking keeps the first character and the whole domain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactEmailKeepsFirstAndDomain', 0, () => {
      expect(redactEmail('aidelian@example.com')).assertEqual('a***@example.com');
      expect(redactEmail('bella@example.com')).assertEqual('b***@example.com');
      expect(redactEmail('broken')).assertEqual('***');
      expect(redactEmail('aidelian@example.com').indexOf('@example.com') >= 0).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'email redaction keeps the domain');
    });

    /**
     * @tc.name   splitRevealsCjkCharacters
     * @tc.desc   Splitting a three character CJK name yields three one unit parts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('splitRevealsCjkCharacters', 0, () => {
      const parts = '本杰明'.split('');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('本');
      expect(parts[1]).assertEqual('杰');
      expect(parts[2]).assertEqual('明');
      expect(joined(parts, '-')).assertEqual('本-杰-明');
      logStep('unicodeEmojiMatrixTest', 'split reveals CJK characters');
    });

    /**
     * @tc.name   uniqueStringsCollapsesEmojiTwins
     * @tc.desc   Two identical emoji names collapse to one unique entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uniqueStringsCollapsesEmojiTwins', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉🌊', '13900000001', 'bella1@example.com', '天津市和平区', '', CATEGORY_B));
      rows.push(contactOf('贝拉🌊', '13900000002', 'bella2@example.com', '天津市河西区', '', CATEGORY_B));
      const names = contactNames(rows);
      expect(names.length).assertEqual(17);
      expect(uniqueStrings(names).length).assertEqual(16);
      expect(countOf(names, '贝拉🌊')).assertEqual(2);
      logStep('unicodeEmojiMatrixTest', 'emoji twins collapse');
    });

    /**
     * @tc.name   countOfEmojiName
     * @tc.desc   The counter matches only the exact emoji name and not the plain one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countOfEmojiName', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉🚀', '13900000003', 'bella.rocket@example.com', '天津市南开区', '', CATEGORY_B));
      const names = contactNames(rows);
      expect(countOf(names, '贝拉🚀')).assertEqual(1);
      expect(countOf(names, '贝拉')).assertEqual(1);
      expect(countOf(names, '贝拉🚀🚀')).assertEqual(0);
      logStep('unicodeEmojiMatrixTest', 'emoji counter is exact');
    });

    /**
     * @tc.name   joinedKeepsUnicodeOrder
     * @tc.desc   Joining CJK names with a CJK separator preserves order and length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('joinedKeepsUnicodeOrder', 0, () => {
      const names: string[] = ['艾德里安', '阿诺德', '贝拉'];
      const text = joined(names, '、');
      expect(text).assertEqual('艾德里安、阿诺德、贝拉');
      expect(text.split('、').length).assertEqual(3);
      expect(text.indexOf('阿诺德') > text.indexOf('艾德里安')).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'unicode join keeps order');
    });

    /**
     * @tc.name   searchMatchesEmojiKeyword
     * @tc.desc   A name filter with an emoji keyword finds the emoji row only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchMatchesEmojiKeyword', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('闻溪🌊', '13700000002', 'wenxi.sea@example.com', '广东省汕头市金平区', '', CATEGORY_A));
      const hits = SearchEngine.filterByName(rows, '🌊');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('闻溪🌊');
      expect(SearchEngine.filterByName(rows, '闻溪').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '🌊🌊').length).assertEqual(0);
      logStep('unicodeEmojiMatrixTest', 'emoji keyword search works');
    });

    /**
     * @tc.name   accentedLatinNamePasses
     * @tc.desc   A Latin name with diacritics keeps its accents and passes validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('accentedLatinNamePasses', 0, () => {
      const row = contactOf('Renée', '13800138041', 'renee@example.com', '上海市长宁区', '', CATEGORY_A);
      expect(row.name.length).assertEqual(5);
      expect(row.name.indexOf('é') > 0).assertTrue();
      expect(containsChinese(row.name)).assertFalse();
      expect(ContactValidation.validate(row).length).assertEqual(0);
      logStep('unicodeEmojiMatrixTest', 'accented Latin name passes');
    });

    /**
     * @tc.name   nameAtCapWithEmojiRejected
     * @tc.desc   Eleven CJK characters plus one emoji exceed the twelve unit cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('nameAtCapWithEmojiRejected', 0, () => {
      const eleven = '一二三四五六七八九十一';
      const name = eleven + '😀';
      const row = contactOf(name, '13800138042', 'long@example.com', '上海市普陀区', '', CATEGORY_A);
      expect(eleven.length).assertEqual(11);
      expect(name.length).assertEqual(13);
      expect(name.length > MAX_NAME_LENGTH).assertTrue();
      expect(ContactValidation.validate(row).indexOf('name-too-long') >= 0).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'emoji pushes the name over the cap');
    });

    /**
     * @tc.name   controlCharactersAreDetected
     * @tc.desc   A tab in an address is reported while CJK text is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('controlCharactersAreDetected', 0, () => {
      expect(hasControlCharacters('line\tbreak')).assertTrue();
      expect(hasControlCharacters('line\nbreak')).assertTrue();
      expect(hasControlCharacters('江苏省南京市')).assertFalse();
      expect(hasControlCharacters('plain')).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'control characters are detected');
    });

    /**
     * @tc.name   unicodeEmailShapeAccepted
     * @tc.desc   An email with CJK local and domain parts still satisfies the shape test.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('unicodeEmailShapeAccepted', 0, () => {
      const value = '用户@例子.测试';
      expect(hasEmailShape(value)).assertTrue();
      expect(value.indexOf('@') > 0).assertTrue();
      expect(containsChinese(value)).assertTrue();
      expect(hasEmailShape('例子.测试')).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'unicode email shape accepted');
    });

    /**
     * @tc.name   emojiCategoryKeepsTwoUnits
     * @tc.desc   A category holding one emoji reports two length units and round trips.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emojiCategoryKeepsTwoUnits', 0, () => {
      const row = contactOf('洛水', '13620000101', 'luoshui@example.com', '河南省洛阳市洛龙区', '', '🌊');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.category).assertEqual('🌊');
      expect(restored.category.length).assertEqual(2);
      expect(restored.category === CATEGORY_A).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'emoji category keeps two units');
    });

    /**
     * @tc.name   combiningMarkAddsUnits
     * @tc.desc   A base letter followed by a combining accent counts two units.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('combiningMarkAddsUnits', 0, () => {
      const combined = 'e' + '\u0301';
      expect(combined.length).assertEqual(2);
      expect(combined.charCodeAt(0)).assertEqual(101);
      expect(combined.charCodeAt(1)).assertEqual(769);
      expect(containsChinese(combined)).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'combining mark adds a unit');
    });

    /**
     * @tc.name   emojiAddressRoundTrips
     * @tc.desc   An address ending with an emoji marker round trips through the bucket.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emojiAddressRoundTrips', 0, () => {
      const address = '上海市徐汇区🏠';
      const row = contactOf('闻舟', '13700000003', 'wenzhou.home@example.com', address, '', CATEGORY_A);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.address).assertEqual(address);
      expect(restored.address.length).assertEqual(8);
      expect(restored.address.endsWith('🏠')).assertTrue();
      expect(containsChinese(restored.address)).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'emoji address round trips');
    });

    /**
     * @tc.name   cjkNameOrderComparison
     * @tc.desc   CJK names compare by code unit, which keeps the seed order for the shared prefix 本.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('cjkNameOrderComparison', 0, () => {
      const shortName = '本';
      const longName = '本杰明';
      expect(shortName < longName).assertTrue();
      expect(shortName.length < longName.length).assertTrue();
      expect(longName.startsWith(shortName)).assertTrue();
      expect(longName.indexOf(shortName)).assertEqual(0);
      logStep('unicodeEmojiMatrixTest', 'CJK comparison follows code units');
    });

    /**
     * @tc.name   uppercaseUnicodeNameValidates
     * @tc.desc   An uppercase accented name is a different name from its lowercase form but still valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('uppercaseUnicodeNameValidates', 0, () => {
      const upper = contactOf('RENÉE', '13800138043', 'renee.upper@example.com', '上海市虹口区', '', CATEGORY_A);
      expect(upper.name).assertEqual('RENÉE');
      expect(upper.name === 'Renée').assertFalse();
      expect(upper.name.length).assertEqual(5);
      expect(ContactValidation.validate(upper).length).assertEqual(0);
      logStep('unicodeEmojiMatrixTest', 'uppercase accent name validates');
    });

    /**
     * @tc.name   multiEmojiNameLength
     * @tc.desc   Two emoji add four units, so a two character CJK name plus two emoji is six.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('multiEmojiNameLength', 0, () => {
      const name = '洛川🚀🌊';
      const row = contactOf(name, '13620000102', 'luochuan.m@example.com', '河南省平顶山市新华区', '', CATEGORY_A);
      expect(name.length).assertEqual(6);
      expect(countOf(['x', name], name)).assertEqual(1);
      expect(ContactValidation.validate(row).length).assertEqual(0);
      expect(name.indexOf('🚀') > 0).assertTrue();
      logStep('unicodeEmojiMatrixTest', 'two emoji add four units');
    });

    /**
     * @tc.name   fingerprintOfSeedName
     * @tc.desc   The fingerprint of a seed name is positive and independent of the phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintOfSeedName', 0, () => {
      const seed = createSeedContacts();
      const first = textFingerprint(seed[0].name);
      const second = textFingerprint(seed[1].name);
      expect(first > 0).assertTrue();
      expect(first === second).assertFalse();
      expect(textFingerprint(seed[0].name)).assertEqual(first);
      logStep('unicodeEmojiMatrixTest', 'seed name fingerprints differ');
    });

    /**
     * @tc.name   emojiInEmailLocalPart
     * @tc.desc   An emoji before the at sign keeps the email shape valid and adds two units.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UnicodeEmojiMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emojiInEmailLocalPart', 0, () => {
      const email = 'aidelian😀@example.com';
      expect(email.length).assertEqual(22);
      expect(hasEmailShape(email)).assertTrue();
      expect(email.indexOf('@') > 0).assertTrue();
      expect(containsChinese(email)).assertFalse();
      logStep('unicodeEmojiMatrixTest', 'emoji in the local part keeps the shape');
    });
  });
}
