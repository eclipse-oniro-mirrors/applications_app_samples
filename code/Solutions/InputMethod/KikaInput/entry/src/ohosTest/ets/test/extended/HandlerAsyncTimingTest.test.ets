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
const TAG: string = '[Sample_KikaInputHandlerAsyncTiming]';

export default function HandlerAsyncTimingTestTest(): void {
  describe('HandlerAsyncTimingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0100
     * @tc.name      testHandlerAsyncTiming_001
     * @tc.desc      Verify an insertion sent before the attribute promise resolves is still delivered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().insertText('sync-insert');
      expect(harness.client.insertedTexts.join('')).assertEqual('sync-insert');
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0200
     * @tc.name      testHandlerAsyncTiming_002
     * @tc.desc      Verify an enter sent before the attribute promise resolves is dropped silently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_002 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(5);
      handlerRef.sendKeyFunction();
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0300
     * @tc.name      testHandlerAsyncTiming_003
     * @tc.desc      Verify the pending enter becomes usable once the start promise chain settles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(6);
      const editorRef: FakeInputClient = harness.client;
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(editorRef.keyFunctions.join('')).assertEqual('6');
      expect(editorRef.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0400
     * @tc.name      testHandlerAsyncTiming_004
     * @tc.desc      Verify a stop issued before resolution does not cancel the pending storage write.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(8, 3);
      InputHandler.getInstance().onInputStop();
      await Promise.resolve();
      await Promise.resolve();
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(8);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(3);
      expect(harness.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0500
     * @tc.name      testHandlerAsyncTiming_005
     * @tc.desc      Verify an insertion and a stop in the same tick keep the insertion in the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_005 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      handlerRef.insertText('same-tick');
      handlerRef.onInputStop();
      handlerRef.insertText('after-stop');
      expect(harness.client.insertedTexts.join('|')).assertEqual('same-tick');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0600
     * @tc.name      testHandlerAsyncTiming_006
     * @tc.desc      Verify two starts in one tick each request one attribute and the later value wins.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_006 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(1, 11);
      const second: ClientHarness = new ClientHarness(2, 22);
      await Promise.resolve();
      await Promise.resolve();
      expect(second.client.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(22);
      expect(first.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0700
     * @tc.name      testHandlerAsyncTiming_007
     * @tc.desc      Verify a same-tick second start owns insertions before any microtask runs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_007 begin');
      InputHandler.getInstance().onInputStop();
      const oldClient: ClientHarness = new ClientHarness(0);
      const editorRef: FakeInputClient = oldClient.client;
      const newClient: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().insertText('owner');
      expect(editorRef.insertedTexts.length).assertEqual(0);
      expect(newClient.client.insertedTexts[0]).assertEqual('owner');
      expect(newClient.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0800
     * @tc.name      testHandlerAsyncTiming_008
     * @tc.desc      Verify a same-tick stop-start pair keeps the middle client frozen and serves the last.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_008 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      handlerRef.onInputStop();
      const second: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('third');
      expect(second.client.insertedTexts.join('')).assertEqual('third');
      expect(second.client.editorAttributeCount).assertEqual(1);
      expect(first.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_0900
     * @tc.name      testHandlerAsyncTiming_009
     * @tc.desc      Verify a stop in the same tick does not trigger a second attribute request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(3);
      InputHandler.getInstance().onInputStop();
      expect(harness.client.editorAttributeCount).assertEqual(1);
      InputHandler.getInstance().onInputStop();
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1000
     * @tc.name      testHandlerAsyncTiming_010
     * @tc.desc      Verify a hide request in the same tick reaches the controller with no wait.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.keyboard.hideCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1100
     * @tc.name      testHandlerAsyncTiming_011
     * @tc.desc      Verify both deletion kinds are usable in the same tick as the start call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_011 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      handlerRef.deleteBackward(4);
      handlerRef.deleteForward(7);
      expect(editorRef.forwardLengths.join('')).assertEqual('7');
      expect(editorRef.journal.join('|')).assertEqual('back:4|forward:7');
      expect(editorRef.backwardLengths.join('')).assertEqual('4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1200
     * @tc.name      testHandlerAsyncTiming_012
     * @tc.desc      Verify caret movement and extend actions also work before resolution.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.movedDirections.length).assertEqual(2);
      expect(harness.client.extendActions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1300
     * @tc.name      testHandlerAsyncTiming_013
     * @tc.desc      Verify an enter issued after one turn carries the type that was pending at start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(15, 1);
      InputHandler.getInstance().sendKeyFunction();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(15);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(15);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1400
     * @tc.name      testHandlerAsyncTiming_014
     * @tc.desc      Verify an insertion in a stopped tick never reaches the detached client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_014 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      handlerRef.onInputStop();
      handlerRef.insertText('dropped');
      handlerRef.deleteBackward(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1500
     * @tc.name      testHandlerAsyncTiming_015
     * @tc.desc      Verify a command before a same-tick stop is not lost by the late attribute callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().insertText('kept');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(editorRef.insertedTexts.join('')).assertEqual('kept');
      expect(editorRef.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1600
     * @tc.name      testHandlerAsyncTiming_016
     * @tc.desc      Verify two same-tick starts route every hide to the newest controller only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_016 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      const second: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(first.keyboard.hideCount).assertEqual(0);
      expect(second.keyboard.hideCount).assertEqual(2);
      expect(second.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1700
     * @tc.name      testHandlerAsyncTiming_017
     * @tc.desc      Verify a start-stop-start tick stores the final start value after both callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_017 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = new ClientHarness(21, 31);
      handlerRef.onInputStop();
      const second: ClientHarness = new ClientHarness(22, 32);
      await Promise.resolve();
      await Promise.resolve();
      expect(first.client.editorAttributeCount).assertEqual(1);
      expect(second.client.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(22);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(32);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1800
     * @tc.name      testHandlerAsyncTiming_018
     * @tc.desc      Verify an insert works while the second client still waits for its attribute.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_018 begin');
      InputHandler.getInstance().onInputStop();
      await Promise.resolve();
      const harness: ClientHarness = new ClientHarness(9);
      InputHandler.getInstance().insertText('eager');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('eager');
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('')).assertEqual('9');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_1900
     * @tc.name      testHandlerAsyncTiming_019
     * @tc.desc      Verify a same-tick stop keeps the pending attribute as the last stored value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_019 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(77, 88);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().onInputStop();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(77);
      await Promise.resolve();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(88);
      expect(editorRef.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_ASYNC_TIMING_2000
     * @tc.name      testHandlerAsyncTiming_020
     * @tc.desc      Verify attribute reads happen at start events only and never for later commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncTiming_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_020 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      handlerRef.onInputStop();
      handlerRef.insertText('idle');
      handlerRef.sendKeyFunction();
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncTiming_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0100
     * @tc.name      testHandlerAsyncExtra_001
     * @tc.desc      Verify the stored type keeps the previous session value until the next callback lands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_001 begin');
      InputHandler.getInstance().onInputStop();
      const observed: number[] = [];
      await createClientHarness(5, 0);
      observed.push(AppStorage.get<number>('enterKeyType') ?? -1);
      InputHandler.getInstance().onInputStop();
      const pending: ClientHarness = new ClientHarness(7, 0);
      observed.push(AppStorage.get<number>('enterKeyType') ?? -1);
      expect(pending.client.editorAttributeCount).assertEqual(1);
      await Promise.resolve();
      await Promise.resolve();
      observed.push(AppStorage.get<number>('enterKeyType') ?? -1);
      expect(observed.join('|')).assertEqual('5|5|7');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0200
     * @tc.name      testHandlerAsyncExtra_002
     * @tc.desc      Verify a same-tick pair of starts leaves the middle value only until both callbacks land.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_002 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(11, 0);
      InputHandler.getInstance().onInputStop();
      const middle: ClientHarness = new ClientHarness(12, 0);
      const last: ClientHarness = new ClientHarness(13, 0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(11);
      await Promise.resolve();
      await Promise.resolve();
      expect(middle.client.editorAttributeCount).assertEqual(1);
      expect(last.client.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(13);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0300
     * @tc.name      testHandlerAsyncExtra_003
     * @tc.desc      Verify the pattern field also waits one callback before replacing its stored value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_003 begin');
      handlerRef.onInputStop();
      await createClientHarness(0, 21);
      handlerRef.onInputStop();
      new ClientHarness(0, 22);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(21);
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(22);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0400
     * @tc.name      testHandlerAsyncExtra_004
     * @tc.desc      Verify a pending start still routes insertions while its type remains uncommitted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_004 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(1, 1);
      InputHandler.getInstance().onInputStop();
      const pending: ClientHarness = new ClientHarness(2, 2);
      InputHandler.getInstance().insertText('early');
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);
      expect(pending.client.insertedTexts.join('')).assertEqual('early');
      expect(pending.client.keyFunctions.length).assertEqual(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(pending.client.keyFunctions.join('')).assertEqual('2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0500
     * @tc.name      testHandlerAsyncExtra_005
     * @tc.desc      Verify a stop does not roll back the type already committed by an earlier await.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(31, 41);
      InputHandler.getInstance().onInputStop();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(31);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(41);
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(31);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0600
     * @tc.name      testHandlerAsyncExtra_006
     * @tc.desc      Verify a pending start followed by a stop keeps the callback write but loses delivery.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_006 begin');
      handlerRef.onInputStop();
      const pending: ClientHarness = new ClientHarness(51, 61);
      handlerRef.onInputStop();
      handlerRef.insertText('gone');
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(61);
      expect(pending.client.journal.length).assertEqual(0);
      expect(pending.client.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(51);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0700
     * @tc.name      testHandlerAsyncExtra_007
     * @tc.desc      Verify five same-tick starts each read one attribute and only the last receives.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_007 begin');
      InputHandler.getInstance().onInputStop();
      const harnesses: ClientHarness[] = [];
      let i: number = 0;
      while (i < 5) {
        harnesses.push(new ClientHarness(i, i * 2));
        i = i + 1;
      }
      InputHandler.getInstance().insertText('five');
      let totalReads: number = 0;
      let iW1: number = 0;
      while (iW1 < harnesses.length) {
        totalReads = totalReads + harnesses[iW1].client.editorAttributeCount;
        iW1 = iW1 + 1;
      }
      expect(totalReads).assertEqual(5);
      let iW2: number = 0;
      while (iW2 < 4) {
        expect(harnesses[iW2].client.insertedTexts.length).assertEqual(0);
        iW2 = iW2 + 1;
      }
      expect(harnesses[4].client.insertedTexts.join('')).assertEqual('five');
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0800
     * @tc.name      testHandlerAsyncExtra_008
     * @tc.desc      Verify an insert sent to a pending client survives an immediate stop in the same tick.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      const pending: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().insertText('one');
      InputHandler.getInstance().insertText('two');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('three');
      expect(pending.client.journal.length).assertEqual(2);
      expect(pending.client.insertedTexts.join('|')).assertEqual('one|two');
      await Promise.resolve();
      await Promise.resolve();
      expect(pending.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_0900
     * @tc.name      testHandlerAsyncExtra_009
     * @tc.desc      Verify a pending client keeps its type for a reattach after the first stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_009 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(6, 0);
      handlerRef.onInputStop();
      handlerRef.onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(harness.client.editorAttributeCount).assertEqual(2);
      expect(harness.client.keyFunctions.join('')).assertEqual('6');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1000
     * @tc.name      testHandlerAsyncExtra_010
     * @tc.desc      Verify a command before the first await of a reattach is still delivered to the client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().insertText('before');
      await Promise.resolve();
      InputHandler.getInstance().insertText('after');
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('|')).assertEqual('before|after');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1100
     * @tc.name      testHandlerAsyncExtra_011
     * @tc.desc      Verify a refresh between two pending starts omits the preview for the gap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_011 begin');
      InputHandler.getInstance().onInputStop();
      new ClientHarness(0);
      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const gapSummary: string = AppStorage.get<string>('showLog') ?? '';
      expect(gapSummary.indexOf('five chars:')).assertEqual(-1);
      const next: ClientHarness = new ClientHarness(0);
      const editorRef: FakeInputClient = next.client;
      await Promise.resolve();
      await Promise.resolve();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const liveSummary: string = AppStorage.get<string>('showLog') ?? '';
      expect(liveSummary.indexOf('FWD5') >= 0).assertEqual(true);
      expect(editorRef.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1200
     * @tc.name      testHandlerAsyncExtra_012
     * @tc.desc      Verify a stop-start pair in one tick keeps the newest client for hides and edits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_012 begin');
      handlerRef.onInputStop();
      const first: ClientHarness = new ClientHarness(0);
      const keyboardRef: FakeKeyboardController = first.keyboard;
      handlerRef.onInputStop();
      const second: ClientHarness = new ClientHarness(0);
      handlerRef.hideKeyboardSelf();
      handlerRef.deleteForward(9);
      expect(first.client.journal.length).assertEqual(0);
      expect(keyboardRef.hideCount).assertEqual(0);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(second.client.forwardLengths.join('')).assertEqual('9');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1300
     * @tc.name      testHandlerAsyncExtra_013
     * @tc.desc      Verify a client keeps its enter type after two stop and reattach cycles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(23, 0);
      let i: number = 0;
      while (i < 2) {
        InputHandler.getInstance().onInputStop();
        InputHandler.getInstance().onInputStart(
            harness.keyboard as object as inputMethodEngine.KeyboardController,
            harness.client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().sendKeyFunction();
        i = i + 1;
      }
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(23);
      expect(harness.client.keyFunctions.join('|')).assertEqual('23|23');
      expect(harness.client.editorAttributeCount).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1400
     * @tc.name      testHandlerAsyncExtra_014
     * @tc.desc      Verify an insertion issued while no client exists is not replayed by the next start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_014 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('orphan');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('owned');
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('|')).assertEqual('owned');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1500
     * @tc.name      testHandlerAsyncExtra_015
     * @tc.desc      Verify a pending start with a normal type still refuses an enter until the callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_015 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(19, 0);
      const editorRef: FakeInputClient = harness.client;
      handlerRef.sendKeyFunction();
      handlerRef.sendKeyFunction();
      expect(editorRef.keyFunctions.length).assertEqual(0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(editorRef.keyFunctions.join('')).assertEqual('19');
      expect(editorRef.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1600
     * @tc.name      testHandlerAsyncExtra_016
     * @tc.desc      Verify an insert and a move before resolution keep their call order in the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_016 begin');
      InputHandler.getInstance().onInputStop();
      const pending: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().insertText('first');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().insertText('second');
      expect(pending.client.journal[1].indexOf('move:')).assertEqual(0);
      expect(pending.client.journal.length).assertEqual(3);
      expect(pending.client.journal[0]).assertEqual('insert:first');
      expect(pending.client.journal[2]).assertEqual('insert:second');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1700
     * @tc.name      testHandlerAsyncExtra_017
     * @tc.desc      Verify the previous type stays readable through a stop while a new start is pending.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_017 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(43, 0);
      InputHandler.getInstance().onInputStop();
      new ClientHarness(44, 0);
      InputHandler.getInstance().onInputStop();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(43);
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(44);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1800
     * @tc.name      testHandlerAsyncExtra_018
     * @tc.desc      Verify a stop between two pending starts leaves the last start as the only owner.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_018 begin');
      handlerRef.onInputStop();
      const dropped: ClientHarness = new ClientHarness(0);
      handlerRef.onInputStop();
      const owner: ClientHarness = new ClientHarness(0);
      handlerRef.insertText('owner-only');
      expect(owner.client.insertedTexts.join('')).assertEqual('owner-only');
      expect(dropped.client.journal.length).assertEqual(0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.insertText('still-owner');
      expect(dropped.client.insertedTexts.length).assertEqual(0);
      expect(owner.client.insertedTexts.join('|')).assertEqual('owner-only|still-owner');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_1900
     * @tc.name      testHandlerAsyncExtra_019
     * @tc.desc      Verify an empty insertion before resolution is recorded as one command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_019 begin');
      InputHandler.getInstance().onInputStop();
      const pending: ClientHarness = new ClientHarness(0);
      const editorRef: FakeInputClient = pending.client;
      InputHandler.getInstance().insertText('');
      expect(editorRef.insertedTexts[0].length).assertEqual(0);
      expect(editorRef.journal.join('')).assertEqual('insert:');
      expect(editorRef.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ASYNC_EXTRA_2000
     * @tc.name      testHandlerAsyncExtra_020
     * @tc.desc      Verify a late callback cannot re-open a client that was stopped after an insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerAsyncExtra_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().insertText('kept');
      InputHandler.getInstance().onInputStop();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('blocked');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.insertedTexts.join('')).assertEqual('kept');
      expect(harness.client.keyFunctions.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerAsyncExtra_020 end');
      await yieldToEventLoop();
    });

  });
}
