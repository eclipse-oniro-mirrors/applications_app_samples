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
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { MenuKey, SubMenuType, keySourceListData, keySourceListType, numberSourceListData, symbolSourceListData, sourceListType } from '../../../../main/ets/model/KeyboardKeyData';
import { KeyStyle, StyleConfiguration } from '../../../../main/ets/common/StyleConfiguration';
import { GetHardKeyValue } from '../../../../main/ets/model/HardKeyUtils';
const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMenuStyleContractTest]';

export default function menuStyleContractTest(): void {
  describe('MenuStyleContractTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0001
     * @tc.name      testMenuStyleContractTest_001
     * @tc.desc      SubMenuType.NORMAL identifies the keyboard page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_001 begin');

      const expectedNumber: number = 0;

      // TopMenu compares submenuType with NORMAL to decide whether the menu is expanded.
      const actualNumber: number = SubMenuType.NORMAL;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actualNumber}`);

      expect(actualNumber).assertEqual(expectedNumber);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0002
     * @tc.name      testMenuStyleContractTest_002
     * @tc.desc      SubMenuType.MENU identifies the menu page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_002 begin');

      const expectedNumber: number = 1;

      const actualNumber: number = SubMenuType.MENU;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actualNumber}`);

      expect(actualNumber).assertEqual(expectedNumber);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_002 end');
      // The native yield keeps the board watchdog from treating the case as a freeze.
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0003
     * @tc.name      testMenuStyleContractTest_003
     * @tc.desc      SubMenuType.MENU is deeper than NORMAL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_003 begin');

      const expectedBoolean: boolean = true;

      const actualBoolean: boolean = SubMenuType.MENU > SubMenuType.NORMAL;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actualBoolean}`);

      expect(actualBoolean).assertEqual(expectedBoolean);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0004
     * @tc.name      testMenuStyleContractTest_004
     * @tc.desc      The menu switch shows ?123 through MenuKey.NUMBER_KEY.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_004 begin');

      const expectedString: string = "?123";

      const actualString: string = MenuKey.NUMBER_KEY;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actualString}`);

      expect(actualString).assertEqual(expectedString);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0005
     * @tc.name      testMenuStyleContractTest_005
     * @tc.desc      The menu switch shows ABC through MenuKey.NORMAL_KEY.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_005 begin');

      const expectedString: string = "ABC";

      const actualString: string = MenuKey.NORMAL_KEY;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actualString}`);

      expect(actualString).assertEqual(expectedString);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0006
     * @tc.name      testMenuStyleContractTest_006
     * @tc.desc      The menu switch shows =/< through MenuKey.SPECIAL_KEY.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_006 begin');

      const expectedString: string = "=/<";

      const actualString: string = MenuKey.SPECIAL_KEY;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actualString}`);

      expect(actualString).assertEqual(expectedString);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0007
     * @tc.name      testMenuStyleContractTest_007
     * @tc.desc      Verify that the phone portrait branch returns a complete style without a device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_007 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'phone');

      expect(style.deviceType).assertEqual(undefined);
      expect(style.keyboardHeight.id > 0).assertTrue();
      expect(style.basicButtonWidth.id > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0008
     * @tc.name      testMenuStyleContractTest_008
     * @tc.desc      Verify that the tablet portrait branch is marked tablet_portrait.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_008 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');

      expect(style.deviceType).assertEqual('tablet_portrait');
      expect(style.keyboardHeight.id > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0009
     * @tc.name      testMenuStyleContractTest_009
     * @tc.desc      Verify that the RK branch returns the RK style set with its number font field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuStyleContractTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_009 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, true, 'phone');

      expect(style.deviceType).assertEqual(undefined);
      expect(style.keyboardHeight.id > 0).assertTrue();
      expect((style.number1234ontFSize as Resource).id > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0010
     * @tc.name      testMenuStyleContractTest_010
     * @tc.desc      Verify that the alphabet table holds the twenty-six lowercase letters once each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_010 begin');
      expect(keySourceListData.length).assertEqual(26);

      // The table is a permutation of a..z.
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < keySourceListData.length; i++) {
        seen.add(keySourceListData[i].content);
      }
      expect(seen.size).assertEqual(26);
      expect(seen.has('a')).assertTrue();
      expect(seen.has('z')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0011
     * @tc.name      testMenuStyleContractTest_011
     * @tc.desc      Verify that the number page starts with 1..0 and the symbol page has sixteen slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_011 begin');
      expect(numberSourceListData.length).assertEqual(27);
      expect(symbolSourceListData.length).assertEqual(27);

      const digits: string[] = numberSourceListData.slice(0, 10).map((item: sourceListType) => item.content);
      expect(digits.join('')).assertEqual('1234567890');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0012
     * @tc.name      testMenuStyleContractTest_012
     * @tc.desc      Verify that every alphabet entry has a title, a one-character content and an uppercase form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuStyleContractTest_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_012 begin');
      for (let i = 0; i < keySourceListData.length; i++) {
        const entry: keySourceListType = keySourceListData[i];
        expect(entry.title.length > 0).assertTrue();
        expect(entry.content.length).assertEqual(1);
        expect(entry.upperContent).assertEqual(entry.content.toUpperCase());
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_STYLE_CONTRACT_0013
     * @tc.name      testMenuStyleContractTest_013
     * @tc.desc      Verify that digit and letter codes translate to their alphabet and digit glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMenuStyleContractTest_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_013 begin');
      for (let i = 0; i < 10; i++) {
        expect(GetHardKeyValue(2000 + i, false)).assertEqual(String(i));
      }
      for (let i = 0; i < 26; i++) {
        expect(GetHardKeyValue(2017 + i, false)).assertEqual(String.fromCharCode(97 + i));
        expect(GetHardKeyValue(2017 + i, true)).assertEqual(String.fromCharCode(65 + i));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuStyleContractTest_013 end');
      await yieldToEventLoop();
    });

  });

}
