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
import { InputHandler, KeyboardController } from '../../../../main/ets/model/KeyboardController';
import {
  keySourceListData,
  keySourceListType,
  numberSourceListData,
  symbolSourceListData
} from '../../../../main/ets/model/KeyboardKeyData';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';
import { createKeyboardController, pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputKeyTableStability]';

function tableText(): string {
  let text: string = '';
  for (let i = 0; i < keySourceListData.length; i++) {
    text = text + keySourceListData[i].content + keySourceListData[i].upperContent;
  }
  for (let i = 0; i < numberSourceListData.length; i++) {
    text = text + numberSourceListData[i].content;
  }
  for (let i = 0; i < symbolSourceListData.length; i++) {
    text = text + symbolSourceListData[i].content;
  }
  return text;
}

export default function keyTableStabilityTest(): void {
  describe('KeyTableStabilityTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_TABLE_STABILITY_0100
     * @tc.name      testKeyTableStability_001
     * @tc.desc      Verify that one hundred letter taps leave all three key tables byte-identical.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const before: string = tableText();

      for (let i = 0; i < 100; i++) {
        const code: number = 2017 + (i % 26);
        pressHardKey(controller, code);
        releaseHardKey(controller, code);
      }
      expect(tableText()).assertEqual(before);
      expect(tableText().length).assertEqual(before.length);
      expect(harness.client.insertedTexts.length).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_TABLE_STABILITY_0200
     * @tc.name      testKeyTableStability_002
     * @tc.desc      Verify that handler edits leave the number and symbol pages unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_002 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      let numberText: string = '';
      for (let i = 0; i < numberSourceListData.length; i++) {
        numberText = numberText + numberSourceListData[i].content;
      }
      let symbolText: string = '';
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolText = symbolText + symbolSourceListData[i].content;
      }

      for (let i = 0; i < 20; i++) {
        InputHandler.getInstance().insertText('x');
        InputHandler.getInstance().deleteBackward(1);
      }
      let numberAfter: string = '';
      for (let i = 0; i < numberSourceListData.length; i++) {
        numberAfter = numberAfter + numberSourceListData[i].content;
      }
      let symbolAfter: string = '';
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolAfter = symbolAfter + symbolSourceListData[i].content;
      }
      expect(numberAfter).assertEqual(numberText);
      expect(symbolAfter).assertEqual(symbolText);
      expect(numberSourceListData.length).assertEqual(27);
      expect(symbolSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_TABLE_STABILITY_0300
     * @tc.name      testKeyTableStability_003
     * @tc.desc      Verify that a shift run leaves all three table lengths and the upper column intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_003 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let upperBefore: string = '';
      for (let i = 0; i < keySourceListData.length; i++) {
        upperBefore = upperBefore + keySourceListData[i].upperContent;
      }

      pressHardKey(controller, 2047);
      for (let i = 0; i < 10; i++) {
        pressHardKey(controller, 2017 + i);
        releaseHardKey(controller, 2017 + i);
      }
      releaseHardKey(controller, 2047);
      let upperAfter: string = '';
      for (let i = 0; i < keySourceListData.length; i++) {
        upperAfter = upperAfter + keySourceListData[i].upperContent;
      }
      expect(upperAfter).assertEqual(upperBefore);
      expect(keySourceListData.length).assertEqual(26);
      expect(numberSourceListData.length + symbolSourceListData.length).assertEqual(54);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_TABLE_STABILITY_0400
     * @tc.name      testKeyTableStability_004
     * @tc.desc      Verify that a stored entry reference still points at the same table slot after input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableStability_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_004 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      const entry: keySourceListType = keySourceListData[0];

      InputHandler.getInstance().insertText('q');
      InputHandler.getInstance().deleteBackward(1);
      expect(entry).assertEqual(keySourceListData[0]);
      expect(keySourceListData[0].content).assertEqual('q');
      expect(entry.upperContent).assertEqual('Q');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableStability_004 end');
      await yieldToEventLoop();
    });

  });
}
