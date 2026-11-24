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
const TAG: string = '[Sample_KikaInputStressSequence]';

export default function stressSequenceTest(): void {
  describe('StressSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_STRESS_SEQUENCE_0100
     * @tc.name      testStressSequence_001
     * @tc.desc      Verify that one thousand letter taps keep one insertion per tap at both ends.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      for (let i = 0; i < 1000; i++) {
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
      }
      expect(harness.client.insertedTexts.length).assertEqual(1000);
      expect(harness.client.journal.length).assertEqual(1000);
      expect(harness.client.insertedTexts.join('').length).assertEqual(1000);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      expect(harness.client.insertedTexts[999]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STRESS_SEQUENCE_0200
     * @tc.name      testStressSequence_002
     * @tc.desc      Verify that five hundred insert-delete pairs alternate two journal kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      for (let i = 0; i < 500; i++) {
        InputHandler.getInstance().insertText('p');
        InputHandler.getInstance().deleteBackward(1);
      }
      let inserts: number = 0;
      let deletes: number = 0;
      for (let i = 0; i < harness.client.journal.length; i++) {
        if (harness.client.journal[i].indexOf('insert:') === 0) {
          inserts = inserts + 1;
        } else {
          deletes = deletes + 1;
        }
      }
      expect(harness.client.journal.length).assertEqual(1000);
      expect(inserts).assertEqual(500);
      expect(deletes).assertEqual(500);
      expect(harness.client.backwardLengths.length).assertEqual(500);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STRESS_SEQUENCE_0300
     * @tc.name      testStressSequence_003
     * @tc.desc      Verify that two hundred shift-held letter pairs all land in the uppercase range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      for (let i = 0; i < 200; i++) {
        pressHardKey(controller, 2047);
        pressHardKey(controller, 2017);
        releaseHardKey(controller, 2017);
        pressHardKey(controller, 2018);
        releaseHardKey(controller, 2018);
        releaseHardKey(controller, 2047);
      }
      let outsideUpper: number = 0;
      for (let i = 0; i < harness.client.insertedTexts.length; i++) {
        const code: number = harness.client.insertedTexts[i].charCodeAt(0);
        if (code < 65 || code > 90) {
          outsideUpper = outsideUpper + 1;
        }
      }
      expect(harness.client.insertedTexts.length).assertEqual(400);
      expect(outsideUpper).assertEqual(0);
      expect(harness.client.insertedTexts[399]).assertEqual('B');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STRESS_SEQUENCE_0400
     * @tc.name      testStressSequence_004
     * @tc.desc      Verify that three hundred moves followed by one hundred inserts split the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      for (let i = 0; i < 300; i++) {
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      }
      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().insertText('m');
      }
      expect(harness.client.journal.length).assertEqual(400);
      expect(harness.client.journal[299].indexOf('move:')).assertEqual(0);
      expect(harness.client.journal[300].indexOf('insert:')).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(300);
      expect(harness.client.insertedTexts.length).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STRESS_SEQUENCE_0500
     * @tc.name      testStressSequence_005
     * @tc.desc      Verify that forty consecutive sessions each keep their own single insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_005 begin');
      InputHandler.getInstance().onInputStop();
      let journalTotal: number = 0;
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < 40; i++) {
        const session: ClientHarness = await createClientHarness(0);
        const text: string = 's' + i;
        InputHandler.getInstance().insertText(text);
        journalTotal = journalTotal + session.client.journal.length;
        seen.add(session.client.insertedTexts[0]);
        InputHandler.getInstance().onInputStop();
      }
      expect(journalTotal).assertEqual(40);
      expect(seen.size).assertEqual(40);
      expect(seen.has('s39')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STRESS_SEQUENCE_0600
     * @tc.name      testStressSequence_006
     * @tc.desc      Verify that four clients interleaved one hundred commands keep balanced journals.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStressSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_006 begin');
      InputHandler.getInstance().onInputStop();
      const clients: ClientHarness[] = [];
      for (let i = 0; i < 4; i++) {
        clients.push(await createClientHarness(i));
      }
      for (let i = 0; i < 100; i++) {
        InputHandler.getInstance().onInputStop();
        const target: ClientHarness = clients[i % 4];
        InputHandler.getInstance().onInputStart(
          target.keyboard as object as inputMethodEngine.KeyboardController,
          target.client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().insertText('q');
      }
      let total: number = 0;
      let balanced: number = 0;
      for (let i = 0; i < clients.length; i++) {
        total = total + clients[i].client.journal.length;
        if (clients[i].client.journal.length === 25) {
          balanced = balanced + 1;
        }
      }
      expect(total).assertEqual(100);
      expect(balanced).assertEqual(4);
      expect(clients[3].client.insertedTexts.length).assertEqual(25);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStressSequence_006 end');
      await yieldToEventLoop();
    });

  });
}
