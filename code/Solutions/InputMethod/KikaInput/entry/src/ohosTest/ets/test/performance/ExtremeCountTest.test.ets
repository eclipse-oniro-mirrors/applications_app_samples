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
import { InputHandler, KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';
import { createKeyboardController, pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputExtremeCount]';

export default function extremeCountTest(): void {
  describe('ExtremeCountTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0100
     * @tc.name      testExtremeCount_001
     * @tc.desc      Verify that three hundred thirty-three taps produce that many insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      let count: number = 0;
      while (count < 333) {
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        count = count + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(333);
      expect(count * 1).assertEqual(333);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0200
     * @tc.name      testExtremeCount_002
     * @tc.desc      Verify that seven hundred seventy-seven insert-delete pairs keep both counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 777; i++) {
        InputHandler.getInstance().insertText('z');
        InputHandler.getInstance().deleteBackward(1);
      }
      expect(harness.client.insertedTexts.length).assertEqual(777);
      expect(harness.client.backwardLengths.length).assertEqual(777);
      expect(harness.client.journal.length).assertEqual(1554);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0300
     * @tc.name      testExtremeCount_003
     * @tc.desc      Verify that one thousand one zero deletions stay one thousand one calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let remaining: number = 1001;
      while (remaining > 0) {
        InputHandler.getInstance().deleteForward(0);
        remaining = remaining - 1;
      }
      expect(harness.client.forwardLengths.length).assertEqual(1001);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0400
     * @tc.name      testExtremeCount_004
     * @tc.desc      Verify that five hundred fifty-five cycled moves split 139/139/139/138.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const directions: number[] = [inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN, inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT];
      for (let i = 0; i < 555; i++) {
        InputHandler.getInstance().moveCursor(directions[i % 4]);
      }
      const histogram: number[] = [0, 0, 0, 0];
      for (let i = 0; i < harness.client.movedDirections.length; i++) {
        histogram[harness.client.movedDirections[i] - 1] = histogram[harness.client.movedDirections[i] - 1] + 1;
      }
      expect(histogram.join('|')).assertEqual('139|139|139|138');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0500
     * @tc.name      testExtremeCount_005
     * @tc.desc      Verify that two hundred twenty-two enters all forward the same type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(6);
      for (let i = 0; i < 222; i++) {
        InputHandler.getInstance().sendKeyFunction();
      }
      const distinct: Set<number> = new Set<number>();
      for (let i = 0; i < harness.client.keyFunctions.length; i++) {
        distinct.add(harness.client.keyFunctions[i]);
      }
      expect(distinct.size).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(222);
      expect(distinct.has(6)).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0600
     * @tc.name      testExtremeCount_006
     * @tc.desc      Verify that four hundred forty-four cycled actions split two hundred twenty-two each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 444; i++) {
        const action: number = i % 2 === 0 ? inputMethodEngine.ExtendAction.COPY :
          inputMethodEngine.ExtendAction.PASTE;
        InputHandler.getInstance().sendExtendAction(action);
      }
      let copies: number = 0;
      let pastes: number = 0;
      for (let i = 0; i < harness.client.extendActions.length; i++) {
        if (harness.client.extendActions[i] === inputMethodEngine.ExtendAction.COPY) {
          copies = copies + 1;
        } else {
          pastes = pastes + 1;
        }
      }
      expect(copies).assertEqual(222);
      expect(pastes).assertEqual(222);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0700
     * @tc.name      testExtremeCount_007
     * @tc.desc      Verify that one hundred eleven shift taps leave ten following letters lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      for (let i = 0; i < 111; i++) {
        pressHardKey(controller, 2047);
        releaseHardKey(controller, 2047);
      }
      for (let i = 0; i < 10; i++) {
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('aaaaaaaaaa');
      expect(harness.client.insertedTexts.length).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EXTREME_COUNT_0800
     * @tc.name      testExtremeCount_008
     * @tc.desc      Verify that nine hundred ninety-nine single inserts all reach the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testExtremeCount_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let index: number = 0;
      while (index < 999) {
        InputHandler.getInstance().insertText(String.fromCharCode(97 + (index % 26)));
        index = index + 1;
      }
      expect(harness.client.journal.length).assertEqual(999);
      expect(harness.client.insertedTexts[998].length).assertEqual(1);
      expect(harness.client.insertedTexts[998]).assertEqual('k');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testExtremeCount_008 end');
      await yieldToEventLoop();
    });

  });
}
