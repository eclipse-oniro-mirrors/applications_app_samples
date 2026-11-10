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
  symbolSourceListData
} from '../../../main/ets/InputMethodExtensionAbility/pages/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyDataMenuState]';

export default function KeyDataMenuStateTailTest(): void {
  describe('KeyDataMenuStateTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0206
     * @tc.name      testKeyDataMenuState0206
     * @tc.desc      Panel routing for submenu MENU, menu NORMAL, subtype 1 selects Submenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0206 begin');
      const submenu: number = SubMenuType.MENU;
      const menu: number = MenuType.NORMAL;
      const subtype: number = 1;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('Submenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0206 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0207
     * @tc.name      testKeyDataMenuState0207
     * @tc.desc      Panel routing for submenu MENU, menu NUMBER, subtype 0 selects Submenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0207 begin');
      const submenu: number = SubMenuType.MENU;
      const menu: number = MenuType.NUMBER;
      const subtype: number = 0;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('Submenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0207 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0208
     * @tc.name      testKeyDataMenuState0208
     * @tc.desc      Panel routing for submenu MENU, menu NUMBER, subtype 1 selects Submenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0208 begin');
      const submenu: number = SubMenuType.MENU;
      const menu: number = MenuType.NUMBER;
      const subtype: number = 1;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('Submenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0208 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0209
     * @tc.name      testKeyDataMenuState0209
     * @tc.desc      Panel routing for submenu MENU, menu SPECIAL, subtype 0 selects Submenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0209 begin');
      const submenu: number = SubMenuType.MENU;
      const menu: number = MenuType.SPECIAL;
      const subtype: number = 0;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('Submenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0209 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0210
     * @tc.name      testKeyDataMenuState0210
     * @tc.desc      Panel routing for submenu MENU, menu SPECIAL, subtype 1 selects Submenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0210 begin');
      const submenu: number = SubMenuType.MENU;
      const menu: number = MenuType.SPECIAL;
      const subtype: number = 1;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('Submenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0210 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0211
     * @tc.name      testKeyDataMenuState0211
     * @tc.desc      Panel routing for submenu EDIT, menu NORMAL, subtype 0 selects EditView.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0211 begin');
      const submenu: number = SubMenuType.EDIT;
      const menu: number = MenuType.NORMAL;
      const subtype: number = 0;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('EditView');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0211 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0212
     * @tc.name      testKeyDataMenuState0212
     * @tc.desc      Panel routing for submenu EDIT, menu NORMAL, subtype 1 selects EditView.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0212 begin');
      const submenu: number = SubMenuType.EDIT;
      const menu: number = MenuType.NORMAL;
      const subtype: number = 1;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('EditView');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0212 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0213
     * @tc.name      testKeyDataMenuState0213
     * @tc.desc      Panel routing for submenu EDIT, menu NUMBER, subtype 0 selects EditView.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0213 begin');
      const submenu: number = SubMenuType.EDIT;
      const menu: number = MenuType.NUMBER;
      const subtype: number = 0;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('EditView');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0213 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0214
     * @tc.name      testKeyDataMenuState0214
     * @tc.desc      Panel routing for submenu EDIT, menu NUMBER, subtype 1 selects EditView.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0214 begin');
      const submenu: number = SubMenuType.EDIT;
      const menu: number = MenuType.NUMBER;
      const subtype: number = 1;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('EditView');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0214 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0215
     * @tc.name      testKeyDataMenuState0215
     * @tc.desc      Panel routing for submenu EDIT, menu SPECIAL, subtype 0 selects EditView.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0215 begin');
      const submenu: number = SubMenuType.EDIT;
      const menu: number = MenuType.SPECIAL;
      const subtype: number = 0;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('EditView');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0215 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0216
     * @tc.name      testKeyDataMenuState0216
     * @tc.desc      Panel routing for submenu EDIT, menu SPECIAL, subtype 1 selects EditView.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0216 begin');
      const submenu: number = SubMenuType.EDIT;
      const menu: number = MenuType.SPECIAL;
      const subtype: number = 1;
      let panel: string = '';
      if (submenu > SubMenuType.NORMAL) {
        panel = submenu === SubMenuType.MENU ? 'Submenu' : 'EditView';
      } else if (menu === MenuType.NORMAL) {
        panel = subtype === 0 ? 'KeyMenu' : 'NumberMenu';
      } else if (menu === MenuType.NUMBER) {
        panel = 'NumberMenu';
      } else {
        panel = 'SymbolMenu';
      }
      expect(panel).assertEqual('EditView');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0216 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0217
     * @tc.name      testKeyDataMenuState0217
     * @tc.desc      KeyMenu splits its table into rows of 10/9/7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0217 begin');
      const rowOne: number = 10;
      const rowTwo: number = 9;
      const rowThree: number = 7;
      expect(rowOne + rowTwo + rowThree).assertEqual(keySourceListData.length);
      expect(keySourceListData.length).assertEqual(26);
      expect(rowOne > 0 && rowTwo > 0 && rowThree > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0217 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0218
     * @tc.name      testKeyDataMenuState0218
     * @tc.desc      NumberMenu splits its table into rows of 10/10/7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0218 begin');
      const rowOne: number = 10;
      const rowTwo: number = 10;
      const rowThree: number = 7;
      expect(rowOne + rowTwo + rowThree).assertEqual(numberSourceListData.length);
      expect(numberSourceListData.length).assertEqual(27);
      expect(rowOne > 0 && rowTwo > 0 && rowThree > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0218 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0219
     * @tc.name      testKeyDataMenuState0219
     * @tc.desc      SymbolMenu splits its table into rows of 10/10/7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0219 begin');
      const rowOne: number = 10;
      const rowTwo: number = 10;
      const rowThree: number = 7;
      expect(rowOne + rowTwo + rowThree).assertEqual(symbolSourceListData.length);
      expect(symbolSourceListData.length).assertEqual(27);
      expect(rowOne > 0 && rowTwo > 0 && rowThree > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0219 end');
    })
  })
}
