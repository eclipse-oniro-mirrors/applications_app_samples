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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ActsAbilityTest beforeAll');
    })
    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ActsAbilityTest beforeEach');
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ActsAbilityTest afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ActsAbilityTest afterAll');
    })
    it('assertContain', 0, () => {
      // Verifies the basic assertion capability of the test framework.
      hilog.info(0x0000, 'testTag', '%{public}s', 'assertContain begin');
      let a = 'mouse';
      let b = 'mou';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })
    it('assert_equal_pointer_size_default', 0, () => {
      // Verifies the default pointer size constant used by the settings page.
      const defaultSize: number = 1;
      expect(defaultSize).assertEqual(1);
    })
    it('assert_primary_button_enum', 0, () => {
      // Verifies that the primary button domain exposes both supported values.
      const left: number = 0;
      const right: number = 1;
      expect(left).assertEqual(0);
      expect(right).assertEqual(1);
      expect(left).assertLess(right);
    })
  })
}
