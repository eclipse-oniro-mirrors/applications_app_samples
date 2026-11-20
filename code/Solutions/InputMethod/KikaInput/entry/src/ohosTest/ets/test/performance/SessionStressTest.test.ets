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
const TAG: string = '[Sample_KikaInputSessionStress]';

export default function sessionStressTest(): void {
  describe('SessionStressTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0100
     * @tc.name      testSessionStress_001
     * @tc.desc      Verify that seven sessions of five insertions each total thirty-five commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_001 begin');
      InputHandler.getInstance().onInputStop();
      let total: number = 0;
      for (let session = 0; session < 7; session++) {
        const harness: ClientHarness = await createClientHarness(session);
        for (let i = 0; i < 5; i++) {
          InputHandler.getInstance().insertText('v');
        }
        total = total + harness.client.journal.length;
        InputHandler.getInstance().onInputStop();
      }
      expect(total).assertEqual(35);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0200
     * @tc.name      testSessionStress_002
     * @tc.desc      Verify that thirteen clients with two commands each keep twenty-six journal entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_002 begin');
      InputHandler.getInstance().onInputStop();
      const clients: ClientHarness[] = [];
      for (let i = 0; i < 13; i++) {
        clients.push(await createClientHarness(0));
      }
      for (let i = 0; i < 13; i++) {
        InputHandler.getInstance().onInputStop();
        InputHandler.getInstance().onInputStart(
          clients[i].keyboard as object as inputMethodEngine.KeyboardController,
          clients[i].client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().insertText('a');
        InputHandler.getInstance().deleteBackward(1);
      }
      let sum: number = 0;
      for (let i = 0; i < clients.length; i++) {
        sum = sum + clients[i].client.journal.length;
      }
      expect(sum).assertEqual(26);
      expect(clients[12].client.journal.join('|')).assertEqual('insert:a|back:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0300
     * @tc.name      testSessionStress_003
     * @tc.desc      Verify that twenty-nine stop-start cycles keep one insertion per cycle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_003 begin');
      InputHandler.getInstance().onInputStop();
      let commands: number = 0;
      for (let i = 0; i < 29; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(i % 3);
        InputHandler.getInstance().insertText('c');
        commands = commands + harness.client.journal.length;
      }
      expect(commands).assertEqual(29);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0400
     * @tc.name      testSessionStress_004
     * @tc.desc      Verify that seventeen pending starts each deliver one insertion after resolution.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_004 begin');
      InputHandler.getInstance().onInputStop();
      let delivered: number = 0;
      for (let i = 0; i < 17; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const pending: ClientHarness = new ClientHarness(i);
        InputHandler.getInstance().insertText('p');
        delivered = delivered + pending.client.journal.length;
        await Promise.resolve();
        await Promise.resolve();
      }
      expect(delivered).assertEqual(17);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(16);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0500
     * @tc.name      testSessionStress_005
     * @tc.desc      Verify that eleven alternating enter-hide sessions keep both counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_005 begin');
      InputHandler.getInstance().onInputStop();
      let enters: number = 0;
      let hides: number = 0;
      for (let i = 0; i < 11; i++) {
        InputHandler.getInstance().onInputStop();
        const harness: ClientHarness = await createClientHarness(i);
        if (i % 2 === 0) {
          InputHandler.getInstance().sendKeyFunction();
          enters = enters + harness.client.keyFunctions.length;
        } else {
          InputHandler.getInstance().hideKeyboardSelf();
          hides = hides + harness.keyboard.hideCount;
        }
      }
      expect(enters).assertEqual(6);
      expect(hides).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0600
     * @tc.name      testSessionStress_006
     * @tc.desc      Verify that nine client switches route deletion lengths to the active client only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_006 begin');
      InputHandler.getInstance().onInputStop();
      const clients: ClientHarness[] = [];
      for (let i = 0; i < 9; i++) {
        clients.push(await createClientHarness(0));
      }
      for (let i = 0; i < 9; i++) {
        InputHandler.getInstance().onInputStop();
        InputHandler.getInstance().onInputStart(
          clients[i].keyboard as object as inputMethodEngine.KeyboardController,
          clients[i].client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().deleteForward(i + 1);
      }
      expect(clients[8].client.forwardLengths.join('')).assertEqual('9');
      expect(clients[0].client.forwardLengths.join('')).assertEqual('1');
      let lengths: number = 0;
      for (let i = 0; i < clients.length; i++) {
        lengths = lengths + clients[i].client.forwardLengths.length;
      }
      expect(lengths).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0700
     * @tc.name      testSessionStress_007
     * @tc.desc      Verify that twenty-three zero deletions across sessions never change text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_007 begin');
      InputHandler.getInstance().onInputStop();
      let zeros: number = 0;
      for (let i = 0; i < 23; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(0);
        InputHandler.getInstance().deleteBackward(0);
        zeros = zeros + harness.client.backwardLengths.length;
        expect(harness.client.insertedTexts.length).assertEqual(0);
      }
      expect(zeros).assertEqual(23);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_STRESS_0800
     * @tc.name      testSessionStress_008
     * @tc.desc      Verify that six sessions of three inserts and three deletions keep thirty-six commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionStress_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_008 begin');
      InputHandler.getInstance().onInputStop();
      let total: number = 0;
      for (let session = 0; session < 6; session++) {
        if (session > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(0);
        for (let i = 0; i < 3; i++) {
          InputHandler.getInstance().insertText('w');
          InputHandler.getInstance().deleteBackward(i);
        }
        total = total + harness.client.journal.length;
      }
      expect(total).assertEqual(36);
      expect(total / 6).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionStress_008 end');
      await yieldToEventLoop();
    });

  });
}
