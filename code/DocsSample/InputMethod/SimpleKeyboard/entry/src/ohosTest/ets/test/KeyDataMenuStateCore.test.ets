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

export default function KeyDataMenuStateCoreTest(): void {
  describe('KeyDataMenuStateCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0001
     * @tc.name      testKeyDataMenuState0001
     * @tc.desc      KeyState exposes the three expected numeric values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0001 begin');
      expect(KeyState.LOWER_CASE).assertEqual(0);
      expect(KeyState.ONCE_UPPER_CASE).assertEqual(1);
      expect(KeyState.UPPER_CASE).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0002
     * @tc.name      testKeyDataMenuState0002
     * @tc.desc      KeyState values are distinct and strictly ordered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0002 begin');
      expect(KeyState.LOWER_CASE < KeyState.ONCE_UPPER_CASE).assertTrue();
      expect(KeyState.ONCE_UPPER_CASE < KeyState.UPPER_CASE).assertTrue();
      const lower: number = KeyState.LOWER_CASE;
      const upper: number = KeyState.UPPER_CASE;
      expect(lower === upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0003
     * @tc.name      testKeyDataMenuState0003
     * @tc.desc      MenuType exposes normal, number and special values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0003 begin');
      expect(MenuType.NORMAL).assertEqual(0);
      expect(MenuType.NUMBER).assertEqual(1);
      expect(MenuType.SPECIAL).assertEqual(2);
      expect(MenuType.NORMAL < MenuType.NUMBER).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0004
     * @tc.name      testKeyDataMenuState0004
     * @tc.desc      SubMenuType exposes normal, menu and edit values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0004 begin');
      expect(SubMenuType.NORMAL).assertEqual(0);
      expect(SubMenuType.MENU).assertEqual(1);
      expect(SubMenuType.EDIT).assertEqual(2);
      expect(SubMenuType.NORMAL < SubMenuType.EDIT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0005
     * @tc.name      testKeyDataMenuState0005
     * @tc.desc      MenuKey labels are the expected panel switch captions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0005 begin');
      expect(MenuKey.NUMBER_KEY).assertEqual('?123');
      expect(MenuKey.NORMAL_KEY).assertEqual('ABC');
      expect(MenuKey.SPECIAL_KEY).assertEqual('=/\<');
      const numberCaption: string = MenuKey.NUMBER_KEY;
      const normalCaption: string = MenuKey.NORMAL_KEY;
      expect(numberCaption === normalCaption).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0006
     * @tc.name      testKeyDataMenuState0006
     * @tc.desc      The three menu captions are non-empty and unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0006 begin');
      const labels: string[] = [MenuKey.NUMBER_KEY, MenuKey.NORMAL_KEY, MenuKey.SPECIAL_KEY];
      expect(labels.length).assertEqual(3);
      for (let i: number = 0; i < labels.length; i++) {
        expect(labels[i].length > 0).assertTrue();
        for (let j: number = i + 1; j < labels.length; j++) {
          expect(labels[i] === labels[j]).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0007
     * @tc.name      testKeyDataMenuState0007
     * @tc.desc      Shift from LOWER_CASE advances KeyState to ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0007 begin');
      const start: number = 0;
      let next: number = -1;
      if (start === KeyState.LOWER_CASE) {
        next = KeyState.ONCE_UPPER_CASE;
      } else if (start === KeyState.ONCE_UPPER_CASE) {
        next = KeyState.UPPER_CASE;
      } else if (start === KeyState.UPPER_CASE) {
        next = KeyState.LOWER_CASE;
      }
      expect(next).assertEqual(1);
      expect(next).assertEqual(KeyState.ONCE_UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0008
     * @tc.name      testKeyDataMenuState0008
     * @tc.desc      Shift from ONCE_UPPER_CASE advances KeyState to UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0008 begin');
      const start: number = 1;
      let next: number = -1;
      if (start === KeyState.LOWER_CASE) {
        next = KeyState.ONCE_UPPER_CASE;
      } else if (start === KeyState.ONCE_UPPER_CASE) {
        next = KeyState.UPPER_CASE;
      } else if (start === KeyState.UPPER_CASE) {
        next = KeyState.LOWER_CASE;
      }
      expect(next).assertEqual(2);
      expect(next).assertEqual(KeyState.UPPER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0009
     * @tc.name      testKeyDataMenuState0009
     * @tc.desc      Shift from UPPER_CASE advances KeyState to LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0009 begin');
      const start: number = 2;
      let next: number = -1;
      if (start === KeyState.LOWER_CASE) {
        next = KeyState.ONCE_UPPER_CASE;
      } else if (start === KeyState.ONCE_UPPER_CASE) {
        next = KeyState.UPPER_CASE;
      } else if (start === KeyState.UPPER_CASE) {
        next = KeyState.LOWER_CASE;
      }
      expect(next).assertEqual(0);
      expect(next).assertEqual(KeyState.LOWER_CASE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0010
     * @tc.name      testKeyDataMenuState0010
     * @tc.desc      Shift pressed 1 time(s) from LOWER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0010 begin');
      const expected: number = 1;
      let state: number = 0;
      for (let i: number = 0; i < 1; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0011
     * @tc.name      testKeyDataMenuState0011
     * @tc.desc      Shift pressed 2 time(s) from LOWER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0011 begin');
      const expected: number = 2;
      let state: number = 0;
      for (let i: number = 0; i < 2; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0012
     * @tc.name      testKeyDataMenuState0012
     * @tc.desc      Shift pressed 3 time(s) from LOWER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0012 begin');
      const expected: number = 0;
      let state: number = 0;
      for (let i: number = 0; i < 3; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0013
     * @tc.name      testKeyDataMenuState0013
     * @tc.desc      Shift pressed 4 time(s) from LOWER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0013 begin');
      const expected: number = 1;
      let state: number = 0;
      for (let i: number = 0; i < 4; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0014
     * @tc.name      testKeyDataMenuState0014
     * @tc.desc      Shift pressed 5 time(s) from LOWER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0014 begin');
      const expected: number = 2;
      let state: number = 0;
      for (let i: number = 0; i < 5; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0015
     * @tc.name      testKeyDataMenuState0015
     * @tc.desc      Shift pressed 6 time(s) from LOWER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0015 begin');
      const expected: number = 0;
      let state: number = 0;
      for (let i: number = 0; i < 6; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0016
     * @tc.name      testKeyDataMenuState0016
     * @tc.desc      Shift pressed 1 time(s) from ONCE_UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0016 begin');
      const expected: number = 2;
      let state: number = 1;
      for (let i: number = 0; i < 1; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0017
     * @tc.name      testKeyDataMenuState0017
     * @tc.desc      Shift pressed 2 time(s) from ONCE_UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0017 begin');
      const expected: number = 0;
      let state: number = 1;
      for (let i: number = 0; i < 2; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0018
     * @tc.name      testKeyDataMenuState0018
     * @tc.desc      Shift pressed 3 time(s) from ONCE_UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0018 begin');
      const expected: number = 1;
      let state: number = 1;
      for (let i: number = 0; i < 3; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0019
     * @tc.name      testKeyDataMenuState0019
     * @tc.desc      Shift pressed 4 time(s) from ONCE_UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0019 begin');
      const expected: number = 2;
      let state: number = 1;
      for (let i: number = 0; i < 4; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0020
     * @tc.name      testKeyDataMenuState0020
     * @tc.desc      Shift pressed 5 time(s) from ONCE_UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0020 begin');
      const expected: number = 0;
      let state: number = 1;
      for (let i: number = 0; i < 5; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0021
     * @tc.name      testKeyDataMenuState0021
     * @tc.desc      Shift pressed 6 time(s) from ONCE_UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0021 begin');
      const expected: number = 1;
      let state: number = 1;
      for (let i: number = 0; i < 6; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0022
     * @tc.name      testKeyDataMenuState0022
     * @tc.desc      Shift pressed 1 time(s) from UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0022 begin');
      const expected: number = 0;
      let state: number = 2;
      for (let i: number = 0; i < 1; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0023
     * @tc.name      testKeyDataMenuState0023
     * @tc.desc      Shift pressed 2 time(s) from UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0023 begin');
      const expected: number = 1;
      let state: number = 2;
      for (let i: number = 0; i < 2; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0024
     * @tc.name      testKeyDataMenuState0024
     * @tc.desc      Shift pressed 3 time(s) from UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0024 begin');
      const expected: number = 2;
      let state: number = 2;
      for (let i: number = 0; i < 3; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0025
     * @tc.name      testKeyDataMenuState0025
     * @tc.desc      Shift pressed 4 time(s) from UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0025 begin');
      const expected: number = 0;
      let state: number = 2;
      for (let i: number = 0; i < 4; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0026
     * @tc.name      testKeyDataMenuState0026
     * @tc.desc      Shift pressed 5 time(s) from UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0026 begin');
      const expected: number = 1;
      let state: number = 2;
      for (let i: number = 0; i < 5; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0027
     * @tc.name      testKeyDataMenuState0027
     * @tc.desc      Shift pressed 6 time(s) from UPPER_CASE reaches the expected KeyState.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0027 begin');
      const expected: number = 2;
      let state: number = 2;
      for (let i: number = 0; i < 6; i++) {
        if (state === KeyState.LOWER_CASE) {
          state = KeyState.ONCE_UPPER_CASE;
        } else if (state === KeyState.ONCE_UPPER_CASE) {
          state = KeyState.UPPER_CASE;
        } else if (state === KeyState.UPPER_CASE) {
          state = KeyState.LOWER_CASE;
        }
      }
      expect(state).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0028
     * @tc.name      testKeyDataMenuState0028
     * @tc.desc      Letter q renders 'q' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0028 begin');
      const item: keySourceListType = keySourceListData[0];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('q');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0029
     * @tc.name      testKeyDataMenuState0029
     * @tc.desc      Letter q renders 'Q' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0029 begin');
      const item: keySourceListType = keySourceListData[0];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('Q');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0030
     * @tc.name      testKeyDataMenuState0030
     * @tc.desc      Letter q renders 'Q' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0030 begin');
      const item: keySourceListType = keySourceListData[0];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('Q');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0031
     * @tc.name      testKeyDataMenuState0031
     * @tc.desc      Letter w renders 'w' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0031 begin');
      const item: keySourceListType = keySourceListData[1];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('w');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0032
     * @tc.name      testKeyDataMenuState0032
     * @tc.desc      Letter w renders 'W' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0032 begin');
      const item: keySourceListType = keySourceListData[1];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('W');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0033
     * @tc.name      testKeyDataMenuState0033
     * @tc.desc      Letter w renders 'W' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0033 begin');
      const item: keySourceListType = keySourceListData[1];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('W');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0034
     * @tc.name      testKeyDataMenuState0034
     * @tc.desc      Letter e renders 'e' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0034 begin');
      const item: keySourceListType = keySourceListData[2];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('e');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0035
     * @tc.name      testKeyDataMenuState0035
     * @tc.desc      Letter e renders 'E' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0035 begin');
      const item: keySourceListType = keySourceListData[2];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('E');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0036
     * @tc.name      testKeyDataMenuState0036
     * @tc.desc      Letter e renders 'E' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0036 begin');
      const item: keySourceListType = keySourceListData[2];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('E');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0037
     * @tc.name      testKeyDataMenuState0037
     * @tc.desc      Letter r renders 'r' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0037 begin');
      const item: keySourceListType = keySourceListData[3];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('r');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0038
     * @tc.name      testKeyDataMenuState0038
     * @tc.desc      Letter r renders 'R' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0038 begin');
      const item: keySourceListType = keySourceListData[3];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('R');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0039
     * @tc.name      testKeyDataMenuState0039
     * @tc.desc      Letter r renders 'R' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0039 begin');
      const item: keySourceListType = keySourceListData[3];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('R');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0040
     * @tc.name      testKeyDataMenuState0040
     * @tc.desc      Letter t renders 't' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0040 begin');
      const item: keySourceListType = keySourceListData[4];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('t');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0041
     * @tc.name      testKeyDataMenuState0041
     * @tc.desc      Letter t renders 'T' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0041 begin');
      const item: keySourceListType = keySourceListData[4];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('T');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0042
     * @tc.name      testKeyDataMenuState0042
     * @tc.desc      Letter t renders 'T' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0042 begin');
      const item: keySourceListType = keySourceListData[4];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('T');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0043
     * @tc.name      testKeyDataMenuState0043
     * @tc.desc      Letter y renders 'y' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0043 begin');
      const item: keySourceListType = keySourceListData[5];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('y');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0044
     * @tc.name      testKeyDataMenuState0044
     * @tc.desc      Letter y renders 'Y' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0044 begin');
      const item: keySourceListType = keySourceListData[5];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('Y');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0045
     * @tc.name      testKeyDataMenuState0045
     * @tc.desc      Letter y renders 'Y' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0045 begin');
      const item: keySourceListType = keySourceListData[5];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('Y');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0046
     * @tc.name      testKeyDataMenuState0046
     * @tc.desc      Letter u renders 'u' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0046 begin');
      const item: keySourceListType = keySourceListData[6];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('u');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0047
     * @tc.name      testKeyDataMenuState0047
     * @tc.desc      Letter u renders 'U' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0047 begin');
      const item: keySourceListType = keySourceListData[6];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('U');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0048
     * @tc.name      testKeyDataMenuState0048
     * @tc.desc      Letter u renders 'U' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0048 begin');
      const item: keySourceListType = keySourceListData[6];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('U');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0049
     * @tc.name      testKeyDataMenuState0049
     * @tc.desc      Letter i renders 'i' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0049 begin');
      const item: keySourceListType = keySourceListData[7];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('i');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0050
     * @tc.name      testKeyDataMenuState0050
     * @tc.desc      Letter i renders 'I' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0050 begin');
      const item: keySourceListType = keySourceListData[7];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('I');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0051
     * @tc.name      testKeyDataMenuState0051
     * @tc.desc      Letter i renders 'I' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0051 begin');
      const item: keySourceListType = keySourceListData[7];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('I');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0052
     * @tc.name      testKeyDataMenuState0052
     * @tc.desc      Letter o renders 'o' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0052 begin');
      const item: keySourceListType = keySourceListData[8];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('o');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0053
     * @tc.name      testKeyDataMenuState0053
     * @tc.desc      Letter o renders 'O' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0053 begin');
      const item: keySourceListType = keySourceListData[8];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('O');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0054
     * @tc.name      testKeyDataMenuState0054
     * @tc.desc      Letter o renders 'O' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0054 begin');
      const item: keySourceListType = keySourceListData[8];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('O');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0055
     * @tc.name      testKeyDataMenuState0055
     * @tc.desc      Letter p renders 'p' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0055 begin');
      const item: keySourceListType = keySourceListData[9];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('p');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0056
     * @tc.name      testKeyDataMenuState0056
     * @tc.desc      Letter p renders 'P' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0056 begin');
      const item: keySourceListType = keySourceListData[9];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('P');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0057
     * @tc.name      testKeyDataMenuState0057
     * @tc.desc      Letter p renders 'P' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0057 begin');
      const item: keySourceListType = keySourceListData[9];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('P');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0058
     * @tc.name      testKeyDataMenuState0058
     * @tc.desc      Letter a renders 'a' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0058 begin');
      const item: keySourceListType = keySourceListData[10];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('a');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0059
     * @tc.name      testKeyDataMenuState0059
     * @tc.desc      Letter a renders 'A' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0059 begin');
      const item: keySourceListType = keySourceListData[10];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('A');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0060
     * @tc.name      testKeyDataMenuState0060
     * @tc.desc      Letter a renders 'A' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0060 begin');
      const item: keySourceListType = keySourceListData[10];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('A');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0061
     * @tc.name      testKeyDataMenuState0061
     * @tc.desc      Letter s renders 's' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0061 begin');
      const item: keySourceListType = keySourceListData[11];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('s');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0062
     * @tc.name      testKeyDataMenuState0062
     * @tc.desc      Letter s renders 'S' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0062 begin');
      const item: keySourceListType = keySourceListData[11];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('S');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0063
     * @tc.name      testKeyDataMenuState0063
     * @tc.desc      Letter s renders 'S' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0063 begin');
      const item: keySourceListType = keySourceListData[11];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('S');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0064
     * @tc.name      testKeyDataMenuState0064
     * @tc.desc      Letter d renders 'd' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0064 begin');
      const item: keySourceListType = keySourceListData[12];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('d');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0065
     * @tc.name      testKeyDataMenuState0065
     * @tc.desc      Letter d renders 'D' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0065 begin');
      const item: keySourceListType = keySourceListData[12];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('D');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0066
     * @tc.name      testKeyDataMenuState0066
     * @tc.desc      Letter d renders 'D' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0066 begin');
      const item: keySourceListType = keySourceListData[12];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('D');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0067
     * @tc.name      testKeyDataMenuState0067
     * @tc.desc      Letter f renders 'f' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0067 begin');
      const item: keySourceListType = keySourceListData[13];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('f');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0068
     * @tc.name      testKeyDataMenuState0068
     * @tc.desc      Letter f renders 'F' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0068 begin');
      const item: keySourceListType = keySourceListData[13];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('F');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0069
     * @tc.name      testKeyDataMenuState0069
     * @tc.desc      Letter f renders 'F' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0069 begin');
      const item: keySourceListType = keySourceListData[13];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('F');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0070
     * @tc.name      testKeyDataMenuState0070
     * @tc.desc      Letter g renders 'g' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0070 begin');
      const item: keySourceListType = keySourceListData[14];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('g');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0071
     * @tc.name      testKeyDataMenuState0071
     * @tc.desc      Letter g renders 'G' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0071 begin');
      const item: keySourceListType = keySourceListData[14];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('G');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0072
     * @tc.name      testKeyDataMenuState0072
     * @tc.desc      Letter g renders 'G' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0072 begin');
      const item: keySourceListType = keySourceListData[14];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('G');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0073
     * @tc.name      testKeyDataMenuState0073
     * @tc.desc      Letter h renders 'h' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0073 begin');
      const item: keySourceListType = keySourceListData[15];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('h');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0074
     * @tc.name      testKeyDataMenuState0074
     * @tc.desc      Letter h renders 'H' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0074 begin');
      const item: keySourceListType = keySourceListData[15];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('H');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0075
     * @tc.name      testKeyDataMenuState0075
     * @tc.desc      Letter h renders 'H' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0075 begin');
      const item: keySourceListType = keySourceListData[15];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('H');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0076
     * @tc.name      testKeyDataMenuState0076
     * @tc.desc      Letter j renders 'j' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0076 begin');
      const item: keySourceListType = keySourceListData[16];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('j');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0077
     * @tc.name      testKeyDataMenuState0077
     * @tc.desc      Letter j renders 'J' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0077 begin');
      const item: keySourceListType = keySourceListData[16];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('J');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0078
     * @tc.name      testKeyDataMenuState0078
     * @tc.desc      Letter j renders 'J' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0078 begin');
      const item: keySourceListType = keySourceListData[16];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('J');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0079
     * @tc.name      testKeyDataMenuState0079
     * @tc.desc      Letter k renders 'k' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0079 begin');
      const item: keySourceListType = keySourceListData[17];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('k');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0080
     * @tc.name      testKeyDataMenuState0080
     * @tc.desc      Letter k renders 'K' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0080 begin');
      const item: keySourceListType = keySourceListData[17];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('K');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0081
     * @tc.name      testKeyDataMenuState0081
     * @tc.desc      Letter k renders 'K' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0081 begin');
      const item: keySourceListType = keySourceListData[17];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('K');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0082
     * @tc.name      testKeyDataMenuState0082
     * @tc.desc      Letter l renders 'l' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0082 begin');
      const item: keySourceListType = keySourceListData[18];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('l');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0083
     * @tc.name      testKeyDataMenuState0083
     * @tc.desc      Letter l renders 'L' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0083 begin');
      const item: keySourceListType = keySourceListData[18];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('L');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0084
     * @tc.name      testKeyDataMenuState0084
     * @tc.desc      Letter l renders 'L' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0084 begin');
      const item: keySourceListType = keySourceListData[18];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('L');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0085
     * @tc.name      testKeyDataMenuState0085
     * @tc.desc      Letter z renders 'z' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0085 begin');
      const item: keySourceListType = keySourceListData[19];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('z');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0086
     * @tc.name      testKeyDataMenuState0086
     * @tc.desc      Letter z renders 'Z' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0086 begin');
      const item: keySourceListType = keySourceListData[19];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('Z');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0087
     * @tc.name      testKeyDataMenuState0087
     * @tc.desc      Letter z renders 'Z' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0087 begin');
      const item: keySourceListType = keySourceListData[19];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('Z');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0088
     * @tc.name      testKeyDataMenuState0088
     * @tc.desc      Letter x renders 'x' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0088 begin');
      const item: keySourceListType = keySourceListData[20];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('x');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0089
     * @tc.name      testKeyDataMenuState0089
     * @tc.desc      Letter x renders 'X' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0089 begin');
      const item: keySourceListType = keySourceListData[20];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('X');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0090
     * @tc.name      testKeyDataMenuState0090
     * @tc.desc      Letter x renders 'X' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0090 begin');
      const item: keySourceListType = keySourceListData[20];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('X');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0091
     * @tc.name      testKeyDataMenuState0091
     * @tc.desc      Letter c renders 'c' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0091 begin');
      const item: keySourceListType = keySourceListData[21];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('c');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0092
     * @tc.name      testKeyDataMenuState0092
     * @tc.desc      Letter c renders 'C' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0092 begin');
      const item: keySourceListType = keySourceListData[21];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('C');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0093
     * @tc.name      testKeyDataMenuState0093
     * @tc.desc      Letter c renders 'C' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0093 begin');
      const item: keySourceListType = keySourceListData[21];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('C');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0094
     * @tc.name      testKeyDataMenuState0094
     * @tc.desc      Letter v renders 'v' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0094 begin');
      const item: keySourceListType = keySourceListData[22];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('v');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0095
     * @tc.name      testKeyDataMenuState0095
     * @tc.desc      Letter v renders 'V' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0095 begin');
      const item: keySourceListType = keySourceListData[22];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('V');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0096
     * @tc.name      testKeyDataMenuState0096
     * @tc.desc      Letter v renders 'V' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0096 begin');
      const item: keySourceListType = keySourceListData[22];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('V');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0097
     * @tc.name      testKeyDataMenuState0097
     * @tc.desc      Letter b renders 'b' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0097 begin');
      const item: keySourceListType = keySourceListData[23];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('b');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0098
     * @tc.name      testKeyDataMenuState0098
     * @tc.desc      Letter b renders 'B' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0098 begin');
      const item: keySourceListType = keySourceListData[23];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('B');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0099
     * @tc.name      testKeyDataMenuState0099
     * @tc.desc      Letter b renders 'B' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0099 begin');
      const item: keySourceListType = keySourceListData[23];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('B');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0100
     * @tc.name      testKeyDataMenuState0100
     * @tc.desc      Letter n renders 'n' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0100 begin');
      const item: keySourceListType = keySourceListData[24];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('n');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0101
     * @tc.name      testKeyDataMenuState0101
     * @tc.desc      Letter n renders 'N' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0101 begin');
      const item: keySourceListType = keySourceListData[24];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('N');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0102
     * @tc.name      testKeyDataMenuState0102
     * @tc.desc      Letter n renders 'N' while KeyState is UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0102 begin');
      const item: keySourceListType = keySourceListData[24];
      const state: number = KeyState.UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('N');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0103
     * @tc.name      testKeyDataMenuState0103
     * @tc.desc      Letter m renders 'm' while KeyState is LOWER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0103 begin');
      const item: keySourceListType = keySourceListData[25];
      const state: number = KeyState.LOWER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('m');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_MENUSTATE_0104
     * @tc.name      testKeyDataMenuState0104
     * @tc.desc      Letter m renders 'M' while KeyState is ONCE_UPPER_CASE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataMenuState0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0104 begin');
      const item: keySourceListType = keySourceListData[25];
      const state: number = KeyState.ONCE_UPPER_CASE;
      const shown: string = state === KeyState.LOWER_CASE ? item.content : item.upperContent;
      expect(shown).assertEqual('M');
      expect(shown.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMenuState0104 end');
    })
  })
}
