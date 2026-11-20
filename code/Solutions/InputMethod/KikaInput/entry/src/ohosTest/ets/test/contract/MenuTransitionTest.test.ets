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
import { KeyState, MenuKey, MenuType } from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMenuTransition]';

export default function menuTransitionTest(): void {
  describe('MenuTransitionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0100
     * @tc.name      testMenuTransition_001
     * @tc.desc      Verify that each key state advances to the next by one step.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_001 begin');
      const lowered: number = KeyState.LOWER_CASE;
      const once: number = KeyState.ONCE_UPPER_CASE;
      const upper: number = KeyState.UPPER_CASE;
      expect(lowered + 1).assertEqual(once);
      expect(once + 1).assertEqual(upper);
      expect(upper - lowered).assertEqual(2);
      expect(once * 2).assertEqual(upper);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0200
     * @tc.name      testMenuTransition_002
     * @tc.desc      Verify that the three menu types fill the values zero through two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_002 begin');
      const seen: Set<number> = new Set<number>();
      const values: number[] = [MenuType.NORMAL, MenuType.NUMBER, MenuType.SPECIAL];
      for (let i = 0; i < values.length; i++) {
        seen.add(values[i]);
      }
      expect(seen.size).assertEqual(3);
      expect(values.join('|')).assertEqual('0|1|2');
      expect(values[1] + values[2]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0300
     * @tc.name      testMenuTransition_003
     * @tc.desc      Verify that the switch labels begin with three distinct documented characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_003 begin');
      const firsts: string[] = [MenuKey.NUMBER_KEY.substring(0, 1), MenuKey.NORMAL_KEY.substring(0, 1),
        MenuKey.SPECIAL_KEY.substring(0, 1)];
      expect(firsts.join('')).assertEqual('?A=');
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < firsts.length; i++) {
        unique.add(firsts[i]);
      }
      expect(unique.size).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0400
     * @tc.name      testMenuTransition_004
     * @tc.desc      Verify that the three labels keep their four-three-three length split.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_004 begin');
      const lengths: number[] = [MenuKey.NUMBER_KEY.length, MenuKey.NORMAL_KEY.length,
        MenuKey.SPECIAL_KEY.length];
      expect(lengths.join('|')).assertEqual('4|3|3');
      expect(lengths[0] - lengths[1]).assertEqual(1);
      expect(lengths[1]).assertEqual(lengths[2]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0500
     * @tc.name      testMenuTransition_005
     * @tc.desc      Verify that the menu type order moves from normal through number to special.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_005 begin');
      const sequence: number[] = [MenuType.NORMAL, MenuType.NUMBER, MenuType.SPECIAL];
      let increasing: boolean = true;
      for (let i = 1; i < sequence.length; i++) {
        if (!(sequence[i] > sequence[i - 1])) {
          increasing = false;
        }
      }
      expect(increasing).assertTrue();
      expect(sequence[sequence.length - 1]).assertEqual(MenuType.SPECIAL);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0600
     * @tc.name      testMenuTransition_006
     * @tc.desc      Verify that the key state difference is exactly two and the middle value is one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_006 begin');
      expect(KeyState.LOWER_CASE).assertEqual(0);
      expect(KeyState.UPPER_CASE).assertEqual(2);
      expect(KeyState.LOWER_CASE + KeyState.UPPER_CASE).assertEqual(2);
      expect(KeyState.UPPER_CASE - KeyState.ONCE_UPPER_CASE).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0700
     * @tc.name      testMenuTransition_007
     * @tc.desc      Verify that every switch label starts inside the printable ASCII range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_007 begin');
      const labels: string[] = [MenuKey.NUMBER_KEY, MenuKey.NORMAL_KEY, MenuKey.SPECIAL_KEY];
      let printable: number = 0;
      for (let i = 0; i < labels.length; i++) {
        const code: number = labels[i].charCodeAt(0);
        if (code >= 32 && code <= 126) {
          printable = printable + 1;
        }
      }
      expect(printable).assertEqual(3);
      expect(labels[2].indexOf('=')).assertEqual(0);
      expect(labels[2].indexOf('/')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MENU_TRANSITION_0800
     * @tc.name      testMenuTransition_008
     * @tc.desc      Verify that the three menu types are pairwise distinct through an array scan.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMenuTransition_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_008 begin');
      const values: number[] = [MenuType.NORMAL, MenuType.NUMBER, MenuType.SPECIAL];
      let duplicates: number = 0;
      for (let i = 0; i < values.length; i++) {
        for (let j = i + 1; j < values.length; j++) {
          if (values[i] === values[j]) {
            duplicates = duplicates + 1;
          }
        }
      }
      expect(duplicates).assertEqual(0);
      expect(values.indexOf(MenuType.SPECIAL) - values.indexOf(MenuType.NUMBER)).assertEqual(1);
      expect(values.indexOf(MenuType.NORMAL)).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuTransition_008 end');
      await yieldToEventLoop();
    });

  });
}
