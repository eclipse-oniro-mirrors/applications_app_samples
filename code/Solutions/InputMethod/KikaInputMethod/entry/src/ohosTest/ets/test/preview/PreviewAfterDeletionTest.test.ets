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
const TAG: string = '[Sample_KikaInputMethodPreviewAfterDeletion]';

export default function previewAfterDeletionTest(): void {
  describe('PreviewAfterDeletionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_AFTER_DELETION_0001
     * @tc.name      testPreviewAfterDeletion_001
     * @tc.desc      Verify that a one-character backward deletion then retyping reopens the preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewAfterDeletion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().insertText('l');
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_AFTER_DELETION_0002
     * @tc.name      testPreviewAfterDeletion_002
     * @tc.desc      Verify that a forward deletion during a preview keeps the buffer and leaves finish alone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewAfterDeletion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.forwardLengths.join('')).assertEqual('1');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.indexOf('hello world') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_AFTER_DELETION_0003
     * @tc.name      testPreviewAfterDeletion_003
     * @tc.desc      Verify that selecting to begin before a deletion does not add another preview call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewAfterDeletion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_AFTER_DELETION_0004
     * @tc.name      testPreviewAfterDeletion_004
     * @tc.desc      Verify that zero forward then one backward deletion precedes a single commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewAfterDeletion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.forwardLengths[0]).assertEqual(0);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_AFTER_DELETION_0005
     * @tc.name      testPreviewAfterDeletion_005
     * @tc.desc      Verify that a two-unit deletion then a two-letter retype opens a second preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewAfterDeletion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_AFTER_DELETION_0006
     * @tc.name      testPreviewAfterDeletion_006
     * @tc.desc      Verify that alternating backward and forward deletions keep one preview and one buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewAfterDeletion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewAfterDeletion_006 end');
      await yieldToEventLoop();
    });

  });
}
