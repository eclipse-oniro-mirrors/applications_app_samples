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
const TAG: string = '[Sample_KikaInputMethodPatternRouting]';

export default function patternRoutingTest(): void {
  describe('PatternRoutingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PATTERN_ROUTING_0001
     * @tc.name      testPatternRouting_001
     * @tc.desc      Verify that a text-pattern attach publishes its pattern while defaulting the enter key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPatternRouting_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PATTERN_ROUTING_0002
     * @tc.name      testPatternRouting_002
     * @tc.desc      Verify that a later attach overwrites both the pattern and the enter key values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPatternRouting_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_002 begin');
      await createPreviewHarness('', 1, 2);
      const second: PreviewHarness = await createPreviewHarness('', 6, 5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(5);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(6);
      expect(second.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PATTERN_ROUTING_0003
     * @tc.name      testPatternRouting_003
     * @tc.desc      Verify that typing neither rewrites the published pattern nor the enter key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPatternRouting_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4, 3);
      InputHandler.getInstance().insertText('p');
      InputHandler.getInstance().insertText('q');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(3);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(harness.client.buffer).assertEqual('pq');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PATTERN_ROUTING_0004
     * @tc.name      testPatternRouting_004
     * @tc.desc      Verify that a zero-pattern attach resets a previously published number pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPatternRouting_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_004 begin');
      await createPreviewHarness('', 0, 2);
      InputHandler.getInstance().insertText('7');
      const reset: PreviewHarness = await createPreviewHarness('', 0, 0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);
      expect(reset.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PATTERN_ROUTING_0005
     * @tc.name      testPatternRouting_005
     * @tc.desc      Verify that reattaching the same pattern keeps preview active for new keystrokes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPatternRouting_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_005 begin');
      await createPreviewHarness('', 0, 1);
      InputHandler.getInstance().insertText('a');
      const again: PreviewHarness = await createPreviewHarness('', 0, 1);
      typeSequence(again, 'hel');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1);
      expect(again.client.previewCalls.length).assertEqual(1);
      expect(again.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PATTERN_ROUTING_0006
     * @tc.name      testPatternRouting_006
     * @tc.desc      Verify that pattern and enter key travel independently into the key request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPatternRouting_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 7, 9);
      InputHandler.getInstance().insertText('k');
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);
      expect(harness.client.keyFunctions[0]).assertEqual(7);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPatternRouting_006 end');
      await yieldToEventLoop();
    });

  });
}
