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
const TAG: string = '[Sample_KikaInputHandlerLifecycleDeep]';

export default function HandlerLifecycleDeepTestTest(): void {
  describe('HandlerLifecycleDeepTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0100
     * @tc.name      testHandlerLifecycleDeep_001
     * @tc.desc      Verify three starts each read one editor attribute and the last type wins.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_001 begin');
      InputHandler.getInstance().onInputStop();
      const types: number[] = [1, 5, 9];
      const counts: number[] = [];
      let i: number = 0;
      while (i < types.length) {
        if (i > 0) {
          InputHandler.getInstance().onInputStop();
        }
        const harness: ClientHarness = await createClientHarness(types[i], i);
        counts.push(harness.client.editorAttributeCount);
        i = i + 1;
      }
      expect(counts.join('|')).assertEqual('1|1|1');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0200
     * @tc.name      testHandlerLifecycleDeep_002
     * @tc.desc      Verify starting the same harness twice reads the attribute twice and keeps delivery.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_002 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(3, 4);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.onInputStart(
        keyboardRef as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('twice');
      expect(harness.client.insertedTexts.join('')).assertEqual('twice');
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0300
     * @tc.name      testHandlerLifecycleDeep_003
     * @tc.desc      Verify two stops after two starts leave the first client with all commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_003 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = first.client;
      InputHandler.getInstance().insertText('one');
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('two');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('three');
      expect(editorRef.insertedTexts.join('')).assertEqual('one');
      expect(second.client.insertedTexts.join('')).assertEqual('two');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0400
     * @tc.name      testHandlerLifecycleDeep_004
     * @tc.desc      Verify a command issued in the stopped gap is not replayed after the next start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_004 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('gap');
      const after: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('live');
      expect(after.client.journal.length).assertEqual(1);
      expect(after.client.insertedTexts.join('|')).assertEqual('live');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0500
     * @tc.name      testHandlerLifecycleDeep_005
     * @tc.desc      Verify the enter type of a reattached client follows its own attribute.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_005 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(2, 0);
      handlerRef.sendKeyFunction();
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(8, 0);
      handlerRef.sendKeyFunction();
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(first.client.keyFunctions.join('|')).assertEqual('2|2');
      expect(second.client.keyFunctions.join('|')).assertEqual('8');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0600
     * @tc.name      testHandlerLifecycleDeep_006
     * @tc.desc      Verify a hide before stop and a hide after stop produce one and zero calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0700
     * @tc.name      testHandlerLifecycleDeep_007
     * @tc.desc      Verify a deletion issued before and after a stop is split by the stop boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().deleteBackward(2);
      expect(editorRef.backwardLengths.join('|')).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0800
     * @tc.name      testHandlerLifecycleDeep_008
     * @tc.desc      Verify a move issued before and after a stop is split by the stop boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_008 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      handlerRef.onInputStop();
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.movedDirections.join('|')).assertEqual('2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_0900
     * @tc.name      testHandlerLifecycleDeep_009
     * @tc.desc      Verify an extend issued before and after a stop is split by the stop boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_1000
     * @tc.name      testHandlerLifecycleDeep_010
     * @tc.desc      Verify three starts without a stop leave only the last client receiving data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_010 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const second: ClientHarness = await createClientHarness(1);
      const third: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().insertText('last');
      const lengths: number[] = [first.client.insertedTexts.length,
        second.client.insertedTexts.length, third.client.insertedTexts.length];
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(lengths.join('|')).assertEqual('0|0|1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_1100
     * @tc.name      testHandlerLifecycleDeep_011
     * @tc.desc      Verify five stop-start cycles keep the last stored type and pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_011 begin');
      handlerRef.onInputStop();
      let i: number = 0;
      while (i < 5) {
        if (i > 0) {
          handlerRef.onInputStop();
        }
        await createClientHarness(i, i + 1);
        i = i + 1;
      }
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_1200
     * @tc.name      testHandlerLifecycleDeep_012
     * @tc.desc      Verify a reattach to the first client leaves the second client frozen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_012 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      const keyboardRef: FakeKeyboardController = first.keyboard;
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        keyboardRef as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('c');
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(first.client.insertedTexts.join('')).assertEqual('ac');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_1300
     * @tc.name      testHandlerLifecycleDeep_013
     * @tc.desc      Verify an enter issued in a stopped gap is not delivered after the next start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_013 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendKeyFunction();
      const after: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(after.client.keyFunctions.join('|')).assertEqual('0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_LIFECYCLE_DEEP_1400
     * @tc.name      testHandlerLifecycleDeep_014
     * @tc.desc      Verify a healthy client followed by a fault client keeps the first journal closed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleDeep_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_014 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('healthy');
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      handlerRef.deleteBackward(5);
      expect(second.client.journal.join('|')).assertEqual('back:5');
      expect(first.client.journal.join('|')).assertEqual('insert:healthy');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleDeep_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0100
     * @tc.name      testHandlerLifecycleExtra_001
     * @tc.desc      Verify three inserts before and three after a stop stay on their own clients.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_001 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = first.client;
      let i: number = 0;
      while (i < 3) {
        InputHandler.getInstance().insertText('a');
        i = i + 1;
      }
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      let iW1: number = 0;
      while (iW1 < 3) {
        InputHandler.getInstance().insertText('b');
        iW1 = iW1 + 1;
      }
      expect(editorRef.journal.length).assertEqual(3);
      expect(second.client.journal.length).assertEqual(3);
      expect(editorRef.insertedTexts.join('')).assertEqual('aaa');
      expect(second.client.insertedTexts.join('')).assertEqual('bbb');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0200
     * @tc.name      testHandlerLifecycleExtra_002
     * @tc.desc      Verify five consecutive stops without a start leave the next start fully usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_002 begin');
      for (let i = 0; i < 5; i++) {
        InputHandler.getInstance().onInputStop();
      }
      const harness: ClientHarness = new ClientHarness(3);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('live');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.insertedTexts.join('')).assertEqual('live');
      expect(harness.client.keyFunctions.join('')).assertEqual('3');
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0300
     * @tc.name      testHandlerLifecycleExtra_003
     * @tc.desc      Verify three reattachments of one harness read three attributes and deliver each time.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_003 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      let i: number = 0;
      while (i < 3) {
        handlerRef.insertText('x' + i);
        handlerRef.onInputStop();
        if (i < 2) {
          handlerRef.onInputStart(
              keyboardRef as object as inputMethodEngine.KeyboardController,
              harness.client as object as inputMethodEngine.InputClient);
          await Promise.resolve();
          await Promise.resolve();
        }
        i = i + 1;
      }
      expect(harness.client.insertedTexts.join('|')).assertEqual('x0|x1|x2');
      expect(harness.client.editorAttributeCount).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0400
     * @tc.name      testHandlerLifecycleExtra_004
     * @tc.desc      Verify two hide calls on different sessions reach their own keyboard controllers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_004 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(second.client.journal.length).assertEqual(0);
      expect(first.keyboard.hideCount).assertEqual(1);
      expect(second.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0500
     * @tc.name      testHandlerLifecycleExtra_005
     * @tc.desc      Verify an enter before a stop is dropped while the next session uses its own type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(2, 0);
      const editorRef: FakeInputClient = first.client;
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendKeyFunction();
      const second: ClientHarness = await createClientHarness(9, 0);
      InputHandler.getInstance().sendKeyFunction();
      expect(editorRef.keyFunctions.join('')).assertEqual('2');
      expect(second.client.keyFunctions.join('')).assertEqual('9');
      expect(second.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0600
     * @tc.name      testHandlerLifecycleExtra_006
     * @tc.desc      Verify backward and forward deletions split at a stop without leaking arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_006 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.deleteBackward(2);
      handlerRef.deleteBackward(4);
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      handlerRef.deleteForward(3);
      handlerRef.deleteForward(5);
      expect(second.client.backwardLengths.length).assertEqual(0);
      expect(first.client.backwardLengths.join('|')).assertEqual('2|4');
      expect(first.client.forwardLengths.length).assertEqual(0);
      expect(second.client.forwardLengths.join('|')).assertEqual('3|5');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0700
     * @tc.name      testHandlerLifecycleExtra_007
     * @tc.desc      Verify a cursor move and an extend action split at a stop by their kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_007 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(first.client.movedDirections.join('')).assertEqual('1');
      expect(first.client.extendActions.length).assertEqual(0);
      expect(second.client.extendActions.length).assertEqual(1);
      expect(second.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0800
     * @tc.name      testHandlerLifecycleExtra_008
     * @tc.desc      Verify a stop after three sessions leaves all three clients closed to new data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('closed');
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.journal.length).assertEqual(0);
      expect(second.client.journal.length).assertEqual(0);
      expect(third.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_0900
     * @tc.name      testHandlerLifecycleExtra_009
     * @tc.desc      Verify a command in a stopped gap stays unowned while both sessions keep their own.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_009 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = first.client;
      handlerRef.insertText('one');
      handlerRef.onInputStop();
      handlerRef.insertText('gap');
      const second: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('two');
      expect(editorRef.journal.length).assertEqual(1);
      expect(second.client.journal.length).assertEqual(1);
      expect(editorRef.insertedTexts.join('')).assertEqual('one');
      expect(second.client.insertedTexts.join('')).assertEqual('two');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1000
     * @tc.name      testHandlerLifecycleExtra_010
     * @tc.desc      Verify returning to the first harness keeps its earlier journal and appends new data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_010 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('early');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('middle');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('late');
      expect(second.client.insertedTexts.join('')).assertEqual('middle');
      expect(first.client.journal.join('|')).assertEqual('insert:early|insert:late');
      expect(first.client.insertedTexts.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1100
     * @tc.name      testHandlerLifecycleExtra_011
     * @tc.desc      Verify a same-tick double start followed by a stop leaves no client owning commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_011 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const second: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('nobody');
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.journal.length).assertEqual(0);
      expect(second.client.journal.length).assertEqual(0);
      expect(second.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1200
     * @tc.name      testHandlerLifecycleExtra_012
     * @tc.desc      Verify a zero enter type is stored as zero across a stop and a second zero start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_012 begin');
      handlerRef.onInputStop();
      await createClientHarness(0, 0);
      handlerRef.onInputStop();
      const second: ClientHarness = new ClientHarness(0, 0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(second.client.keyFunctions.join('')).assertEqual('0');
      expect(second.client.journal.join('')).assertEqual('enter:0');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1300
     * @tc.name      testHandlerLifecycleExtra_013
     * @tc.desc      Verify each session's hide and insert counts stay inside that session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_013 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const keyboardRef: FakeKeyboardController = first.keyboard;
      const editorRef: FakeInputClient = first.client;
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('b');
      expect(editorRef.insertedTexts.join('')).assertEqual('a');
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(keyboardRef.hideCount).assertEqual(1);
      expect(second.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1400
     * @tc.name      testHandlerLifecycleExtra_014
     * @tc.desc      Verify ten inserts before a stop and ten after it never cross the boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_014 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      for (let i = 0; i < 10; i++) {
        InputHandler.getInstance().insertText('L');
      }
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 10; i++) {
        InputHandler.getInstance().insertText('R');
      }
      expect(second.client.insertedTexts.join('')).assertEqual('RRRRRRRRRR');
      expect(first.client.insertedTexts.length).assertEqual(10);
      expect(second.client.insertedTexts.length).assertEqual(10);
      expect(first.client.insertedTexts.join('')).assertEqual('LLLLLLLLLL');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1500
     * @tc.name      testHandlerLifecycleExtra_015
     * @tc.desc      Verify a hide after every client is stopped reaches no keyboard controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_015 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      handlerRef.onInputStop();
      handlerRef.hideKeyboardSelf();
      expect(second.keyboard.hideCount).assertEqual(0);
      expect(first.client.journal.length + second.client.journal.length).assertEqual(0);
      expect(first.keyboard.hideCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1600
     * @tc.name      testHandlerLifecycleExtra_016
     * @tc.desc      Verify one extend action per session stays on its own client journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_016 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(second.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(first.client.extendActions.length).assertEqual(1);
      expect(second.client.extendActions.length).assertEqual(1);
      expect(first.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1700
     * @tc.name      testHandlerLifecycleExtra_017
     * @tc.desc      Verify two moves separated by a reattach append to the same client journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        editorRef as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(editorRef.movedDirections.join('|')).assertEqual('3|4');
      expect(editorRef.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LIFECYCLE_EXTRA_1800
     * @tc.name      testHandlerLifecycleExtra_018
     * @tc.desc      Verify the last of three restart attributes remains stored after the final stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerLifecycleExtra_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_018 begin');
      handlerRef.onInputStop();
      await createClientHarness(2, 5);
      handlerRef.onInputStop();
      await createClientHarness(4, 6);
      handlerRef.onInputStop();
      await createClientHarness(8, 7);
      handlerRef.onInputStop();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(7);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerLifecycleExtra_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0100
     * @tc.name      testHandlerRestart_001
     * @tc.desc      Verify that a recovery with a new keyboard stub routes later hides away from the old stub.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_001 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const replacement: FakeKeyboardController = new FakeKeyboardController();
      handlerRef.hideKeyboardSelf();
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        replacement as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(replacement.hideCount).assertEqual(1);
      expect(harness.client.editorAttributeCount).assertEqual(2);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0200
     * @tc.name      testHandlerRestart_002
     * @tc.desc      Verify that three reattachments deliver one deletion, one move and one extend in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_002 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.deleteBackward(1);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      const expected: string = 'back:1|move:' + inputMethodEngine.Direction.CURSOR_UP +
        '|extend:' + inputMethodEngine.ExtendAction.PASTE;
      expect(harness.client.journal.join('|')).assertEqual(expected);
      expect(harness.client.editorAttributeCount).assertEqual(3);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0300
     * @tc.name      testHandlerRestart_003
     * @tc.desc      Verify that two alternating clients keep two payloads each after two recoveries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_003 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('x');
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      handlerRef.insertText('y');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('z');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        second.keyboard as object as inputMethodEngine.KeyboardController,
        second.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('w');
      expect(first.client.insertedTexts.join('')).assertEqual('xz');
      expect(second.client.insertedTexts.join('')).assertEqual('yw');
      expect(first.client.editorAttributeCount).assertEqual(2);
      expect(second.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0400
     * @tc.name      testHandlerRestart_004
     * @tc.desc      Verify that a hide returns to the original stub after a recovery through a replacement stub.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_004 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const original: FakeKeyboardController = harness.keyboard;
      const replacement: FakeKeyboardController = new FakeKeyboardController();
      handlerRef.hideKeyboardSelf();
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        replacement as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.hideKeyboardSelf();
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        original as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.hideKeyboardSelf();
      expect(original.hideCount).assertEqual(2);
      expect(replacement.hideCount).assertEqual(1);
      expect(harness.client.editorAttributeCount).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0500
     * @tc.name      testHandlerRestart_005
     * @tc.desc      Verify that five stops still leave a session able to record one command of every kind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_005 begin');
      let i: number = 0;
      while (i < 5) {
        handlerRef.onInputStop();
        i = i + 1;
      }
      const harness: ClientHarness = await createClientHarness(3);
      handlerRef.insertText('s');
      handlerRef.deleteBackward(2);
      handlerRef.deleteForward(1);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      handlerRef.sendKeyFunction();
      expect(harness.client.journal.length).assertEqual(6);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.keyFunctions.join('')).assertEqual('3');
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.forwardLengths[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0600
     * @tc.name      testHandlerRestart_006
     * @tc.desc      Verify that a refresh during a pending start still shows the preview because the client is bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_006 begin');
      handlerRef.onInputStop();
      const pending: ClientHarness = new ClientHarness(0);
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('five chars:')).assertEqual(0);
      expect(summary.indexOf('FWD5') > 0).assertTrue();
      expect(summary.indexOf('BWD5') > 0).assertTrue();
      expect(pending.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0700
     * @tc.name      testHandlerRestart_007
     * @tc.desc      Verify that both stored attributes follow each recovery and the recovered client forwards its type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_007 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(2, 5);
      const firstType: number = AppStorage.get<number>('enterKeyType') ?? -1;
      const firstPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(7, 9);
      const secondType: number = AppStorage.get<number>('enterKeyType') ?? -1;
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      const recoveredType: number = AppStorage.get<number>('enterKeyType') ?? -1;
      const recoveredPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      handlerRef.sendKeyFunction();
      expect(firstType).assertEqual(2);
      expect(firstPattern).assertEqual(5);
      expect(secondType).assertEqual(7);
      expect(recoveredType).assertEqual(2);
      expect(recoveredPattern).assertEqual(5);
      expect(first.client.keyFunctions.join('')).assertEqual('2');
      expect(second.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0800
     * @tc.name      testHandlerRestart_008
     * @tc.desc      Verify that an extend issued in a stopped gap never appears after the same client is recovered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_008 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.onInputStop();
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_0900
     * @tc.name      testHandlerRestart_009
     * @tc.desc      Verify that three starts across a recovery read three attributes while commands add none.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_009 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('1');
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      handlerRef.insertText('2');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('3');
      const reads: number = first.client.editorAttributeCount + second.client.editorAttributeCount;
      expect(reads).assertEqual(3);
      expect(first.client.insertedTexts.join('|')).assertEqual('1|3');
      expect(second.client.insertedTexts.join('')).assertEqual('2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1000
     * @tc.name      testHandlerRestart_010
     * @tc.desc      Verify that five insertions on each side of a recovery fill ten slots in two halves.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_010 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      let i: number = 0;
      while (i < 5) {
        handlerRef.insertText('L');
        i = i + 1;
      }
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      let j: number = 0;
      while (j < 5) {
        handlerRef.insertText('R');
        j = j + 1;
      }
      expect(harness.client.insertedTexts.length).assertEqual(10);
      expect(harness.client.insertedTexts.join('')).assertEqual('LLLLLRRRRR');
      expect(harness.client.journal.length).assertEqual(10);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1100
     * @tc.name      testHandlerRestart_011
     * @tc.desc      Verify that a move after two recoveries appends to the original client and not the interim one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_011 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('b');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(first.client.movedDirections.join('|')).assertEqual(
        inputMethodEngine.Direction.CURSOR_LEFT + '|' + inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(first.client.movedDirections.length).assertEqual(2);
      expect(second.client.movedDirections.length).assertEqual(0);
      expect(second.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1200
     * @tc.name      testHandlerRestart_012
     * @tc.desc      Verify that diagnostic fields and a preview survive a stop and recovery of the same client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_012 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.setSelectInfo('REC-S');
      handlerRef.setTextInfo('REC-T');
      handlerRef.insertText('a');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('REC-S') >= 0).assertTrue();
      expect(summary.indexOf('REC-T') >= 0).assertTrue();
      expect(summary.indexOf('FWD5') >= 0).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1300
     * @tc.name      testHandlerRestart_013
     * @tc.desc      Verify that three clients keep one distinct command kind each and no cross-kind leakage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_013 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      handlerRef.deleteBackward(1);
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      handlerRef.deleteForward(2);
      handlerRef.onInputStop();
      const third: ClientHarness = await createClientHarness(2);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      expect(first.client.backwardLengths.join('')).assertEqual('1');
      expect(first.client.forwardLengths.length).assertEqual(0);
      expect(second.client.forwardLengths.join('')).assertEqual('2');
      expect(second.client.backwardLengths.length).assertEqual(0);
      expect(third.client.movedDirections.length).assertEqual(1);
      expect(third.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1400
     * @tc.name      testHandlerRestart_014
     * @tc.desc      Verify that two payloads separated by a recovery stay separate entries on the same client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_014 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('L');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('R');
      expect(harness.client.insertedTexts.join('|')).assertEqual('L|R');
      expect(harness.client.insertedTexts.join('')).assertEqual('LR');
      expect(harness.client.journal.join('|')).assertEqual('insert:L|insert:R');
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1500
     * @tc.name      testHandlerRestart_015
     * @tc.desc      Verify that an enter after recovery uses the recovered client type even when no one sent before.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_015 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(2);
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(9);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(first.client.keyFunctions.join('')).assertEqual('2');
      expect(second.client.keyFunctions.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(first.client.journal.join('')).assertEqual('enter:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1600
     * @tc.name      testHandlerRestart_016
     * @tc.desc      Verify that an empty insertion before a recovery stays a distinct zero-length slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_016 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('');
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('x');
      expect(harness.client.journal.join('|')).assertEqual('insert:|insert:x');
      expect(harness.client.insertedTexts[0].length).assertEqual(0);
      expect(harness.client.insertedTexts[1]).assertEqual('x');
      expect(harness.client.insertedTexts.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1700
     * @tc.name      testHandlerRestart_017
     * @tc.desc      Verify that three enters after recovery all carry the recovered type and never reach the interim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_017 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = await createClientHarness(3);
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(5);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      handlerRef.sendKeyFunction();
      handlerRef.sendKeyFunction();
      expect(first.client.keyFunctions.join('|')).assertEqual('3|3|3');
      expect(first.client.keyFunctions.length).assertEqual(3);
      expect(second.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1800
     * @tc.name      testHandlerRestart_018
     * @tc.desc      Verify that gap insertions and enters are dropped while a later recovery accepts an insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_018 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.onInputStop();
      handlerRef.insertText('x');
      handlerRef.sendKeyFunction();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('y');
      expect(harness.client.journal.join('')).assertEqual('insert:y');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_1900
     * @tc.name      testHandlerRestart_019
     * @tc.desc      Verify that a session used only for hiding keeps an empty editor journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_019 begin');
      handlerRef.onInputStop();
      const hidden: ClientHarness = await createClientHarness(0);
      handlerRef.hideKeyboardSelf();
      handlerRef.onInputStop();
      const typing: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('b');
      expect(hidden.keyboard.hideCount).assertEqual(1);
      expect(hidden.client.journal.length).assertEqual(0);
      expect(typing.client.journal.join('')).assertEqual('insert:b');
      expect(typing.keyboard.hideCount).assertEqual(0);
      expect(typing.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_2000
     * @tc.name      testHandlerRestart_020
     * @tc.desc      Verify that preview presence follows the attached state across a stop and a recovery.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_020 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const attached: string = AppStorage.get<string>('showLog') ?? '';
      handlerRef.onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const detached: string = AppStorage.get<string>('showLog') ?? '';
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const recovered: string = AppStorage.get<string>('showLog') ?? '';
      expect(attached.indexOf('five chars:')).assertEqual(0);
      expect(detached.indexOf('five chars:')).assertEqual(-1);
      expect(recovered.indexOf('five chars:')).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_2100
     * @tc.name      testHandlerRestart_021
     * @tc.desc      Verify that a stop after a recovery closes both the editor and the hide paths for that client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_021 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('once');
      handlerRef.onInputStop();
      handlerRef.insertText('late');
      handlerRef.hideKeyboardSelf();
      expect(harness.client.insertedTexts.join('')).assertEqual('once');
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_2200
     * @tc.name      testHandlerRestart_022
     * @tc.desc      Verify that a text field set during a stopped gap appears in the next session summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_022 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.onInputStop();
      handlerRef.setTextInfo('GAP-T');
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('GAP-T') >= 0).assertTrue();
      expect(summary.indexOf('FWD5') >= 0).assertTrue();
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_2300
     * @tc.name      testHandlerRestart_023
     * @tc.desc      Verify that three non-enter commands after a recovery leave the stored type and enter list untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_023 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(4);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('a');
      handlerRef.deleteBackward(1);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.journal.length).assertEqual(3);
      expect(harness.client.keyFunctions.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_2400
     * @tc.name      testHandlerRestart_024
     * @tc.desc      Verify that two enters after recovery are recorded and a third one after a stop is dropped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_024 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(5);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      handlerRef.sendKeyFunction();
      handlerRef.onInputStop();
      handlerRef.sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('5|5');
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_RESTART_2500
     * @tc.name      testHandlerRestart_025
     * @tc.desc      Verify that five recoveries of one client add five hides and no editor commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerRestart_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_025 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      handlerRef.hideKeyboardSelf();
      let i: number = 0;
      while (i < 5) {
        handlerRef.onInputStop();
        handlerRef.onInputStart(
          harness.keyboard as object as inputMethodEngine.KeyboardController,
          harness.client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        handlerRef.hideKeyboardSelf();
        i = i + 1;
      }
      expect(harness.keyboard.hideCount).assertEqual(6);
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerRestart_025 end');
      await yieldToEventLoop();
    });

  });
}
