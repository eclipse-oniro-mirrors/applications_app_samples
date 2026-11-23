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
import { yieldToEventLoop } from '../support/AsyncSupport';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import Log from '../../../../main/ets/model/Log';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodHandlerContractTest]';

export default function HandlerContractTestTest(): void {
  describe('HandlerContractTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0001
     * @tc.name      testHandlerContractTest_001
     * @tc.desc      The input handler factory keeps one process-wide instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHandlerContractTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_001 begin');

      const first: InputHandler = InputHandler.getInstance();
      const second: InputHandler = InputHandler.getInstance();

      expect(first).assertEqual(second);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0002
     * @tc.name      testHandlerContractTest_002
     * @tc.desc      Inserting any text without a client stays safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHandlerContractTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_002 begin');

      // No client is attached yet; every handler entry point must be a safe no-op.
      const handler: InputHandler = InputHandler.getInstance();
      const texts: string[] = ['safe', ''];

      for (let i = 0; i < texts.length; i++) {
        handler.insertText(texts[i]);
        expect(handler).assertEqual(InputHandler.getInstance());
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0003
     * @tc.name      testHandlerContractTest_003
     * @tc.desc      Every selection helper is safe without a client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHandlerContractTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_003 begin');

      const handler: InputHandler = InputHandler.getInstance();

      await handler.selectToBegin();
      await handler.selectToEnd();
      await handler.moveCursorToBegin();
      await handler.moveCursorToEnd();
      handler.selectByMovement(inputMethodEngine.Direction.CURSOR_LEFT);

      expect(handler).assertEqual(InputHandler.getInstance());

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0004
     * @tc.name      testHandlerContractTest_004
     * @tc.desc      Recording selection, text and input info is safe without a client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHandlerContractTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_004 begin');

      const handler: InputHandler = InputHandler.getInstance();

      handler.setSelectInfo('safety');
      handler.setTextInfo('safety');
      handler.setInputInfo('safety');

      expect(handler).assertEqual(InputHandler.getInstance());

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0005
     * @tc.name      testHandlerContractTest_005
     * @tc.desc      Sending the enter key and hiding the keyboard are safe without a client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHandlerContractTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_005 begin');

      const handler: InputHandler = InputHandler.getInstance();

      handler.sendKeyFunction();
      handler.hideKeyboardSelf();

      expect(handler).assertEqual(InputHandler.getInstance());

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0006
     * @tc.name      testHandlerContractTest_006
     * @tc.desc      Verify that attaching reads the editor attribute once and sends one private preview command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHandlerContractTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness("");

      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.privateCommandCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0007
     * @tc.name      testHandlerContractTest_007
     * @tc.desc      Verify that the attached editor's enter type and input pattern are published to storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHandlerContractTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_007 begin');
      await createPreviewHarness("");

      // The fake editor reports type 0 and pattern 0.
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0008
     * @tc.name      testHandlerContractTest_008
     * @tc.desc      Verify that a direct re-attach sends a new private command and redirects later insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerContractTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_008 begin');
      const first: PreviewHarness = await createPreviewHarness("");
      const second: PreviewHarness = await createPreviewHarness("");

      InputHandler.getInstance().insertText('a');
      expect(first.client.privateCommandCount).assertEqual(1);
      expect(second.client.privateCommandCount).assertEqual(1);
      expect(first.client.insertedTexts.length).assertEqual(0);
      expect(second.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0009
     * @tc.name      testHandlerContractTest_009
     * @tc.desc      Every Log severity accepts ASCII payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerContractTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_009 begin');

      const payloads: string[] = ['info zero', 'info one', 'warn zero', 'warn one',
        'error zero', 'error one', 'debug zero', 'debug one', 'fatal zero', 'fatal one'];

      Log.showInfo('KikaInputMethodLogProbe', '%{public}s', payloads[0]);
      Log.showInfo('KikaInputMethodLogProbe', '%{public}s', payloads[1]);
      Log.showWarn('KikaInputMethodLogProbe', '%{public}s', payloads[2]);
      Log.showWarn('KikaInputMethodLogProbe', '%{public}s', payloads[3]);
      Log.showError('KikaInputMethodLogProbe', '%{public}s', payloads[4]);
      Log.showError('KikaInputMethodLogProbe', '%{public}s', payloads[5]);
      Log.showDebug('KikaInputMethodLogProbe', '%{public}s', payloads[6]);
      Log.showDebug('KikaInputMethodLogProbe', '%{public}s', payloads[7]);
      Log.showFatal('KikaInputMethodLogProbe', '%{public}s', payloads[8]);
      Log.showFatal('KikaInputMethodLogProbe', '%{public}s', payloads[9]);

      expect(typeof Log.showInfo).assertEqual('function');
      expect(typeof Log.showWarn).assertEqual('function');
      expect(typeof Log.showError).assertEqual('function');
      expect(typeof Log.showDebug).assertEqual('function');
      expect(typeof Log.showFatal).assertEqual('function');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HANDLER_CONTRACT_0010
     * @tc.name      testHandlerContractTest_010
     * @tc.desc      The test runner is bound to the expected bundle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerContractTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_010 begin');

      // The runner binding is checked here instead of in a standalone ability suite.
      const args = AbilityDelegatorRegistry.getArguments();
      expect(args.bundleName).assertEqual('com.samples.kikainput');
      expect(args.bundleName.length > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerContractTest_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTACH_LIFECYCLE_0001
     * @tc.name      testAttachLifecycle_001
     * @tc.desc      Verify that one attach requests the attribute once, sends one command and finishes nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttachLifecycle_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('node');
      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.privateCommands.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTACH_LIFECYCLE_0002
     * @tc.name      testAttachLifecycle_002
     * @tc.desc      Verify that re-attaching the same client doubles the attribute and command requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttachLifecycle_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, false);
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      expect(harness.client.editorAttributeCount).assertEqual(2);
      expect(harness.client.privateCommandCount).assertEqual(2);
      expect(harness.client.privateCommands.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTACH_LIFECYCLE_0003
     * @tc.name      testAttachLifecycle_003
     * @tc.desc      Verify that a second attach to an empty editor publishes zero values and serves its own enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttachLifecycle_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_003 begin');
      const first: PreviewHarness = await createPreviewHarness('', 8, 4);
      const second: PreviewHarness = await createPreviewHarness('', 0, 0);
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.keyFunctions.join('|')).assertEqual('0');
      expect(first.client.keyFunctions.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);
      expect(second.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTACH_LIFECYCLE_0004
     * @tc.name      testAttachLifecycle_004
     * @tc.desc      Verify that the single attach command carries only the underline style key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testAttachLifecycle_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const record: Record<string, inputMethodEngine.CommandDataType> = harness.client.privateCommands[0];
      const keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('previewTextStyle');
      expect(record['previewTextStyle']).assertEqual('underline');
      expect(harness.client.privateCommandCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTACH_LIFECYCLE_0005
     * @tc.name      testAttachLifecycle_005
     * @tc.desc      Verify that an attach keeps the initial editor text and appends at its end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttachLifecycle_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('base');
      InputHandler.getInstance().insertText('x');
      expect(harness.client.buffer).assertEqual('basex');
      expect(harness.client.buffer.length).assertEqual(5);
      expect(harness.client.insertedTexts.join('')).assertEqual('x');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(4);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTACH_LIFECYCLE_0006
     * @tc.name      testAttachLifecycle_006
     * @tc.desc      Verify that a re-attach appends a second command record with the same style payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testAttachLifecycle_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      expect(harness.client.privateCommands.length).assertEqual(2);
      expect(harness.client.privateCommands[0]['previewTextStyle']).assertEqual('underline');
      expect(harness.client.privateCommands[1]['previewTextStyle']).assertEqual('underline');
      expect(harness.client.privateCommandCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttachLifecycle_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0001
     * @tc.name      testChannelContract_001
     * @tc.desc      Verify that enter and hide reach different channels and leave the editor text alone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.keyFunctions.join('|')).assertEqual('2');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0002
     * @tc.name      testChannelContract_002
     * @tc.desc      Verify that two insertions never add entries to either deletion channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('ab');
      InputHandler.getInstance().insertText('cd');
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abcd');
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0003
     * @tc.name      testChannelContract_003
     * @tc.desc      Verify that an insertion between two deletions keeps the backward and forward orders separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().insertText('m');
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.backwardLengths.join('|')).assertEqual('2');
      expect(harness.client.forwardLengths.join('|')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('m');
      expect(harness.client.buffer).assertEqual('m');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0004
     * @tc.name      testChannelContract_004
     * @tc.desc      Verify that a caret move adds no selection range and a movement selection adds no caret move.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.movementDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_RIGHT);
      expect(harness.client.selectedRanges.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0005
     * @tc.name      testChannelContract_005
     * @tc.desc      Verify that begin and end selections produce two ranges and no movement entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].end).assertEqual(2);
      expect(harness.client.selectedRanges[1].start).assertEqual(2);
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.movementDirections.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0006
     * @tc.name      testChannelContract_006
     * @tc.desc      Verify that a preview request adds no enter, finish or hide record.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.keyFunctions.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0007
     * @tc.name      testChannelContract_007
     * @tc.desc      Verify that an edit action changes neither the buffer nor the deletion channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('kept');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('kept');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0008
     * @tc.name      testChannelContract_008
     * @tc.desc      Verify that begin selection on initial text uses the cursor index five rather than the fallback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcdef');
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(5);
      expect(harness.client.movedDirections.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0009
     * @tc.name      testChannelContract_009
     * @tc.desc      Verify that end selection on initial text starts at the cursor index five.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcdef');
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(5);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.buffer).assertEqual('abcdef');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0010
     * @tc.name      testChannelContract_010
     * @tc.desc      Verify that enter, hide and enter keep two type sends, two finishes and one panel call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testChannelContract_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('2|2');
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHANNEL_CONTRACT_0011
     * @tc.name      testChannelContract_011
     * @tc.desc      Verify that an insertion between two forward deletions keeps the forward order and no backward entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChannelContract_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().insertText('q');
      InputHandler.getInstance().deleteForward(2);
      expect(harness.client.forwardLengths.join('|')).assertEqual('1|2');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('q');
      expect(harness.client.insertedTexts.join('')).assertEqual('q');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelContract_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_PUBLISH_0001
     * @tc.name      testAttributePublish_001
     * @tc.desc      Verify that a deferred attach leaves the previous stored pair until its own values settle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testAttributePublish_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_001 begin');
      const settled: PreviewHarness = await createPreviewHarness('', 5, 6);
      const pending: PreviewHarness = await createPreviewHarness('', 9, 10, true, true);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(6);
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(10);
      expect(settled.client.keyFunctions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_PUBLISH_0002
     * @tc.name      testAttributePublish_002
     * @tc.desc      Verify that a pattern of one hundred is stored beside a small enter type and not forwarded as enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributePublish_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3, 100);
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(100);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(harness.client.keyFunctions.join('|')).assertEqual('3');
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_PUBLISH_0003
     * @tc.name      testAttributePublish_003
     * @tc.desc      Verify that each enter call forwards the stored type once even when the pattern is negative.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testAttributePublish_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 6, -2);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(6);
      expect(harness.client.finishCount).assertEqual(1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(-2);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_ATTRIBUTE_PUBLISH_0004
     * @tc.name      testAttributePublish_004
     * @tc.desc      Verify that editing commands leave the stored enter type and pattern at their attach values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testAttributePublish_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 7, 8);
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(7);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);
      expect(harness.client.insertedTexts.join('')).assertEqual('z');
      expect(harness.client.backwardLengths.join('|')).assertEqual('1');
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAttributePublish_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EMPTY_ATTACH_0001
     * @tc.name      testEmptyAttach_001
     * @tc.desc      Verify that the first character inserted into an empty editor reaches index zero and opens no window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEmptyAttach_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(-1);
      InputHandler.getInstance().insertText('h');
      expect(harness.client.buffer).assertEqual('h');
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EMPTY_ATTACH_0002
     * @tc.name      testEmptyAttach_002
     * @tc.desc      Verify that begin selection on an empty editor records the fixed zero range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEmptyAttach_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EMPTY_ATTACH_0003
     * @tc.name      testEmptyAttach_003
     * @tc.desc      Verify that end selection on an empty editor records the fixed thousand range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEmptyAttach_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.movementDirections.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EMPTY_ATTACH_0004
     * @tc.name      testEmptyAttach_004
     * @tc.desc      Verify that enter on an empty editor sends the type and finishes without a preview request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEmptyAttach_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 7);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('7');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EMPTY_ATTACH_0005
     * @tc.name      testEmptyAttach_005
     * @tc.desc      Verify that two hides on an empty editor count twice and change no editor channel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEmptyAttach_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_EMPTY_ATTACH_0006
     * @tc.name      testEmptyAttach_006
     * @tc.desc      Verify that the two fixed caret helpers on an empty editor record the zero and thousand ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEmptyAttach_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().moveCursorToBegin();
      await InputHandler.getInstance().moveCursorToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.selectedRanges[1].start).assertEqual(1000);
      expect(harness.client.selectedRanges[1].end).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyAttach_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_COMMIT_CONTRACT_0001
     * @tc.name      testPreviewCommitContract_001
     * @tc.desc      Verify that enter after a trigger commits the overwrite and finishes exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewCommitContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommitContract_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 1);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.keyFunctions.join('|')).assertEqual('1');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommitContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_COMMIT_CONTRACT_0002
     * @tc.name      testPreviewCommitContract_002
     * @tc.desc      Verify that a hide between a trigger and enter keeps the window open until the finish call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewCommitContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommitContract_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommitContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_COMMIT_CONTRACT_0003
     * @tc.name      testPreviewCommitContract_003
     * @tc.desc      Verify that enter without any trigger finishes once but records no preview window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewCommitContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommitContract_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('plain', 6);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(6);
      expect(harness.client.buffer).assertEqual('plain');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCommitContract_003 end');
      await yieldToEventLoop();
    });

  });
}
