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
import { KeyState, MenuKey, MenuType, SubMenuType } from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMenuRelation]';

export default function menuRelationTest(): void {
  describe('MenuRelationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_RELATION_0001
     * @tc.name      testMenuRelation_001
     * @tc.desc      Verify that the three submenu levels keep their strict numeric order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuRelation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_001 begin');
      expect(SubMenuType.NORMAL < SubMenuType.MENU).assertTrue();
      expect(SubMenuType.MENU < SubMenuType.EDIT).assertTrue();
      expect(SubMenuType.EDIT - SubMenuType.NORMAL).assertEqual(2);
      expect(SubMenuType.EDIT).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_RELATION_0002
     * @tc.name      testMenuRelation_002
     * @tc.desc      Verify that the menu and submenu level numbers correspond one to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuRelation_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_002 begin');
      expect(MenuType.NORMAL).assertEqual(SubMenuType.NORMAL);
      expect(MenuType.NUMBER).assertEqual(SubMenuType.MENU);
      expect(MenuType.SPECIAL).assertEqual(SubMenuType.EDIT);
      expect(MenuType.SPECIAL - MenuType.NORMAL).assertEqual(2);
      expect(MenuType.NORMAL < MenuType.SPECIAL).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_RELATION_0003
     * @tc.name      testMenuRelation_003
     * @tc.desc      Verify that the three switch labels start with three different characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuRelation_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_003 begin');
      const firsts: string[] = [MenuKey.NUMBER_KEY.charAt(0), MenuKey.NORMAL_KEY.charAt(0),
        MenuKey.SPECIAL_KEY.charAt(0)];
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < firsts.length; i++) {
        unique.add(firsts[i]);
      }
      expect(unique.size).assertEqual(3);
      expect(firsts[0]).assertEqual('?');
      expect(firsts[1]).assertEqual('A');
      expect(firsts[2]).assertEqual('=');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_RELATION_0004
     * @tc.name      testMenuRelation_004
     * @tc.desc      Verify that the three key states keep the lower-once-upper numeric order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuRelation_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_004 begin');
      expect(KeyState.LOWER_CASE < KeyState.ONCE_UPPER_CASE).assertTrue();
      expect(KeyState.ONCE_UPPER_CASE < KeyState.UPPER_CASE).assertTrue();
      expect(KeyState.UPPER_CASE - KeyState.LOWER_CASE).assertEqual(2);
      expect(KeyState.ONCE_UPPER_CASE).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_RELATION_0005
     * @tc.name      testMenuRelation_005
     * @tc.desc      Verify that the three menu types form one unique value set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuRelation_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_005 begin');
      const values: number[] = [MenuType.NORMAL, MenuType.NUMBER, MenuType.SPECIAL];
      const unique: Set<number> = new Set<number>();
      let sum: number = 0;
      for (let i = 0; i < values.length; i++) {
        unique.add(values[i]);
        sum = sum + values[i];
      }
      expect(unique.size).assertEqual(3);
      expect(sum).assertEqual(3);
      expect(values[2] > values[1]).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_RELATION_0006
     * @tc.name      testMenuRelation_006
     * @tc.desc      Verify that the edit submenu sits above the menu submenu and differs from it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuRelation_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_006 begin');
      const edit: number = SubMenuType.EDIT;
      const menu: number = SubMenuType.MENU;
      expect(edit !== menu).assertTrue();
      expect(edit - menu).assertEqual(1);
      expect(edit > SubMenuType.NORMAL).assertTrue();
      expect(SubMenuType.EDIT > SubMenuType.MENU).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuRelation_006 end');
      await yieldToEventLoop();
    });

  });
}
