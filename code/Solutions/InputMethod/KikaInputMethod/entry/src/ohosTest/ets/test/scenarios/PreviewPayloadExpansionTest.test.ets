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
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewPayloadExpansion]';

export default function previewPayloadExpansionTest(): void {
  describe('PreviewPayloadExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0001
     * @tc.name      testPreviewPayloadExpansion_001
     * @tc.desc      Verify that one bulk hel insertion opens exactly one preview through the prefix branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText('hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].text).assertEqual('hello world');
      expect(harness.client.buffer).assertEqual('hehello world');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0002
     * @tc.name      testPreviewPayloadExpansion_002
     * @tc.desc      Verify that an emoji prefix shifts the preview overwrite range by two code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, '😀');
      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(5);
      expect(harness.client.buffer.indexOf('hello world')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0003
     * @tc.name      testPreviewPayloadExpansion_003
     * @tc.desc      Verify that a CJK prefix starts the preview at the next code unit after it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const prefix: string = '中';
      typeSequence(harness, prefix);
      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      const startIndex: number = harness.client.previewCalls[0].start;
      const endIndex: number = harness.client.previewCalls[0].end;
      expect(endIndex - startIndex).assertEqual(3);
      expect(startIndex).assertEqual(prefix.length);
      expect(harness.client.buffer.substring(0, startIndex)).assertEqual(prefix);
      expect(harness.client.buffer.charAt(startIndex - 1)).assertEqual(prefix);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0004
     * @tc.name      testPreviewPayloadExpansion_004
     * @tc.desc      Verify that a negative enter type finishes the preview once and is forwarded as-is.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', -3);
      typeSequence(harness, 'hel');
      const previewText: string = harness.client.buffer;

      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(-3);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual(previewText);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0005
     * @tc.name      testPreviewPayloadExpansion_005
     * @tc.desc      Verify that a caret-left and forward deletion during a preview leave the preview open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.movedDirections[0]).assertEqual(3);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0006
     * @tc.name      testPreviewPayloadExpansion_006
     * @tc.desc      Verify that enter, hide and a later insertion keep three independent counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 6);
      typeSequence(harness, 'hel');
      const beforeInsert: number = harness.client.buffer.length;

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('z');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(beforeInsert + 1);
      expect(harness.client.keyFunctions[0]).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0007
     * @tc.name      testPreviewPayloadExpansion_007
     * @tc.desc      Verify that two plain letters before hel shift the overwrite start by two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'ab');
      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(5);
      expect(harness.client.buffer.substring(0, 2)).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_PAYLOAD_0008
     * @tc.name      testPreviewPayloadExpansion_008
     * @tc.desc      Verify that an empty insertion between h, e and l does not block the preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewPayloadExpansion_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'he');
      InputHandler.getInstance().insertText('');
      typeSequence(harness, 'l');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.insertedTexts[2].length).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewPayloadExpansion_008 end');
      await yieldToEventLoop();
    });

  });
}
