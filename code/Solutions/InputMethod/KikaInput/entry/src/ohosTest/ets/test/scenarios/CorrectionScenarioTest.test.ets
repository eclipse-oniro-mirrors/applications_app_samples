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
const TAG: string = '[Sample_KikaInputCorrectionScenario]';

export default function correctionScenarioTest(): void {
  describe('CorrectionScenarioTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0100
     * @tc.name      testCorrectionScenario_001
     * @tc.desc      Verify that a one-character backspace between two insertions keeps the edit order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const handler: InputHandler = InputHandler.getInstance();

      handler.insertText('a');
      handler.insertText('b');
      handler.deleteBackward(1);
      handler.insertText('c');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:b|back:1|insert:c');
      expect(harness.client.backwardLengths.join('')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0200
     * @tc.name      testCorrectionScenario_002
     * @tc.desc      Verify that two caret-left moves before an insertion stay ahead of the inserted text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const handler: InputHandler = InputHandler.getInstance();

      handler.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handler.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handler.insertText('X');
      expect(harness.client.movedDirections.length).assertEqual(2);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.journal.join('|')).assertEqual('move:3|move:3|insert:X');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0300
     * @tc.name      testCorrectionScenario_003
     * @tc.desc      Verify that a two-character forward deletion precedes the replacement insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().insertText('q');
      expect(harness.client.forwardLengths.join('')).assertEqual('2');
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.journal[0]).assertEqual('forward:2');
      expect(harness.client.journal[1]).assertEqual('insert:q');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0400
     * @tc.name      testCorrectionScenario_004
     * @tc.desc      Verify that an enter issued mid-correction keeps its forwarded type and position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(6);
      const handler: InputHandler = InputHandler.getInstance();

      handler.sendKeyFunction();
      handler.insertText('z');
      expect(harness.client.keyFunctions.join('')).assertEqual('6');
      expect(harness.client.journal.join('|')).assertEqual('enter:6|insert:z');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0500
     * @tc.name      testCorrectionScenario_005
     * @tc.desc      Verify that a hide between two insertions leaves both insertions in the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('m');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('n');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('mn');
      expect(harness.client.journal.join('|')).assertEqual('insert:m|insert:n');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0600
     * @tc.name      testCorrectionScenario_006
     * @tc.desc      Verify that a cut action before a correction insertion is forwarded once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().insertText('o');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.insertedTexts.join('')).assertEqual('o');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0700
     * @tc.name      testCorrectionScenario_007
     * @tc.desc      Verify that a zero-length backward deletion is kept as its own command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().insertText('p');
      expect(harness.client.backwardLengths.join('')).assertEqual('0');
      expect(harness.client.journal[0]).assertEqual('back:0');
      expect(harness.client.journal.length - 2).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CORRECTION_SCENARIO_0800
     * @tc.name      testCorrectionScenario_008
     * @tc.desc      Verify that an empty insertion followed by a deletion keeps both command shapes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testCorrectionScenario_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().deleteBackward(2);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(0);
      expect(harness.client.journal.join('|')).assertEqual('insert:|back:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCorrectionScenario_008 end');
      await yieldToEventLoop();
    });

  });

}
