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
import { ContactStore, ContactItem } from '../../../main/ets/model/ListModels';

/**
 * 联系人输入与国际化维度
 *
 * 关注真实实现面对“非法/特殊/国际化”输入时的行为：正则元字符不被当作模式、
 * 超长/空白/换行/零宽字符不崩溃、CJK/Emoji/组合音标按原样存储与检索。
 * 断言均针对可观察结果（是否抛错、命中数量、原样存储），不做镜像复写。
 */
export default function contactStoreInputTest() {
  describe('contactStoreInputTest', () => {
    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0100
     * @tc.name regexLikeKeywordsAreSafe
     * @tc.desc Verify regex metacharacters used as keywords never throw and never exceed the population
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('regexLikeKeywordsAreSafe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = new ContactStore();
      store.add('alpha', '1', 'deptA');
      store.add('beta', '2', 'deptB');
      const keywords: string[] = ['\\', '.*', '(', ')', '[a]', '^', '$', '|', '+', '?', '{2}', 'a|b', '\\d+'];
      for (const keyword of keywords) {
        let threw: boolean = false;
        let hits: ContactItem[] = [];
        try {
          hits = store.search(keyword);
        } catch (err) {
          threw = true;
        }
        expect(threw).assertFalse();
        expect(hits.length <= store.count()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0200
     * @tc.name specialCharFieldsAreSearchable
     * @tc.desc Verify stored metacharacter text is matched literally by a substring keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('specialCharFieldsAreSearchable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = new ContactStore();
      store.add('a+b*c?', '1', 'x(y)');
      expect(store.search('b*c').length).assertEqual(1);
      expect(store.search('(y)').length).assertEqual(1);
      expect(store.search('a+b').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0300
     * @tc.name cjkAndEmojiAreSearchable
     * @tc.desc Verify CJK and emoji fragments match in both name and department fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('cjkAndEmojiAreSearchable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = new ContactStore();
      store.add('张三', '1', '研发😀', true);
      store.add('😀Smile', '2', 'dept', false);
      expect(store.search('张').length).assertEqual(1);
      expect(store.search('研发').length).assertEqual(1);
      expect(store.search('😀').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0400
     * @tc.name latinCaseFoldingMatches
     * @tc.desc Verify Latin keywords match regardless of letter casing in name and department
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('latinCaseFoldingMatches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = new ContactStore();
      store.add('AbC', '1', 'XyZ', true);
      expect(store.search('abc').length).assertEqual(1);
      expect(store.search('XYZ').length).assertEqual(1);
      expect(store.search('aBc').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0500
     * @tc.name whitespaceKeywordMatchesNothing
     * @tc.desc Verify a single-space keyword does not throw and matches no space-free contact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('whitespaceKeywordMatchesNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = new ContactStore();
      store.add('u1', 'p1', 'deptB');
      store.add('u2', 'p2', 'deptA');
      let threw: boolean = false;
      let hits: ContactItem[] = [];
      try {
        hits = store.search(' ');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(hits.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0600
     * @tc.name newlineAndTabFieldsAreSearchable
     * @tc.desc Verify newline and tab characters in fields are preserved and matched by themselves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('newlineAndTabFieldsAreSearchable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = new ContactStore();
      store.add('line1\nline2', '1', 'tab\there');
      expect(store.search('\n').length).assertEqual(1);
      expect(store.search('\t').length).assertEqual(1);
      expect(store.findById(1)!.name.indexOf('\n') > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0700
     * @tc.name veryLongKeywordReturnsEmpty
     * @tc.desc Verify a ten-thousand-character keyword returns no hits without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('veryLongKeywordReturnsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = new ContactStore();
      store.add('u1', 'p1', 'deptA');
      const keyword: string = 'x'.repeat(10000);
      let threw: boolean = false;
      let hits: ContactItem[] = [];
      try {
        hits = store.search(keyword);
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(hits.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0800
     * @tc.name numericTextIsSearchable
     * @tc.desc Verify numeric names are stored as text and matched by numeric substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('numericTextIsSearchable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = new ContactStore();
      store.add('12345', 'p', 'dept');
      expect(store.search('234').length).assertEqual(1);
      expect(store.search('12345').length).assertEqual(1);
      expect(store.findById(1)!.name).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_0900
     * @tc.name combiningMarksPreserved
     * @tc.desc Verify a base letter plus combining mark is stored verbatim and searchable by prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('combiningMarksPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = new ContactStore();
      const name: string = 'cafe\u0301';
      store.add(name, '1', 'dept');
      expect(store.findById(1)!.name).assertEqual(name);
      expect(store.search('caf').length).assertEqual(1);
      expect(store.search(name).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_1000
     * @tc.name zeroWidthCharacterPreserved
     * @tc.desc Verify a zero-width character in a name is preserved and a normal prefix still matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('zeroWidthCharacterPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = new ContactStore();
      const name: string = 'ab\u200Bc';
      store.add(name, '1', 'dept');
      expect(store.findById(1)!.name.length).assertEqual(4);
      expect(store.search('ab').length).assertEqual(1);
      expect(store.search('\u200B').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_INPUT_1100
     * @tc.name fuzzAddsKeepStoreConsistent
     * @tc.desc Verify a batch of awkward inputs all persist and remain individually retrievable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('fuzzAddsKeepStoreConsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = new ContactStore();
      const values: string[] = ['', ' ', 'a', 'A', '张', '😀', 'a b', 'a\nb', 'a\tb', '\\', '.*', '(', '<script>',
        'cafe\u0301', 'ab\u200Bc', 'x'.repeat(2048)];
      for (const value of values) {
        store.add(value, value, value, false);
      }
      expect(store.count()).assertEqual(values.length);
      expect(store.search('').length).assertEqual(values.length);
      const all: ContactItem[] = store.getAll();
      let reachable: boolean = true;
      for (const c of all) {
        if (store.findById(c.id) === null) {
          reachable = false;
          break;
        }
      }
      expect(reachable).assertTrue();
    });
  });
}
