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
const TAG: string = '[Sample_KikaInputCommandQueue]';

export default function commandQueueTest(): void {
  describe('CommandQueueTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0100
     * @tc.name      testCommandQueue_001
     * @tc.desc      Verify that a hundred mixed commands keep checkpoints at every twenty entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const checkpoints: number[] = [];
      for (let i = 0; i < 100; i++) {
        if (i % 5 === 0) {
          InputHandler.getInstance().insertText('q');
        } else if (i % 5 === 1) {
          InputHandler.getInstance().deleteBackward(1);
        } else if (i % 5 === 2) {
          InputHandler.getInstance().deleteForward(2);
        } else if (i % 5 === 3) {
          InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
        } else {
          InputHandler.getInstance().sendKeyFunction();
        }
        if ((i + 1) % 20 === 0) {
          checkpoints.push(harness.client.journal.length);
        }
      }
      expect(checkpoints.join('|')).assertEqual('20|40|60|80|100');
      expect(harness.client.insertedTexts.length).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0200
     * @tc.name      testCommandQueue_002
     * @tc.desc      Verify that forty insert-hide pairs keep forty editor entries and forty hides.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 40; i++) {
        InputHandler.getInstance().insertText('r');
        InputHandler.getInstance().hideKeyboardSelf();
      }
      expect(harness.client.insertedTexts.length).assertEqual(40);
      expect(harness.client.journal.length).assertEqual(40);
      expect(harness.keyboard.hideCount).assertEqual(40);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0300
     * @tc.name      testCommandQueue_003
     * @tc.desc      Verify that three sessions of twenty commands each keep sixty journal entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_003 begin');
      InputHandler.getInstance().onInputStop();
      let total: number = 0;
      for (let session = 0; session < 3; session++) {
        if (session > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(0);
        for (let i = 0; i < 20; i++) {
          InputHandler.getInstance().insertText('s');
        }
        total = total + harness.client.journal.length;
      }
      expect(total).assertEqual(60);
      expect(total / 3).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0400
     * @tc.name      testCommandQueue_004
     * @tc.desc      Verify that fifty inserts followed by fifty deletions split journal at index fifty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 50; i++) {
        InputHandler.getInstance().insertText('t');
      }
      for (let i = 0; i < 50; i++) {
        InputHandler.getInstance().deleteBackward(1);
      }
      expect(harness.client.journal[49]).assertEqual('insert:t');
      expect(harness.client.journal[50]).assertEqual('back:1');
      expect(harness.client.journal.length).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0500
     * @tc.name      testCommandQueue_005
     * @tc.desc      Verify that ninety alternating moves and copies keep forty-five per channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 90; i++) {
        if (i % 2 === 0) {
          InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
        } else {
          InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
        }
      }
      expect(harness.client.movedDirections.length).assertEqual(45);
      expect(harness.client.extendActions.length).assertEqual(45);
      expect(harness.client.journal.length).assertEqual(90);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0600
     * @tc.name      testCommandQueue_006
     * @tc.desc      Verify that every seventh of seventy commands is a zero deletion with ten hits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 70; i++) {
        if (i % 7 === 0) {
          InputHandler.getInstance().deleteBackward(0);
        } else {
          InputHandler.getInstance().insertText('u');
        }
      }
      expect(harness.client.backwardLengths.length).assertEqual(10);
      expect(harness.client.insertedTexts.length).assertEqual(60);
      expect(harness.client.journal.length).assertEqual(70);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0700
     * @tc.name      testCommandQueue_007
     * @tc.desc      Verify that four sessions of twenty-five enters keep the last four types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_007 begin');
      InputHandler.getInstance().onInputStop();
      const types: number[] = [1, 4, 7, 9];
      const counts: number[] = [];
      for (let i = 0; i < types.length; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(types[i]);
        for (let k = 0; k < 25; k++) {
          InputHandler.getInstance().sendKeyFunction();
        }
        counts.push(harness.client.keyFunctions.length);
      }
      expect(counts.join('|')).assertEqual('25|25|25|25');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_QUEUE_0800
     * @tc.name      testCommandQueue_008
     * @tc.desc      Verify that a hundred twenty modular commands split into four equal kind groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testCommandQueue_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const counts: number[] = [0, 0, 0, 0];
      for (let i = 0; i < 120; i++) {
        const kind: number = i % 4;
        if (kind === 0) {
          InputHandler.getInstance().insertText('w');
        } else if (kind === 1) {
          InputHandler.getInstance().deleteBackward(1);
        } else if (kind === 2) {
          InputHandler.getInstance().deleteForward(1);
        } else {
          InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
        }
        counts[kind] = counts[kind] + 1;
      }
      expect(counts.join('|')).assertEqual('30|30|30|30');
      expect(harness.client.journal.length).assertEqual(120);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandQueue_008 end');
      await yieldToEventLoop();
    });

  });
}
