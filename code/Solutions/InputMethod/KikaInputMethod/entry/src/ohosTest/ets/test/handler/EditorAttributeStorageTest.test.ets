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
import inputMethodEngine from '@ohos.inputMethodEngine';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodEditorAttributeStorage]';

export default function editorAttributeStorageTest(): void {
  describe('EditorAttributeStorageTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_ATTRIBUTE_STORAGE_0001
     * @tc.name      testEditorAttributeStorage_001
     * @tc.desc      Verify that both editor fields are published to storage and the type reaches enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeStorage_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3, 4);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(4);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_ATTRIBUTE_STORAGE_0002
     * @tc.name      testEditorAttributeStorage_002
     * @tc.desc      Verify that maximum and minimum editor values are published without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeStorage_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647, -2147483648);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2147483647);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(-2147483648);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_ATTRIBUTE_STORAGE_0003
     * @tc.name      testEditorAttributeStorage_003
     * @tc.desc      Verify that a second attach overwrites both stored values and serves the new editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeStorage_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_003 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1, 2);
      const second: PreviewHarness = await createPreviewHarness('', 9, 8);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.keyFunctions[0]).assertEqual(9);
      expect(first.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_ATTRIBUTE_STORAGE_0004
     * @tc.name      testEditorAttributeStorage_004
     * @tc.desc      Verify that editing commands leave both stored editor values unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeStorage_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5, 6);

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(6);
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EDITOR_ATTRIBUTE_STORAGE_0005
     * @tc.name      testEditorAttributeStorage_005
     * @tc.desc      Verify that two clients with different patterns keep their own enter types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeStorage_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_005 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1, 2);
      InputHandler.getInstance().sendKeyFunction();
      const second: PreviewHarness = await createPreviewHarness('', 9, 8);
      InputHandler.getInstance().sendKeyFunction();

      expect(first.client.keyFunctions.join('')).assertEqual('1');
      expect(second.client.keyFunctions.join('')).assertEqual('9');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);
      expect(first.client.previewCalls.length + second.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeStorage_005 end');
      await yieldToEventLoop();
    });

  });
}
