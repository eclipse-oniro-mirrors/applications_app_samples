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
import { FaultInputClient, FaultKeyboardController, attachFaultClient } from '../support/FaultHarness';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputInputHandlerPayload]';

const INT_MAX: number = 2147483647;

function repeat(char: string, times: number): string {
  let result: string = '';
  for (let i = 0; i < times; i++) {
    result = result + char;
  }
  return result;
}

function summary(): string {
  return AppStorage.get<string>('showLog') ?? '';
}

export default function inputHandlerDataFamilyTest(): void {
  describe('InputHandlerDataFamilyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0100
     * @tc.name      testInputHandlerPayload_001
     * @tc.desc      Verify that an empty insertion reaches the editor as one empty command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('');
      expect(harness.client.journal.join('|')).assertEqual('insert:');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0200
     * @tc.name      testInputHandlerPayload_002
     * @tc.desc      Verify that control whitespace is forwarded without normalisation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_002 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      const payload: string = 'tab\tline\ncarriage\r';
      handlerRef.insertText(payload);
      expect(harness.client.insertedTexts[0].indexOf('\t') > 0).assertTrue();
      expect(harness.client.insertedTexts[0].indexOf('\n') > 0).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual(payload);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0300
     * @tc.name      testInputHandlerPayload_003
     * @tc.desc      Verify that CJK and emoji payloads survive the insertion call unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      const payload: string = '中文😀';
      InputHandler.getInstance().insertText(payload);
      expect(editorRef.insertedTexts[0]).assertEqual(payload);
      expect(editorRef.insertedTexts[0].length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0400
     * @tc.name      testInputHandlerPayload_004
     * @tc.desc      Verify that a long payload is forwarded as one command without truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPayload_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      const payload: string = repeat('x', 1024);
      InputHandler.getInstance().insertText(payload);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0].length).assertEqual(1024);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0500
     * @tc.name      testInputHandlerPayload_005
     * @tc.desc      Verify that a zero-length backward deletion is forwarded verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_005 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      handlerRef.deleteBackward(0);
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.journal[0]).assertEqual('back:0');
      expect(harness.client.backwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0600
     * @tc.name      testInputHandlerPayload_006
     * @tc.desc      Verify that a negative backward length is forwarded without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPayload_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().deleteBackward(-5);
      expect(harness.client.journal[0]).assertEqual('back:-5');
      expect(harness.client.backwardLengths[0]).assertEqual(-5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0700
     * @tc.name      testInputHandlerPayload_007
     * @tc.desc      Verify that the maximum integer backward length is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPayload_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().deleteBackward(INT_MAX);
      expect(editorRef.backwardLengths[0]).assertEqual(INT_MAX);
      expect(editorRef.journal[0]).assertEqual('back:' + INT_MAX);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0800
     * @tc.name      testInputHandlerPayload_008
     * @tc.desc      Verify that forward deletion accepts zero, negative and maximum lengths.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPayload_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_008 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.deleteForward(0);
      handlerRef.deleteForward(-7);
      handlerRef.deleteForward(INT_MAX);
      expect(harness.client.forwardLengths[2]).assertEqual(INT_MAX);
      expect(harness.client.forwardLengths.length).assertEqual(3);
      expect(harness.client.forwardLengths[0]).assertEqual(0);
      expect(harness.client.forwardLengths[1]).assertEqual(-7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_0900
     * @tc.name      testInputHandlerPayload_009
     * @tc.desc      Verify that all four cursor directions arrive in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.movedDirections[2]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.movedDirections[3]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.movedDirections.length).assertEqual(4);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.movedDirections[1]).assertEqual(inputMethodEngine.Direction.CURSOR_DOWN);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_1000
     * @tc.name      testInputHandlerPayload_010
     * @tc.desc      Verify that all four extend actions arrive in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      const actions: inputMethodEngine.ExtendAction[] = [
        inputMethodEngine.ExtendAction.SELECT_ALL,
        inputMethodEngine.ExtendAction.CUT,
        inputMethodEngine.ExtendAction.COPY,
        inputMethodEngine.ExtendAction.PASTE
      ];
      for (let i = 0; i < actions.length; i++) {
        InputHandler.getInstance().sendExtendAction(actions[i]);
      }
      expect(harness.client.extendActions.length).assertEqual(4);
      for (let i = 0; i < actions.length; i++) {
        expect(harness.client.extendActions[i]).assertEqual(actions[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_1100
     * @tc.name      testInputHandlerPayload_011
     * @tc.desc      Verify that repeated identical insertions keep their multiplicity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_011 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      handlerRef.insertText('a');
      handlerRef.insertText('a');
      handlerRef.insertText('a');
      expect(editorRef.insertedTexts.join('')).assertEqual('aaa');
      expect(editorRef.journal.length).assertEqual(3);
      expect(editorRef.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_1200
     * @tc.name      testInputHandlerPayload_012
     * @tc.desc      Verify that a mixed command sequence keeps its exact journal order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerPayload_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(7);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('ab');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().sendKeyFunction();
      const expected: string[] = ['insert:ab', 'back:1', 'move:3', 'forward:2', 'extend:4', 'enter:7'];
      expect(harness.client.journal.join('|')).assertEqual(expected.join('|'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_1300
     * @tc.name      testInputHandlerPayload_013
     * @tc.desc      Verify that diagnostic text setters are visible in the refreshed summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPayload_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_013 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);

      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      InputHandler.getInstance().setSelectInfo('SEL-zero');
      InputHandler.getInstance().setTextInfo('TXT-zero');
      InputHandler.getInstance().setInputInfo('INP-zero');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('SEL-zero') >= 0).assertEqual(true);
      expect(summary.indexOf('TXT-zero') >= 0).assertEqual(true);
      expect(summary.indexOf('INP-zero') >= 0).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_PAYLOAD_1400
     * @tc.name      testInputHandlerPayload_014
     * @tc.desc      Verify that negative cursor coordinates and long diagnostic strings are stored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerPayload_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_014 begin');
      handlerRef.onInputStop();
      await createClientHarness(0);

      handlerRef.setCursorInfo({ x: -1, y: -2, height: -3 });
      const longText: string = repeat('L', 256);
      handlerRef.setSelectInfo(longText);
      handlerRef.setTextInfo('中文文本');
      handlerRef.setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('中文文本') >= 0).assertTrue();
      expect(summary.indexOf(longText) >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerPayload_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0100
     * @tc.name      testInputHandlerLifecycle_001
     * @tc.desc      Verify that a second start freezes the first client and serves the new one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_001 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1, 0);
      const editorRef: FakeInputClient = first.client;
      const second: ClientHarness = await createClientHarness(2, 3);

      InputHandler.getInstance().insertText('x');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(3);
      expect(editorRef.insertedTexts.length).assertEqual(0);
      expect(second.client.insertedTexts.length).assertEqual(1);
      expect(second.client.insertedTexts[0]).assertEqual('x');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0200
     * @tc.name      testInputHandlerLifecycle_002
     * @tc.desc      Verify that a stop before any start is harmless and the next start works.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_002 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('before-start');

      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('after-start');
      expect(harness.client.insertedTexts[0]).assertEqual('after-start');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0300
     * @tc.name      testInputHandlerLifecycle_003
     * @tc.desc      Verify that a repeated stop keeps the client detached and commands frozen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_003 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      handlerRef.insertText('a');
      handlerRef.onInputStop();
      handlerRef.onInputStop();
      handlerRef.insertText('b');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0400
     * @tc.name      testInputHandlerLifecycle_004
     * @tc.desc      Verify that a start after a stop resumes delivery to the new client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_004 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(1, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('first');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(5, 6);
      InputHandler.getInstance().insertText('second');

      expect(second.client.insertedTexts.join('|')).assertEqual('second');
      expect(first.client.insertedTexts.join('|')).assertEqual('first');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0500
     * @tc.name      testInputHandlerLifecycle_005
     * @tc.desc      Verify that the stored enter type and pattern survive an input stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_005 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(5, 6);

      InputHandler.getInstance().onInputStop();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0600
     * @tc.name      testInputHandlerLifecycle_006
     * @tc.desc      Verify that a restart overwrites both stored editor attributes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_006 begin');
      handlerRef.onInputStop();
      await createClientHarness(1, 1);
      handlerRef.onInputStop();
      await createClientHarness(9, 8);

      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0700
     * @tc.name      testInputHandlerLifecycle_007
     * @tc.desc      Verify that hiding before a start is harmless and works after a start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_007 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();

      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0800
     * @tc.name      testInputHandlerLifecycle_008
     * @tc.desc      Verify that an enter before a start is harmless and works after a start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_008 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendKeyFunction();

      const harness: ClientHarness = new ClientHarness(4, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(4);
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_0900
     * @tc.name      testInputHandlerLifecycle_009
     * @tc.desc      Verify that editing calls before a start leave no journal behind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerLifecycle_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_009 begin');
      handlerRef.onInputStop();
      handlerRef.deleteBackward(1);
      handlerRef.deleteForward(2);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);

      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      handlerRef.insertText('z');
      expect(editorRef.journal.join('|')).assertEqual('insert:z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_1000
     * @tc.name      testInputHandlerLifecycle_010
     * @tc.desc      Verify that refreshing before a start omits the editor preview block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerLifecycle_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_010 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('SELECT-BEFORE');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('SELECT-BEFORE') >= 0).assertTrue();
      expect(summary.indexOf('five chars:')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_1100
     * @tc.name      testInputHandlerLifecycle_011
     * @tc.desc      Verify that refreshing after a stop omits the detached editor preview block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerLifecycle_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_011 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setTextInfo('TEXT-AFTER-STOP');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('five chars:')).assertEqual(-1);
      expect(summary.indexOf('TEXT-AFTER-STOP') >= 0).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_1200
     * @tc.name      testInputHandlerLifecycle_012
     * @tc.desc      Verify that every start reads the editor attribute exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerLifecycle_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_012 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(1, 0);
      await Promise.resolve();
      await Promise.resolve();
      const second: ClientHarness = await createClientHarness(2, 1);
      const third: ClientHarness = await createClientHarness(3, 2);

      expect(first.client.editorAttributeCount).assertEqual(1);
      expect(second.client.editorAttributeCount).assertEqual(1);
      expect(third.client.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_1300
     * @tc.name      testInputHandlerLifecycle_013
     * @tc.desc      Verify that the old client stays frozen for every command kind after a restart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerLifecycle_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_013 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1, 0);
      const keyboardRef: FakeKeyboardController = first.keyboard;
      const editorRef: FakeInputClient = first.client;
      InputHandler.getInstance().insertText('old');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(2, 0);

      InputHandler.getInstance().insertText('new');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();

      expect(second.client.journal.length).assertEqual(5);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(editorRef.journal.length).assertEqual(1);
      expect(keyboardRef.hideCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_LIFECYCLE_1400
     * @tc.name      testInputHandlerLifecycle_014
     * @tc.desc      Verify that three stop-start cycles keep storage stable and delivery local.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerLifecycle_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_014 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(1, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('one');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(2, 1);
      InputHandler.getInstance().insertText('two');
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(3, 2);
      InputHandler.getInstance().insertText('three');

      expect(third.client.insertedTexts.join('|')).assertEqual('three');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2);
      expect(first.client.insertedTexts.join('|')).assertEqual('one');
      expect(second.client.insertedTexts.join('|')).assertEqual('two');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerLifecycle_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0100
     * @tc.name      testInputHandlerDiagnostics_001
     * @tc.desc      Verify that a refresh without a client omits the editor preview but keeps text fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerDiagnostics_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_001 begin');
      handlerRef.onInputStop();
      handlerRef.setSelectInfo('SEL-NO-CLIENT');
      handlerRef.setTextInfo('TXT-NO-CLIENT');
      handlerRef.setInputInfo('INP-NO-CLIENT');
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const text: string = summary();
      expect(text.indexOf('five chars:')).assertEqual(-1);
      expect(text.indexOf('SEL-NO-CLIENT') >= 0).assertTrue();
      expect(text.indexOf('TXT-NO-CLIENT') >= 0).assertTrue();
      expect(text.indexOf('INP-NO-CLIENT') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0200
     * @tc.name      testInputHandlerDiagnostics_002
     * @tc.desc      Verify that a refresh with a client includes both five-character previews.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerDiagnostics_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_002 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = summary();
      // The fake editor returns FWD5 and BWD5 for the two preview probes.
      expect(text.indexOf('BWD5') >= 0).assertTrue();
      expect(text.indexOf('FWD5') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0300
     * @tc.name      testInputHandlerDiagnostics_003
     * @tc.desc      Verify that a later select payload overwrites the earlier one in the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerDiagnostics_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_003 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('FIRST');
      InputHandler.getInstance().setSelectInfo('SECOND');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = summary();
      expect(text.indexOf('SECOND') >= 0).assertEqual(true);
      expect(text.indexOf('FIRST') >= 0).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0400
     * @tc.name      testInputHandlerDiagnostics_004
     * @tc.desc      Verify that a later text payload overwrites the earlier one in the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerDiagnostics_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_004 begin');
      handlerRef.onInputStop();
      handlerRef.setTextInfo('OLD-TEXT');
      handlerRef.setTextInfo('NEW-TEXT');
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      const text: string = summary();
      expect(text.indexOf('OLD-TEXT') >= 0).assertFalse();
      expect(text.indexOf('NEW-TEXT') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0500
     * @tc.name      testInputHandlerDiagnostics_005
     * @tc.desc      Verify that a later input payload overwrites the earlier one in the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerDiagnostics_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_005 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setInputInfo('OLD-INPUT');
      InputHandler.getInstance().setInputInfo('NEW-INPUT');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = summary();
      expect(text.indexOf('NEW-INPUT') >= 0).assertTrue();
      expect(text.indexOf('OLD-INPUT') >= 0).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0600
     * @tc.name      testInputHandlerDiagnostics_006
     * @tc.desc      Verify that repeated refreshes produce the same summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerDiagnostics_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_006 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('STABLE-SELECT');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const first: string = summary();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const second: string = summary();
      expect(second).assertEqual(first);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0700
     * @tc.name      testInputHandlerDiagnostics_007
     * @tc.desc      Verify that empty diagnostic payloads are accepted and keep the summary typed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerDiagnostics_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_007 begin');
      handlerRef.onInputStop();
      handlerRef.setSelectInfo('');
      handlerRef.setTextInfo('');
      handlerRef.setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      expect(typeof summary()).assertEqual('string');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0800
     * @tc.name      testInputHandlerDiagnostics_008
     * @tc.desc      Verify that a long diagnostic payload is not truncated in the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerDiagnostics_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_008 begin');
      InputHandler.getInstance().onInputStop();
      let payload: string = '';
      for (let i = 0; i < 512; i++) {
        payload = payload + 'D';
      }
      InputHandler.getInstance().setTextInfo(payload);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf(payload) >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_0900
     * @tc.name      testInputHandlerDiagnostics_009
     * @tc.desc      Verify that a Unicode diagnostic payload survives the summary assembly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerDiagnostics_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_009 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setInputInfo('输入信息😀');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf('输入信息😀') >= 0).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_1000
     * @tc.name      testInputHandlerDiagnostics_010
     * @tc.desc      Verify that a pre-start select field survives while the input field is replaced by editor info.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerDiagnostics_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_010 begin');
      handlerRef.onInputStop();
      handlerRef.setSelectInfo('BEFORE-START-SELECT');
      handlerRef.setInputInfo('BEFORE-START-INFO');
      await createClientHarness(0);
      AppStorage.setOrCreate<string>('showLog', '');
      handlerRef.refreshInfo();
      expect(summary().indexOf('EditorInfo') >= 0).assertTrue();
      expect(summary().indexOf('BEFORE-START-INFO') >= 0).assertFalse();
      expect(summary().indexOf('BEFORE-START-SELECT') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_1100
     * @tc.name      testInputHandlerDiagnostics_011
     * @tc.desc      Verify that a second start does not erase diagnostics set in the first session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerDiagnostics_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_011 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('KEPT-SELECT');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(1);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf('KEPT-SELECT') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_DIAGNOSTICS_1200
     * @tc.name      testInputHandlerDiagnostics_012
     * @tc.desc      Verify that setting only one diagnostic field leaves the other two defaults intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerDiagnostics_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_012 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('ONLY-SELECT');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = summary();
      expect(text.indexOf('ONLY-SELECT') >= 0).assertEqual(true);
      // Default text and input fields are empty strings, so the summary ends with two blank lines.
      expect(text.split('\n').length >= 3).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerDiagnostics_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0100
     * @tc.name      testInputHandlerCommandMatrix_001
     * @tc.desc      Verify an insert-delete-insert-delete chain keeps four ordered commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_001 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      handlerRef.insertText('a');
      handlerRef.deleteBackward(1);
      handlerRef.insertText('b');
      handlerRef.deleteBackward(2);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|back:1|insert:b|back:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0200
     * @tc.name      testInputHandlerCommandMatrix_002
     * @tc.desc      Verify a backward, insert, forward and insert chain.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().deleteForward(3);
      InputHandler.getInstance().insertText('y');
      expect(harness.client.journal.join('|')).assertEqual('back:1|insert:x|forward:3|insert:y');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0300
     * @tc.name      testInputHandlerCommandMatrix_003
     * @tc.desc      Verify a move-insert-move-insert chain keeps both directions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().insertText('b');
      expect(editorRef.journal.join('|')).assertEqual('move:3|insert:a|move:4|insert:b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0400
     * @tc.name      testInputHandlerCommandMatrix_004
     * @tc.desc      Verify an extend-insert-extend-insert chain keeps both actions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_004 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      handlerRef.insertText('s');
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handlerRef.insertText('c');
      expect(harness.client.journal.join('|')).assertEqual('extend:0|insert:s|extend:3|insert:c');
      expect(harness.client.extendActions.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0500
     * @tc.name      testInputHandlerCommandMatrix_005
     * @tc.desc      Verify an enter-insert-enter-insert chain uses the stored enter type twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3, 0);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('b');
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.journal.join('|')).assertEqual('enter:3|insert:a|enter:3|insert:b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0600
     * @tc.name      testInputHandlerCommandMatrix_006
     * @tc.desc      Verify hide-insert-hide reaches the controller twice and the editor once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('h');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.journal.join('|')).assertEqual('insert:h');
      expect(harness.keyboard.hideCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0700
     * @tc.name      testInputHandlerCommandMatrix_007
     * @tc.desc      Verify an insert-move-delete-move-insert chain keeps all five commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerCommandMatrix_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_007 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      handlerRef.insertText('a');
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handlerRef.deleteBackward(1);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      handlerRef.insertText('b');
      expect(editorRef.journal.join('|'))
        .assertEqual('insert:a|move:3|back:1|move:4|insert:b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0800
     * @tc.name      testInputHandlerCommandMatrix_008
     * @tc.desc      Verify three insertions followed by three deletions keep their counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().insertText('c');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.client.journal.length).assertEqual(6);
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.backwardLengths.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_0900
     * @tc.name      testInputHandlerCommandMatrix_009
     * @tc.desc      Verify two forward deletions before two insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().deleteForward(4);
      InputHandler.getInstance().insertText('m');
      InputHandler.getInstance().insertText('n');
      expect(harness.client.journal.join('|')).assertEqual('forward:2|forward:4|insert:m|insert:n');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_1000
     * @tc.name      testInputHandlerCommandMatrix_010
     * @tc.desc      Verify cut, paste and an insertion keep their three actions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_010 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      handlerRef.insertText('z');
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions[1]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.insertedTexts[0]).assertEqual('z');
      expect(harness.client.extendActions.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_1100
     * @tc.name      testInputHandlerCommandMatrix_011
     * @tc.desc      Verify that enter uses the type of the client active at the call time.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerCommandMatrix_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_011 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0, 0);
      const editorRef: FakeInputClient = first.client;
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(9, 0);
      InputHandler.getInstance().sendKeyFunction();

      expect(second.client.keyFunctions.length).assertEqual(1);
      expect(editorRef.keyFunctions[0]).assertEqual(0);
      expect(second.client.keyFunctions[0]).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_1200
     * @tc.name      testInputHandlerCommandMatrix_012
     * @tc.desc      Verify hide twice before an insertion leaves the editor command intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('k');
      expect(harness.client.insertedTexts.join('')).assertEqual('k');
      expect(keyboardRef.hideCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_1300
     * @tc.name      testInputHandlerCommandMatrix_013
     * @tc.desc      Verify a Unicode insertion followed by a backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_013 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      handlerRef.insertText('中');
      handlerRef.deleteBackward(1);
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:中|back:1');
      expect(harness.client.insertedTexts[0]).assertEqual('中');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_1400
     * @tc.name      testInputHandlerCommandMatrix_014
     * @tc.desc      Verify a long insertion followed by a forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerCommandMatrix_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      let payload: string = '';
      for (let i = 0; i < 128; i++) {
        payload = payload + 'z';
      }
      InputHandler.getInstance().insertText(payload);
      InputHandler.getInstance().deleteForward(128);
      expect(harness.client.forwardLengths[0]).assertEqual(128);
      expect(harness.client.insertedTexts[0].length).assertEqual(128);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_1500
     * @tc.name      testInputHandlerCommandMatrix_015
     * @tc.desc      Verify all four cursor directions followed by one insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerCommandMatrix_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().insertText('i');
      expect(editorRef.movedDirections.length).assertEqual(4);
      expect(editorRef.journal[4]).assertEqual('insert:i');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_COMMAND_MATRIX_1600
     * @tc.name      testInputHandlerCommandMatrix_016
     * @tc.desc      Verify that a stop in the middle of a chain freezes the remaining commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerCommandMatrix_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_016 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.insertText('a');
      handlerRef.deleteBackward(1);
      handlerRef.onInputStop();
      handlerRef.insertText('b');
      handlerRef.deleteForward(2);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|back:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerCommandMatrix_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0100
     * @tc.name      testInputHandlerFault_001
     * @tc.desc      Verify that a synchronous editor-attribute fault propagates out of onInputStart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerFault_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_001 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnAttribute = true;
      const keyboard: FaultKeyboardController = new FaultKeyboardController();
      let thrown: boolean = false;
      try {
        attachFaultClient(client, keyboard);
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0200
     * @tc.name      testInputHandlerFault_002
     * @tc.desc      Verify that a failed start still leaves the assigned client receiving insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerFault_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_002 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnAttribute = true;
      try {
        attachFaultClient(client, new FaultKeyboardController());
      } catch (error) {
        // The assignment happens before the attribute read; the probe asserts that side effect.
      }
      InputHandler.getInstance().insertText('after-fault');
      expect(client.insertedTexts[0]).assertEqual('after-fault');
      expect(client.insertedTexts.length).assertEqual(1);
      InputHandler.getInstance().onInputStop();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0300
     * @tc.name      testInputHandlerFault_003
     * @tc.desc      Verify that a false insertion result is ignored and does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerFault_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_003 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      handlerRef.insertText('rejected');
      expect(client.insertedTexts[0]).assertEqual('rejected');
      expect(client.journal.join('|')).assertEqual('insert:rejected');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0400
     * @tc.name      testInputHandlerFault_004
     * @tc.desc      Verify that a false backward-deletion result is ignored and does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerFault_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_004 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      InputHandler.getInstance().deleteBackward(3);
      expect(client.journal.join('|')).assertEqual('back:3');
      expect(client.backwardLengths[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0500
     * @tc.name      testInputHandlerFault_005
     * @tc.desc      Verify that a false forward-deletion result is ignored and does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerFault_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_005 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      InputHandler.getInstance().deleteForward(4);
      expect(client.forwardLengths[0]).assertEqual(4);
      expect(client.journal.join('|')).assertEqual('forward:4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0600
     * @tc.name      testInputHandlerFault_006
     * @tc.desc      Verify that a false enter result is ignored and the command is still recorded.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerFault_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_006 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.returnFalse = true;
      attachFaultClient(client, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(client.journal.join('|')).assertEqual('enter:0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0700
     * @tc.name      testInputHandlerFault_007
     * @tc.desc      Verify that a synchronous hide fault propagates out of hideKeyboardSelf.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerFault_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_007 begin');
      InputHandler.getInstance().onInputStop();
      attachFaultClient(new FaultInputClient(), new FaultKeyboardController());
      let thrown: boolean = false;
      try {
        InputHandler.getInstance().hideKeyboardSelf();
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0800
     * @tc.name      testInputHandlerFault_008
     * @tc.desc      Verify that a synchronous preview fault propagates out of refreshInfo.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerFault_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_008 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      client.throwOnPreview = true;
      attachFaultClient(client, new FaultKeyboardController());
      let thrown: boolean = false;
      try {
        InputHandler.getInstance().refreshInfo();
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_0900
     * @tc.name      testInputHandlerFault_009
     * @tc.desc      Verify that a stop after a fault detaches the client from later commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerFault_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_009 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = new FaultInputClient();
      attachFaultClient(client, new FaultKeyboardController());
      handlerRef.insertText('kept');
      handlerRef.onInputStop();
      handlerRef.insertText('dropped');
      expect(client.insertedTexts.join('|')).assertEqual('kept');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_FAULT_1000
     * @tc.name      testInputHandlerFault_010
     * @tc.desc      Verify that a healthy attach after a fault resumes normal command delivery.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerFault_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_010 begin');
      InputHandler.getInstance().onInputStop();
      const broken: FaultInputClient = new FaultInputClient();
      broken.throwOnAttribute = true;
      try {
        attachFaultClient(broken, new FaultKeyboardController());
      } catch (error) {
        // Expected; the next attach must replace the broken client.
      }
      const healthy: FaultInputClient = new FaultInputClient();
      attachFaultClient(healthy, new FaultKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('healthy');
      expect(healthy.insertedTexts[0]).assertEqual('healthy');
      expect(broken.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerFault_010 end');
      await yieldToEventLoop();
    });

  });

}
