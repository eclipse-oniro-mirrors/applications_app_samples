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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { UIContext, FrameNode, Size as LayoutSize } from '@kit.ArkUI';
import { MyNodeController } from '../../../main/ets/pages/common';
import { logCase } from './shared/TestLog';
import { paceTurn } from './shared/TestPace';

export default function controllerGuardSequence(): void {
  describe('ControllerGuardSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_CONTROLLERGUARDSEQUENCE_0001
     * @tc.name testControllerGuardSequence0001
     * @tc.desc Uninitialized controller stays detached after load and lifecycle callbacks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testControllerGuardSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const controller: MyNodeController = new MyNodeController();
        const context: UIContext = new UIContext();
        const before: FrameNode | null = controller.makeNode(context);
        logCase('testControllerGuardSequence0001', 'uninitialized node=' + JSON.stringify(before));
        expect(before).assertNull();
        controller.loadUrl('https://www.example.com');
        const loaded: FrameNode | null = controller.makeNode(context);
        logCase('testControllerGuardSequence0001',
          'loadUrl without initWeb must remain detached=' + JSON.stringify(loaded));
        expect(loaded).assertNull();
        controller.aboutToAppear();
        const size: LayoutSize = { width: 360, height: 640 };
        controller.aboutToResize(size);
        controller.aboutToDisappear();
        const after: FrameNode | null = controller.makeNode(context);
        logCase('testControllerGuardSequence0001',
          'lifecycle callbacks must not attach a node=' + JSON.stringify(after));
        expect(after).assertNull();
      });

  });
}
