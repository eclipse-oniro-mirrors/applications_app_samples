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
import { createKeyboardController, pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputIntegrationGapScenario]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function integrationGapScenarioTest(): void {
  describe('IntegrationGapScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0100
     * @tc.name      testIntegrationGapScenario_001
     * @tc.desc      Verify that a held shift survives a handler caret move and still uppercases the next letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testIntegrationGapScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      tap(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal.join('|')).assertEqual('move:3|insert:A');
      expect(harness.client.insertedTexts[0]).assertEqual('A');
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0200
     * @tc.name      testIntegrationGapScenario_002
     * @tc.desc      Verify that enter, a caret move and an insertion keep their call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testIntegrationGapScenario_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(4);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().insertText('q');
      expect(harness.client.journal.join('|')).assertEqual('enter:4|move:3|insert:q');
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0300
     * @tc.name      testIntegrationGapScenario_003
     * @tc.desc      Verify that hiding the keyboard does not disturb a following caret move or insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testIntegrationGapScenario_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('m');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().insertText('n');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:m|move:4|insert:n');
      expect(harness.client.insertedTexts.join('')).assertEqual('mn');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0400
     * @tc.name      testIntegrationGapScenario_004
     * @tc.desc      Verify that cut, deletion and paste stay three distinct commands in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIntegrationGapScenario_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions[1]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.backwardLengths.join('')).assertEqual('1');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0500
     * @tc.name      testIntegrationGapScenario_005
     * @tc.desc      Verify that a forward deletion after a client switch lands only on the new client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIntegrationGapScenario_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteForward(2);
      expect(first.client.journal.join('')).assertEqual('insert:a');
      expect(second.client.journal.join('')).assertEqual('forward:2');
      expect(second.client.forwardLengths[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0600
     * @tc.name      testIntegrationGapScenario_006
     * @tc.desc      Verify that an extend action issued after a switch reaches only the new editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIntegrationGapScenario_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_006 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(first.client.extendActions.length).assertEqual(0);
      expect(second.client.extendActions.length).assertEqual(1);
      expect(second.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(first.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0700
     * @tc.name      testIntegrationGapScenario_007
     * @tc.desc      Verify that one backspace after a space keeps the earlier word and adds a correction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIntegrationGapScenario_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      tap(controller, 2050);
      tap(controller, 2018);
      tap(controller, 2071);
      tap(controller, 2019);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert: |insert:b|back:1|insert:c');
      expect(harness.client.insertedTexts.join('')).assertEqual('a bc');
      expect(harness.client.backwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0800
     * @tc.name      testIntegrationGapScenario_008
     * @tc.desc      Verify that a caret-left between two punctuation keys puts the next glyph first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIntegrationGapScenario_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2043);
      tap(controller, 2044);
      tap(controller, 2014);
      tap(controller, 2040);
      expect(harness.client.journal.join('|')).assertEqual('insert:,|insert:.|move:3|insert:x');
      expect(harness.client.insertedTexts.join('')).assertEqual(',.x');
      expect(harness.client.movedDirections[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_0900
     * @tc.name      testIntegrationGapScenario_009
     * @tc.desc      Verify that shift blocks an arrow key and that the arrow works after both releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIntegrationGapScenario_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      expect(pressHardKey(controller, 2014)).assertFalse();
      releaseHardKey(controller, 2014);
      expect(harness.client.movedDirections.length).assertEqual(0);
      releaseHardKey(controller, 2047);
      tap(controller, 2014);
      expect(harness.client.movedDirections.join('')).assertEqual('3');
      expect(harness.client.journal.join('')).assertEqual('move:3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INTEGRATION_GAP_SCENARIO_1000
     * @tc.name      testIntegrationGapScenario_010
     * @tc.desc      Verify that three sessions with different command kinds keep one journal entry each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testIntegrationGapScenario_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_010 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(3);
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(first.client.journal.join('')).assertEqual('insert:x');
      expect(second.client.journal.join('')).assertEqual('back:3');
      expect(third.client.journal.length).assertEqual(1);
      expect(third.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testIntegrationGapScenario_010 end');
      await yieldToEventLoop();
    });

  });

}
