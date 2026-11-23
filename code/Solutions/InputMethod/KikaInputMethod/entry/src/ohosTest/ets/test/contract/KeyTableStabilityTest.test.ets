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
import {
  keySourceListData,
  keySourceListType,
  numberSourceListData,
  symbolSourceListData
} from '../../../../main/ets/model/KeyboardKeyData';
import { pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodKeyTableStability]';

function alphabetText(): string {
  let text: string = '';
  for (let i = 0; i < keySourceListData.length; i++) {
    text = text + keySourceListData[i].content;
  }
  return text;
}

function symbolSum(): number {
  let sum: number = 0;
  for (let i = 0; i < symbolSourceListData.length; i++) {
    sum = sum + symbolSourceListData[i].content.charCodeAt(0);
  }
  return sum;
}

export default function keyTableStabilityTest(): void {
  describe('KeyTableStabilityTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_STABILITY_0001
     * @tc.name      testKeyTableStability_001
     * @tc.desc      Verify that one hundred handler insertions leave the alphabet page unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const before: string = alphabetText();
      let payload: string = '';
      for (let i = 0; i < 100; i++) {
        payload = payload + String.fromCharCode(97 + (i % 26));
      }

      typeSequence(harness, payload);
      expect(harness.client.buffer.length).assertEqual(100);
      expect(alphabetText()).assertEqual(before);
      expect(alphabetText().length).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_STABILITY_0002
     * @tc.name      testKeyTableStability_002
     * @tc.desc      Verify that a preview commit leaves the number and symbol pages unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      let numberBefore: string = '';
      for (let i = 0; i < numberSourceListData.length; i++) {
        numberBefore = numberBefore + numberSourceListData[i].content;
      }
      let symbolBefore: string = '';
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolBefore = symbolBefore + symbolSourceListData[i].content;
      }

      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      let numberAfter: string = '';
      for (let i = 0; i < numberSourceListData.length; i++) {
        numberAfter = numberAfter + numberSourceListData[i].content;
      }
      let symbolAfter: string = '';
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolAfter = symbolAfter + symbolSourceListData[i].content;
      }
      expect(numberAfter).assertEqual(numberBefore);
      expect(symbolAfter).assertEqual(symbolBefore);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_STABILITY_0003
     * @tc.name      testKeyTableStability_003
     * @tc.desc      Verify that a shift run leaves the uppercase column and all page lengths intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_003 begin');
      await createPreviewHarness('');
      let upperBefore: string = '';
      for (let i = 0; i < keySourceListData.length; i++) {
        upperBefore = upperBefore + keySourceListData[i].upperContent;
      }

      pressHardKey(2047);
      for (let i = 0; i < 10; i++) {
        pressHardKey(2017 + i);
        releaseHardKey(2017 + i);
      }
      releaseHardKey(2047);
      let upperAfter: string = '';
      for (let i = 0; i < keySourceListData.length; i++) {
        upperAfter = upperAfter + keySourceListData[i].upperContent;
      }
      expect(upperAfter).assertEqual(upperBefore);
      expect(keySourceListData.length).assertEqual(26);
      expect(numberSourceListData.length).assertEqual(27);
      expect(symbolSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_STABILITY_0004
     * @tc.name      testKeyTableStability_004
     * @tc.desc      Verify that an entry reference still points at the same slot after an edit cycle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_004 begin');
      await createPreviewHarness('');
      const entry: keySourceListType = keySourceListData[0];

      InputHandler.getInstance().insertText('q');
      InputHandler.getInstance().deleteBackward(1);
      expect(entry).assertEqual(keySourceListData[0]);
      expect(entry.content).assertEqual('q');
      expect(entry.upperContent).assertEqual('Q');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_STABILITY_0005
     * @tc.name      testKeyTableStability_005
     * @tc.desc      Verify that the symbol code point sum is unchanged after a mixed edit run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_005 begin');
      await createPreviewHarness('');
      const sumBefore: number = symbolSum();

      InputHandler.getInstance().insertText('1');
      InputHandler.getInstance().deleteForward(3);
      InputHandler.getInstance().insertText('中');
      expect(symbolSum()).assertEqual(sumBefore);
      expect(symbolSum()).assertEqual(54615);
      expect(symbolSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_005 end');
      await yieldToEventLoop();
    });

  });
}
