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

import { afterAll, describe, expect, it } from '@ohos/hypium';
import { KeyEvent } from '@kit.InputKit';
import MyAccessibilityExtensionAbility from '../../../main/ets/accessibilityextensionability/MyAccessibilityExtensionAbility';
import { addLog, runCase } from '../testkit/SharedDriver';

function createKeyEvent(code: number): KeyEvent {
  return { key: { code: code } } as KeyEvent;
}

export default function extensionKeyEventTest(): void {
  describe('ExtensionKeyEventTest', () => {
    afterAll(() => {
      addLog('ExtensionKeyEventTest suite finished');
    })

    /**
     * @tc.number    SUB_A11Y_EXT_KEY_EVENT_0100
     * @tc.name      testExtensionKeyEvent0001
     * @tc.desc      Verify key dispatch intercepts only the configured key code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testExtensionKeyEvent0001', 0, async (done: Function) => {
      await runCase('testExtensionKeyEvent0001', async (): Promise<void> => {
        const ability: MyAccessibilityExtensionAbility = new MyAccessibilityExtensionAbility();

        const intercepted: boolean = ability.onKeyEvent(createKeyEvent(16));
        addLog('testExtensionKeyEvent0001: keyCode=16 intercepted=%{public}s', String(intercepted));
        expect(intercepted).assertTrue();

        const previousKey: boolean = ability.onKeyEvent(createKeyEvent(15));
        addLog('testExtensionKeyEvent0001: keyCode=15 intercepted=%{public}s', String(previousKey));
        expect(previousKey).assertFalse();

        const nextKey: boolean = ability.onKeyEvent(createKeyEvent(17));
        addLog('testExtensionKeyEvent0001: keyCode=17 intercepted=%{public}s', String(nextKey));
        expect(nextKey).assertFalse();

        const zeroKey: boolean = ability.onKeyEvent(createKeyEvent(0));
        addLog('testExtensionKeyEvent0001: keyCode=0 intercepted=%{public}s', String(zeroKey));
        expect(zeroKey).assertFalse();
      }, done);
    });
  });
}
