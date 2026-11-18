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

export default function KeyDataAlphabetCoreTest(): void {
  describe('KeyDataAlphabetCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0001
     * @tc.name      testKeyDataAlphabet0001
     * @tc.desc      Verify alphabet key at index 0 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0001 begin');
      const idx: number = 0;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('1');
      expect(item.content).assertEqual('q');
      expect(item.upperContent).assertEqual('Q');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0002
     * @tc.name      testKeyDataAlphabet0002
     * @tc.desc      Verify alphabet key q uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0002 begin');
      const item: keySourceListType = keySourceListData[0];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0003
     * @tc.name      testKeyDataAlphabet0003
     * @tc.desc      Verify alphabet key q upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0003 begin');
      const item: keySourceListType = keySourceListData[0];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0004
     * @tc.name      testKeyDataAlphabet0004
     * @tc.desc      Verify alphabet key q has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0004 begin');
      const item: keySourceListType = keySourceListData[0];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0005
     * @tc.name      testKeyDataAlphabet0005
     * @tc.desc      Verify alphabet key q lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0005 begin');
      const content: string = 'q';
      const upper: string = 'Q';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0006
     * @tc.name      testKeyDataAlphabet0006
     * @tc.desc      Verify alphabet key q has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0006 begin');
      const title: string = '1';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0007
     * @tc.name      testKeyDataAlphabet0007
     * @tc.desc      Verify alphabet key q is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0007 begin');
      const idx: number = 0;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0008
     * @tc.name      testKeyDataAlphabet0008
     * @tc.desc      Verify alphabet key q fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0008 begin');
      const item: keySourceListType = keySourceListData[0];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0009
     * @tc.name      testKeyDataAlphabet0009
     * @tc.desc      Verify alphabet key q is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0009 begin');
      const first: keySourceListType = keySourceListData[0];
      const second: keySourceListType = keySourceListData[0];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0010
     * @tc.name      testKeyDataAlphabet0010
     * @tc.desc      Verify alphabet key q keeps its title label '1' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0010 begin');
      const item: keySourceListType = keySourceListData[0];
      expect(item.title).assertEqual('1');
      expect('1'.length).assertEqual(1);
      expect(item.content).assertEqual('q');
      expect(item.upperContent).assertEqual('Q');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0011
     * @tc.name      testKeyDataAlphabet0011
     * @tc.desc      Verify alphabet key q follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0011 begin');
      const item: keySourceListType = keySourceListData[0];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0012
     * @tc.name      testKeyDataAlphabet0012
     * @tc.desc      Verify alphabet key at index 1 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0012 begin');
      const idx: number = 1;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('2');
      expect(item.content).assertEqual('w');
      expect(item.upperContent).assertEqual('W');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0013
     * @tc.name      testKeyDataAlphabet0013
     * @tc.desc      Verify alphabet key w uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0013 begin');
      const item: keySourceListType = keySourceListData[1];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0014
     * @tc.name      testKeyDataAlphabet0014
     * @tc.desc      Verify alphabet key w upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0014 begin');
      const item: keySourceListType = keySourceListData[1];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0015
     * @tc.name      testKeyDataAlphabet0015
     * @tc.desc      Verify alphabet key w has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0015 begin');
      const item: keySourceListType = keySourceListData[1];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0016
     * @tc.name      testKeyDataAlphabet0016
     * @tc.desc      Verify alphabet key w lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0016 begin');
      const content: string = 'w';
      const upper: string = 'W';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0017
     * @tc.name      testKeyDataAlphabet0017
     * @tc.desc      Verify alphabet key w has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0017 begin');
      const title: string = '2';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0018
     * @tc.name      testKeyDataAlphabet0018
     * @tc.desc      Verify alphabet key w is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0018 begin');
      const idx: number = 1;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0019
     * @tc.name      testKeyDataAlphabet0019
     * @tc.desc      Verify alphabet key w fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0019 begin');
      const item: keySourceListType = keySourceListData[1];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0020
     * @tc.name      testKeyDataAlphabet0020
     * @tc.desc      Verify alphabet key w is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0020 begin');
      const first: keySourceListType = keySourceListData[1];
      const second: keySourceListType = keySourceListData[1];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0021
     * @tc.name      testKeyDataAlphabet0021
     * @tc.desc      Verify alphabet key w keeps its title label '2' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0021 begin');
      const item: keySourceListType = keySourceListData[1];
      expect(item.title).assertEqual('2');
      expect('2'.length).assertEqual(1);
      expect(item.content).assertEqual('w');
      expect(item.upperContent).assertEqual('W');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0022
     * @tc.name      testKeyDataAlphabet0022
     * @tc.desc      Verify alphabet key w follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0022 begin');
      const item: keySourceListType = keySourceListData[1];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0023
     * @tc.name      testKeyDataAlphabet0023
     * @tc.desc      Verify alphabet key at index 2 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0023 begin');
      const idx: number = 2;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('3');
      expect(item.content).assertEqual('e');
      expect(item.upperContent).assertEqual('E');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0024
     * @tc.name      testKeyDataAlphabet0024
     * @tc.desc      Verify alphabet key e uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0024 begin');
      const item: keySourceListType = keySourceListData[2];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0025
     * @tc.name      testKeyDataAlphabet0025
     * @tc.desc      Verify alphabet key e upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0025 begin');
      const item: keySourceListType = keySourceListData[2];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0026
     * @tc.name      testKeyDataAlphabet0026
     * @tc.desc      Verify alphabet key e has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0026 begin');
      const item: keySourceListType = keySourceListData[2];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0027
     * @tc.name      testKeyDataAlphabet0027
     * @tc.desc      Verify alphabet key e lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0027 begin');
      const content: string = 'e';
      const upper: string = 'E';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0028
     * @tc.name      testKeyDataAlphabet0028
     * @tc.desc      Verify alphabet key e has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0028 begin');
      const title: string = '3';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0029
     * @tc.name      testKeyDataAlphabet0029
     * @tc.desc      Verify alphabet key e is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0029 begin');
      const idx: number = 2;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0030
     * @tc.name      testKeyDataAlphabet0030
     * @tc.desc      Verify alphabet key e fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0030 begin');
      const item: keySourceListType = keySourceListData[2];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0031
     * @tc.name      testKeyDataAlphabet0031
     * @tc.desc      Verify alphabet key e is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0031 begin');
      const first: keySourceListType = keySourceListData[2];
      const second: keySourceListType = keySourceListData[2];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0032
     * @tc.name      testKeyDataAlphabet0032
     * @tc.desc      Verify alphabet key e keeps its title label '3' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0032 begin');
      const item: keySourceListType = keySourceListData[2];
      expect(item.title).assertEqual('3');
      expect('3'.length).assertEqual(1);
      expect(item.content).assertEqual('e');
      expect(item.upperContent).assertEqual('E');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0033
     * @tc.name      testKeyDataAlphabet0033
     * @tc.desc      Verify alphabet key e follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0033 begin');
      const item: keySourceListType = keySourceListData[2];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0034
     * @tc.name      testKeyDataAlphabet0034
     * @tc.desc      Verify alphabet key at index 3 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0034 begin');
      const idx: number = 3;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('4');
      expect(item.content).assertEqual('r');
      expect(item.upperContent).assertEqual('R');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0035
     * @tc.name      testKeyDataAlphabet0035
     * @tc.desc      Verify alphabet key r uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0035 begin');
      const item: keySourceListType = keySourceListData[3];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0036
     * @tc.name      testKeyDataAlphabet0036
     * @tc.desc      Verify alphabet key r upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0036 begin');
      const item: keySourceListType = keySourceListData[3];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0037
     * @tc.name      testKeyDataAlphabet0037
     * @tc.desc      Verify alphabet key r has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0037 begin');
      const item: keySourceListType = keySourceListData[3];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0038
     * @tc.name      testKeyDataAlphabet0038
     * @tc.desc      Verify alphabet key r lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0038 begin');
      const content: string = 'r';
      const upper: string = 'R';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0039
     * @tc.name      testKeyDataAlphabet0039
     * @tc.desc      Verify alphabet key r has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0039 begin');
      const title: string = '4';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0040
     * @tc.name      testKeyDataAlphabet0040
     * @tc.desc      Verify alphabet key r is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0040 begin');
      const idx: number = 3;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0041
     * @tc.name      testKeyDataAlphabet0041
     * @tc.desc      Verify alphabet key r fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0041 begin');
      const item: keySourceListType = keySourceListData[3];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0042
     * @tc.name      testKeyDataAlphabet0042
     * @tc.desc      Verify alphabet key r is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0042 begin');
      const first: keySourceListType = keySourceListData[3];
      const second: keySourceListType = keySourceListData[3];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0043
     * @tc.name      testKeyDataAlphabet0043
     * @tc.desc      Verify alphabet key r keeps its title label '4' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0043 begin');
      const item: keySourceListType = keySourceListData[3];
      expect(item.title).assertEqual('4');
      expect('4'.length).assertEqual(1);
      expect(item.content).assertEqual('r');
      expect(item.upperContent).assertEqual('R');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0044
     * @tc.name      testKeyDataAlphabet0044
     * @tc.desc      Verify alphabet key r follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0044 begin');
      const item: keySourceListType = keySourceListData[3];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0045
     * @tc.name      testKeyDataAlphabet0045
     * @tc.desc      Verify alphabet key at index 4 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0045 begin');
      const idx: number = 4;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('5');
      expect(item.content).assertEqual('t');
      expect(item.upperContent).assertEqual('T');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0046
     * @tc.name      testKeyDataAlphabet0046
     * @tc.desc      Verify alphabet key t uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0046 begin');
      const item: keySourceListType = keySourceListData[4];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0047
     * @tc.name      testKeyDataAlphabet0047
     * @tc.desc      Verify alphabet key t upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0047 begin');
      const item: keySourceListType = keySourceListData[4];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0048
     * @tc.name      testKeyDataAlphabet0048
     * @tc.desc      Verify alphabet key t has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0048 begin');
      const item: keySourceListType = keySourceListData[4];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0049
     * @tc.name      testKeyDataAlphabet0049
     * @tc.desc      Verify alphabet key t lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0049 begin');
      const content: string = 't';
      const upper: string = 'T';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0050
     * @tc.name      testKeyDataAlphabet0050
     * @tc.desc      Verify alphabet key t has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0050 begin');
      const title: string = '5';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0051
     * @tc.name      testKeyDataAlphabet0051
     * @tc.desc      Verify alphabet key t is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0051 begin');
      const idx: number = 4;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0052
     * @tc.name      testKeyDataAlphabet0052
     * @tc.desc      Verify alphabet key t fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0052 begin');
      const item: keySourceListType = keySourceListData[4];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0053
     * @tc.name      testKeyDataAlphabet0053
     * @tc.desc      Verify alphabet key t is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0053 begin');
      const first: keySourceListType = keySourceListData[4];
      const second: keySourceListType = keySourceListData[4];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0054
     * @tc.name      testKeyDataAlphabet0054
     * @tc.desc      Verify alphabet key t keeps its title label '5' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0054 begin');
      const item: keySourceListType = keySourceListData[4];
      expect(item.title).assertEqual('5');
      expect('5'.length).assertEqual(1);
      expect(item.content).assertEqual('t');
      expect(item.upperContent).assertEqual('T');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0055
     * @tc.name      testKeyDataAlphabet0055
     * @tc.desc      Verify alphabet key t follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0055 begin');
      const item: keySourceListType = keySourceListData[4];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0056
     * @tc.name      testKeyDataAlphabet0056
     * @tc.desc      Verify alphabet key at index 5 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0056 begin');
      const idx: number = 5;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('6');
      expect(item.content).assertEqual('y');
      expect(item.upperContent).assertEqual('Y');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0057
     * @tc.name      testKeyDataAlphabet0057
     * @tc.desc      Verify alphabet key y uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0057 begin');
      const item: keySourceListType = keySourceListData[5];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0058
     * @tc.name      testKeyDataAlphabet0058
     * @tc.desc      Verify alphabet key y upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0058 begin');
      const item: keySourceListType = keySourceListData[5];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0059
     * @tc.name      testKeyDataAlphabet0059
     * @tc.desc      Verify alphabet key y has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0059 begin');
      const item: keySourceListType = keySourceListData[5];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0060
     * @tc.name      testKeyDataAlphabet0060
     * @tc.desc      Verify alphabet key y lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0060 begin');
      const content: string = 'y';
      const upper: string = 'Y';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0061
     * @tc.name      testKeyDataAlphabet0061
     * @tc.desc      Verify alphabet key y has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0061 begin');
      const title: string = '6';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0062
     * @tc.name      testKeyDataAlphabet0062
     * @tc.desc      Verify alphabet key y is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0062 begin');
      const idx: number = 5;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0063
     * @tc.name      testKeyDataAlphabet0063
     * @tc.desc      Verify alphabet key y fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0063 begin');
      const item: keySourceListType = keySourceListData[5];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0064
     * @tc.name      testKeyDataAlphabet0064
     * @tc.desc      Verify alphabet key y is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0064 begin');
      const first: keySourceListType = keySourceListData[5];
      const second: keySourceListType = keySourceListData[5];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0065
     * @tc.name      testKeyDataAlphabet0065
     * @tc.desc      Verify alphabet key y keeps its title label '6' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0065 begin');
      const item: keySourceListType = keySourceListData[5];
      expect(item.title).assertEqual('6');
      expect('6'.length).assertEqual(1);
      expect(item.content).assertEqual('y');
      expect(item.upperContent).assertEqual('Y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0066
     * @tc.name      testKeyDataAlphabet0066
     * @tc.desc      Verify alphabet key y follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0066 begin');
      const item: keySourceListType = keySourceListData[5];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0067
     * @tc.name      testKeyDataAlphabet0067
     * @tc.desc      Verify alphabet key at index 6 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0067 begin');
      const idx: number = 6;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('7');
      expect(item.content).assertEqual('u');
      expect(item.upperContent).assertEqual('U');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0068
     * @tc.name      testKeyDataAlphabet0068
     * @tc.desc      Verify alphabet key u uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0068 begin');
      const item: keySourceListType = keySourceListData[6];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0069
     * @tc.name      testKeyDataAlphabet0069
     * @tc.desc      Verify alphabet key u upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0069 begin');
      const item: keySourceListType = keySourceListData[6];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0070
     * @tc.name      testKeyDataAlphabet0070
     * @tc.desc      Verify alphabet key u has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0070 begin');
      const item: keySourceListType = keySourceListData[6];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0071
     * @tc.name      testKeyDataAlphabet0071
     * @tc.desc      Verify alphabet key u lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0071 begin');
      const content: string = 'u';
      const upper: string = 'U';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0072
     * @tc.name      testKeyDataAlphabet0072
     * @tc.desc      Verify alphabet key u has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0072 begin');
      const title: string = '7';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0073
     * @tc.name      testKeyDataAlphabet0073
     * @tc.desc      Verify alphabet key u is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0073 begin');
      const idx: number = 6;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0074
     * @tc.name      testKeyDataAlphabet0074
     * @tc.desc      Verify alphabet key u fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0074 begin');
      const item: keySourceListType = keySourceListData[6];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0075
     * @tc.name      testKeyDataAlphabet0075
     * @tc.desc      Verify alphabet key u is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0075 begin');
      const first: keySourceListType = keySourceListData[6];
      const second: keySourceListType = keySourceListData[6];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0076
     * @tc.name      testKeyDataAlphabet0076
     * @tc.desc      Verify alphabet key u keeps its title label '7' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0076 begin');
      const item: keySourceListType = keySourceListData[6];
      expect(item.title).assertEqual('7');
      expect('7'.length).assertEqual(1);
      expect(item.content).assertEqual('u');
      expect(item.upperContent).assertEqual('U');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0077
     * @tc.name      testKeyDataAlphabet0077
     * @tc.desc      Verify alphabet key u follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0077 begin');
      const item: keySourceListType = keySourceListData[6];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0078
     * @tc.name      testKeyDataAlphabet0078
     * @tc.desc      Verify alphabet key at index 7 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0078 begin');
      const idx: number = 7;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('8');
      expect(item.content).assertEqual('i');
      expect(item.upperContent).assertEqual('I');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0079
     * @tc.name      testKeyDataAlphabet0079
     * @tc.desc      Verify alphabet key i uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0079 begin');
      const item: keySourceListType = keySourceListData[7];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0080
     * @tc.name      testKeyDataAlphabet0080
     * @tc.desc      Verify alphabet key i upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0080 begin');
      const item: keySourceListType = keySourceListData[7];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0081
     * @tc.name      testKeyDataAlphabet0081
     * @tc.desc      Verify alphabet key i has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0081 begin');
      const item: keySourceListType = keySourceListData[7];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0082
     * @tc.name      testKeyDataAlphabet0082
     * @tc.desc      Verify alphabet key i lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0082 begin');
      const content: string = 'i';
      const upper: string = 'I';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0083
     * @tc.name      testKeyDataAlphabet0083
     * @tc.desc      Verify alphabet key i has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0083 begin');
      const title: string = '8';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0084
     * @tc.name      testKeyDataAlphabet0084
     * @tc.desc      Verify alphabet key i is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0084 begin');
      const idx: number = 7;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0085
     * @tc.name      testKeyDataAlphabet0085
     * @tc.desc      Verify alphabet key i fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0085 begin');
      const item: keySourceListType = keySourceListData[7];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0086
     * @tc.name      testKeyDataAlphabet0086
     * @tc.desc      Verify alphabet key i is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0086 begin');
      const first: keySourceListType = keySourceListData[7];
      const second: keySourceListType = keySourceListData[7];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0087
     * @tc.name      testKeyDataAlphabet0087
     * @tc.desc      Verify alphabet key i keeps its title label '8' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0087 begin');
      const item: keySourceListType = keySourceListData[7];
      expect(item.title).assertEqual('8');
      expect('8'.length).assertEqual(1);
      expect(item.content).assertEqual('i');
      expect(item.upperContent).assertEqual('I');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0088
     * @tc.name      testKeyDataAlphabet0088
     * @tc.desc      Verify alphabet key i follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0088 begin');
      const item: keySourceListType = keySourceListData[7];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0089
     * @tc.name      testKeyDataAlphabet0089
     * @tc.desc      Verify alphabet key at index 8 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0089 begin');
      const idx: number = 8;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('9');
      expect(item.content).assertEqual('o');
      expect(item.upperContent).assertEqual('O');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0090
     * @tc.name      testKeyDataAlphabet0090
     * @tc.desc      Verify alphabet key o uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0090 begin');
      const item: keySourceListType = keySourceListData[8];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0091
     * @tc.name      testKeyDataAlphabet0091
     * @tc.desc      Verify alphabet key o upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0091 begin');
      const item: keySourceListType = keySourceListData[8];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0092
     * @tc.name      testKeyDataAlphabet0092
     * @tc.desc      Verify alphabet key o has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0092 begin');
      const item: keySourceListType = keySourceListData[8];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0093
     * @tc.name      testKeyDataAlphabet0093
     * @tc.desc      Verify alphabet key o lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0093 begin');
      const content: string = 'o';
      const upper: string = 'O';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0094
     * @tc.name      testKeyDataAlphabet0094
     * @tc.desc      Verify alphabet key o has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0094 begin');
      const title: string = '9';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0095
     * @tc.name      testKeyDataAlphabet0095
     * @tc.desc      Verify alphabet key o is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0095 begin');
      const idx: number = 8;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0096
     * @tc.name      testKeyDataAlphabet0096
     * @tc.desc      Verify alphabet key o fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0096 begin');
      const item: keySourceListType = keySourceListData[8];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0097
     * @tc.name      testKeyDataAlphabet0097
     * @tc.desc      Verify alphabet key o is read consistently from the exported table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0097 begin');
      const first: keySourceListType = keySourceListData[8];
      const second: keySourceListType = keySourceListData[8];
      expect(first).assertEqual(second);
      expect(first.content).assertEqual(second.content);
      expect(first.upperContent).assertEqual(second.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0098
     * @tc.name      testKeyDataAlphabet0098
     * @tc.desc      Verify alphabet key o keeps its title label '9' stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0098 begin');
      const item: keySourceListType = keySourceListData[8];
      expect(item.title).assertEqual('9');
      expect('9'.length).assertEqual(1);
      expect(item.content).assertEqual('o');
      expect(item.upperContent).assertEqual('O');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0099
     * @tc.name      testKeyDataAlphabet0099
     * @tc.desc      Verify alphabet key o follows the ASCII case offset rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0099 begin');
      const item: keySourceListType = keySourceListData[8];
      expect(item.content.charCodeAt(0) >= 97).assertTrue();
      expect(item.content.charCodeAt(0) <= 122).assertTrue();
      expect(item.upperContent.charCodeAt(0)).assertEqual(item.content.charCodeAt(0) - 32);
      expect(item.title.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0100
     * @tc.name      testKeyDataAlphabet0100
     * @tc.desc      Verify alphabet key at index 9 exposes the expected title, lower and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0100 begin');
      const idx: number = 9;
      const item: keySourceListType = keySourceListData[idx];
      expect(item.title).assertEqual('0');
      expect(item.content).assertEqual('p');
      expect(item.upperContent).assertEqual('P');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0101
     * @tc.name      testKeyDataAlphabet0101
     * @tc.desc      Verify alphabet key p uses a single lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0101 begin');
      const item: keySourceListType = keySourceListData[9];
      expect(item.content.length).assertEqual(1);
      expect(item.content >= 'a').assertTrue();
      expect(item.content <= 'z').assertTrue();
      expect(item.content).assertEqual(item.content.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0102
     * @tc.name      testKeyDataAlphabet0102
     * @tc.desc      Verify alphabet key p upper content is the uppercase form of the lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0102 begin');
      const item: keySourceListType = keySourceListData[9];
      expect(item.upperContent.length).assertEqual(1);
      expect(item.upperContent >= 'A').assertTrue();
      expect(item.upperContent <= 'Z').assertTrue();
      expect(item.upperContent).assertEqual(item.content.toUpperCase());
      expect(item.upperContent === item.content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0103
     * @tc.name      testKeyDataAlphabet0103
     * @tc.desc      Verify alphabet key p has non-empty title without surrounding whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0103 begin');
      const item: keySourceListType = keySourceListData[9];
      expect(item.title.length > 0).assertTrue();
      expect(item.title.trim()).assertEqual(item.title);
      expect(item.content.trim()).assertEqual(item.content);
      expect(item.upperContent.trim()).assertEqual(item.upperContent);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0104
     * @tc.name      testKeyDataAlphabet0104
     * @tc.desc      Verify alphabet key p lower and upper content are unique in the letter table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0104 begin');
      const content: string = 'p';
      const upper: string = 'P';
      let lowerCount: number = 0;
      let upperCount: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === content) lowerCount++;
        if (keySourceListData[i].upperContent === upper) upperCount++;
      }
      expect(lowerCount).assertEqual(1);
      expect(upperCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0104 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0105
     * @tc.name      testKeyDataAlphabet0105
     * @tc.desc      Verify alphabet key p has a unique single-character title label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0105 begin');
      const title: string = '0';
      let count: number = 0;
      for (let i: number = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title === title) count++;
      }
      expect(count).assertEqual(1);
      expect(title.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0106
     * @tc.name      testKeyDataAlphabet0106
     * @tc.desc      Verify alphabet key p is placed in KeyMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0106 begin');
      const idx: number = 9;
      const row: number = idx < 10 ? 0 : (idx < 19 ? 1 : 2);
      expect(row).assertEqual(0);
      expect(idx >= 0).assertTrue();
      expect(idx < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0106 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYDATA_0107
     * @tc.name      testKeyDataAlphabet0107
     * @tc.desc      Verify alphabet key p fields are compact single-character strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataAlphabet0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0107 begin');
      const item: keySourceListType = keySourceListData[9];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.upperContent).assertEqual(item.upperContent.trim());
      expect(item.title).assertEqual(item.title.trim());
      expect(item.content.length + item.upperContent.length + item.title.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAlphabet0107 end');
    })
  })
}
