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
import { ClientHarness, createClientHarness, FakeInputClient, FakeKeyboardController } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputHandlerClientMatrix]';

export default function handlerClientMatrixTest(): void {
  describe('HandlerClientMatrixTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0100
     * @tc.name      testHandlerClientMatrix_001
     * @tc.desc      Verify two clients report their own journal lengths after a switch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_001 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('one');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('two');
      InputHandler.getInstance().deleteBackward(1);

      const lengths: number[] = [first.client.journal.length, second.client.journal.length];
      expect(lengths[0]).assertEqual(1);
      expect(lengths[1]).assertEqual(2);
      expect(lengths.join('|')).assertEqual('1|2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0200
     * @tc.name      testHandlerClientMatrix_002
     * @tc.desc      Verify a late command after switching back only reaches the first client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_002 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      const keyboardRef: FakeKeyboardController = first.keyboard;
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('a');
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('b');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        keyboardRef as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      handlerRef.insertText('c');

      expect(second.client.insertedTexts.join('|')).assertEqual('b');
      expect(first.client.insertedTexts.join('|')).assertEqual('a|c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0300
     * @tc.name      testHandlerClientMatrix_003
     * @tc.desc      Verify each client forwards its own enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_003 begin');
      InputHandler.getInstance().onInputStop();
      const types: number[] = [1, 4, 7];
      const clients: ClientHarness[] = [];
      let i: number = 0;
      while (i < types.length) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(types[i], 0);
        clients.push(harness);
        InputHandler.getInstance().sendKeyFunction();
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < clients.length) {
        expect(clients[iW1].client.keyFunctions[0]).assertEqual(types[iW1]);
        expect(clients[iW1].client.keyFunctions.length).assertEqual(1);
        iW1 = iW1 + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0400
     * @tc.name      testHandlerClientMatrix_004
     * @tc.desc      Verify hide requests are counted per controller across three starts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_004 begin');
      InputHandler.getInstance().onInputStop();
      const counts: number[] = [];
      for (let i = 0; i < 3; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = new ClientHarness(0);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().hideKeyboardSelf();
        counts.push(harness.keyboard.hideCount);
      }
      expect(counts.join('|')).assertEqual('2|2|2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0500
     * @tc.name      testHandlerClientMatrix_005
     * @tc.desc      Verify starting the same client twice re-reads the editor attribute twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_005 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(5, 6);
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(6);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0600
     * @tc.name      testHandlerClientMatrix_006
     * @tc.desc      Verify extend actions are routed per client and never duplicated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_006 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);

      expect(first.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(second.client.extendActions.length).assertEqual(1);
      expect(second.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(first.client.extendActions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0700
     * @tc.name      testHandlerClientMatrix_007
     * @tc.desc      Verify move directions are grouped per client in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_007 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = first.client;
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);

      expect(editorRef.movedDirections.join('|')).assertEqual('1|2');
      expect(second.client.movedDirections.join('|')).assertEqual('3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0800
     * @tc.name      testHandlerClientMatrix_008
     * @tc.desc      Verify deletion lengths are grouped per client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_008 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.deleteBackward(2);
      handlerRef.deleteForward(3);
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      handlerRef.deleteBackward(9);

      expect(second.client.forwardLengths.length).assertEqual(0);
      expect(first.client.backwardLengths.join('|')).assertEqual('2');
      expect(first.client.forwardLengths.join('|')).assertEqual('3');
      expect(second.client.backwardLengths.join('|')).assertEqual('9');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_0900
     * @tc.name      testHandlerClientMatrix_009
     * @tc.desc      Verify a count map summarises four clients after four switches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_009 begin');
      InputHandler.getInstance().onInputStop();
      const counts: Map<number, number> = new Map<number, number>();
      let i: number = 0;
      while (i < 4) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(i, 0);
        InputHandler.getInstance().insertText('c' + i);
        counts.set(i, harness.client.insertedTexts.length);
        i = i + 1;
      }
      expect(counts.size).assertEqual(4);
      let total: number = 0;
      counts.forEach((value: number, key: number) => {
        expect(value).assertEqual(1);
        total = total + value;
      });
      expect(total).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_1000
     * @tc.name      testHandlerClientMatrix_010
     * @tc.desc      Verify a stop in the middle of a sequence freezes the current client only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_010 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('b');
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('c');

      expect(second.client.journal.join('|')).assertEqual('insert:c');
      expect(first.client.journal.join('|')).assertEqual('insert:a|back:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_1100
     * @tc.name      testHandlerClientMatrix_011
     * @tc.desc      Verify a reattached client resumes at the exact next journal index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_011 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      handlerRef.insertText('a');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        editorRef as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('b');

      expect(editorRef.journal[1]).assertEqual('insert:b');
      expect(editorRef.editorAttributeCount).assertEqual(2);
      expect(editorRef.journal.length).assertEqual(2);
      expect(editorRef.journal[0]).assertEqual('insert:a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_CLIENT_MATRIX_1200
     * @tc.name      testHandlerClientMatrix_012
     * @tc.desc      Verify old clients stay empty for every command kind after five switches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerClientMatrix_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_012 begin');
      InputHandler.getInstance().onInputStop();
      const clients: ClientHarness[] = [];
      for (let i = 0; i < 5; i++) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        clients.push(await createClientHarness(i, 0));
      }
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();

      let emptyOld: number = 0;
      for (let i = 0; i < clients.length - 1; i++) {
        if (clients[i].client.journal.length === 0 && clients[i].keyboard.hideCount === 0) {
          emptyOld = emptyOld + 1;
        }
      }
      expect(clients[4].keyboard.hideCount).assertEqual(1);
      expect(emptyOld).assertEqual(4);
      expect(clients[4].client.journal.length).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerClientMatrix_012 end');
      await yieldToEventLoop();
    });

  });

}
