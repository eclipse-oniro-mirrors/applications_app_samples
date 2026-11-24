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
const TAG: string = '[Sample_KikaInputMethodStress]';

export default function stressTest(): void {
  describe('StressTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0001
     * @tc.name      testStressTest_001
     * @tc.desc      Verify that a single ten-thousand-character insertion is forwarded and measured once.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('start');
      let payload: string = '';
      for (let i = 0; i < 10000; i++) {
        payload = payload + 'a';
      }

      InputHandler.getInstance().insertText(payload);

      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(10000);
      expect(harness.client.buffer.length).assertEqual(10005);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0002
     * @tc.name      testStressTest_002
     * @tc.desc      Verify that two hundred single-character calls keep one ordered insertion record each.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      for (let i = 0; i < 200; i++) {
        InputHandler.getInstance().insertText('a');
      }

      expect(harness.client.insertedTexts.length).assertEqual(200);
      expect(harness.client.buffer.length).assertEqual(200);
      expect(harness.client.insertedTexts.join('')).assertEqual(harness.client.buffer);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0003
     * @tc.name      testStressTest_003
     * @tc.desc      Verify that one hundred deletion calls preserve every requested length in order.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const expected: number[] = [];

      for (let i = 0; i < 100; i++) {
        const length: number = i + 1;
        expected.push(length);
        InputHandler.getInstance().deleteBackward(length);
      }

      expect(harness.client.backwardLengths.length).assertEqual(100);
      expect(harness.client.backwardLengths.join(',')).assertEqual(expected.join(','));
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0004
     * @tc.name      testStressTest_004
     * @tc.desc      Verify that fifty editor attachments leave one live client that receives the later text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_004 begin');
      let last: PreviewHarness = await createPreviewHarness('');

      for (let i = 0; i < 49; i++) {
        last = await createPreviewHarness('');
      }
      InputHandler.getInstance().insertText('z');

      expect(last.client.insertedTexts.join('')).assertEqual('z');
      expect(last.client.privateCommandCount).assertEqual(1);
      expect(last.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0005
     * @tc.name      testStressTest_005
     * @tc.desc      Verify that a trigger at the end of a ten-thousand-character buffer overwrites only three chars.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_005 begin');
      let initial: string = 'he';
      for (let i = 0; i < 9998; i++) {
        initial = initial + 'x';
      }
      const harness: PreviewHarness = await createPreviewHarness(initial);

      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(10000);
      expect(harness.client.previewCalls[0].end).assertEqual(10003);
      expect(harness.client.buffer.length).assertEqual(10011);
      expect(harness.client.buffer.substring(0, 2)).assertEqual('he');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0006
     * @tc.name      testStressTest_006
     * @tc.desc      Verify that one hundred insertions alone keep a single ordered record per call.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('base');

      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().insertText('a');
      }

      expect(harness.client.insertedTexts.length).assertEqual(100);
      expect(harness.client.buffer.length).assertEqual(104);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0007
     * @tc.name      testStressTest_007
     * @tc.desc      Verify that one hundred deletion lengths alone stay ordered and leave the buffer intact.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('base');

      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().deleteBackward(i + 1);
      }

      expect(harness.client.backwardLengths.length).assertEqual(100);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.backwardLengths[99]).assertEqual(100);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('base');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STRESS_0008
     * @tc.name      testStressTest_008
     * @tc.desc      Verify that alternating insert and delete calls keep both counters at one hundred.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testStressTest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('base');

      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().insertText('a');
        InputHandler.getInstance().deleteBackward(1);
      }

      expect(harness.client.insertedTexts.length).assertEqual(100);
      expect(harness.client.backwardLengths.length).assertEqual(100);
      expect(harness.client.buffer.length).assertEqual(104);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressTest_008 end');
      await yieldToEventLoop();
    });

  });

}
