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
const TAG: string = '[Sample_KikaInputMethodAttributeCombination]';

export default function attributeCombinationTest(): void {
  describe('AttributeCombinationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_COMBINATION_0001
     * @tc.name      testAttributeCombination_001
     * @tc.desc      Verify that a deferred unsupported editor previews and then forwards one enter after settling.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeCombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false, true);
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      harness.client.resolveAttribute();
      await yieldToEventLoop();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_COMBINATION_0002
     * @tc.name      testAttributeCombination_002
     * @tc.desc      Verify that a rejected private command does not stop editing on a deferred editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeCombination_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, true, true);
      InputHandler.getInstance().insertText('h');
      harness.client.resolveAttribute();
      await Promise.resolve();
      InputHandler.getInstance().insertText('e');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.buffer.endsWith('e')).assertTrue();
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_COMBINATION_0003
     * @tc.name      testAttributeCombination_003
     * @tc.desc      Verify that an unsupported number-pattern editor still publishes both attribute values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeCombination_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2, 5, false);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(5);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer.indexOf('hello world') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_COMBINATION_0004
     * @tc.name      testAttributeCombination_004
     * @tc.desc      Verify that two rejected finishes still forward the maximum enter type twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeCombination_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2147483647);
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('2147483647|2147483647');
      expect(harness.client.finishCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_COMBINATION_0005
     * @tc.name      testAttributeCombination_005
     * @tc.desc      Verify that an unsupported editor recovers previewing once the fault flag clears.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeCombination_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      harness.client.failPreview = true;
      InputHandler.getInstance().insertText('h');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer.indexOf('hello world') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_COMBINATION_0006
     * @tc.name      testAttributeCombination_006
     * @tc.desc      Verify that a deferred editor and a healthy replacement keep separate channel counts.
     * @tc.type      FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributeCombination_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_006 begin');
      const deferred: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      InputHandler.getInstance().insertText('a');
      const healthy: PreviewHarness = await createPreviewHarness('', 0, 0, true);
      InputHandler.getInstance().insertText('b');
      deferred.client.resolveAttribute();
      await Promise.resolve();
      expect(deferred.client.buffer).assertEqual('a');
      expect(healthy.client.buffer).assertEqual('b');
      expect(deferred.client.keyFunctions.length).assertEqual(0);
      expect(healthy.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributeCombination_006 end');
      await yieldToEventLoop();
    });

  });
}
