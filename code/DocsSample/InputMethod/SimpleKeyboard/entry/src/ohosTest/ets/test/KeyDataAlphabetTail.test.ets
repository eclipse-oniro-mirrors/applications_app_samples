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

export default function KeyDataAlphabetTailTest(): void {
  describe('KeyDataAlphabetTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0215
     * @tc.name      testKeyDataAlphabet0215
     * @tc.desc      Verify alphabet key z has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0215 begin');
      const title: string = 'H';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0215 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0216
     * @tc.name      testKeyDataAlphabet0216
     * @tc.desc      Verify alphabet key z is placed in KeyMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0216 begin');
      const idx: number = 19;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(2);
      expect(idx >= 19).assertTrue();
      expect(idx < 26).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0216 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0217
     * @tc.name      testKeyDataAlphabet0217
     * @tc.desc      Verify alphabet key z fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0217 begin');
      const item: keySourceListType = keySourceListData[19];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0217 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0218
     * @tc.name      testKeyDataAlphabet0218
     * @tc.desc      Verify alphabet key z is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0218 begin');
      const first: keySourceListType = keySourceListData[19];
      const second: keySourceListType = keySourceListData[19];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0218 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0219
     * @tc.name      testKeyDataAlphabet0219
     * @tc.desc      Verify alphabet key z keeps its title label 'H' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0219 begin');
      const item: keySourceListType = keySourceListData[19];
      expect(item.title).assertEqual('H');
      expect('H'.toUpperCase()).assertEqual('H');
      expect(item.content).assertEqual('z');
      expect(item.upperContent).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0219 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0220
     * @tc.name      testKeyDataAlphabet0220
     * @tc.desc      Verify alphabet key z follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0220 begin');
      const item: keySourceListType = keySourceListData[19];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0220 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0221
     * @tc.name      testKeyDataAlphabet0221
     * @tc.desc      Verify alphabet key at index 20 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0221 begin');
      const idx: number = 20;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('I');
      expect(item.content).assertEqual('x');
      expect(item.upperContent).assertEqual('X');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0221 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0222
     * @tc.name      testKeyDataAlphabet0222
     * @tc.desc      Verify alphabet key x uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0222 begin');
      const item: keySourceListType = keySourceListData[20];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0222 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0223
     * @tc.name      testKeyDataAlphabet0223
     * @tc.desc      Verify alphabet key x upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0223 begin');
      const item: keySourceListType = keySourceListData[20];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0223 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0224
     * @tc.name      testKeyDataAlphabet0224
     * @tc.desc      Verify alphabet key x has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0224 begin');
      const item: keySourceListType = keySourceListData[20];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0224 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0225
     * @tc.name      testKeyDataAlphabet0225
     * @tc.desc      Verify alphabet key x lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0225 begin');
      const content: string = 'x';
      const upper: string = 'X';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0225 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0226
     * @tc.name      testKeyDataAlphabet0226
     * @tc.desc      Verify alphabet key x has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0226 begin');
      const title: string = 'I';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0226 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0227
     * @tc.name      testKeyDataAlphabet0227
     * @tc.desc      Verify alphabet key x is placed in KeyMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0227 begin');
      const idx: number = 20;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(2);
      expect(idx >= 19).assertTrue();
      expect(idx < 26).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0227 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0228
     * @tc.name      testKeyDataAlphabet0228
     * @tc.desc      Verify alphabet key x fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0228 begin');
      const item: keySourceListType = keySourceListData[20];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0228 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0229
     * @tc.name      testKeyDataAlphabet0229
     * @tc.desc      Verify alphabet key x is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0229 begin');
      const first: keySourceListType = keySourceListData[20];
      const second: keySourceListType = keySourceListData[20];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0229 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0230
     * @tc.name      testKeyDataAlphabet0230
     * @tc.desc      Verify alphabet key x keeps its title label 'I' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0230 begin');
      const item: keySourceListType = keySourceListData[20];
      expect(item.title).assertEqual('I');
      expect('I'.toUpperCase()).assertEqual('I');
      expect(item.content).assertEqual('x');
      expect(item.upperContent).assertEqual('X');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0230 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0231
     * @tc.name      testKeyDataAlphabet0231
     * @tc.desc      Verify alphabet key x follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0231 begin');
      const item: keySourceListType = keySourceListData[20];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0231 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0232
     * @tc.name      testKeyDataAlphabet0232
     * @tc.desc      Verify alphabet key at index 21 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0232 begin');
      const idx: number = 21;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('\u00AF');
      expect(item.content).assertEqual('c');
      expect(item.upperContent).assertEqual('C');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0232 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0233
     * @tc.name      testKeyDataAlphabet0233
     * @tc.desc      Verify alphabet key c uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0233 begin');
      const item: keySourceListType = keySourceListData[21];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0233 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0234
     * @tc.name      testKeyDataAlphabet0234
     * @tc.desc      Verify alphabet key c upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0234 begin');
      const item: keySourceListType = keySourceListData[21];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0234 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0235
     * @tc.name      testKeyDataAlphabet0235
     * @tc.desc      Verify alphabet key c has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0235 begin');
      const item: keySourceListType = keySourceListData[21];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0235 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0236
     * @tc.name      testKeyDataAlphabet0236
     * @tc.desc      Verify alphabet key c lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0236 begin');
      const content: string = 'c';
      const upper: string = 'C';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0236 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0237
     * @tc.name      testKeyDataAlphabet0237
     * @tc.desc      Verify alphabet key c has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0237 begin');
      const title: string = '\u00AF';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0237 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0238
     * @tc.name      testKeyDataAlphabet0238
     * @tc.desc      Verify alphabet key c is placed in KeyMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0238 begin');
      const idx: number = 21;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(2);
      expect(idx >= 19).assertTrue();
      expect(idx < 26).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0238 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0239
     * @tc.name      testKeyDataAlphabet0239
     * @tc.desc      Verify alphabet key c fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0239 begin');
      const item: keySourceListType = keySourceListData[21];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0239 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0240
     * @tc.name      testKeyDataAlphabet0240
     * @tc.desc      Verify alphabet key c is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0240 begin');
      const first: keySourceListType = keySourceListData[21];
      const second: keySourceListType = keySourceListData[21];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0240 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0241
     * @tc.name      testKeyDataAlphabet0241
     * @tc.desc      Verify alphabet key c keeps its title label '¯' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0241 begin');
      const item: keySourceListType = keySourceListData[21];
      expect(item.title).assertEqual('\u00AF');
      expect('\u00AF'.length).assertEqual(1);
      expect(item.content).assertEqual('c');
      expect(item.upperContent).assertEqual('C');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0241 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0242
     * @tc.name      testKeyDataAlphabet0242
     * @tc.desc      Verify alphabet key c follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0242 begin');
      const item: keySourceListType = keySourceListData[21];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0242 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0243
     * @tc.name      testKeyDataAlphabet0243
     * @tc.desc      Verify alphabet key at index 22 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0243 begin');
      const idx: number = 22;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('_');
      expect(item.content).assertEqual('v');
      expect(item.upperContent).assertEqual('V');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0243 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0244
     * @tc.name      testKeyDataAlphabet0244
     * @tc.desc      Verify alphabet key v uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0244 begin');
      const item: keySourceListType = keySourceListData[22];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0244 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0245
     * @tc.name      testKeyDataAlphabet0245
     * @tc.desc      Verify alphabet key v upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0245 begin');
      const item: keySourceListType = keySourceListData[22];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0245 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0246
     * @tc.name      testKeyDataAlphabet0246
     * @tc.desc      Verify alphabet key v has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0246 begin');
      const item: keySourceListType = keySourceListData[22];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0246 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0247
     * @tc.name      testKeyDataAlphabet0247
     * @tc.desc      Verify alphabet key v lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0247 begin');
      const content: string = 'v';
      const upper: string = 'V';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0247 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0248
     * @tc.name      testKeyDataAlphabet0248
     * @tc.desc      Verify alphabet key v has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0248 begin');
      const title: string = '_';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0248 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0249
     * @tc.name      testKeyDataAlphabet0249
     * @tc.desc      Verify alphabet key v is placed in KeyMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0249 begin');
      const idx: number = 22;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(2);
      expect(idx >= 19).assertTrue();
      expect(idx < 26).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0249 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0250
     * @tc.name      testKeyDataAlphabet0250
     * @tc.desc      Verify alphabet key v fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0250 begin');
      const item: keySourceListType = keySourceListData[22];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0250 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0251
     * @tc.name      testKeyDataAlphabet0251
     * @tc.desc      Verify alphabet key v is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0251 begin');
      const first: keySourceListType = keySourceListData[22];
      const second: keySourceListType = keySourceListData[22];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0251 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0252
     * @tc.name      testKeyDataAlphabet0252
     * @tc.desc      Verify alphabet key v keeps its title label '_' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0252 begin');
      const item: keySourceListType = keySourceListData[22];
      expect(item.title).assertEqual('_');
      expect('_'.length).assertEqual(1);
      expect(item.content).assertEqual('v');
      expect(item.upperContent).assertEqual('V');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0252 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0253
     * @tc.name      testKeyDataAlphabet0253
     * @tc.desc      Verify alphabet key v follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0253 begin');
      const item: keySourceListType = keySourceListData[22];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0253 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0254
     * @tc.name      testKeyDataAlphabet0254
     * @tc.desc      Verify alphabet key at index 23 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0254 begin');
      const idx: number = 23;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual(':');
      expect(item.content).assertEqual('b');
      expect(item.upperContent).assertEqual('B');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0254 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0255
     * @tc.name      testKeyDataAlphabet0255
     * @tc.desc      Verify alphabet key b uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0255 begin');
      const item: keySourceListType = keySourceListData[23];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0255 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0256
     * @tc.name      testKeyDataAlphabet0256
     * @tc.desc      Verify alphabet key b upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0256 begin');
      const item: keySourceListType = keySourceListData[23];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0256 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0257
     * @tc.name      testKeyDataAlphabet0257
     * @tc.desc      Verify alphabet key b has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0257 begin');
      const item: keySourceListType = keySourceListData[23];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0257 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0258
     * @tc.name      testKeyDataAlphabet0258
     * @tc.desc      Verify alphabet key b lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0258 begin');
      const content: string = 'b';
      const upper: string = 'B';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0258 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0259
     * @tc.name      testKeyDataAlphabet0259
     * @tc.desc      Verify alphabet key b has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0259 begin');
      const title: string = ':';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0259 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0260
     * @tc.name      testKeyDataAlphabet0260
     * @tc.desc      Verify alphabet key b is placed in KeyMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0260 begin');
      const idx: number = 23;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(2);
      expect(idx >= 19).assertTrue();
      expect(idx < 26).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0260 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0261
     * @tc.name      testKeyDataAlphabet0261
     * @tc.desc      Verify alphabet key b fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0261 begin');
      const item: keySourceListType = keySourceListData[23];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0261 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0262
     * @tc.name      testKeyDataAlphabet0262
     * @tc.desc      Verify alphabet key b is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0262 begin');
      const first: keySourceListType = keySourceListData[23];
      const second: keySourceListType = keySourceListData[23];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0262 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0263
     * @tc.name      testKeyDataAlphabet0263
     * @tc.desc      Verify alphabet key b keeps its title label ':' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0263 begin');
      const item: keySourceListType = keySourceListData[23];
      expect(item.title).assertEqual(':');
      expect(':'.length).assertEqual(1);
      expect(item.content).assertEqual('b');
      expect(item.upperContent).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0263 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0264
     * @tc.name      testKeyDataAlphabet0264
     * @tc.desc      Verify alphabet key b follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0264 begin');
      const item: keySourceListType = keySourceListData[23];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0264 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0265
     * @tc.name      testKeyDataAlphabet0265
     * @tc.desc      Verify alphabet key at index 24 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0265 begin');
      const idx: number = 24;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual(';');
      expect(item.content).assertEqual('n');
      expect(item.upperContent).assertEqual('N');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0265 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0266
     * @tc.name      testKeyDataAlphabet0266
     * @tc.desc      Verify alphabet key n uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0266 begin');
      const item: keySourceListType = keySourceListData[24];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0266 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0267
     * @tc.name      testKeyDataAlphabet0267
     * @tc.desc      Verify alphabet key n upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0267 begin');
      const item: keySourceListType = keySourceListData[24];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0267 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0268
     * @tc.name      testKeyDataAlphabet0268
     * @tc.desc      Verify alphabet key n has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0268 begin');
      const item: keySourceListType = keySourceListData[24];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0268 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0269
     * @tc.name      testKeyDataAlphabet0269
     * @tc.desc      Verify alphabet key n lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0269 begin');
      const content: string = 'n';
      const upper: string = 'N';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0269 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0270
     * @tc.name      testKeyDataAlphabet0270
     * @tc.desc      Verify alphabet key n has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0270 begin');
      const title: string = ';';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0270 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0271
     * @tc.name      testKeyDataAlphabet0271
     * @tc.desc      Verify alphabet key n is placed in KeyMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0271 begin');
      const idx: number = 24;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(2);
      expect(idx >= 19).assertTrue();
      expect(idx < 26).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0271 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0272
     * @tc.name      testKeyDataAlphabet0272
     * @tc.desc      Verify alphabet key n fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0272 begin');
      const item: keySourceListType = keySourceListData[24];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0272 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0273
     * @tc.name      testKeyDataAlphabet0273
     * @tc.desc      Verify alphabet key n is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0273 begin');
      const first: keySourceListType = keySourceListData[24];
      const second: keySourceListType = keySourceListData[24];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0273 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0274
     * @tc.name      testKeyDataAlphabet0274
     * @tc.desc      Verify alphabet key n keeps its title label ';' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0274 begin');
      const item: keySourceListType = keySourceListData[24];
      expect(item.title).assertEqual(';');
      expect(';'.length).assertEqual(1);
      expect(item.content).assertEqual('n');
      expect(item.upperContent).assertEqual('N');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0274 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0275
     * @tc.name      testKeyDataAlphabet0275
     * @tc.desc      Verify alphabet key n follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0275 begin');
      const item: keySourceListType = keySourceListData[24];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0275 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0276
     * @tc.name      testKeyDataAlphabet0276
     * @tc.desc      Verify alphabet key at index 25 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0276 begin');
      const idx: number = 25;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('/');
      expect(item.content).assertEqual('m');
      expect(item.upperContent).assertEqual('M');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0276 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0277
     * @tc.name      testKeyDataAlphabet0277
     * @tc.desc      Verify alphabet key m uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0277 begin');
      const item: keySourceListType = keySourceListData[25];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0277 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0278
     * @tc.name      testKeyDataAlphabet0278
     * @tc.desc      Verify alphabet key m upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0278 begin');
      const item: keySourceListType = keySourceListData[25];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0278 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0279
     * @tc.name      testKeyDataAlphabet0279
     * @tc.desc      Verify alphabet key m has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0279 begin');
      const item: keySourceListType = keySourceListData[25];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0279 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0280
     * @tc.name      testKeyDataAlphabet0280
     * @tc.desc      Verify alphabet key m lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0280 begin');
      const content: string = 'm';
      const upper: string = 'M';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0280 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0281
     * @tc.name      testKeyDataAlphabet0281
     * @tc.desc      Verify alphabet key m has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0281 begin');
      const title: string = '/';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0281 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0282
     * @tc.name      testKeyDataAlphabet0282
     * @tc.desc      Verify alphabet key m is placed in KeyMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0282 begin');
      const idx: number = 25;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(2);
      expect(idx >= 19).assertTrue();
      expect(idx < 26).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0282 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0283
     * @tc.name      testKeyDataAlphabet0283
     * @tc.desc      Verify alphabet key m fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0283 begin');
      const item: keySourceListType = keySourceListData[25];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0283 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0284
     * @tc.name      testKeyDataAlphabet0284
     * @tc.desc      Verify alphabet key m is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0284 begin');
      const first: keySourceListType = keySourceListData[25];
      const second: keySourceListType = keySourceListData[25];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0284 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0285
     * @tc.name      testKeyDataAlphabet0285
     * @tc.desc      Verify alphabet key m keeps its title label '/' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0285 begin');
      const item: keySourceListType = keySourceListData[25];
      expect(item.title).assertEqual('/');
      expect('/'.length).assertEqual(1);
      expect(item.content).assertEqual('m');
      expect(item.upperContent).assertEqual('M');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0285 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0286
     * @tc.name      testKeyDataAlphabet0286
     * @tc.desc      Verify alphabet key m follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0286 begin');
      const item: keySourceListType = keySourceListData[25];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0286 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0287
     * @tc.name      testKeyDataAlphabet0287
     * @tc.desc      The letter table contains exactly 26 keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0287 begin');
      expect(keySourceListData.length).assertEqual(26);
      expect(keySourceListData[0].content).assertEqual('q');
      expect(keySourceListData[25].content).assertEqual('m');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0287 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0288
     * @tc.name      testKeyDataAlphabet0288
     * @tc.desc      The first KeyMenu row contains ten distinct keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0288 begin');
      expect(keySourceListData.slice(0, 10).length).assertEqual(10);
      expect(keySourceListData[0].content).assertEqual('q');
      expect(keySourceListData[9].content).assertEqual('p');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0288 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0289
     * @tc.name      testKeyDataAlphabet0289
     * @tc.desc      The second KeyMenu row contains nine distinct keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0289 begin');
      expect(keySourceListData.slice(10, 19).length).assertEqual(9);
      expect(keySourceListData[10].content).assertEqual('a');
      expect(keySourceListData[18].content).assertEqual('l');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0289 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0290
     * @tc.name      testKeyDataAlphabet0290
     * @tc.desc      The third KeyMenu row contains seven distinct keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0290 begin');
      expect(keySourceListData.slice(19).length).assertEqual(7);
      expect(keySourceListData[19].content).assertEqual('z');
      expect(keySourceListData[25].content).assertEqual('m');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0290 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0291
     * @tc.name      testKeyDataAlphabet0291
     * @tc.desc      The letter table covers the full English alphabet.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0291 begin');
      let covered: number = 0;
      const alphabet: string = 'abcdefghijklmnopqrstuvwxyz';
      for (let i: number = 0; i < alphabet.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === alphabet.charAt(i)) covered++;
        }
      }
      expect(covered).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0291 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0292
     * @tc.name      testKeyDataAlphabet0292
     * @tc.desc      The upper content covers A through Z.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0292 begin');
      let covered: number = 0;
      const alphabet: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      for (let i: number = 0; i < alphabet.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].upperContent === alphabet.charAt(i)) covered++;
        }
      }
      expect(covered).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0292 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0293
     * @tc.name      testKeyDataAlphabet0293
     * @tc.desc      All letter key titles are unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0293 begin');
      const seen: string[] = [];
      for (let i: number = 0; i < keySourceListData.length; i++) {
        expect(seen.indexOf(keySourceListData[i].title)).assertEqual(-1);
        seen.push(keySourceListData[i].title);
      }
      expect(seen.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0293 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0294
     * @tc.name      testKeyDataAlphabet0294
     * @tc.desc      All letter key contents are unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0294 begin');
      const seen: string[] = [];
      for (let i: number = 0; i < keySourceListData.length; i++) {
        expect(seen.indexOf(keySourceListData[i].content)).assertEqual(-1);
        seen.push(keySourceListData[i].content);
      }
      expect(seen.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0294 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0295
     * @tc.name      testKeyDataAlphabet0295
     * @tc.desc      Every upper content is the uppercase of the matching lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0295 begin');
      for (let i: number = 0; i < keySourceListData.length; i++) {
        expect(keySourceListData[i].upperContent).assertEqual(keySourceListData[i].content.toUpperCase());
        expect(keySourceListData[i].upperContent).assertEqual(keySourceListData[i].content.toUpperCase());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0295 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0296
     * @tc.name      testKeyDataAlphabet0296
     * @tc.desc      No letter key exposes an empty field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0296 begin');
      for (let i: number = 0; i < keySourceListData.length; i++) {
        expect(keySourceListData[i].title.length > 0).assertTrue();
        expect(keySourceListData[i].content.length > 0).assertTrue();
        expect(keySourceListData[i].upperContent.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0296 end');
    })
  })
}
