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
const TAG: string = '[Sample_KikaInputModifierFlowExpansion]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function modifierFlowExpansionTest(): void {
  describe('ModifierFlowExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0100
     * @tc.name      testModifierFlowExpansion_001
     * @tc.desc      Verify that shift blocks a space key and that the space inserts after both releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2050)).assertFalse();
      releaseHardKey(controller, 2050);
      expect(harness.client.journal.length).assertEqual(0);
      releaseHardKey(controller, 2047);
      tap(controller, 2050);
      expect(harness.client.journal.join('')).assertEqual('insert: ');
      expect(harness.client.insertedTexts[0]).assertEqual(' ');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0200
     * @tc.name      testModifierFlowExpansion_002
     * @tc.desc      Verify that enter, an empty insertion and a zero deletion keep three journal entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.journal.join('|')).assertEqual('enter:0|insert:|back:0');
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0300
     * @tc.name      testModifierFlowExpansion_003
     * @tc.desc      Verify that a forward deletion sits between two opposite caret moves.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.journal.join('|')).assertEqual('move:3|forward:1|move:4');
      expect(harness.client.movedDirections.length).assertEqual(2);
      expect(harness.client.movedDirections[1]).assertEqual(
        inputMethodEngine.Direction.CURSOR_RIGHT);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0400
     * @tc.name      testModifierFlowExpansion_004
     * @tc.desc      Verify that an enter between cut and paste keeps the three command slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(9);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.keyFunctions.join('')).assertEqual('9');
      expect(harness.client.journal.length).assertEqual(3);
      expect(harness.client.journal[1]).assertEqual('enter:9');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0500
     * @tc.name      testModifierFlowExpansion_005
     * @tc.desc      Verify that a deletion after returning to the first client stays on that client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(5);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().deleteForward(4);
      expect(first.client.journal.join('|')).assertEqual('insert:a|forward:4');
      expect(second.client.keyFunctions.join('')).assertEqual('5');
      expect(second.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0600
     * @tc.name      testModifierFlowExpansion_006
     * @tc.desc      Verify that a move before a stop stays with the old client and the next insert with the new one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_006 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('n');
      expect(first.client.journal.join('')).assertEqual('move:2');
      expect(second.client.journal.join('')).assertEqual('insert:n');
      expect(first.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0700
     * @tc.name      testModifierFlowExpansion_007
     * @tc.desc      Verify that a negative enter type is forwarded between an insertion and a deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(-1);

      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteForward(2);
      expect(harness.client.journal.join('|')).assertEqual('insert:x|enter:-1|forward:2');
      expect(harness.client.keyFunctions[0]).assertEqual(-1);
      expect(harness.client.forwardLengths[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MODIFIER_FLOW_EXPANSION_0800
     * @tc.name      testModifierFlowExpansion_008
     * @tc.desc      Verify that copy, an insertion and select-all keep both action kinds in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testModifierFlowExpansion_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().insertText('s');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.extendActions[1]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.journal[0].indexOf('extend:')).assertEqual(0);
      expect(harness.client.journal[1]).assertEqual('insert:s');
      expect(harness.client.journal[2].indexOf('extend:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifierFlowExpansion_008 end');
      await yieldToEventLoop();
    });

  });

}
