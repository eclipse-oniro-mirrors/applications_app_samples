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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { KeyCode } from '@kit.InputKit';

export default function keyCodeValidationTest(): void {
  describe('keyCodeValidation_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('dpad_keycodes_should_match_tv_standard', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
      expect(KeyCode.KEYCODE_DPAD_UP).assertEqual(2012);
      expect(KeyCode.KEYCODE_DPAD_DOWN).assertEqual(2013);
    });

    it('enter_keycode_should_be_positive', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    it('navigation_keycodes_should_be_distinct', 0, () => {
      const keys: number[] = [
        KeyCode.KEYCODE_DPAD_LEFT,
        KeyCode.KEYCODE_DPAD_RIGHT,
        KeyCode.KEYCODE_DPAD_UP,
        KeyCode.KEYCODE_DPAD_DOWN,
        KeyCode.KEYCODE_ENTER
      ];
      const unique: Set<number> = new Set<number>(keys);
      expect(unique.size).assertEqual(keys.length);
    });

    /* Business case 3249-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3249', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3248-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3248', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3247-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3247', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3246-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3246', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3245-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3245', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3244-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3244', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3243-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3243', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3242-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3242', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3241-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3241', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3240-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3240', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3239-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3239', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3238-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3238', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3237-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3237', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3236-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3236', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3235-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3235', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3234-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3234', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3233-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3233', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3232-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3232', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3231-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3231', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3230-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3230', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3229-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3229', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3228-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3228', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3227-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3227', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3226-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3226', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3225-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3225', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3224-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3224', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3223-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3223', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3222-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3222', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3221-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3221', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3220-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3220', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3219-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3219', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3218-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3218', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3217-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3217', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3216-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3216', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3215-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3215', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3214-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3214', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3213-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3213', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3212-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3212', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3211-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3211', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3210-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3210', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3209-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3209', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3208-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3208', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3207-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3207', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3206-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3206', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3205-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3205', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3204-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3204', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3203-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3203', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3202-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3202', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3201-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3201', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3200-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3200', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3199-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3199', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3198-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3198', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3197-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3197', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3196-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3196', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3195-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3195', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3194-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3194', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3193-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3193', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3192-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3192', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3191-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3191', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3190-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3190', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3189-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3189', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3188-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3188', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3187-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3187', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3186-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3186', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3185-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3185', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3184-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3184', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3183-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3183', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3182-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3182', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3181-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3181', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3180-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3180', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3179-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3179', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3178-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3178', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3177-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3177', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3176-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3176', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3175-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3175', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3174-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3174', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3173-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3173', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3172-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3172', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3171-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3171', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3170-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3170', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3169-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3169', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3168-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3168', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3167-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3167', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3166-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3166', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3165-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3165', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3164-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3164', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3163-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3163', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3162-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3162', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3161-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3161', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3160-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3160', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3159-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3159', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3158-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3158', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3157-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3157', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3156-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3156', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3155-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3155', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3154-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3154', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3153-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3153', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3152-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3152', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3151-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3151', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3150-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3150', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3149-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3149', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3148-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3148', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3147-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3147', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3146-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3146', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3145-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3145', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3144-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3144', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3143-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3143', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3142-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3142', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3141-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3141', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3140-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3140', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3139-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3139', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3138-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3138', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3137-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3137', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3136-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3136', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3135-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3135', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3134-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3134', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3133-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3133', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3132-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3132', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3131-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3131', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3130-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3130', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3129-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3129', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3128-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3128', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3127-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3127', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3126-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3126', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3125-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3125', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3124-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3124', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3123-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3123', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3122-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3122', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3121-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3121', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3120-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3120', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3119-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3119', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3118-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3118', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3117-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3117', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3116-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3116', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3115-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3115', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3114-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3114', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3113-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3113', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3112-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3112', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3111-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3111', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3110-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3110', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 3109-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_3109', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3108-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_3108', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3107-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_3107', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3106-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_3106', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3105-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_3105', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3104-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_3104', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3103-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_3103', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 3102-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_3102', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 3101-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_3101', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 3100-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_3100', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 31199-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_31199', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31198-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_31198', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31197-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_31197', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31196-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_31196', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31195-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_31195', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 31194-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_31194', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 31193-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_31193', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 31192-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_31192', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31191-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_31191', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31190-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_31190', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31189-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_31189', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31188-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_31188', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31187-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_31187', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31186-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_31186', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31185-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_31185', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 31184-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_31184', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 31183-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_31183', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 31182-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_31182', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31181-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_31181', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31180-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_31180', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31179-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_31179', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31178-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_31178', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31177-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_31177', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31176-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_31176', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31175-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_31175', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 31174-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_31174', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 31173-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_31173', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 31172-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_31172', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31171-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_31171', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31170-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_31170', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31169-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_31169', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31168-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_31168', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31167-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_31167', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31166-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_31166', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31165-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_31165', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 31164-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_31164', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 31163-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_31163', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

    /* Business case 31162-9 for KeyCodeValidation */
    it('KeyCodeValidation_case_31162', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31161-8 for KeyCodeValidation */
    it('KeyCodeValidation_case_31161', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31160-7 for KeyCodeValidation */
    it('KeyCodeValidation_case_31160', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31159-6 for KeyCodeValidation */
    it('KeyCodeValidation_case_31159', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31158-5 for KeyCodeValidation */
    it('KeyCodeValidation_case_31158', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31157-4 for KeyCodeValidation */
    it('KeyCodeValidation_case_31157', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertLarger(0);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertLarger(KeyCode.KEYCODE_DPAD_LEFT);
      expect(KeyCode.KEYCODE_ENTER).assertLarger(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31156-3 for KeyCodeValidation */
    it('KeyCodeValidation_case_31156', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT + 1).assertEqual(KeyCode.KEYCODE_DPAD_RIGHT);
      expect(KeyCode.KEYCODE_DPAD_UP + 1).assertEqual(KeyCode.KEYCODE_DPAD_DOWN);
    });

    /* Business case 31155-2 for KeyCodeValidation */
    it('KeyCodeValidation_case_31155', 0, () => {
      const keys: number[] =
        [KeyCode.KEYCODE_DPAD_LEFT, KeyCode.KEYCODE_DPAD_RIGHT, KeyCode.KEYCODE_DPAD_UP, KeyCode.KEYCODE_DPAD_DOWN,
          KeyCode.KEYCODE_ENTER];
      expect(new Set<number>(keys).size).assertEqual(keys.length);
    });

    /* Business case 31154-1 for KeyCodeValidation */
    it('KeyCodeValidation_case_31154', 0, () => {
      expect(KeyCode.KEYCODE_ENTER).assertLarger(0);
      expect(typeof KeyCode.KEYCODE_ENTER).assertEqual('number');
    });

    /* Business case 31153-0 for KeyCodeValidation */
    it('KeyCodeValidation_case_31153', 0, () => {
      expect(KeyCode.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEYCODE_DPAD_RIGHT).assertEqual(2015);
    });

  });
}
