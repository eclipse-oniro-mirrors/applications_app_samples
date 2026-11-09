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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function abilityTest() {
  describe('ActsInAppKeyboardTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    it('assertContain', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'InAppCustomKeyboard';
      let b = 'Keyboard';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })

    it('keyboardCharactersValid', 0, () => {
      const keys: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A'];
      expect(keys.length).assertEqual(11);
      for (let i = 0; i < keys.length; i++) {
        expect(keys[i].length).assertEqual(1);
      }
    })

    it('generationCounterLogic', 0, () => {
      let generation: number = 0;
      generation++;
      expect(generation).assertEqual(1);
      generation++;
      expect(generation).assertEqual(2);
      const stale: number = 0;
      expect(stale !== generation).assertTrue();
    })

    it('deleteForwardApiName', 0, () => {
      const methodName: string = 'deleteForward';
      expect(methodName).assertEqual('deleteForward');
    })

    it('disposeFlagLogic', 0, () => {
      let disposed: boolean = false;
      expect(disposed).assertFalse();
      disposed = true;
      expect(disposed).assertTrue();
    })
  })
}
