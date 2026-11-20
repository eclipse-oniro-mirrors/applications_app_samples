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
const TAG: string = '[Sample_KikaInputSyncExpansionScenario]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function syncExpansionScenarioTest(): void {
  describe('SyncExpansionScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0100
     * @tc.name      testSyncExpansionScenario_001
     * @tc.desc      Verify that backward and forward deletions after a switch split by client journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_001 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(3);
      expect(first.client.journal.join('')).assertEqual('insert:a');
      expect(second.client.journal.join('|')).assertEqual('back:2|forward:3');
      expect(second.client.backwardLengths[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0200
     * @tc.name      testSyncExpansionScenario_002
     * @tc.desc      Verify that an enter after a caret move follows the inserted text in the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2);

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('insert:a|move:3|enter:2');
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0300
     * @tc.name      testSyncExpansionScenario_003
     * @tc.desc      Verify that a hide before a forward deletion leaves the deletion untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().insertText('z');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1|insert:z');
      expect(harness.client.forwardLengths.join('')).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0400
     * @tc.name      testSyncExpansionScenario_004
     * @tc.desc      Verify that a cut between two deletions keeps the three command kinds apart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().deleteForward(2);
      expect(harness.client.backwardLengths.join('')).assertEqual('1');
      expect(harness.client.forwardLengths.join('')).assertEqual('2');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0500
     * @tc.name      testSyncExpansionScenario_005
     * @tc.desc      Verify that a cut and a paste split across two clients keep their own action lists.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(first.client.extendActions.length).assertEqual(1);
      expect(first.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(second.client.extendActions.length).assertEqual(1);
      expect(second.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(first.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0600
     * @tc.name      testSyncExpansionScenario_006
     * @tc.desc      Verify that a pending start still accepts a move and deletion before its callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(3);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteBackward(1);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('p');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('move:3|back:1|insert:p|enter:3');
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0700
     * @tc.name      testSyncExpansionScenario_007
     * @tc.desc      Verify that one deletion between two spaces removes only the trailing space.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      tap(controller, 2050);
      tap(controller, 2050);
      tap(controller, 2018);
      tap(controller, 2071);
      tap(controller, 2019);
      expect(harness.client.insertedTexts.join('')).assertEqual('a  bc');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert: |insert: |insert:b|back:1|insert:c');
      expect(harness.client.backwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SYNC_EXPANSION_SCENARIO_0800
     * @tc.name      testSyncExpansionScenario_008
     * @tc.desc      Verify that a caret move inside a punctuation run leaves the last insertion at the front.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSyncExpansionScenario_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2043);
      tap(controller, 2044);
      tap(controller, 2043);
      tap(controller, 2014);
      tap(controller, 2040);
      expect(harness.client.journal.join('|')).assertEqual('insert:,|insert:.|insert:,|move:3|insert:x');
      expect(harness.client.insertedTexts.join('')).assertEqual(',.,x');
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncExpansionScenario_008 end');
      await yieldToEventLoop();
    });

  });

}
