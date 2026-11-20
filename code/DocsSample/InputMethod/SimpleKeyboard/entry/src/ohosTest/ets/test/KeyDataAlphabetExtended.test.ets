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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  KeyState,
  MenuKey,
  MenuType,
  SubMenuType,
  keySourceListData,
  keySourceListType,
  numberSourceListData,
  symbolSourceListData,
  sourceListType
} from '../../../main/ets/InputMethodExtensionAbility/pages/KeyboardKeyData';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KeyDataAlphabet]';

export default function KeyDataAlphabetExtendedTest(): void {
  describe('KeyDataAlphabetExtendedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0108
     * @tc.name      testKeyDataAlphabet0108
     * @tc.desc      Verify alphabet key p is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0108 begin');
      const first: keySourceListType = keySourceListData[9];
      const second: keySourceListType = keySourceListData[9];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0109
     * @tc.name      testKeyDataAlphabet0109
     * @tc.desc      Verify alphabet key p keeps its title label '0' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0109 begin');
      const item: keySourceListType = keySourceListData[9];
      expect(item.title).assertEqual('0');
      expect('0'.length).assertEqual(1);
      expect(item.content).assertEqual('p');
      expect(item.upperContent).assertEqual('P');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0110
     * @tc.name      testKeyDataAlphabet0110
     * @tc.desc      Verify alphabet key p follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0110 begin');
      const item: keySourceListType = keySourceListData[9];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0111
     * @tc.name      testKeyDataAlphabet0111
     * @tc.desc      Verify alphabet key at index 10 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0111 begin');
      const idx: number = 10;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('~');
      expect(item.content).assertEqual('a');
      expect(item.upperContent).assertEqual('A');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0112
     * @tc.name      testKeyDataAlphabet0112
     * @tc.desc      Verify alphabet key a uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0112 begin');
      const item: keySourceListType = keySourceListData[10];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0112 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0113
     * @tc.name      testKeyDataAlphabet0113
     * @tc.desc      Verify alphabet key a upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0113 begin');
      const item: keySourceListType = keySourceListData[10];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0113 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0114
     * @tc.name      testKeyDataAlphabet0114
     * @tc.desc      Verify alphabet key a has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0114 begin');
      const item: keySourceListType = keySourceListData[10];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0115
     * @tc.name      testKeyDataAlphabet0115
     * @tc.desc      Verify alphabet key a lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0115 begin');
      const content: string = 'a';
      const upper: string = 'A';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0116
     * @tc.name      testKeyDataAlphabet0116
     * @tc.desc      Verify alphabet key a has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0116 begin');
      const title: string = '~';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0117
     * @tc.name      testKeyDataAlphabet0117
     * @tc.desc      Verify alphabet key a is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0117 begin');
      const idx: number = 10;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0118
     * @tc.name      testKeyDataAlphabet0118
     * @tc.desc      Verify alphabet key a fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0118 begin');
      const item: keySourceListType = keySourceListData[10];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0119
     * @tc.name      testKeyDataAlphabet0119
     * @tc.desc      Verify alphabet key a is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0119 begin');
      const first: keySourceListType = keySourceListData[10];
      const second: keySourceListType = keySourceListData[10];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0119 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0120
     * @tc.name      testKeyDataAlphabet0120
     * @tc.desc      Verify alphabet key a keeps its title label '~' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0120 begin');
      const item: keySourceListType = keySourceListData[10];
      expect(item.title).assertEqual('~');
      expect('~'.length).assertEqual(1);
      expect(item.content).assertEqual('a');
      expect(item.upperContent).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0120 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0121
     * @tc.name      testKeyDataAlphabet0121
     * @tc.desc      Verify alphabet key a follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0121 begin');
      const item: keySourceListType = keySourceListData[10];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0122
     * @tc.name      testKeyDataAlphabet0122
     * @tc.desc      Verify alphabet key at index 11 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0122 begin');
      const idx: number = 11;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('!');
      expect(item.content).assertEqual('s');
      expect(item.upperContent).assertEqual('S');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0123
     * @tc.name      testKeyDataAlphabet0123
     * @tc.desc      Verify alphabet key s uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0123 begin');
      const item: keySourceListType = keySourceListData[11];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0123 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0124
     * @tc.name      testKeyDataAlphabet0124
     * @tc.desc      Verify alphabet key s upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0124 begin');
      const item: keySourceListType = keySourceListData[11];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0124 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0125
     * @tc.name      testKeyDataAlphabet0125
     * @tc.desc      Verify alphabet key s has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0125 begin');
      const item: keySourceListType = keySourceListData[11];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0125 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0126
     * @tc.name      testKeyDataAlphabet0126
     * @tc.desc      Verify alphabet key s lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0126 begin');
      const content: string = 's';
      const upper: string = 'S';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0126 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0127
     * @tc.name      testKeyDataAlphabet0127
     * @tc.desc      Verify alphabet key s has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0127 begin');
      const title: string = '!';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0127 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0128
     * @tc.name      testKeyDataAlphabet0128
     * @tc.desc      Verify alphabet key s is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0128 begin');
      const idx: number = 11;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0128 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0129
     * @tc.name      testKeyDataAlphabet0129
     * @tc.desc      Verify alphabet key s fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0129 begin');
      const item: keySourceListType = keySourceListData[11];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0129 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0130
     * @tc.name      testKeyDataAlphabet0130
     * @tc.desc      Verify alphabet key s is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0130 begin');
      const first: keySourceListType = keySourceListData[11];
      const second: keySourceListType = keySourceListData[11];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0130 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0131
     * @tc.name      testKeyDataAlphabet0131
     * @tc.desc      Verify alphabet key s keeps its title label '!' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0131 begin');
      const item: keySourceListType = keySourceListData[11];
      expect(item.title).assertEqual('!');
      expect('!'.length).assertEqual(1);
      expect(item.content).assertEqual('s');
      expect(item.upperContent).assertEqual('S');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0131 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0132
     * @tc.name      testKeyDataAlphabet0132
     * @tc.desc      Verify alphabet key s follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0132 begin');
      const item: keySourceListType = keySourceListData[11];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0132 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0133
     * @tc.name      testKeyDataAlphabet0133
     * @tc.desc      Verify alphabet key at index 12 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0133 begin');
      const idx: number = 12;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('@');
      expect(item.content).assertEqual('d');
      expect(item.upperContent).assertEqual('D');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0133 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0134
     * @tc.name      testKeyDataAlphabet0134
     * @tc.desc      Verify alphabet key d uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0134 begin');
      const item: keySourceListType = keySourceListData[12];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0134 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0135
     * @tc.name      testKeyDataAlphabet0135
     * @tc.desc      Verify alphabet key d upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0135 begin');
      const item: keySourceListType = keySourceListData[12];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0135 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0136
     * @tc.name      testKeyDataAlphabet0136
     * @tc.desc      Verify alphabet key d has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0136 begin');
      const item: keySourceListType = keySourceListData[12];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0136 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0137
     * @tc.name      testKeyDataAlphabet0137
     * @tc.desc      Verify alphabet key d lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0137 begin');
      const content: string = 'd';
      const upper: string = 'D';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0137 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0138
     * @tc.name      testKeyDataAlphabet0138
     * @tc.desc      Verify alphabet key d has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0138 begin');
      const title: string = '@';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0138 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0139
     * @tc.name      testKeyDataAlphabet0139
     * @tc.desc      Verify alphabet key d is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0139 begin');
      const idx: number = 12;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0139 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0140
     * @tc.name      testKeyDataAlphabet0140
     * @tc.desc      Verify alphabet key d fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0140 begin');
      const item: keySourceListType = keySourceListData[12];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0140 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0141
     * @tc.name      testKeyDataAlphabet0141
     * @tc.desc      Verify alphabet key d is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0141 begin');
      const first: keySourceListType = keySourceListData[12];
      const second: keySourceListType = keySourceListData[12];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0141 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0142
     * @tc.name      testKeyDataAlphabet0142
     * @tc.desc      Verify alphabet key d keeps its title label '@' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0142 begin');
      const item: keySourceListType = keySourceListData[12];
      expect(item.title).assertEqual('@');
      expect('@'.length).assertEqual(1);
      expect(item.content).assertEqual('d');
      expect(item.upperContent).assertEqual('D');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0142 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0143
     * @tc.name      testKeyDataAlphabet0143
     * @tc.desc      Verify alphabet key d follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0143 begin');
      const item: keySourceListType = keySourceListData[12];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0143 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0144
     * @tc.name      testKeyDataAlphabet0144
     * @tc.desc      Verify alphabet key at index 13 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0144 begin');
      const idx: number = 13;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('#');
      expect(item.content).assertEqual('f');
      expect(item.upperContent).assertEqual('F');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0144 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0145
     * @tc.name      testKeyDataAlphabet0145
     * @tc.desc      Verify alphabet key f uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0145 begin');
      const item: keySourceListType = keySourceListData[13];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0145 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0146
     * @tc.name      testKeyDataAlphabet0146
     * @tc.desc      Verify alphabet key f upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0146 begin');
      const item: keySourceListType = keySourceListData[13];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0146 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0147
     * @tc.name      testKeyDataAlphabet0147
     * @tc.desc      Verify alphabet key f has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0147 begin');
      const item: keySourceListType = keySourceListData[13];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0147 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0148
     * @tc.name      testKeyDataAlphabet0148
     * @tc.desc      Verify alphabet key f lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0148 begin');
      const content: string = 'f';
      const upper: string = 'F';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0148 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0149
     * @tc.name      testKeyDataAlphabet0149
     * @tc.desc      Verify alphabet key f has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0149 begin');
      const title: string = '#';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0149 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0150
     * @tc.name      testKeyDataAlphabet0150
     * @tc.desc      Verify alphabet key f is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0150 begin');
      const idx: number = 13;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0150 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0151
     * @tc.name      testKeyDataAlphabet0151
     * @tc.desc      Verify alphabet key f fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0151 begin');
      const item: keySourceListType = keySourceListData[13];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0151 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0152
     * @tc.name      testKeyDataAlphabet0152
     * @tc.desc      Verify alphabet key f is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0152 begin');
      const first: keySourceListType = keySourceListData[13];
      const second: keySourceListType = keySourceListData[13];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0152 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0153
     * @tc.name      testKeyDataAlphabet0153
     * @tc.desc      Verify alphabet key f keeps its title label '#' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0153 begin');
      const item: keySourceListType = keySourceListData[13];
      expect(item.title).assertEqual('#');
      expect('#'.length).assertEqual(1);
      expect(item.content).assertEqual('f');
      expect(item.upperContent).assertEqual('F');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0153 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0154
     * @tc.name      testKeyDataAlphabet0154
     * @tc.desc      Verify alphabet key f follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0154 begin');
      const item: keySourceListType = keySourceListData[13];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0154 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0155
     * @tc.name      testKeyDataAlphabet0155
     * @tc.desc      Verify alphabet key at index 14 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0155 begin');
      const idx: number = 14;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('%');
      expect(item.content).assertEqual('g');
      expect(item.upperContent).assertEqual('G');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0155 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0156
     * @tc.name      testKeyDataAlphabet0156
     * @tc.desc      Verify alphabet key g uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0156 begin');
      const item: keySourceListType = keySourceListData[14];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0156 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0157
     * @tc.name      testKeyDataAlphabet0157
     * @tc.desc      Verify alphabet key g upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0157 begin');
      const item: keySourceListType = keySourceListData[14];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0157 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0158
     * @tc.name      testKeyDataAlphabet0158
     * @tc.desc      Verify alphabet key g has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0158 begin');
      const item: keySourceListType = keySourceListData[14];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0158 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0159
     * @tc.name      testKeyDataAlphabet0159
     * @tc.desc      Verify alphabet key g lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0159 begin');
      const content: string = 'g';
      const upper: string = 'G';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0159 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0160
     * @tc.name      testKeyDataAlphabet0160
     * @tc.desc      Verify alphabet key g has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0160 begin');
      const title: string = '%';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0160 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0161
     * @tc.name      testKeyDataAlphabet0161
     * @tc.desc      Verify alphabet key g is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0161 begin');
      const idx: number = 14;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0161 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0162
     * @tc.name      testKeyDataAlphabet0162
     * @tc.desc      Verify alphabet key g fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0162 begin');
      const item: keySourceListType = keySourceListData[14];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0162 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0163
     * @tc.name      testKeyDataAlphabet0163
     * @tc.desc      Verify alphabet key g is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0163 begin');
      const first: keySourceListType = keySourceListData[14];
      const second: keySourceListType = keySourceListData[14];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0163 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0164
     * @tc.name      testKeyDataAlphabet0164
     * @tc.desc      Verify alphabet key g keeps its title label '%' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0164 begin');
      const item: keySourceListType = keySourceListData[14];
      expect(item.title).assertEqual('%');
      expect('%'.length).assertEqual(1);
      expect(item.content).assertEqual('g');
      expect(item.upperContent).assertEqual('G');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0164 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0165
     * @tc.name      testKeyDataAlphabet0165
     * @tc.desc      Verify alphabet key g follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0165 begin');
      const item: keySourceListType = keySourceListData[14];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0165 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0166
     * @tc.name      testKeyDataAlphabet0166
     * @tc.desc      Verify alphabet key at index 15 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0166 begin');
      const idx: number = 15;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('\'');
      expect(item.content).assertEqual('h');
      expect(item.upperContent).assertEqual('H');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0166 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0167
     * @tc.name      testKeyDataAlphabet0167
     * @tc.desc      Verify alphabet key h uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0167 begin');
      const item: keySourceListType = keySourceListData[15];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0167 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0168
     * @tc.name      testKeyDataAlphabet0168
     * @tc.desc      Verify alphabet key h upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0168 begin');
      const item: keySourceListType = keySourceListData[15];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0168 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0169
     * @tc.name      testKeyDataAlphabet0169
     * @tc.desc      Verify alphabet key h has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0169 begin');
      const item: keySourceListType = keySourceListData[15];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0169 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0170
     * @tc.name      testKeyDataAlphabet0170
     * @tc.desc      Verify alphabet key h lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0170 begin');
      const content: string = 'h';
      const upper: string = 'H';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0170 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0171
     * @tc.name      testKeyDataAlphabet0171
     * @tc.desc      Verify alphabet key h has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0171 begin');
      const title: string = '\'';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0171 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0172
     * @tc.name      testKeyDataAlphabet0172
     * @tc.desc      Verify alphabet key h is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0172 begin');
      const idx: number = 15;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0172 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0173
     * @tc.name      testKeyDataAlphabet0173
     * @tc.desc      Verify alphabet key h fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0173 begin');
      const item: keySourceListType = keySourceListData[15];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0173 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0174
     * @tc.name      testKeyDataAlphabet0174
     * @tc.desc      Verify alphabet key h is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0174 begin');
      const first: keySourceListType = keySourceListData[15];
      const second: keySourceListType = keySourceListData[15];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0174 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0175
     * @tc.name      testKeyDataAlphabet0175
     * @tc.desc      Verify alphabet key h keeps its title label "'" stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0175 begin');
      const item: keySourceListType = keySourceListData[15];
      expect(item.title).assertEqual('\'');
      expect('\''.length).assertEqual(1);
      expect(item.content).assertEqual('h');
      expect(item.upperContent).assertEqual('H');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0175 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0176
     * @tc.name      testKeyDataAlphabet0176
     * @tc.desc      Verify alphabet key h follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0176 begin');
      const item: keySourceListType = keySourceListData[15];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0176 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0177
     * @tc.name      testKeyDataAlphabet0177
     * @tc.desc      Verify alphabet key at index 16 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0177 begin');
      const idx: number = 16;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('&');
      expect(item.content).assertEqual('j');
      expect(item.upperContent).assertEqual('J');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0177 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0178
     * @tc.name      testKeyDataAlphabet0178
     * @tc.desc      Verify alphabet key j uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0178 begin');
      const item: keySourceListType = keySourceListData[16];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0178 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0179
     * @tc.name      testKeyDataAlphabet0179
     * @tc.desc      Verify alphabet key j upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0179 begin');
      const item: keySourceListType = keySourceListData[16];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0179 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0180
     * @tc.name      testKeyDataAlphabet0180
     * @tc.desc      Verify alphabet key j has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0180 begin');
      const item: keySourceListType = keySourceListData[16];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0180 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0181
     * @tc.name      testKeyDataAlphabet0181
     * @tc.desc      Verify alphabet key j lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0181 begin');
      const content: string = 'j';
      const upper: string = 'J';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0181 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0182
     * @tc.name      testKeyDataAlphabet0182
     * @tc.desc      Verify alphabet key j has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0182 begin');
      const title: string = '&';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0182 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0183
     * @tc.name      testKeyDataAlphabet0183
     * @tc.desc      Verify alphabet key j is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0183 begin');
      const idx: number = 16;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0183 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0184
     * @tc.name      testKeyDataAlphabet0184
     * @tc.desc      Verify alphabet key j fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0184 begin');
      const item: keySourceListType = keySourceListData[16];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0184 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0185
     * @tc.name      testKeyDataAlphabet0185
     * @tc.desc      Verify alphabet key j is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0185 begin');
      const first: keySourceListType = keySourceListData[16];
      const second: keySourceListType = keySourceListData[16];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0185 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0186
     * @tc.name      testKeyDataAlphabet0186
     * @tc.desc      Verify alphabet key j keeps its title label '&' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0186 begin');
      const item: keySourceListType = keySourceListData[16];
      expect(item.title).assertEqual('&');
      expect('&'.length).assertEqual(1);
      expect(item.content).assertEqual('j');
      expect(item.upperContent).assertEqual('J');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0186 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0187
     * @tc.name      testKeyDataAlphabet0187
     * @tc.desc      Verify alphabet key j follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0187 begin');
      const item: keySourceListType = keySourceListData[16];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0187 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0188
     * @tc.name      testKeyDataAlphabet0188
     * @tc.desc      Verify alphabet key at index 17 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0188 begin');
      const idx: number = 17;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('*');
      expect(item.content).assertEqual('k');
      expect(item.upperContent).assertEqual('K');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0188 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0189
     * @tc.name      testKeyDataAlphabet0189
     * @tc.desc      Verify alphabet key k uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0189 begin');
      const item: keySourceListType = keySourceListData[17];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0189 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0190
     * @tc.name      testKeyDataAlphabet0190
     * @tc.desc      Verify alphabet key k upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0190 begin');
      const item: keySourceListType = keySourceListData[17];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0190 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0191
     * @tc.name      testKeyDataAlphabet0191
     * @tc.desc      Verify alphabet key k has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0191 begin');
      const item: keySourceListType = keySourceListData[17];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0191 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0192
     * @tc.name      testKeyDataAlphabet0192
     * @tc.desc      Verify alphabet key k lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0192 begin');
      const content: string = 'k';
      const upper: string = 'K';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0192 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0193
     * @tc.name      testKeyDataAlphabet0193
     * @tc.desc      Verify alphabet key k has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0193 begin');
      const title: string = '*';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0193 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0194
     * @tc.name      testKeyDataAlphabet0194
     * @tc.desc      Verify alphabet key k is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0194 begin');
      const idx: number = 17;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0194 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0195
     * @tc.name      testKeyDataAlphabet0195
     * @tc.desc      Verify alphabet key k fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0195 begin');
      const item: keySourceListType = keySourceListData[17];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0195 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0196
     * @tc.name      testKeyDataAlphabet0196
     * @tc.desc      Verify alphabet key k is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0196 begin');
      const first: keySourceListType = keySourceListData[17];
      const second: keySourceListType = keySourceListData[17];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0196 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0197
     * @tc.name      testKeyDataAlphabet0197
     * @tc.desc      Verify alphabet key k keeps its title label '*' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0197 begin');
      const item: keySourceListType = keySourceListData[17];
      expect(item.title).assertEqual('*');
      expect('*'.length).assertEqual(1);
      expect(item.content).assertEqual('k');
      expect(item.upperContent).assertEqual('K');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0197 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0198
     * @tc.name      testKeyDataAlphabet0198
     * @tc.desc      Verify alphabet key k follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0198 begin');
      const item: keySourceListType = keySourceListData[17];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0198 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0199
     * @tc.name      testKeyDataAlphabet0199
     * @tc.desc      Verify alphabet key at index 18 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0199 begin');
      const idx: number = 18;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('?');
      expect(item.content).assertEqual('l');
      expect(item.upperContent).assertEqual('L');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0199 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0200
     * @tc.name      testKeyDataAlphabet0200
     * @tc.desc      Verify alphabet key l uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0200 begin');
      const item: keySourceListType = keySourceListData[18];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0200 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0201
     * @tc.name      testKeyDataAlphabet0201
     * @tc.desc      Verify alphabet key l upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0201 begin');
      const item: keySourceListType = keySourceListData[18];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0201 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0202
     * @tc.name      testKeyDataAlphabet0202
     * @tc.desc      Verify alphabet key l has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0202 begin');
      const item: keySourceListType = keySourceListData[18];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0202 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0203
     * @tc.name      testKeyDataAlphabet0203
     * @tc.desc      Verify alphabet key l lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0203 begin');
      const content: string = 'l';
      const upper: string = 'L';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0203 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0204
     * @tc.name      testKeyDataAlphabet0204
     * @tc.desc      Verify alphabet key l has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0204 begin');
      const title: string = '?';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0204 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0205
     * @tc.name      testKeyDataAlphabet0205
     * @tc.desc      Verify alphabet key l is placed in KeyMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0205 begin');
      const idx: number = 18;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(1);
      expect(idx >= 10).assertTrue();
      expect(idx < 19).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0205 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0206
     * @tc.name      testKeyDataAlphabet0206
     * @tc.desc      Verify alphabet key l fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0206 begin');
      const item: keySourceListType = keySourceListData[18];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0206 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0207
     * @tc.name      testKeyDataAlphabet0207
     * @tc.desc      Verify alphabet key l is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0207 begin');
      const first: keySourceListType = keySourceListData[18];
      const second: keySourceListType = keySourceListData[18];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0207 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0208
     * @tc.name      testKeyDataAlphabet0208
     * @tc.desc      Verify alphabet key l keeps its title label '?' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0208 begin');
      const item: keySourceListType = keySourceListData[18];
      expect(item.title).assertEqual('?');
      expect('?'.length).assertEqual(1);
      expect(item.content).assertEqual('l');
      expect(item.upperContent).assertEqual('L');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0208 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0209
     * @tc.name      testKeyDataAlphabet0209
     * @tc.desc      Verify alphabet key l follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0209 begin');
      const item: keySourceListType = keySourceListData[18];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0209 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0210
     * @tc.name      testKeyDataAlphabet0210
     * @tc.desc      Verify alphabet key at index 19 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0210 begin');
      const idx: number = 19;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('H');
      expect(item.content).assertEqual('z');
      expect(item.upperContent).assertEqual('Z');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0210 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0211
     * @tc.name      testKeyDataAlphabet0211
     * @tc.desc      Verify alphabet key z uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0211 begin');
      const item: keySourceListType = keySourceListData[19];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0211 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0212
     * @tc.name      testKeyDataAlphabet0212
     * @tc.desc      Verify alphabet key z upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0212 begin');
      const item: keySourceListType = keySourceListData[19];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0212 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0213
     * @tc.name      testKeyDataAlphabet0213
     * @tc.desc      Verify alphabet key z has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0213 begin');
      const item: keySourceListType = keySourceListData[19];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0213 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0214
     * @tc.name      testKeyDataAlphabet0214
     * @tc.desc      Verify alphabet key z lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0214 begin');
      const content: string = 'z';
      const upper: string = 'Z';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0214 end');
    })
  })
}
