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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputClientPressure]';

export default function clientPressureTest(): void {
  describe('ClientPressureTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0100
     * @tc.name      testClientPressure_001
     * @tc.desc      Verify that a five-kind command cycle of thirty repeats keeps balanced counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 30; i++) {
        InputHandler.getInstance().insertText('a');
        InputHandler.getInstance().deleteBackward(1);
        InputHandler.getInstance().deleteForward(2);
        InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        InputHandler.getInstance().sendKeyFunction();
      }
      const journal: string[] = harness.client.journal;
      expect(journal.length).assertEqual(150);
      expect(journal[149]).assertEqual('enter:0');
      let moveCount: number = 0;
      for (let i = 0; i < journal.length; i++) {
        if (journal[i].indexOf('move:') === 0) {
          moveCount = moveCount + 1;
        }
      }
      expect(moveCount).assertEqual(30);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0200
     * @tc.name      testClientPressure_002
     * @tc.desc      Verify that forty-five insert-copy pairs keep each channel at forty-five.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 45; i++) {
        InputHandler.getInstance().insertText('b');
        InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      }
      expect(harness.client.insertedTexts.length).assertEqual(45);
      expect(harness.client.extendActions.length).assertEqual(45);
      expect(harness.client.journal.length).assertEqual(90);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0300
     * @tc.name      testClientPressure_003
     * @tc.desc      Verify that sixty sessions each hiding once total sixty hide requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_003 begin');
      InputHandler.getInstance().onInputStop();
      let hides: number = 0;
      for (let i = 0; i < 60; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(0);
        InputHandler.getInstance().hideKeyboardSelf();
        hides = hides + harness.keyboard.hideCount;
      }
      expect(hides).assertEqual(60);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0400
     * @tc.name      testClientPressure_004
     * @tc.desc      Verify that thirty-three sessions each forward one cyclic enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_004 begin');
      InputHandler.getInstance().onInputStop();
      let total: number = 0;
      for (let i = 0; i < 33; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(i % 10);
        InputHandler.getInstance().sendKeyFunction();
        total = total + harness.client.keyFunctions.length;
      }
      expect(total).assertEqual(33);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0500
     * @tc.name      testClientPressure_005
     * @tc.desc      Verify that seventeen clients with increasing deletion lengths sum to 153.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_005 begin');
      InputHandler.getInstance().onInputStop();
      let sum: number = 0;
      for (let i = 0; i < 17; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(0);
        InputHandler.getInstance().deleteBackward(i + 1);
        sum = sum + harness.client.backwardLengths[0];
      }
      expect(sum).assertEqual(153);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0600
     * @tc.name      testClientPressure_006
     * @tc.desc      Verify that eighty empty inserts and eighty zero deletions keep two counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 80; i++) {
        InputHandler.getInstance().insertText('');
        InputHandler.getInstance().deleteForward(0);
      }
      expect(harness.client.insertedTexts.length).assertEqual(80);
      expect(harness.client.forwardLengths.length).assertEqual(80);
      expect(harness.client.journal.length).assertEqual(160);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0700
     * @tc.name      testClientPressure_007
     * @tc.desc      Verify that two hundred cycled moves split fifty per direction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const directions: number[] = [inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN, inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT];
      for (let i = 0; i < 200; i++) {
        InputHandler.getInstance().moveCursor(directions[i % 4]);
      }
      const counts: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < harness.client.movedDirections.length; i++) {
        const key: number = harness.client.movedDirections[i];
        counts.set(key, (counts.get(key) ?? 0) + 1);
      }
      expect(counts.size).assertEqual(4);
      expect(counts.get(1)).assertEqual(50);
      expect(harness.client.journal.length).assertEqual(200);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CLIENT_PRESSURE_0800
     * @tc.name      testClientPressure_008
     * @tc.desc      Verify that three round-robin clients each collect one hundred commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testClientPressure_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_008 begin');
      InputHandler.getInstance().onInputStop();
      const clients: ClientHarness[] = [];
      for (let i = 0; i < 3; i++) {
        clients.push(await createClientHarness(0));
      }
      for (let i = 0; i < 300; i++) {
        if (i % 3 === 0) {
          InputHandler.getInstance().onInputStop();
          const target: ClientHarness = clients[(i / 3) % 3];
          InputHandler.getInstance().onInputStart(
            target.keyboard as object as inputMethodEngine.KeyboardController,
            target.client as object as inputMethodEngine.InputClient);
          await Promise.resolve();
          await Promise.resolve();
        }
        InputHandler.getInstance().insertText('q');
      }
      let balanced: number = 0;
      let total: number = 0;
      for (let i = 0; i < clients.length; i++) {
        total = total + clients[i].client.journal.length;
        if (clients[i].client.journal.length > 90) {
          balanced = balanced + 1;
        }
      }
      expect(total).assertEqual(300);
      expect(balanced).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testClientPressure_008 end');
      await yieldToEventLoop();
    });

  });
}
