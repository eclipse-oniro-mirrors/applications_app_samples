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
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodEditorAttribute]';

interface EnterTypeRow {
  enterKeyType: number;
}

export default function editorAttributeForwardingTest(): void {
  describe('EditorAttributeForwardingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_ATTRIBUTE_0001
     * @tc.name      testEditorAttributeForwardingTest_001
     * @tc.desc      Verify that the enter type read at attach time is the value sent by the enter key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorAttributeForwardingTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(4);
      expect(harness.client.finishCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_ATTRIBUTE_0002
     * @tc.name      testEditorAttributeForwardingTest_002
     * @tc.desc      Verify that every enter type survives the attach-read-then-send round trip unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeForwardingTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_002 begin');
      const rows: EnterTypeRow[] = [
        { enterKeyType: 0 },
        { enterKeyType: 1 },
        { enterKeyType: 2 },
        { enterKeyType: 3 },
        { enterKeyType: 4 },
        { enterKeyType: 5 },
        { enterKeyType: 6 }
      ];

      for (let i = 0; i < rows.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness('', rows[i].enterKeyType);
        expect(harness.client.editorAttributeCount).assertEqual(1);
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(rows[i].enterKeyType);

        InputHandler.getInstance().sendKeyFunction();
        expect(harness.client.keyFunctions.length).assertEqual(1);
        expect(harness.client.keyFunctions[0]).assertEqual(rows[i].enterKeyType);
        expect(harness.client.finishCount).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_ATTRIBUTE_0003
     * @tc.name      testEditorAttributeForwardingTest_003
     * @tc.desc      Verify that the input pattern is published per editor and does not alter typed text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeForwardingTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_003 begin');
      const patterns: number[] = [0, 1, 2, 3, 4];

      for (let i = 0; i < patterns.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness('abc', 0, patterns[i]);
        expect(AppStorage.get<number>('inputPattern')).assertEqual(patterns[i]);

        typeSequence(harness, 'xy');
        expect(harness.client.insertedTexts.length).assertEqual(2);
        expect(harness.client.insertedTexts.join('')).assertEqual('xy');
        expect(harness.client.buffer).assertEqual('abcxy');
        expect(harness.client.previewCalls.length).assertEqual(0);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_ATTRIBUTE_0004
     * @tc.name      testEditorAttributeForwardingTest_004
     * @tc.desc      Verify that re-attaching switches the enter type used by the next key submission.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testEditorAttributeForwardingTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_004 begin');
      const first: PreviewHarness = await createPreviewHarness('', 3);
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions[0]).assertEqual(3);

      const second: PreviewHarness = await createPreviewHarness('', 6);
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions.length).assertEqual(1);
      expect(second.client.keyFunctions.length).assertEqual(1);
      expect(second.client.keyFunctions[0]).assertEqual(6);
      expect(second.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeForwardingTest_004 end');
      await yieldToEventLoop();
    });

  });

}
