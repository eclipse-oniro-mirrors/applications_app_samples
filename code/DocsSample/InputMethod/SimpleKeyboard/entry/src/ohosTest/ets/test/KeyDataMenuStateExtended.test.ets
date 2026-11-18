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

export default function KeyDataMenuStateExtendedTest(): void {
  describe('KeyDataMenuStateExtendedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0105
     * @tc.name      testKeyDataMenuState0105
     * @tc.desc      Letter m renders 'M' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0105 begin');
      const item: keySourceListType = keySourceListData[25];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('M');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0106
     * @tc.name      testKeyDataMenuState0106
     * @tc.desc      Letter q keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0106 begin');
      const item: keySourceListType = keySourceListData[0];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('q');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0106 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0107
     * @tc.name      testKeyDataMenuState0107
     * @tc.desc      Letter q consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0107 begin');
      const item: keySourceListType = keySourceListData[0];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('Q');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0107 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0108
     * @tc.name      testKeyDataMenuState0108
     * @tc.desc      Letter q keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0108 begin');
      const item: keySourceListType = keySourceListData[0];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('Q');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0109
     * @tc.name      testKeyDataMenuState0109
     * @tc.desc      Letter w keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0109 begin');
      const item: keySourceListType = keySourceListData[1];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('w');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0110
     * @tc.name      testKeyDataMenuState0110
     * @tc.desc      Letter w consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0110 begin');
      const item: keySourceListType = keySourceListData[1];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('W');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0111
     * @tc.name      testKeyDataMenuState0111
     * @tc.desc      Letter w keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0111 begin');
      const item: keySourceListType = keySourceListData[1];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('W');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0112
     * @tc.name      testKeyDataMenuState0112
     * @tc.desc      Letter e keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0112 begin');
      const item: keySourceListType = keySourceListData[2];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('e');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0112 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0113
     * @tc.name      testKeyDataMenuState0113
     * @tc.desc      Letter e consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0113 begin');
      const item: keySourceListType = keySourceListData[2];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('E');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0113 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0114
     * @tc.name      testKeyDataMenuState0114
     * @tc.desc      Letter e keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0114 begin');
      const item: keySourceListType = keySourceListData[2];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('E');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0115
     * @tc.name      testKeyDataMenuState0115
     * @tc.desc      Letter r keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0115 begin');
      const item: keySourceListType = keySourceListData[3];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('r');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0116
     * @tc.name      testKeyDataMenuState0116
     * @tc.desc      Letter r consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0116 begin');
      const item: keySourceListType = keySourceListData[3];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('R');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0117
     * @tc.name      testKeyDataMenuState0117
     * @tc.desc      Letter r keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0117 begin');
      const item: keySourceListType = keySourceListData[3];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('R');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0118
     * @tc.name      testKeyDataMenuState0118
     * @tc.desc      Letter t keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0118 begin');
      const item: keySourceListType = keySourceListData[4];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('t');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0119
     * @tc.name      testKeyDataMenuState0119
     * @tc.desc      Letter t consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0119 begin');
      const item: keySourceListType = keySourceListData[4];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('T');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0119 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0120
     * @tc.name      testKeyDataMenuState0120
     * @tc.desc      Letter t keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0120 begin');
      const item: keySourceListType = keySourceListData[4];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('T');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0120 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0121
     * @tc.name      testKeyDataMenuState0121
     * @tc.desc      Letter y keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0121 begin');
      const item: keySourceListType = keySourceListData[5];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0122
     * @tc.name      testKeyDataMenuState0122
     * @tc.desc      Letter y consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0122 begin');
      const item: keySourceListType = keySourceListData[5];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('Y');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0123
     * @tc.name      testKeyDataMenuState0123
     * @tc.desc      Letter y keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0123 begin');
      const item: keySourceListType = keySourceListData[5];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('Y');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0123 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0124
     * @tc.name      testKeyDataMenuState0124
     * @tc.desc      Letter u keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0124 begin');
      const item: keySourceListType = keySourceListData[6];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('u');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0124 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0125
     * @tc.name      testKeyDataMenuState0125
     * @tc.desc      Letter u consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0125 begin');
      const item: keySourceListType = keySourceListData[6];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('U');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0125 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0126
     * @tc.name      testKeyDataMenuState0126
     * @tc.desc      Letter u keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0126 begin');
      const item: keySourceListType = keySourceListData[6];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('U');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0126 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0127
     * @tc.name      testKeyDataMenuState0127
     * @tc.desc      Letter i keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0127 begin');
      const item: keySourceListType = keySourceListData[7];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('i');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0127 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0128
     * @tc.name      testKeyDataMenuState0128
     * @tc.desc      Letter i consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0128 begin');
      const item: keySourceListType = keySourceListData[7];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('I');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0128 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0129
     * @tc.name      testKeyDataMenuState0129
     * @tc.desc      Letter i keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0129 begin');
      const item: keySourceListType = keySourceListData[7];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('I');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0129 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0130
     * @tc.name      testKeyDataMenuState0130
     * @tc.desc      Letter o keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0130 begin');
      const item: keySourceListType = keySourceListData[8];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('o');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0130 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0131
     * @tc.name      testKeyDataMenuState0131
     * @tc.desc      Letter o consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0131 begin');
      const item: keySourceListType = keySourceListData[8];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('O');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0131 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0132
     * @tc.name      testKeyDataMenuState0132
     * @tc.desc      Letter o keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0132 begin');
      const item: keySourceListType = keySourceListData[8];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('O');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0132 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0133
     * @tc.name      testKeyDataMenuState0133
     * @tc.desc      Letter p keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0133 begin');
      const item: keySourceListType = keySourceListData[9];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('p');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0133 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0134
     * @tc.name      testKeyDataMenuState0134
     * @tc.desc      Letter p consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0134 begin');
      const item: keySourceListType = keySourceListData[9];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('P');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0134 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0135
     * @tc.name      testKeyDataMenuState0135
     * @tc.desc      Letter p keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0135 begin');
      const item: keySourceListType = keySourceListData[9];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('P');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0135 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0136
     * @tc.name      testKeyDataMenuState0136
     * @tc.desc      Letter a keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0136 begin');
      const item: keySourceListType = keySourceListData[10];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0136 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0137
     * @tc.name      testKeyDataMenuState0137
     * @tc.desc      Letter a consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0137 begin');
      const item: keySourceListType = keySourceListData[10];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('A');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0137 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0138
     * @tc.name      testKeyDataMenuState0138
     * @tc.desc      Letter a keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0138 begin');
      const item: keySourceListType = keySourceListData[10];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('A');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0138 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0139
     * @tc.name      testKeyDataMenuState0139
     * @tc.desc      Letter s keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0139 begin');
      const item: keySourceListType = keySourceListData[11];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0139 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0140
     * @tc.name      testKeyDataMenuState0140
     * @tc.desc      Letter s consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0140 begin');
      const item: keySourceListType = keySourceListData[11];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('S');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0140 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0141
     * @tc.name      testKeyDataMenuState0141
     * @tc.desc      Letter s keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0141 begin');
      const item: keySourceListType = keySourceListData[11];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('S');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0141 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0142
     * @tc.name      testKeyDataMenuState0142
     * @tc.desc      Letter d keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0142 begin');
      const item: keySourceListType = keySourceListData[12];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0142 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0143
     * @tc.name      testKeyDataMenuState0143
     * @tc.desc      Letter d consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0143 begin');
      const item: keySourceListType = keySourceListData[12];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('D');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0143 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0144
     * @tc.name      testKeyDataMenuState0144
     * @tc.desc      Letter d keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0144 begin');
      const item: keySourceListType = keySourceListData[12];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('D');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0144 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0145
     * @tc.name      testKeyDataMenuState0145
     * @tc.desc      Letter f keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0145 begin');
      const item: keySourceListType = keySourceListData[13];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0145 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0146
     * @tc.name      testKeyDataMenuState0146
     * @tc.desc      Letter f consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0146 begin');
      const item: keySourceListType = keySourceListData[13];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('F');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0146 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0147
     * @tc.name      testKeyDataMenuState0147
     * @tc.desc      Letter f keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0147 begin');
      const item: keySourceListType = keySourceListData[13];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('F');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0147 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0148
     * @tc.name      testKeyDataMenuState0148
     * @tc.desc      Letter g keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0148 begin');
      const item: keySourceListType = keySourceListData[14];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('g');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0148 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0149
     * @tc.name      testKeyDataMenuState0149
     * @tc.desc      Letter g consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0149 begin');
      const item: keySourceListType = keySourceListData[14];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('G');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0149 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0150
     * @tc.name      testKeyDataMenuState0150
     * @tc.desc      Letter g keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0150 begin');
      const item: keySourceListType = keySourceListData[14];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('G');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0150 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0151
     * @tc.name      testKeyDataMenuState0151
     * @tc.desc      Letter h keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0151 begin');
      const item: keySourceListType = keySourceListData[15];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('h');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0151 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0152
     * @tc.name      testKeyDataMenuState0152
     * @tc.desc      Letter h consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0152 begin');
      const item: keySourceListType = keySourceListData[15];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('H');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0152 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0153
     * @tc.name      testKeyDataMenuState0153
     * @tc.desc      Letter h keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0153 begin');
      const item: keySourceListType = keySourceListData[15];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('H');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0153 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0154
     * @tc.name      testKeyDataMenuState0154
     * @tc.desc      Letter j keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0154 begin');
      const item: keySourceListType = keySourceListData[16];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('j');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0154 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0155
     * @tc.name      testKeyDataMenuState0155
     * @tc.desc      Letter j consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0155 begin');
      const item: keySourceListType = keySourceListData[16];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('J');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0155 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0156
     * @tc.name      testKeyDataMenuState0156
     * @tc.desc      Letter j keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0156 begin');
      const item: keySourceListType = keySourceListData[16];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('J');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0156 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0157
     * @tc.name      testKeyDataMenuState0157
     * @tc.desc      Letter k keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0157 begin');
      const item: keySourceListType = keySourceListData[17];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('k');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0157 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0158
     * @tc.name      testKeyDataMenuState0158
     * @tc.desc      Letter k consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0158 begin');
      const item: keySourceListType = keySourceListData[17];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('K');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0158 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0159
     * @tc.name      testKeyDataMenuState0159
     * @tc.desc      Letter k keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0159 begin');
      const item: keySourceListType = keySourceListData[17];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('K');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0159 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0160
     * @tc.name      testKeyDataMenuState0160
     * @tc.desc      Letter l keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0160 begin');
      const item: keySourceListType = keySourceListData[18];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('l');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0160 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0161
     * @tc.name      testKeyDataMenuState0161
     * @tc.desc      Letter l consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0161 begin');
      const item: keySourceListType = keySourceListData[18];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('L');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0161 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0162
     * @tc.name      testKeyDataMenuState0162
     * @tc.desc      Letter l keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0162 begin');
      const item: keySourceListType = keySourceListData[18];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('L');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0162 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0163
     * @tc.name      testKeyDataMenuState0163
     * @tc.desc      Letter z keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0163 begin');
      const item: keySourceListType = keySourceListData[19];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('z');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0163 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0164
     * @tc.name      testKeyDataMenuState0164
     * @tc.desc      Letter z consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0164 begin');
      const item: keySourceListType = keySourceListData[19];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('Z');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0164 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0165
     * @tc.name      testKeyDataMenuState0165
     * @tc.desc      Letter z keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0165 begin');
      const item: keySourceListType = keySourceListData[19];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('Z');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0165 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0166
     * @tc.name      testKeyDataMenuState0166
     * @tc.desc      Letter x keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0166 begin');
      const item: keySourceListType = keySourceListData[20];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0166 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0167
     * @tc.name      testKeyDataMenuState0167
     * @tc.desc      Letter x consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0167 begin');
      const item: keySourceListType = keySourceListData[20];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('X');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0167 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0168
     * @tc.name      testKeyDataMenuState0168
     * @tc.desc      Letter x keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0168 begin');
      const item: keySourceListType = keySourceListData[20];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('X');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0168 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0169
     * @tc.name      testKeyDataMenuState0169
     * @tc.desc      Letter c keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0169 begin');
      const item: keySourceListType = keySourceListData[21];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0169 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0170
     * @tc.name      testKeyDataMenuState0170
     * @tc.desc      Letter c consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0170 begin');
      const item: keySourceListType = keySourceListData[21];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('C');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0170 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0171
     * @tc.name      testKeyDataMenuState0171
     * @tc.desc      Letter c keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0171 begin');
      const item: keySourceListType = keySourceListData[21];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('C');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0171 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0172
     * @tc.name      testKeyDataMenuState0172
     * @tc.desc      Letter v keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0172 begin');
      const item: keySourceListType = keySourceListData[22];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('v');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0172 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0173
     * @tc.name      testKeyDataMenuState0173
     * @tc.desc      Letter v consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0173 begin');
      const item: keySourceListType = keySourceListData[22];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('V');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0173 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0174
     * @tc.name      testKeyDataMenuState0174
     * @tc.desc      Letter v keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0174 begin');
      const item: keySourceListType = keySourceListData[22];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('V');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0174 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0175
     * @tc.name      testKeyDataMenuState0175
     * @tc.desc      Letter b keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0175 begin');
      const item: keySourceListType = keySourceListData[23];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0175 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0176
     * @tc.name      testKeyDataMenuState0176
     * @tc.desc      Letter b consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0176 begin');
      const item: keySourceListType = keySourceListData[23];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('B');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0176 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0177
     * @tc.name      testKeyDataMenuState0177
     * @tc.desc      Letter b keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0177 begin');
      const item: keySourceListType = keySourceListData[23];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('B');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0177 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0178
     * @tc.name      testKeyDataMenuState0178
     * @tc.desc      Letter n keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0178 begin');
      const item: keySourceListType = keySourceListData[24];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('n');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0178 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0179
     * @tc.name      testKeyDataMenuState0179
     * @tc.desc      Letter n consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0179 begin');
      const item: keySourceListType = keySourceListData[24];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('N');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0179 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0180
     * @tc.name      testKeyDataMenuState0180
     * @tc.desc      Letter n keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0180 begin');
      const item: keySourceListType = keySourceListData[24];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('N');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0180 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0181
     * @tc.name      testKeyDataMenuState0181
     * @tc.desc      Letter m keeps lower state after a lower-case insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0181 begin');
      const item: keySourceListType = keySourceListData[25];
      let state: number = KeyState.LOWER_CASE;
      const inserted: string = item.content;
      expect(state).assertEqual(KeyState.LOWER_CASE);
      expect(inserted).assertEqual('m');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0181 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0182
     * @tc.name      testKeyDataMenuState0182
     * @tc.desc      Letter m consumes ONCE_UPPER_CASE and inserts the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0182 begin');
      const item: keySourceListType = keySourceListData[25];
      let state: number = KeyState.ONCE_UPPER_CASE;
      const inserted: string = item.upperContent;
      if (state === KeyState.ONCE_UPPER_CASE) {
        state = KeyState.LOWER_CASE;
      }
      expect(inserted).assertEqual('M');
      expect(state).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0182 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0183
     * @tc.name      testKeyDataMenuState0183
     * @tc.desc      Letter m keeps UPPER_CASE after inserting the upper character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0183 begin');
      const item: keySourceListType = keySourceListData[25];
      let state: number = KeyState.UPPER_CASE;
      const inserted: string = item.upperContent;
      expect(inserted).assertEqual('M');
      expect(state).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0183 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0184
     * @tc.name      testKeyDataMenuState0184
     * @tc.desc      Clicking the NUMBER_KEY caption switches MenuType to NUMBER.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0184 begin');
      const caption: string = MenuKey.NUMBER_KEY;
      let menu: number = -1;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NUMBER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0184 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0185
     * @tc.name      testKeyDataMenuState0185
     * @tc.desc      Clicking the SPECIAL_KEY caption switches MenuType to SPECIAL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0185 begin');
      const caption: string = MenuKey.SPECIAL_KEY;
      let menu: number = -1;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.SPECIAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0185 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0186
     * @tc.name      testKeyDataMenuState0186
     * @tc.desc      Clicking the NORMAL_KEY caption switches MenuType to NORMAL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0186 begin');
      const caption: string = MenuKey.NORMAL_KEY;
      let menu: number = -1;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0186 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0187
     * @tc.name      testKeyDataMenuState0187
     * @tc.desc      From NORMAL, the NUMBER_KEY caption selects the NUMBER panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0187 begin');
      let menu: number = MenuType.NORMAL;
      const caption: string = MenuKey.NUMBER_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NUMBER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0187 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0188
     * @tc.name      testKeyDataMenuState0188
     * @tc.desc      From NORMAL, the SPECIAL_KEY caption selects the SPECIAL panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0188 begin');
      let menu: number = MenuType.NORMAL;
      const caption: string = MenuKey.SPECIAL_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.SPECIAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0188 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0189
     * @tc.name      testKeyDataMenuState0189
     * @tc.desc      From NORMAL, the NORMAL_KEY caption selects the NORMAL panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0189 begin');
      let menu: number = MenuType.NORMAL;
      const caption: string = MenuKey.NORMAL_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0189 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0190
     * @tc.name      testKeyDataMenuState0190
     * @tc.desc      From NUMBER, the NUMBER_KEY caption selects the NUMBER panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0190 begin');
      let menu: number = MenuType.NUMBER;
      const caption: string = MenuKey.NUMBER_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NUMBER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0190 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0191
     * @tc.name      testKeyDataMenuState0191
     * @tc.desc      From NUMBER, the SPECIAL_KEY caption selects the SPECIAL panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0191 begin');
      let menu: number = MenuType.NUMBER;
      const caption: string = MenuKey.SPECIAL_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.SPECIAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0191 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0192
     * @tc.name      testKeyDataMenuState0192
     * @tc.desc      From NUMBER, the NORMAL_KEY caption selects the NORMAL panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0192 begin');
      let menu: number = MenuType.NUMBER;
      const caption: string = MenuKey.NORMAL_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0192 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0193
     * @tc.name      testKeyDataMenuState0193
     * @tc.desc      From SPECIAL, the NUMBER_KEY caption selects the NUMBER panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0193 begin');
      let menu: number = MenuType.SPECIAL;
      const caption: string = MenuKey.NUMBER_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NUMBER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0193 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0194
     * @tc.name      testKeyDataMenuState0194
     * @tc.desc      From SPECIAL, the SPECIAL_KEY caption selects the SPECIAL panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0194 begin');
      let menu: number = MenuType.SPECIAL;
      const caption: string = MenuKey.SPECIAL_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.SPECIAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0194 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0195
     * @tc.name      testKeyDataMenuState0195
     * @tc.desc      From SPECIAL, the NORMAL_KEY caption selects the NORMAL panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0195 begin');
      let menu: number = MenuType.SPECIAL;
      const caption: string = MenuKey.NORMAL_KEY;
      if (caption === String(MenuKey.NUMBER_KEY)) {
        menu = MenuType.NUMBER;
      } else if (caption === String(MenuKey.SPECIAL_KEY)) {
        menu = MenuType.SPECIAL;
      } else if (caption === String(MenuKey.NORMAL_KEY)) {
        menu = MenuType.NORMAL;
      }
      expect(menu).assertEqual(MenuType.NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0195 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0196
     * @tc.name      testKeyDataMenuState0196
     * @tc.desc      Top menu toggle from NORMAL resolves to MENU.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0196 begin');
      let submenu: number = SubMenuType.NORMAL;
      submenu = submenu > SubMenuType.NORMAL ? SubMenuType.NORMAL : SubMenuType.MENU;
      expect(submenu).assertEqual(SubMenuType.MENU);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0196 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0197
     * @tc.name      testKeyDataMenuState0197
     * @tc.desc      Top menu toggle from MENU resolves to NORMAL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0197 begin');
      let submenu: number = SubMenuType.MENU;
      submenu = submenu > SubMenuType.NORMAL ? SubMenuType.NORMAL : SubMenuType.MENU;
      expect(submenu).assertEqual(SubMenuType.NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0197 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0198
     * @tc.name      testKeyDataMenuState0198
     * @tc.desc      Top menu toggle from EDIT resolves to NORMAL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0198 begin');
      let submenu: number = SubMenuType.EDIT;
      submenu = submenu > SubMenuType.NORMAL ? SubMenuType.NORMAL : SubMenuType.MENU;
      expect(submenu).assertEqual(SubMenuType.NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0198 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0199
     * @tc.name      testKeyDataMenuState0199
     * @tc.desc      Panel routing for submenu NORMAL, menu NORMAL, subtype 0 selects KeyMenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0199 begin');
      const submenu: number = SubMenuType.NORMAL;
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
      expect(panel).assertEqual('KeyMenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0199 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0200
     * @tc.name      testKeyDataMenuState0200
     * @tc.desc      Panel routing for submenu NORMAL, menu NORMAL, subtype 1 selects NumberMenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0200 begin');
      const submenu: number = SubMenuType.NORMAL;
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
      expect(panel).assertEqual('NumberMenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0200 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0201
     * @tc.name      testKeyDataMenuState0201
     * @tc.desc      Panel routing for submenu NORMAL, menu NUMBER, subtype 0 selects NumberMenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0201 begin');
      const submenu: number = SubMenuType.NORMAL;
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
      expect(panel).assertEqual('NumberMenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0201 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0202
     * @tc.name      testKeyDataMenuState0202
     * @tc.desc      Panel routing for submenu NORMAL, menu NUMBER, subtype 1 selects NumberMenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0202 begin');
      const submenu: number = SubMenuType.NORMAL;
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
      expect(panel).assertEqual('NumberMenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0202 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0203
     * @tc.name      testKeyDataMenuState0203
     * @tc.desc      Panel routing for submenu NORMAL, menu SPECIAL, subtype 0 selects SymbolMenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0203 begin');
      const submenu: number = SubMenuType.NORMAL;
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
      expect(panel).assertEqual('SymbolMenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0203 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0204
     * @tc.name      testKeyDataMenuState0204
     * @tc.desc      Panel routing for submenu NORMAL, menu SPECIAL, subtype 1 selects SymbolMenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0204 begin');
      const submenu: number = SubMenuType.NORMAL;
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
      expect(panel).assertEqual('SymbolMenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0204 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0205
     * @tc.name      testKeyDataMenuState0205
     * @tc.desc      Panel routing for submenu MENU, menu NORMAL, subtype 0 selects Submenu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0205 begin');
      const submenu: number = SubMenuType.MENU;
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
      expect(panel).assertEqual('Submenu');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0205 end');
    })
  })
}
