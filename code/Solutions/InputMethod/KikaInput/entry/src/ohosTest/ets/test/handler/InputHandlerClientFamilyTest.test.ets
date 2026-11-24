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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness, FakeInputClient, FakeKeyboardController } from '../support/ClientHarness';
import { yieldToEventLoop } from '../support/AsyncSupport';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputInputHandlerClient]';

export default function InputHandlerClientFamilyTestTest(): void {
  describe('InputHandlerClientFamilyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0100
     * @tc.name      testInputHandlerClient_001
     * @tc.desc      Verify that an empty payload still produces exactly one insertion call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_001 begin');
      const harness: ClientHarness = await createClientHarness(0);

      // The empty string is a valid payload and must not be dropped before the client.
      InputHandler.getInstance().insertText('');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('');
      expect(harness.client.journal.join('|')).assertEqual('insert:');
      expect(harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0200
     * @tc.name      testInputHandlerClient_002
     * @tc.desc      Verify that space, newline and tab payloads keep their exact characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_002 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      // Whitespace must not be trimmed or normalized on the way to the editor.
      handlerRef.insertText(' ');
      handlerRef.insertText('\n');
      handlerRef.insertText('\t');
      expect(harness.client.insertedTexts[0]).assertEqual(' ');
      expect(harness.client.insertedTexts[1]).assertEqual('\n');
      expect(harness.client.insertedTexts[2]).assertEqual('\t');
      expect(harness.client.journal.join('|')).assertEqual('insert: |insert:\n|insert:\t');
      expect(harness.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0300
     * @tc.name      testInputHandlerClient_003
     * @tc.desc      Verify that a long text payload is forwarded whole without truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_003 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const payload: string = 'long text 0123456789';

      // The whole payload survives one insertion call.
      InputHandler.getInstance().insertText(payload);
      expect(editorRef.insertedTexts[0].length).assertEqual(20);
      expect(editorRef.insertedTexts.length).assertEqual(1);
      expect(editorRef.insertedTexts[0]).assertEqual(payload);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0400
     * @tc.name      testInputHandlerClient_004
     * @tc.desc      Verify that a symbol payload is inserted without escaping or case changes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClient_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_004 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('!@#$<>[]');
      expect(harness.client.journal.join('|')).assertEqual('insert:!@#$<>[]');
      expect(harness.client.insertedTexts[0]).assertEqual('!@#$<>[]');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0500
     * @tc.name      testInputHandlerClient_005
     * @tc.desc      Verify that the same payload inserted twice produces two ordered calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClient_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_005 begin');
      const harness: ClientHarness = await createClientHarness(0);

      // No de-duplication is allowed at the handler layer.
      handlerRef.insertText('ab');
      handlerRef.insertText('ab');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.insertedTexts[0]).assertEqual('ab');
      expect(harness.client.insertedTexts[1]).assertEqual('ab');
      expect(harness.client.journal.join('|')).assertEqual('insert:ab|insert:ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0600
     * @tc.name      testInputHandlerClient_006
     * @tc.desc      Verify that a zero-length backward deletion is still sent to the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_006 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      // Zero is a boundary value: the handler does not reject it locally.
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.journal.join('|')).assertEqual('back:0');
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0700
     * @tc.name      testInputHandlerClient_007
     * @tc.desc      Verify that a one-unit forward deletion reaches the editor with length one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_007 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().deleteForward(1);
      expect(editorRef.forwardLengths.length).assertEqual(1);
      expect(editorRef.forwardLengths[0]).assertEqual(1);
      expect(editorRef.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0800
     * @tc.name      testInputHandlerClient_008
     * @tc.desc      Verify that a short deletion run keeps each backward length in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_008 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      // Three different lengths must remain three separate commands.
      handlerRef.deleteBackward(2);
      handlerRef.deleteBackward(3);
      handlerRef.deleteBackward(5);
      expect(harness.client.backwardLengths.join('|')).assertEqual('2|3|5');
      expect(harness.client.journal.join('|')).assertEqual('back:2|back:3|back:5');
      expect(harness.client.backwardLengths.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_0900
     * @tc.name      testInputHandlerClient_009
     * @tc.desc      Verify that large forward deletion lengths are forwarded without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClient_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_009 begin');
      const harness: ClientHarness = await createClientHarness(0);

      // Very large lengths must not be reduced to a smaller editor request.
      InputHandler.getInstance().deleteForward(50);
      InputHandler.getInstance().deleteForward(100);
      InputHandler.getInstance().deleteForward(1000);
      expect(harness.client.journal.join('|')).assertEqual('forward:50|forward:100|forward:1000');
      expect(harness.client.forwardLengths.length).assertEqual(3);
      expect(harness.client.forwardLengths[2]).assertEqual(1000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_1000
     * @tc.name      testInputHandlerClient_010
     * @tc.desc      Verify that a four-direction caret journey keeps the issued order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_010 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      // Four directions in one journey: no direction may overwrite another.
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.movedDirections[3]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.journal.length).assertEqual(4);
      expect(harness.client.movedDirections.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_1100
     * @tc.name      testInputHandlerClient_011
     * @tc.desc      Verify that select-all, cut and copy are forwarded as three distinct actions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_011 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(editorRef.extendActions[1]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(editorRef.extendActions[2]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(editorRef.extendActions.length).assertEqual(3);
      expect(editorRef.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_1200
     * @tc.name      testInputHandlerClient_012
     * @tc.desc      Verify that four editor enter types are forwarded with their own value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_012 begin');

      // Each editor type is attached to its own fake client.
      const type0: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      const type1: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().sendKeyFunction();
      const type2: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().sendKeyFunction();
      const type3: ClientHarness = await createClientHarness(3);
      InputHandler.getInstance().sendKeyFunction();
      expect(type3.client.keyFunctions[0]).assertEqual(3);
      expect(type0.client.keyFunctions[0]).assertEqual(0);
      expect(type1.client.keyFunctions[0]).assertEqual(1);
      expect(type2.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_1300
     * @tc.name      testInputHandlerClient_013
     * @tc.desc      Verify that hiding the keyboard sends exactly one hide request when a controller is attached.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClient_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_013 begin');
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_1400
     * @tc.name      testInputHandlerClient_014
     * @tc.desc      Verify that the handler reads the editor attribute once on input start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClient_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_014 begin');
      const harness: ClientHarness = new ClientHarness(1);
      await Promise.resolve();
      await Promise.resolve();

      // One attach must not poll the editor repeatedly.
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClient_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0100
     * @tc.name      testInputHandlerClientSequence_001
     * @tc.desc      Verify that one insertion followed by a one-unit backward deletion keeps that order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_001 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(1);
      expect(editorRef.backwardLengths[0]).assertEqual(1);
      expect(editorRef.forwardLengths.length).assertEqual(0);
      expect(editorRef.journal.join('|')).assertEqual('insert:a|back:1');
      expect(editorRef.insertedTexts[0]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0200
     * @tc.name      testInputHandlerClientSequence_002
     * @tc.desc      Verify that a five-unit backward deletion after an insertion keeps its length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_002 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      // The larger length must not be split into several editor calls.
      InputHandler.getInstance().insertText('hello');
      InputHandler.getInstance().deleteBackward(5);
      expect(harness.client.journal.join('|')).assertEqual('insert:hello|back:5');
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0300
     * @tc.name      testInputHandlerClientSequence_003
     * @tc.desc      Verify that a backward deletion issued before the insertion stays first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_003 begin');
      const harness: ClientHarness = await createClientHarness(0);

      handlerRef.deleteBackward(3);
      handlerRef.insertText('z');
      expect(harness.client.journal.join('|')).assertEqual('back:3|insert:z');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0400
     * @tc.name      testInputHandlerClientSequence_004
     * @tc.desc      Verify that a forward deletion issued before the insertion stays first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_004 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().insertText('yz');
      expect(harness.client.insertedTexts[0]).assertEqual('yz');
      expect(harness.client.journal.join('|')).assertEqual('forward:2|insert:yz');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0500
     * @tc.name      testInputHandlerClientSequence_005
     * @tc.desc      Verify that an insertion followed by a left caret move keeps the move last.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_005 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(editorRef.journal.join('|')).assertEqual('insert:a|move:' +
        inputMethodEngine.Direction.CURSOR_LEFT);
      expect(editorRef.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0600
     * @tc.name      testInputHandlerClientSequence_006
     * @tc.desc      Verify that a right caret move issued before a deletion stays first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_006 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      handlerRef.deleteBackward(1);
      expect(harness.client.journal.join('|')).assertEqual('move:' +
        inputMethodEngine.Direction.CURSOR_RIGHT + '|back:1');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0700
     * @tc.name      testInputHandlerClientSequence_007
     * @tc.desc      Verify that a three-step insert, move and delete chain keeps all three commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientSequence_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_007 begin');
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().deleteForward(2);
      expect(harness.client.journal.join('|')).assertEqual('insert:x|move:' +
        inputMethodEngine.Direction.CURSOR_UP + '|forward:2');
      expect(harness.client.journal.length).assertEqual(3);
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0800
     * @tc.name      testInputHandlerClientSequence_008
     * @tc.desc      Verify that a marker insertion splits two identical insertions into three calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_008 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().insertText('m');
      InputHandler.getInstance().insertText('a');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:m|insert:a');
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.insertedTexts[1]).assertEqual('m');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_0900
     * @tc.name      testInputHandlerClientSequence_009
     * @tc.desc      Verify that select-all followed by an insertion keeps the action first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientSequence_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_009 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      handlerRef.insertText('k');
      expect(editorRef.journal.join('|')).assertEqual('extend:' +
        inputMethodEngine.ExtendAction.SELECT_ALL + '|insert:k');
      expect(editorRef.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_1000
     * @tc.name      testInputHandlerClientSequence_010
     * @tc.desc      Verify that an enter command followed by a hide command keeps the hide last.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_010 begin');
      const harness: ClientHarness = new ClientHarness(2);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('q');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:q|enter:2');
      expect(harness.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_1100
     * @tc.name      testInputHandlerClientSequence_011
     * @tc.desc      Verify that a left-right-left caret chain records the three moves in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientSequence_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_011 begin');
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.movedDirections.length).assertEqual(3);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.movedDirections[1]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.movedDirections[2]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_SEQUENCE_1200
     * @tc.name      testInputHandlerClientSequence_012
     * @tc.desc      Verify that back, forward and back deletions keep their three lengths in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientSequence_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_012 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.deleteBackward(1);
      handlerRef.deleteForward(2);
      handlerRef.deleteBackward(3);
      expect(harness.client.backwardLengths.length).assertEqual(2);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('back:1|forward:2|back:3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientSequence_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0100
     * @tc.name      testInputHandlerSinkMatrix_001
     * @tc.desc      Verify that an insertion reaches the editor sink and not the keyboard sink.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().insertText('sink');
      expect(editorRef.insertedTexts.length).assertEqual(1);
      expect(keyboardRef.hideCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0200
     * @tc.name      testInputHandlerSinkMatrix_002
     * @tc.desc      Verify that a backward deletion reaches the editor sink only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().deleteBackward(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0300
     * @tc.name      testInputHandlerSinkMatrix_003
     * @tc.desc      Verify that a forward deletion reaches the editor sink only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_003 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      handlerRef.deleteForward(1);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0400
     * @tc.name      testInputHandlerSinkMatrix_004
     * @tc.desc      Verify that a caret move reaches the editor sink only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0500
     * @tc.name      testInputHandlerSinkMatrix_005
     * @tc.desc      Verify that an extend action reaches the editor sink only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(editorRef.extendActions.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0600
     * @tc.name      testInputHandlerSinkMatrix_006
     * @tc.desc      Verify that an enter reaches the editor sink only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_006 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(2, 0);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.sendKeyFunction();
      expect(keyboardRef.hideCount).assertEqual(0);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0700
     * @tc.name      testInputHandlerSinkMatrix_007
     * @tc.desc      Verify that a hide request reaches the keyboard sink only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0800
     * @tc.name      testInputHandlerSinkMatrix_008
     * @tc.desc      Verify that a hide request does not enter the editor journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_0900
     * @tc.name      testInputHandlerSinkMatrix_009
     * @tc.desc      Verify that an enter does not touch the keyboard sink.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_009 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(1, 0);
      const editorRef: FakeInputClient = harness.client;

      handlerRef.sendKeyFunction();
      handlerRef.sendKeyFunction();
      expect(editorRef.keyFunctions.length).assertEqual(2);
      expect(harness.keyboard.hideCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_1000
     * @tc.name      testInputHandlerSinkMatrix_010
     * @tc.desc      Verify that a move does not touch the keyboard sink.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_1100
     * @tc.name      testInputHandlerSinkMatrix_011
     * @tc.desc      Verify that an extend action does not touch the keyboard sink.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const keyboardRef: FakeKeyboardController = harness.keyboard;

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(keyboardRef.hideCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_1200
     * @tc.name      testInputHandlerSinkMatrix_012
     * @tc.desc      Verify that deletions do not touch the keyboard sink.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerSinkMatrix_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_012 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.deleteBackward(1);
      handlerRef.deleteForward(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_1300
     * @tc.name      testInputHandlerSinkMatrix_013
     * @tc.desc      Verify that a full command flow keeps six editor commands and one hide.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerSinkMatrix_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(4, 0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(editorRef.journal.length).assertEqual(6);
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_SINK_MATRIX_1400
     * @tc.name      testInputHandlerSinkMatrix_014
     * @tc.desc      Verify that a command after hide still reaches the editor sink.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerSinkMatrix_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('after-hide');
      expect(harness.client.insertedTexts[0]).assertEqual('after-hide');
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerSinkMatrix_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0100
     * @tc.name      testInputHandlerClientJournal_001
     * @tc.desc      Verify that two insertions whose texts concatenate ambiguously stay two entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientJournal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const firstPart: string = 'ab';
      const secondPart: string = 'c';

      // 'ab' + 'c' equals 'a' + 'bc'; only the per-call array proves the split.
      InputHandler.getInstance().insertText(firstPart);
      InputHandler.getInstance().insertText(secondPart);
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.insertedTexts[0]).assertEqual(firstPart);
      expect(harness.client.insertedTexts[1]).assertEqual(secondPart);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0200
     * @tc.name      testInputHandlerClientJournal_002
     * @tc.desc      Verify that a payload shaped like a move command is treated as insertion data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const payload: string = 'move:1';

      InputHandler.getInstance().insertText(payload);
      // The handler must not reinterpret command-shaped text.
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.insertedTexts[0]).assertEqual(payload);
      expect(harness.client.journal.join('|')).assertEqual('insert:move:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0300
     * @tc.name      testInputHandlerClientJournal_003
     * @tc.desc      Verify that a payload containing the journal delimiter stays one entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('a|b');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('a|b');
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0400
     * @tc.name      testInputHandlerClientJournal_004
     * @tc.desc      Verify that the four command arrays add up to the journal length after a mixed run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const handlerRef: InputHandler = InputHandler.getInstance();

      handlerRef.insertText('i');
      handlerRef.deleteBackward(1);
      handlerRef.deleteForward(2);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handlerRef.sendKeyFunction();
      const classified: number = harness.client.insertedTexts.length +
        harness.client.backwardLengths.length + harness.client.forwardLengths.length +
        harness.client.movedDirections.length + harness.client.extendActions.length +
        harness.client.keyFunctions.length;
      expect(classified).assertEqual(harness.client.journal.length);
      expect(harness.client.journal.length).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0500
     * @tc.name      testInputHandlerClientJournal_005
     * @tc.desc      Verify that every journal entry carries the prefix of its own command kind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const handlerRef: InputHandler = InputHandler.getInstance();

      handlerRef.insertText('i');
      handlerRef.deleteBackward(1);
      handlerRef.deleteForward(2);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handlerRef.sendKeyFunction();
      expect(harness.client.journal[0].indexOf('insert:')).assertEqual(0);
      expect(harness.client.journal[1].indexOf('back:')).assertEqual(0);
      expect(harness.client.journal[2].indexOf('forward:')).assertEqual(0);
      expect(harness.client.journal[3].indexOf('move:')).assertEqual(0);
      expect(harness.client.journal[4].indexOf('extend:')).assertEqual(0);
      expect(harness.client.journal[5].indexOf('enter:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0600
     * @tc.name      testInputHandlerClientJournal_006
     * @tc.desc      Verify that an insertion in the attaching tick reaches the client before the promise.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);

      // No microtask is awaited: the client reference is assigned synchronously.
      InputHandler.getInstance().insertText('same-tick');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('same-tick');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0700
     * @tc.name      testInputHandlerClientJournal_007
     * @tc.desc      Verify that a forward deletion in the attaching tick is delivered immediately.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);

      InputHandler.getInstance().deleteForward(4);
      expect(harness.client.forwardLengths[0]).assertEqual(4);
      expect(harness.client.journal.join('|')).assertEqual('forward:4');
      expect(harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0800
     * @tc.name      testInputHandlerClientJournal_008
     * @tc.desc      Verify that an extend action in the attaching tick is delivered immediately.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('extend:' +
        inputMethodEngine.ExtendAction.CUT);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_0900
     * @tc.name      testInputHandlerClientJournal_009
     * @tc.desc      Verify that a caret move in the attaching tick is delivered immediately.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.movedDirections[0])
        .assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1000
     * @tc.name      testInputHandlerClientJournal_010
     * @tc.desc      Verify that both deletion kinds in the attaching tick keep their own arrays.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);

      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(3);
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.forwardLengths[0]).assertEqual(3);
      expect(harness.client.journal.join('|')).assertEqual('back:2|forward:3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1100
     * @tc.name      testInputHandlerClientJournal_011
     * @tc.desc      Verify that a second attach overwrites the editor that receives the next insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientJournal_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_011 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const second: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('second-only');
      expect(second.client.insertedTexts[0]).assertEqual('second-only');
      expect(second.client.journal.length).assertEqual(1);
      expect(first.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1200
     * @tc.name      testInputHandlerClientJournal_012
     * @tc.desc      Verify that a hide after two back-to-back attaches reaches only the newer panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_012 begin');
      InputHandler.getInstance().onInputStop();
      const older: ClientHarness = await createClientHarness(0);
      const newer: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().hideKeyboardSelf();
      expect(newer.keyboard.hideCount).assertEqual(1);
      expect(older.keyboard.hideCount).assertEqual(0);
      expect(newer.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1300
     * @tc.name      testInputHandlerClientJournal_013
     * @tc.desc      Verify that a hide count built before a stop is kept after the stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      // A stop clears the controller reference but cannot undo the earlier call.
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1400
     * @tc.name      testInputHandlerClientJournal_014
     * @tc.desc      Verify that enter, hide and a forward deletion keep their three channels separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2);
      const handlerRef: InputHandler = InputHandler.getInstance();

      handlerRef.sendKeyFunction();
      handlerRef.hideKeyboardSelf();
      handlerRef.deleteForward(3);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('enter:2|forward:3');
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1500
     * @tc.name      testInputHandlerClientJournal_015
     * @tc.desc      Verify that two identical copy actions stay two extend entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.extendActions[1]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1600
     * @tc.name      testInputHandlerClientJournal_016
     * @tc.desc      Verify that a zero glyph payload and a zero deletion length remain distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('0');
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.insertedTexts[0]).assertEqual('0');
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.journal.join('|')).assertEqual('insert:0|back:0');
      expect(harness.client.backwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1700
     * @tc.name      testInputHandlerClientJournal_017
     * @tc.desc      Verify that a newline payload is an insertion and never an enter command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3);

      InputHandler.getInstance().insertText('\n');
      expect(harness.client.keyFunctions.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('\n');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1800
     * @tc.name      testInputHandlerClientJournal_018
     * @tc.desc      Verify that an inner run of spaces and a tab is preserved with all five units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const payload: string = '  \t  ';

      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts[0]).assertEqual(payload);
      expect(harness.client.insertedTexts[0].length).assertEqual(5);
      expect(harness.client.insertedTexts[0].charCodeAt(2)).assertEqual(9);
      expect(harness.client.insertedTexts[0].charCodeAt(4)).assertEqual(32);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_1900
     * @tc.name      testInputHandlerClientJournal_019
     * @tc.desc      Verify that an enter followed by a downward move keeps the enter first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientJournal_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_019 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.journal.join('|')).assertEqual('enter:3|move:2');
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2000
     * @tc.name      testInputHandlerClientJournal_020
     * @tc.desc      Verify that interleaved deletion directions keep separate internal orders.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const handlerRef: InputHandler = InputHandler.getInstance();

      handlerRef.deleteBackward(1);
      handlerRef.deleteForward(2);
      handlerRef.deleteBackward(3);
      handlerRef.deleteForward(4);
      expect(harness.client.backwardLengths.join('|')).assertEqual('1|3');
      expect(harness.client.forwardLengths.join('|')).assertEqual('2|4');
      expect(harness.client.journal.join('|')).assertEqual('back:1|forward:2|back:3|forward:4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2100
     * @tc.name      testInputHandlerClientJournal_021
     * @tc.desc      Verify that an action and a text alternate without merging their arrays.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_021 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const handlerRef: InputHandler = InputHandler.getInstance();

      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handlerRef.insertText('x');
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      handlerRef.insertText('y');
      expect(harness.client.journal.join('|')).assertEqual('extend:' +
        inputMethodEngine.ExtendAction.CUT + '|insert:x|extend:' +
        inputMethodEngine.ExtendAction.PASTE + '|insert:y');
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2200
     * @tc.name      testInputHandlerClientJournal_022
     * @tc.desc      Verify that a hide between two insertions does not consume a journal slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientJournal_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_022 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('b');
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.journal[0]).assertEqual('insert:a');
      expect(harness.client.journal[1]).assertEqual('insert:b');
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2300
     * @tc.name      testInputHandlerClientJournal_023
     * @tc.desc      Verify that growing prefix payloads do not accumulate into one buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_023 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const payloads: string[] = ['a', 'ab', 'abc'];
      let i: number = 0;
      while (i < payloads.length) {
        InputHandler.getInstance().insertText(payloads[i]);
        i = i + 1;
      }
      // Each call forwards its own payload; nothing is concatenated with an earlier one.
      expect(harness.client.insertedTexts[2]).assertEqual('abc');
      expect(harness.client.insertedTexts.join('|')).assertEqual('a|ab|abc');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2400
     * @tc.name      testInputHandlerClientJournal_024
     * @tc.desc      Verify that two empty insertions stay two entries with no other command kind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_024 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().insertText('');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.journal.join('|')).assertEqual('insert:|insert:');
      expect(harness.client.backwardLengths.length +
        harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2500
     * @tc.name      testInputHandlerClientJournal_025
     * @tc.desc      Verify that each deletion journal entry names the direction that produced it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_025 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(5);
      expect(harness.client.journal[0].indexOf('back:')).assertEqual(0);
      expect(harness.client.journal[0].indexOf('forward:')).assertEqual(-1);
      expect(harness.client.journal[1].indexOf('forward:')).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2700
     * @tc.name      testInputHandlerClientJournal_027
     * @tc.desc      Verify that moves and actions issued before an attach are not replayed later.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientJournal_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_027 begin');
      InputHandler.getInstance().onInputStop();
      const handlerRef: InputHandler = InputHandler.getInstance();
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);

      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.extendActions.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);
      handlerRef.insertText('fresh');
      expect(harness.client.journal.join('|')).assertEqual('insert:fresh');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2800
     * @tc.name      testInputHandlerClientJournal_028
     * @tc.desc      Verify that an insertion followed by only a forward deletion leaves the back array empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerClientJournal_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_028 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('abc');
      InputHandler.getInstance().deleteForward(2);
      expect(harness.client.insertedTexts[0]).assertEqual('abc');
      expect(harness.client.forwardLengths[0]).assertEqual(2);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.journal.join('|')).assertEqual('insert:abc|forward:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_2900
     * @tc.name      testInputHandlerClientJournal_029
     * @tc.desc      Verify that an empty insertion between two texts keeps the three calls aligned.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_029 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().insertText('');
      InputHandler.getInstance().insertText('b');
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.insertedTexts[1]).assertEqual('');
      expect(harness.client.insertedTexts[0] + harness.client.insertedTexts[2]).assertEqual('ab');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:|insert:b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_3000
     * @tc.name      testInputHandlerClientJournal_030
     * @tc.desc      Verify that a hide issued after a stop reaches no panel and leaves the journal closed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_030 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('kept');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CLIENT_JOURNAL_3100
     * @tc.name      testInputHandlerClientJournal_031
     * @tc.desc      Verify that a deletion-shaped payload does not inflate the forward deletion count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerClientJournal_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_031 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const payload: string = 'forward:9';

      InputHandler.getInstance().insertText(payload);
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.insertedTexts[0]).assertEqual(payload);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.journal[0]).assertEqual('insert:forward:9');
      expect(harness.client.journal[1]).assertEqual('forward:1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerClientJournal_031 end');
      await yieldToEventLoop();
    });

  });
}
