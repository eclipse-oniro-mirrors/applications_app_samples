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
const TAG: string = '[Sample_KikaInputSessionScenario]';

export default function sessionScenarioTest(): void {
  describe('SessionScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0100
     * @tc.name      testSessionScenario_001
     * @tc.desc      Verify that two sessions with a stop between them split one insertion each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSessionScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_001 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('b');
      expect(first.client.insertedTexts.join('')).assertEqual('a');
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(second.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0200
     * @tc.name      testSessionScenario_002
     * @tc.desc      Verify that an insertion in the stopped gap never reaches the next session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSessionScenario_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_002 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('gap');
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('c');
      expect(first.client.journal.length).assertEqual(0);
      expect(second.client.insertedTexts.join('')).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0300
     * @tc.name      testSessionScenario_003
     * @tc.desc      Verify that reattaching one client keeps its earlier text and appends the new insert.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSessionScenario_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_003 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('y');
      expect(first.client.insertedTexts.join('')).assertEqual('xy');
      expect(first.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0400
     * @tc.name      testSessionScenario_004
     * @tc.desc      Verify that two clients with different types forward their own enter values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSessionScenario_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_004 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(9);
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions.join('')).assertEqual('1');
      expect(second.client.keyFunctions.join('')).assertEqual('9');
      expect(second.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0500
     * @tc.name      testSessionScenario_005
     * @tc.desc      Verify that one hide per session reaches only that session's controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSessionScenario_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(first.keyboard.hideCount).assertEqual(1);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(second.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0600
     * @tc.name      testSessionScenario_006
     * @tc.desc      Verify that a pending start accepts text but drops enter until the callback lands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionScenario_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(3);
      InputHandler.getInstance().insertText('early');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.insertedTexts.join('')).assertEqual('early');
      expect(harness.client.keyFunctions.length).assertEqual(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('')).assertEqual('3');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0700
     * @tc.name      testSessionScenario_007
     * @tc.desc      Verify that a start after two stops still forwards one enter with type five.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSessionScenario_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_007 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(5);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('')).assertEqual('5');
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_SCENARIO_0800
     * @tc.name      testSessionScenario_008
     * @tc.desc      Verify that three consecutive sessions each keep exactly one insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSessionScenario_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_008 begin');
      InputHandler.getInstance().onInputStop();
      const clients: ClientHarness[] = [];
      clients.push(await createClientHarness(0));
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      clients.push(await createClientHarness(0));
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().onInputStop();
      clients.push(await createClientHarness(0));
      InputHandler.getInstance().insertText('c');
      let journalTotal: number = 0;
      for (let i = 0; i < clients.length; i++) {
        journalTotal = journalTotal + clients[i].client.journal.length;
      }
      expect(journalTotal).assertEqual(3);
      expect(clients[1].client.insertedTexts.join('')).assertEqual('b');
      expect(clients[2].client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionScenario_008 end');
      await yieldToEventLoop();
    });

  });

}
