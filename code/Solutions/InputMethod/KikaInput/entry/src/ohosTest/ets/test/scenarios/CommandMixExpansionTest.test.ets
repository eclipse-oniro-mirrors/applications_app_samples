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
import { ClientHarness, createClientHarness, FakeKeyboardController } from '../support/ClientHarness';
import { createKeyboardController, inputHardKeyValue, pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputCommandMixExpansion]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function CommandMixExpansionTestTest(): void {
  describe('CommandMixExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXPANSION_0100
     * @tc.name      testCommandMixExpansion_001
     * @tc.desc      Verify that a deletion, a caret move and a typed enter keep their order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(9);

      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('back:2|move:3|enter:9');
      expect(harness.client.keyFunctions[0]).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXPANSION_0200
     * @tc.name      testCommandMixExpansion_002
     * @tc.desc      Verify that a cut followed by a hide and an insertion keeps two editor entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('t');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('t');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXPANSION_0300
     * @tc.name      testCommandMixExpansion_003
     * @tc.desc      Verify that returning to the first client preserves both of its enter calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_003 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(6);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions.join('|')).assertEqual('1|1');
      expect(second.client.keyFunctions.join('')).assertEqual('6');
      expect(first.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXPANSION_0400
     * @tc.name      testCommandMixExpansion_004
     * @tc.desc      Verify that a zero deletion, a zero enter and a hide keep three independent counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.backwardLengths.join('')).assertEqual('0');
      expect(harness.client.keyFunctions.join('')).assertEqual('0');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXPANSION_0500
     * @tc.name      testCommandMixExpansion_005
     * @tc.desc      Verify that an empty insertion stays with the old client after a switch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('b');
      expect(first.client.journal.join('')).assertEqual('insert:');
      expect(second.client.journal.join('')).assertEqual('insert:b');
      expect(first.client.insertedTexts.length).assertEqual(1);
      expect(second.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXPANSION_0600
     * @tc.name      testCommandMixExpansion_006
     * @tc.desc      Verify that two controllers with a handler move between them share one journal order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const first: KeyboardController = createKeyboardController();
      const second: KeyboardController = createKeyboardController();

      tap(first, 2017);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      tap(second, 2018);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|move:3|insert:b');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExpansion_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0100
     * @tc.name      testCommandMixExtra_001
     * @tc.desc      Verify that a handler deletion between two physical taps keeps all three commands in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      InputHandler.getInstance().deleteBackward(1);
      tap(controller, 2019);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|back:1|insert:c');
      expect(harness.client.insertedTexts.join('')).assertEqual('ac');
      expect(harness.client.backwardLengths.join('|')).assertEqual('1');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0200
     * @tc.name      testCommandMixExtra_002
     * @tc.desc      Verify that a physical right arrow splits two handler insertions without changing their text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      InputHandler.getInstance().insertText('x');
      inputHardKeyValue(controller, 'KEYCODE_DPAD_RIGHT', 2015);
      InputHandler.getInstance().insertText('y');
      const expectedMove: string = 'move:' + inputMethodEngine.Direction.CURSOR_RIGHT;
      expect(harness.client.journal.join('|')).assertEqual('insert:x|' + expectedMove + '|insert:y');
      expect(harness.client.insertedTexts.join('')).assertEqual('xy');
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0300
     * @tc.name      testCommandMixExtra_003
     * @tc.desc      Verify that a held shift letter and a following select-all reach the editor as two kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      tap(controller, 2033);
      releaseHardKey(controller, 2047);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.insertedTexts.join('')).assertEqual('Q');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0400
     * @tc.name      testCommandMixExtra_004
     * @tc.desc      Verify that two physical delete tokens and one handler insertion keep their delete kinds apart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      InputHandler.getInstance().insertText('k');
      inputHardKeyValue(controller, 'KEYCODE_FORWARD_DEL', 2071);
      expect(harness.client.journal.join('|')).assertEqual('forward:1|insert:k|back:1');
      expect(harness.client.forwardLengths.join('')).assertEqual('1');
      expect(harness.client.backwardLengths.join('')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('k');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0500
     * @tc.name      testCommandMixExtra_005
     * @tc.desc      Verify that a physical key after a reattach lands on the recovered first client only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(3);
      const second: ClientHarness = await createClientHarness(4);
      const controller: KeyboardController = createKeyboardController();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();

      tap(controller, 2036);
      expect(first.client.insertedTexts.join('')).assertEqual('t');
      expect(first.client.journal.length).assertEqual(1);
      expect(second.client.journal.length).assertEqual(0);
      expect(first.client.editorAttributeCount).assertEqual(2);
      expect(second.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0600
     * @tc.name      testCommandMixExtra_006
     * @tc.desc      Verify that a tap, an extend action, an insertion, an arrow and a tap fill five journal slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().insertText('z');
      inputHardKeyValue(controller, 'KEYCODE_DPAD_UP', 2012);
      tap(controller, 2018);
      const expected: string = 'insert:a|extend:' + inputMethodEngine.ExtendAction.PASTE +
        '|insert:z|move:' + inputMethodEngine.Direction.CURSOR_UP + '|insert:b';
      expect(harness.client.journal.join('|')).assertEqual(expected);
      expect(harness.client.insertedTexts.join('')).assertEqual('azb');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0700
     * @tc.name      testCommandMixExtra_007
     * @tc.desc      Verify that a physical space stays a one-unit payload before a forward deletion and an insert.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, ' ', 2050);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      InputHandler.getInstance().insertText('x');
      expect(harness.client.journal.join('|')).assertEqual('insert: |forward:1|insert:x');
      expect(harness.client.insertedTexts[0]).assertEqual(' ');
      expect(harness.client.insertedTexts[0].length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0800
     * @tc.name      testCommandMixExtra_008
     * @tc.desc      Verify that a handler enter between two physical letters uses the harness enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(5);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      InputHandler.getInstance().sendKeyFunction();
      tap(controller, 2018);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|enter:5|insert:b');
      expect(harness.client.keyFunctions.join('')).assertEqual('5');
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_0900
     * @tc.name      testCommandMixExtra_009
     * @tc.desc      Verify that an empty hard-key token is recorded as an empty insertion before real text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const routed: boolean = inputHardKeyValue(controller, '', 2017);
      InputHandler.getInstance().insertText('x');
      expect(routed).assertTrue();
      expect(harness.client.journal[0]).assertEqual('insert:');
      expect(harness.client.insertedTexts.join('|')).assertEqual('|x');
      expect(harness.client.insertedTexts[0].length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1000
     * @tc.name      testCommandMixExtra_010
     * @tc.desc      Verify that a physical tap in a stopped gap is dropped and the next session receives a new tap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_010 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      InputHandler.getInstance().onInputStop();
      tap(controller, 2017);
      const second: ClientHarness = await createClientHarness(0);
      tap(controller, 2018);

      expect(first.client.journal.length).assertEqual(0);
      expect(first.client.editorAttributeCount).assertEqual(1);
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(second.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1100
     * @tc.name      testCommandMixExtra_011
     * @tc.desc      Verify that two controllers tapping one code each report interception and append two payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const first: KeyboardController = createKeyboardController();
      const second: KeyboardController = createKeyboardController();

      const firstDown: boolean = pressHardKey(first, 2017);
      releaseHardKey(first, 2017);
      const secondDown: boolean = pressHardKey(second, 2017);
      releaseHardKey(second, 2017);
      expect(firstDown).assertTrue();
      expect(secondDown).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('aa');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1200
     * @tc.name      testCommandMixExtra_012
     * @tc.desc      Verify that a physical comma between a backward and a forward deletion keeps the punctuation payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, ',', 2043);
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:,|back:1|forward:1');
      expect(harness.client.insertedTexts[0]).assertEqual(',');
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1300
     * @tc.name      testCommandMixExtra_013
     * @tc.desc      Verify that a handler left move between two physical letters keeps the move slot in the middle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2024);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      tap(controller, 2025);
      const expected: string = 'insert:h|move:' + inputMethodEngine.Direction.CURSOR_LEFT + '|insert:i';
      expect(harness.client.journal.join('|')).assertEqual(expected);
      expect(harness.client.insertedTexts.join('')).assertEqual('hi');
      expect(harness.client.movedDirections.join('')).assertEqual(
        '' + inputMethodEngine.Direction.CURSOR_LEFT);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1400
     * @tc.name      testCommandMixExtra_014
     * @tc.desc      Verify that a first client recovered after a second session keeps its old and new payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_014 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1);
      const controller: KeyboardController = createKeyboardController();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();

      tap(controller, 2040);
      InputHandler.getInstance().insertText('y');
      expect(first.client.insertedTexts.join('|')).assertEqual('a|x|y');
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(first.client.editorAttributeCount).assertEqual(2);
      expect(second.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1500
     * @tc.name      testCommandMixExtra_015
     * @tc.desc      Verify that a hide between two physical punctuation keys reaches the panel once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2043);
      InputHandler.getInstance().hideKeyboardSelf();
      tap(controller, 2044);
      expect(harness.client.journal.join('|')).assertEqual('insert:,|insert:.');
      expect(harness.client.insertedTexts.join('')).assertEqual(',.');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.extendActions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1600
     * @tc.name      testCommandMixExtra_016
     * @tc.desc      Verify that an enter after a physical letter forwards the harness type and pattern storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(6, 9);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('insert:a|enter:6');
      expect(harness.client.keyFunctions.join('')).assertEqual('6');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(6);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1700
     * @tc.name      testCommandMixExtra_017
     * @tc.desc      Verify that an unknown symbolic token is inserted literally and then survives a deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'KEYCODE_UNKNOWN', 9999);
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_UNKNOWN');
      expect(harness.client.journal.join('|')).assertEqual('insert:KEYCODE_UNKNOWN|back:1');
      expect(harness.client.insertedTexts[0].length).assertEqual(15);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1800
     * @tc.name      testCommandMixExtra_018
     * @tc.desc      Verify that a handler insertion ignores a held shift while the following physical letter uppercases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().insertText('m');
      tap(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal.join('|')).assertEqual('insert:m|insert:A');
      expect(harness.client.insertedTexts.join('')).assertEqual('mA');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_1900
     * @tc.name      testCommandMixExtra_019
     * @tc.desc      Verify that a key released after a stop delivers nothing and the next session starts clean.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_019 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      InputHandler.getInstance().onInputStop();
      releaseHardKey(controller, 2017);
      const second: ClientHarness = await createClientHarness(0);

      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      expect(first.client.journal.join('')).assertEqual('insert:a');
      expect(second.client.journal.join('')).assertEqual('insert:b');
      expect(second.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_2000
     * @tc.name      testCommandMixExtra_020
     * @tc.desc      Verify that two extend actions alternate with physical letters and a trailing deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2017);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      tap(controller, 2018);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().deleteBackward(3);
      const expected: string = 'insert:a|extend:' + inputMethodEngine.ExtendAction.CUT +
        '|insert:b|extend:' + inputMethodEngine.ExtendAction.PASTE + '|back:3';
      expect(harness.client.journal.join('|')).assertEqual(expected);
      expect(harness.client.extendActions.join('|')).assertEqual(
        inputMethodEngine.ExtendAction.CUT + '|' + inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.backwardLengths[0]).assertEqual(3);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_2100
     * @tc.name      testCommandMixExtra_021
     * @tc.desc      Verify that two handler enters issued before a physical letter keep both types ahead of the glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_021 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(7);
      const controller: KeyboardController = createKeyboardController();

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      tap(controller, 2024);
      expect(harness.client.journal.join('|')).assertEqual('enter:7|enter:7|insert:h');
      expect(harness.client.keyFunctions.join('|')).assertEqual('7|7');
      expect(harness.client.insertedTexts.join('')).assertEqual('h');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_2200
     * @tc.name      testCommandMixExtra_022
     * @tc.desc      Verify that a center-key token becomes literal text between a backward and a forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_022 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      InputHandler.getInstance().deleteBackward(1);
      const handled: boolean = pressHardKey(controller, 2016);
      releaseHardKey(controller, 2016);
      InputHandler.getInstance().deleteForward(2);
      expect(handled).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.insertedTexts[0].length).assertEqual(19);
      expect(harness.client.journal.join('|')).assertEqual(
        'back:1|insert:KEYCODE_DPAD_CENTER|forward:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_2300
     * @tc.name      testCommandMixExtra_023
     * @tc.desc      Verify that a recovered session with a replacement keyboard accepts a key and hides there.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_023 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const replacement: FakeKeyboardController = new FakeKeyboardController();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        replacement as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();

      tap(controller, 2033);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.insertedTexts.join('')).assertEqual('q');
      expect(replacement.hideCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_2400
     * @tc.name      testCommandMixExtra_024
     * @tc.desc      Verify that two backward deletions separated by a physical space keep the space between them.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_024 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      InputHandler.getInstance().deleteBackward(1);
      inputHardKeyValue(controller, ' ', 2050);
      InputHandler.getInstance().deleteBackward(2);
      expect(harness.client.journal.join('|')).assertEqual('back:1|insert: |back:2');
      expect(harness.client.backwardLengths.join('|')).assertEqual('1|2');
      expect(harness.client.insertedTexts[0]).assertEqual(' ');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_2500
     * @tc.name      testCommandMixExtra_025
     * @tc.desc      Verify that an enter issued before a shifted letter keeps the enter first and the letter uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_025 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2);
      const controller: KeyboardController = createKeyboardController();

      InputHandler.getInstance().sendKeyFunction();
      pressHardKey(controller, 2047);
      tap(controller, 2033);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal[0]).assertEqual('enter:2');
      expect(harness.client.insertedTexts.join('')).assertEqual('Q');
      expect(harness.client.keyFunctions.join('')).assertEqual('2');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_MIX_EXTRA_2600
     * @tc.name      testCommandMixExtra_026
     * @tc.desc      Verify that a hide and an enter around one physical letter keep panel and editor counters separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandMixExtra_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_026 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(1);
      const controller: KeyboardController = createKeyboardController();

      tap(controller, 2018);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('insert:b|enter:1');
      expect(harness.client.keyFunctions.join('')).assertEqual('1');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandMixExtra_026 end');
      await yieldToEventLoop();
    });

  });
}
