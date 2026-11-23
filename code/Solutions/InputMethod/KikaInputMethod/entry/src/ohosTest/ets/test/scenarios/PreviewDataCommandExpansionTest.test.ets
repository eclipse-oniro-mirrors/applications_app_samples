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
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewDataCommandExpansion]';

export default function previewDataCommandExpansionTest(): void {
  describe('PreviewDataCommandExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DATA_COMMAND_0001
     * @tc.name      testPreviewDataCommandExpansion_001
     * @tc.desc      Verify that an empty insertion during a preview reissues the preview request and keeps the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewDataCommandExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const previewBuffer: string = harness.client.buffer;

      InputHandler.getInstance().insertText('');
      expect(harness.client.insertedTexts[harness.client.insertedTexts.length - 1].length).assertEqual(0);
      expect(harness.client.buffer).assertEqual(previewBuffer);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].text).assertEqual('hello world');
      expect(harness.client.previewCalls[1].start).assertEqual(0);
      expect(harness.client.previewCalls[1].end).assertEqual(11);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DATA_COMMAND_0002
     * @tc.name      testPreviewDataCommandExpansion_002
     * @tc.desc      Verify that CRLF appended after a committed preview grows the buffer by two units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewDataCommandExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const committedLength: number = harness.client.buffer.length;

      InputHandler.getInstance().insertText('\r\n');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(committedLength + 2);
      expect(harness.client.insertedTexts[harness.client.insertedTexts.length - 1].length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DATA_COMMAND_0003
     * @tc.name      testPreviewDataCommandExpansion_003
     * @tc.desc      Verify that a tab prefix shifts the preview overwrite start to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewDataCommandExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, '\t');
      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer.charAt(0)).assertEqual('\t');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DATA_COMMAND_0004
     * @tc.name      testPreviewDataCommandExpansion_004
     * @tc.desc      Verify that the maximum enter type is forwarded and finishes one preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewDataCommandExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647);
      typeSequence(harness, 'hel');

      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DATA_COMMAND_0005
     * @tc.name      testPreviewDataCommandExpansion_005
     * @tc.desc      Verify that two caret-end requests during a preview record the same fixed range twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewDataCommandExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      await InputHandler.getInstance().moveCursorToEnd();
      await InputHandler.getInstance().moveCursorToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(1000);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_DATA_COMMAND_0006
     * @tc.name      testPreviewDataCommandExpansion_006
     * @tc.desc      Verify that select-to-end followed by a hundred-unit deletion keeps the preview open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewDataCommandExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      const cursorIndex: number = harness.client.cursor;

      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().deleteBackward(100);
      expect(harness.client.selectedRanges[0].start).assertEqual(cursorIndex);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.backwardLengths[0]).assertEqual(100);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewDataCommandExpansion_006 end');
      await yieldToEventLoop();
    });

  });
}
