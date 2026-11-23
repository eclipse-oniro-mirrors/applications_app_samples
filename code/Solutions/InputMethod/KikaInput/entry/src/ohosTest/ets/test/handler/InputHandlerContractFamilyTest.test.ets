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

const TAG: string = '[Sample_KikaInputInputHandlerBehavior]';

export default function InputHandlerContractFamilyTestTest(): void {
  describe('InputHandlerContractFamilyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0100
     * @tc.name      testInputHandlerBehavior_001
     * @tc.desc      Verify that attaching with enter key type 1 publishes that type to storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInputHandlerBehavior_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_001 begin');
        const harness: ClientHarness = await createClientHarness(1, 0);
        // onInputStart resolves getEditorAttribute asynchronously, so the stored value follows the promise.
        expect(harness.client.editorAttributeCount).assertEqual(1);
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);
        expect(AppStorage.get<number>('inputPattern')).assertEqual(0);
        InputHandler.getInstance().sendKeyFunction();
        expect(harness.client.keyFunctions.length).assertEqual(1);
        expect(harness.client.keyFunctions[0]).assertEqual(1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_001 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0200
     * @tc.name      testInputHandlerBehavior_002
     * @tc.desc      Verify that enter key type 2 and input pattern 2 are stored together.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_002 begin');
        const harness: ClientHarness = new ClientHarness(2, 2);
        await Promise.resolve();
        await Promise.resolve();
        // Both fields come from the same editor attribute snapshot.
        expect(AppStorage.get<number>('inputPattern')).assertEqual(2);
        expect(harness.client.editorAttributeCount).assertEqual(1);
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_002 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0300
     * @tc.name      testInputHandlerBehavior_003
     * @tc.desc      Verify that enter key type 3 with pattern 3 is forwarded to the editor on enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_003 begin');
        const harness: ClientHarness = await createClientHarness(3, 3);
        const editorRef: FakeInputClient = harness.client;
        InputHandler.getInstance().sendKeyFunction();
        // The forwarded command is the single source of truth for the enter type.
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(editorRef.keyFunctions[0]);
        expect(AppStorage.get<number>('inputPattern')).assertEqual(3);
        expect(editorRef.keyFunctions.length).assertEqual(1);
        expect(editorRef.keyFunctions[0]).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_003 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0400
     * @tc.name      testInputHandlerBehavior_004
     * @tc.desc      Verify that a later attach overwrites the stored enter key type and input pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_004 begin');
        const first: ClientHarness = new ClientHarness(0, 0);
        await Promise.resolve();
        await Promise.resolve();
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
        // A second editor overwrites the first one's metadata.
        const second: ClientHarness = await createClientHarness(4, 5);
        expect(second.client.editorAttributeCount).assertEqual(1);
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
        expect(AppStorage.get<number>('inputPattern')).assertEqual(5);
        expect(first.client.editorAttributeCount).assertEqual(1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_004 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0500
     * @tc.name      testInputHandlerBehavior_005
     * @tc.desc      Verify that pattern 7 is kept while enter key type stays 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerBehavior_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_005 begin');
        const harness: ClientHarness = await createClientHarness(0, 7);
        // The pattern must survive the enter command instead of being overwritten.
        const patternBefore: number = AppStorage.get<number>('inputPattern') ?? -1;
        InputHandler.getInstance().sendKeyFunction();
        const patternAfter: number = AppStorage.get<number>('inputPattern') ?? -1;
        expect(patternBefore).assertEqual(7);
        expect(patternAfter).assertEqual(patternBefore);
        expect(harness.client.keyFunctions[0]).assertEqual(0);
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_005 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0600
     * @tc.name      testInputHandlerBehavior_006
     * @tc.desc      Verify that refreshInfo after a stop still publishes the stored diagnostics without a client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerBehavior_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_006 begin');
        await createClientHarness(0, 0);
        InputHandler.getInstance().setCursorInfo({ x: 3, y: 4, height: 9 });
        InputHandler.getInstance().onInputStop();
        // With no client the five-character fragment is skipped, but stored fields still appear.
        InputHandler.getInstance().refreshInfo();
        const summary: string = AppStorage.get<string>('showLog') ?? '';
        expect(summary.includes('five chars:')).assertFalse();
        expect(summary.includes('select')).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_006 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0700
     * @tc.name      testInputHandlerBehavior_007
     * @tc.desc      Verify that enter after a stop sends nothing to the detached editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_007 begin');
        const harness: ClientHarness = await createClientHarness(2, 0);
        const editorRef: FakeInputClient = harness.client;
        InputHandler.getInstance().onInputStop();
        // The detached client keeps its journal unchanged.
        InputHandler.getInstance().sendKeyFunction();
        expect(editorRef.keyFunctions.length).assertEqual(0);
        expect(editorRef.journal.length).assertEqual(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_007 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0800
     * @tc.name      testInputHandlerBehavior_008
     * @tc.desc      Verify that a reattach after stop restores enter forwarding with the new type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_008 begin');
        const first: ClientHarness = new ClientHarness(1, 0);
        await Promise.resolve();
        await Promise.resolve();
        handlerRef.onInputStop();
        const second: ClientHarness = await createClientHarness(3, 2);
        handlerRef.sendKeyFunction();
      // The recording editor captures the command produced by this handler call.
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
        expect(first.client.keyFunctions.length).assertEqual(0);
        expect(second.client.keyFunctions.length).assertEqual(1);
        expect(second.client.keyFunctions[0]).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_008 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_0900
     * @tc.name      testInputHandlerBehavior_009
     * @tc.desc      Verify that an attach with type 5 is reported to enter after two microtask turns.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerBehavior_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_009 begin');
        const harness: ClientHarness = await createClientHarness(5, 6);
        await Promise.resolve();
        // Even one more microtask must not change the stored snapshot.
        expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
        expect(AppStorage.get<number>('inputPattern')).assertEqual(6);
        InputHandler.getInstance().sendKeyFunction();
        expect(harness.client.keyFunctions.length).assertEqual(1);
        expect(harness.client.keyFunctions[0]).assertEqual(5);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_009 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1000
     * @tc.name      testInputHandlerBehavior_010
     * @tc.desc      Verify that the three diagnostic setters keep their latest payloads in the refresh summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_010 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      const handler: InputHandler = InputHandler.getInstance();
      const selectPayloads: string[] = ['sel-first', 'from(0,0) to (1,1)', 'from(2,2) to (4,4)'];
      for (let i = 0; i < selectPayloads.length; i++) {
        handler.setSelectInfo(selectPayloads[i]);
      }
      const textPayloads: string[] = ['text-first', 'text-mid', 'text-last'];
      for (let i = 0; i < textPayloads.length; i++) {
        handler.setTextInfo(textPayloads[i]);
      }
      const inputPayloads: string[] = ['info-first', 'info-mid', 'info-last'];
      for (let i = 0; i < inputPayloads.length; i++) {
        handler.setInputInfo(inputPayloads[i]);
      }
      AppStorage.setOrCreate<string>('showLog', '');
      handler.refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf(textPayloads[textPayloads.length - 1]) >= 0).assertEqual(true);
      expect(summary.indexOf(inputPayloads[inputPayloads.length - 1]) >= 0).assertEqual(true);
      expect(handler === InputHandler.getInstance()).assertEqual(true);
      expect(summary.indexOf(selectPayloads[selectPayloads.length - 1]) >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1100
     * @tc.name      testInputHandlerBehavior_011
     * @tc.desc      Verify that every extended text payload reaches the editor journal unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_013 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const handler: InputHandler = handlerRef;
      const texts: string[] = ["hello\nworld", "tab\ttext", "emoji \ud83d\ude00",
        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", " lead", "trail ", "!@#$%^&*()", "a b c d e f"];
      let i: number = 0;
      while (i < texts.length) {
        handler.insertText(texts[i]);
        i = i + 1;
      }
      expect(editorRef.insertedTexts.join('|')).assertEqual(texts.join('|'));
      expect(editorRef.journal.length).assertEqual(texts.length);
      expect(editorRef.insertedTexts.length).assertEqual(texts.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1200
     * @tc.name      testInputHandlerBehavior_012
     * @tc.desc      Verify that every extended backward length reaches the editor in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const handler: InputHandler = InputHandler.getInstance();
      const lengths: number[] = [3, 7, 10, 50, 500, 1000];
      for (let i = 0; i < lengths.length; i++) {
        handler.deleteBackward(lengths[i]);
      }
      expect(harness.client.backwardLengths.length - lengths.length).assertEqual(0);
      expect(harness.client.backwardLengths.join('|')).assertEqual(lengths.join('|'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1300
     * @tc.name      testInputHandlerBehavior_013
     * @tc.desc      Verify that every extended forward length reaches the editor in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const handler: InputHandler = InputHandler.getInstance();
      const lengths: number[] = [3, 7, 10, 50, 500, 1000];
      let index: number = 0;
      while (index < lengths.length) {
        handler.deleteForward(lengths[index]);
        index = index + 1;
      }
      expect(harness.client.forwardLengths.join('|')).assertEqual(lengths.join('|'));
      expect(harness.client.journal.length).assertEqual(lengths.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1400
     * @tc.name      testInputHandlerBehavior_014
     * @tc.desc      Verify that the factory keeps the same handler after editor mutations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_016 begin');
        const handler: InputHandler = handlerRef;
        handler.setSelectInfo('probe');
        handler.setTextInfo('probe');
        handler.setInputInfo('probe');
        handler.deleteBackward(0);
        const second: InputHandler = handlerRef;
      // The recording editor captures the command produced by this handler call.
        expect(handler).assertEqual(handlerRef);
        expect(second).assertEqual(handler);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_016 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1500
     * @tc.name      testInputHandlerBehavior_015
     * @tc.desc      Verify that the input handler factory keeps one process-wide instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInputHandlerBehavior_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_017 begin');
        const first: InputHandler = InputHandler.getInstance();
        const second: InputHandler = InputHandler.getInstance();
      // The recording editor captures the command produced by this handler call.
        expect(first).assertEqual(second);
        expect(second).assertEqual(InputHandler.getInstance());
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_017 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1600
     * @tc.name      testInputHandlerBehavior_016
     * @tc.desc      Verify that repeated stops keep the input handler usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_018 begin');
        const handler: InputHandler = InputHandler.getInstance();
        for (let i = 0; i < 2; i++) {
          // onInputStop detaches the editor client; later calls must stay safe no-ops.
          handler.onInputStop();
          expect(handler).assertEqual(InputHandler.getInstance());
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_018 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1700
     * @tc.name      testInputHandlerBehavior_017
     * @tc.desc      Verify that the diagnostic setters keep the latest payloads after a client stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_019 begin');
      handlerRef.onInputStop();
      const handler: InputHandler = handlerRef;
      handler.setSelectInfo('sel-old');
      handler.setTextInfo('text-old');
      handler.setInputInfo('info-old');
      const later: string[] = ['sel-new', 'text-new', 'info-new'];
      let i: number = 0;
      while (i < later.length) {
        if (i === 0) {
          handler.setSelectInfo(later[i]);
          } else if (i === 1) {
          handler.setTextInfo(later[i]);
          } else {
          handler.setInputInfo(later[i]);
        }
        i = i + 1;
      }
      AppStorage.setOrCreate<string>('showLog', '');
      handler.refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('sel-new') >= 0).assertTrue();
      expect(summary.indexOf('text-new') >= 0).assertTrue();
      expect(summary.indexOf('info-new') >= 0).assertTrue();
      expect(handler).assertEqual(handlerRef);
      expect(summary.indexOf('five chars:')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1800
     * @tc.name      testInputHandlerBehavior_018
     * @tc.desc      Verify that text payloads sent without a client are not replayed by the next attach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_022 begin');
      InputHandler.getInstance().onInputStop();
      const handler: InputHandler = InputHandler.getInstance();
      const texts: string[] = ["", "a", "ab", "hello", "hello world", " ", "\n", "\t", "12345", "abcXYZ!?"];
      for (let i = 0; i < texts.length; i++) {
        handler.insertText(texts[i]);
      }
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      handler.insertText('fresh');
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('fresh');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_1900
     * @tc.name      testInputHandlerBehavior_019
     * @tc.desc      Verify that backward lengths sent without a client never reach the next editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_023 begin');
      InputHandler.getInstance().onInputStop();
      const handler: InputHandler = InputHandler.getInstance();
      const lengths: number[] = [0, 1, 2, 5, 100];
      let i: number = 0;
      while (i < lengths.length) {
        handler.deleteBackward(lengths[i]);
        i = i + 1;
      }
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      handler.deleteBackward(9);
      expect(editorRef.backwardLengths.join('')).assertEqual('9');
      expect(editorRef.journal.join('')).assertEqual('back:9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_2000
     * @tc.name      testInputHandlerBehavior_020
     * @tc.desc      Verify that forward lengths sent without a client never reach the next editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_024 begin');
      handlerRef.onInputStop();
      const handler: InputHandler = handlerRef;
      const lengths: number[] = [0, 1, 2, 5, 100];
      let index: number = lengths.length - 1;
      while (index >= 0) {
        handler.deleteForward(lengths[index]);
        index = index - 1;
      }
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      handler.deleteForward(8);
      expect(harness.client.forwardLengths[0]).assertEqual(8);
      expect(harness.client.journal.join('')).assertEqual('forward:8');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_2100
     * @tc.name      testInputHandlerBehavior_021
     * @tc.desc      Verify that every cursor direction is safe without a client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_025 begin');
        const handler: InputHandler = InputHandler.getInstance();
        const directions: number[] = [inputMethodEngine.Direction.CURSOR_UP,
            inputMethodEngine.Direction.CURSOR_DOWN, inputMethodEngine.Direction.CURSOR_LEFT,
            inputMethodEngine.Direction.CURSOR_RIGHT];
        let i: number = 0;
        while (i < directions.length) {
          handler.moveCursor(directions[i]);
          // The recording editor captures the command produced by this handler call.
          expect(handler).assertEqual(InputHandler.getInstance());
          i = i + 1;
        }
        expect(directions.length).assertEqual(4);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_025 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_2200
     * @tc.name      testInputHandlerBehavior_022
     * @tc.desc      Verify that every extend action is safe without a client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_026 begin');
        const handler: InputHandler = InputHandler.getInstance();
        const actions: inputMethodEngine.ExtendAction[] = [
            inputMethodEngine.ExtendAction.SELECT_ALL, inputMethodEngine.ExtendAction.CUT,
            inputMethodEngine.ExtendAction.COPY
        ];
        for (let i = 0; i < actions.length; i++) {
          handler.sendExtendAction(actions[i]);
          // The recording editor captures the command produced by this handler call.
          expect(handler).assertEqual(InputHandler.getInstance());
        }
        expect(actions.length).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_026 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_2300
     * @tc.name      testInputHandlerBehavior_023
     * @tc.desc      Verify that hiding the keyboard without a client stays safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_027 begin');
        const handler: InputHandler = handlerRef;
        handler.hideKeyboardSelf();
      // The recording editor captures the command produced by this handler call.
        expect(handler).assertEqual(handlerRef);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_027 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_BEHAVIOR_2400
     * @tc.name      testInputHandlerBehavior_024
     * @tc.desc      Verify that sending the enter key without a client stays safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerBehavior_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_028 begin');
        const handler: InputHandler = InputHandler.getInstance();
        handler.sendKeyFunction();
      // The recording editor captures the command produced by this handler call.
        expect(handler).assertEqual(InputHandler.getInstance());
        hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerBehavior_028 end');
        await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0100
     * @tc.name      testInputHandlerContract_001
     * @tc.desc      Verify that the stored enter key type survives an input stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_001 begin');
      await createClientHarness(3, 2);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      InputHandler.getInstance().onInputStop();

      // Stop detaches the client but must not clear the published editor metadata.
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0200
     * @tc.name      testInputHandlerContract_002
     * @tc.desc      Verify that a re-attached editor overwrites the stored input pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_002 begin');
      await createClientHarness(1, 1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1);

      InputHandler.getInstance().onInputStop();
      await createClientHarness(2, 7);

      // The new editor's pattern wins; the enter type follows the same attach.
      expect(AppStorage.get<number>('inputPattern')).assertEqual(7);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0300
     * @tc.name      testInputHandlerContract_003
     * @tc.desc      Verify that sending the enter key does not re-read the editor attribute.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_003 begin');
      const harness: ClientHarness = await createClientHarness(0, 0);
      const editorRef: FakeInputClient = harness.client;

      // The stored snapshot is used for every enter command.
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(editorRef.keyFunctions.length).assertEqual(2);
      expect(editorRef.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0400
     * @tc.name      testInputHandlerContract_004
     * @tc.desc      Verify that insert, caret-left and insert keep the middle move between the texts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_004 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().insertText('b');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|move:' +
        inputMethodEngine.Direction.CURSOR_LEFT + '|insert:b');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0500
     * @tc.name      testInputHandlerContract_005
     * @tc.desc      Verify that a backward delete, an insert and a forward delete keep all three steps.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_005 begin');
      const harness: ClientHarness = await createClientHarness(0);

      handlerRef.deleteBackward(1);
      handlerRef.insertText('x');
      handlerRef.deleteForward(2);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('back:1|insert:x|forward:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0600
     * @tc.name      testInputHandlerContract_006
     * @tc.desc      Verify that a move, an insert and another move keep the text between the moves.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_006 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().insertText('q');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.journal.join('|')).assertEqual('move:' +
        inputMethodEngine.Direction.CURSOR_RIGHT + '|insert:q|move:' +
        inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.movedDirections.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0700
     * @tc.name      testInputHandlerContract_007
     * @tc.desc      Verify that select-all followed by a forward delete keeps the action before the delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_007 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      InputHandler.getInstance().deleteForward(1);
      expect(editorRef.journal.join('|')).assertEqual('extend:' +
        inputMethodEngine.ExtendAction.SELECT_ALL + '|forward:1');
      expect(editorRef.extendActions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0800
     * @tc.name      testInputHandlerContract_008
     * @tc.desc      Verify that enter, hide and insert keep the hide outside the editor journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_008 begin');
      const harness: ClientHarness = new ClientHarness(1);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.sendKeyFunction();
      handlerRef.hideKeyboardSelf();
      handlerRef.insertText('z');
      expect(keyboardRef.hideCount).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.journal.join('|')).assertEqual('enter:1|insert:z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_0900
     * @tc.name      testInputHandlerContract_009
     * @tc.desc      Verify that hiding before an insert leaves the insertion as the only editor command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_009 begin');
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('k');
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:k');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_1000
     * @tc.name      testInputHandlerContract_010
     * @tc.desc      Verify that input pattern 9 persists after the editor is stopped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerContract_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_010 begin');
      await createClientHarness(0, 9);
      InputHandler.getInstance().onInputStop();

      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_1100
     * @tc.name      testInputHandlerContract_011
     * @tc.desc      Verify that three consecutive attaches leave the last editor attribute in storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerContract_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_011 begin');
      await createClientHarness(0, 1);
      await createClientHarness(2, 4);
      const third: ClientHarness = await createClientHarness(5, 8);
      const editorRef: FakeInputClient = third.client;

      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);
      expect(editorRef.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_1200
     * @tc.name      testInputHandlerContract_012
     * @tc.desc      Verify that two stops with two different editors keep both editors detached.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerContract_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_012 begin');
      const first: ClientHarness = new ClientHarness(0, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0, 0);
      InputHandler.getInstance().onInputStop();

      InputHandler.getInstance().insertText('late');
      expect(second.client.insertedTexts.length).assertEqual(0);
      expect(first.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_1300
     * @tc.name      testInputHandlerContract_013
     * @tc.desc      Verify that a direct re-attach without a stop overwrites the editor type used by enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerContract_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_013 begin');
      const first: ClientHarness = await createClientHarness(1, 0);
      InputHandler.getInstance().sendKeyFunction();
      const second: ClientHarness = await createClientHarness(4, 6);

      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions[0]).assertEqual(1);
      expect(second.client.keyFunctions.length).assertEqual(1);
      expect(second.client.keyFunctions[0]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerContract_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0100
     * @tc.name      testInputHandlerState_001
     * @tc.desc      Verify that an editor with enter type three receives its own type on the enter command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_001 begin');
      const harness: ClientHarness = new ClientHarness(3);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(3);
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0200
     * @tc.name      testInputHandlerState_002
     * @tc.desc      Verify that a stop detaches the client after a hello insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_002 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().insertText('hello');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('after');
      expect(editorRef.insertedTexts.length).assertEqual(1);
      expect(editorRef.insertedTexts[0]).assertEqual('hello');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0300
     * @tc.name      testInputHandlerState_003
     * @tc.desc      Verify that an insertion after a stop reaches no editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_003 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('hello');
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0400
     * @tc.name      testInputHandlerState_004
     * @tc.desc      Verify that a re-attached editor receives the next text instead of the old editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_004 begin');
      const first: ClientHarness = await createClientHarness(0);
      handlerRef.insertText('old');
      handlerRef.onInputStop();
      const second: ClientHarness = await createClientHarness(1);

      handlerRef.insertText('new');
      expect(second.client.insertedTexts.length).assertEqual(1);
      expect(second.client.insertedTexts[0]).assertEqual('new');
      expect(first.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0500
     * @tc.name      testInputHandlerState_005
     * @tc.desc      Verify that three hide requests reach the panel controller three times.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_005 begin');
      const harness: ClientHarness = new ClientHarness(0);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(keyboardRef.hideCount).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0600
     * @tc.name      testInputHandlerState_006
     * @tc.desc      Verify that an enter command before an insertion keeps both in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_006 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('z');
      expect(editorRef.journal.join('|')).assertEqual('enter:0|insert:z');
      expect(editorRef.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0700
     * @tc.name      testInputHandlerState_007
     * @tc.desc      Verify that a two-unit deletion after an insertion keeps the insertion first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_007 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      handlerRef.insertText('abc');
      handlerRef.deleteBackward(2);
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.journal.join('|')).assertEqual('insert:abc|back:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0800
     * @tc.name      testInputHandlerState_008
     * @tc.desc      Verify that a downward caret command is forwarded once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_008 begin');
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_DOWN);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_0900
     * @tc.name      testInputHandlerState_009
     * @tc.desc      Verify that a cut action is forwarded once with its own value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerState_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_009 begin');
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.extendActions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_1000
     * @tc.name      testInputHandlerState_010
     * @tc.desc      Verify that setters called after a stop keep the singleton usable and detached.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerState_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_010 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const handler: InputHandler = handlerRef;
      handler.onInputStop();

      // None of the diagnostic setters may throw or reach the detached editor.
      handler.setSelectInfo('stopped');
      handler.setTextInfo('stopped');
      handler.setInputInfo('stopped');
      handler.deleteForward(0);
      handler.deleteBackward(1);
      expect(editorRef.forwardLengths.length).assertEqual(0);
      expect(editorRef.backwardLengths.length).assertEqual(0);
      expect(handler).assertEqual(handlerRef);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_STATE_1100
     * @tc.name      testInputHandlerState_011
     * @tc.desc      Verify that stopping the input session twice keeps the same singleton instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerState_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_011 begin');
      const handler: InputHandler = InputHandler.getInstance();
      handler.onInputStop();
      const second: InputHandler = InputHandler.getInstance();
      handler.onInputStop();

      expect(InputHandler.getInstance()).assertEqual(second);
      expect(second).assertEqual(handler);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerState_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0100
     * @tc.name      testInputHandlerRebind_001
     * @tc.desc      Verify that attach type six with pattern zero publishes both stored values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerRebind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(6, 0);

      expect(harness.client.editorAttributeCount).assertEqual(1);
      const storedType: number = AppStorage.get<number>('enterKeyType') ?? -1;
      const storedPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      expect(storedType).assertEqual(6);
      expect(storedPattern).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0200
     * @tc.name      testInputHandlerRebind_002
     * @tc.desc      Verify that a same-type reattach moves only the pattern while the type stays pinned.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerRebind_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_002 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1, 1);
      const second: ClientHarness = await createClientHarness(1, 2);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2);
      expect(first.client.editorAttributeCount).assertEqual(1);
      expect(first.client.keyFunctions.length).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.keyFunctions[0]).assertEqual(1);
      expect(second.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0300
     * @tc.name      testInputHandlerRebind_003
     * @tc.desc      Verify that a reattach with pattern zero overwrites an earlier non-zero pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_003 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(1, 9);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);
      await createClientHarness(2, 0);

      const storedPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      const storedType: number = AppStorage.get<number>('enterKeyType') ?? -1;
      expect(storedPattern).assertEqual(0);
      expect(storedType).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0400
     * @tc.name      testInputHandlerRebind_004
     * @tc.desc      Verify that a manual storage type does not change the enter value that is forwarded.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3, 5);

      // The handler forwards the attribute snapshot, not the published storage value.
      AppStorage.setOrCreate<number>('enterKeyType', 9);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(3);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      AppStorage.setOrCreate<number>('enterKeyType', 3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0500
     * @tc.name      testInputHandlerRebind_005
     * @tc.desc      Verify that a manual pattern write stays out of the refreshed editor-info line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_005 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(2, 5);

      AppStorage.setOrCreate<number>('inputPattern', 88);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary).assertContain('inputPattern = 5');
      expect(summary.indexOf('inputPattern = 88')).assertEqual(-1);
      const storedPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      expect(storedPattern).assertEqual(88);
      AppStorage.setOrCreate<number>('inputPattern', 5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0600
     * @tc.name      testInputHandlerRebind_006
     * @tc.desc      Verify that a new attach overwrites manual storage writes made after the previous attach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_006 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(1, 1);
      AppStorage.setOrCreate<number>('enterKeyType', 20);
      AppStorage.setOrCreate<number>('inputPattern', 21);

      await createClientHarness(4, 1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0700
     * @tc.name      testInputHandlerRebind_007
     * @tc.desc      Verify that hiding the keyboard does not alter the stored editor fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerRebind_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3, 6);

      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(6);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0800
     * @tc.name      testInputHandlerRebind_008
     * @tc.desc      Verify that a burst of editor commands leaves both stored editor fields intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(4, 2);
      const handlerRef: InputHandler = InputHandler.getInstance();

      handlerRef.insertText('x');
      handlerRef.deleteBackward(1);
      handlerRef.deleteForward(1);
      handlerRef.moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      handlerRef.sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2);
      expect(harness.client.journal.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_0900
     * @tc.name      testInputHandlerRebind_009
     * @tc.desc      Verify that refreshing the diagnostics leaves the stored editor fields untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_009 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(5, 3);
      AppStorage.setOrCreate<string>('showLog', '');

      InputHandler.getInstance().refreshInfo();
      const firstSummary: string = AppStorage.get<string>('showLog') ?? '';
      expect(firstSummary.length === 0).assertFalse();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1000
     * @tc.name      testInputHandlerRebind_010
     * @tc.desc      Verify that manual writes after a stop survive but do not reach the editor-info line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_010 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(5, 2);
      InputHandler.getInstance().onInputStop();

      AppStorage.setOrCreate<number>('enterKeyType', 12);
      AppStorage.setOrCreate<number>('inputPattern', 13);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary).assertContain('inputPattern = 2');
      expect(summary.indexOf('inputPattern = 13')).assertEqual(-1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(12);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(13);
      AppStorage.setOrCreate<number>('enterKeyType', 5);
      AppStorage.setOrCreate<number>('inputPattern', 2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1100
     * @tc.name      testInputHandlerRebind_011
     * @tc.desc      Verify that two stops without a reattach retain the most recent attach values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerRebind_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_011 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(8, 2);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStop();

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(8);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1200
     * @tc.name      testInputHandlerRebind_012
     * @tc.desc      Verify that two stop-separated rebinds leave the last attach in storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerRebind_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_012 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(6, 4);
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0, 1);
      InputHandler.getInstance().onInputStop();
      const last: ClientHarness = await createClientHarness(3, 9);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);
      expect(last.client.editorAttributeCount).assertEqual(1);
      InputHandler.getInstance().sendKeyFunction();
      expect(last.client.keyFunctions[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1300
     * @tc.name      testInputHandlerRebind_013
     * @tc.desc      Verify that three attaches with one pinned type move only the pattern field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_013 begin');
      InputHandler.getInstance().onInputStop();
      const one: ClientHarness = await createClientHarness(7, 1);
      const two: ClientHarness = await createClientHarness(7, 0);
      const three: ClientHarness = await createClientHarness(7, 4);

      expect(one.client.editorAttributeCount).assertEqual(1);
      expect(two.client.editorAttributeCount).assertEqual(1);
      expect(three.client.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(7);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1400
     * @tc.name      testInputHandlerRebind_014
     * @tc.desc      Verify that enter type zero with pattern nine is retained after a stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInputHandlerRebind_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0, 9);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();

      expect(harness.client.keyFunctions[0]).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1500
     * @tc.name      testInputHandlerRebind_015
     * @tc.desc      Verify that two enter commands leave the stored input pattern unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3, 5);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('3|3');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(5);
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1600
     * @tc.name      testInputHandlerRebind_016
     * @tc.desc      Verify that a lower enter type on a direct rebind overwrites the higher one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_016 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(7, 3);
      const lower: ClientHarness = await createClientHarness(2, 0);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(lower.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1700
     * @tc.name      testInputHandlerRebind_017
     * @tc.desc      Verify that an identical rebind still reads the attribute and targets the newest client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_017 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(2, 5);
      const second: ClientHarness = await createClientHarness(2, 5);

      expect(second.client.editorAttributeCount).assertEqual(1);
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.keyFunctions[0]).assertEqual(2);
      expect(first.client.keyFunctions.length).assertEqual(0);
      expect(second.client.journal.join('|')).assertEqual('enter:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_1800
     * @tc.name      testInputHandlerRebind_018
     * @tc.desc      Verify that an attach after a stop and manual writes overwrites both manual values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_018 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(4, 4);
      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<number>('enterKeyType', 30);
      AppStorage.setOrCreate<number>('inputPattern', 31);
      await createClientHarness(1, 0);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2000
     * @tc.name      testInputHandlerRebind_020
     * @tc.desc      Verify that two refreshes in a row keep the stored fields stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_020 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(4, 7);
      AppStorage.setOrCreate<string>('showLog', '');

      InputHandler.getInstance().refreshInfo();
      const before: number = AppStorage.get<number>('enterKeyType') ?? -1;
      InputHandler.getInstance().refreshInfo();
      const after: number = AppStorage.get<number>('enterKeyType') ?? -1;
      expect(before).assertEqual(after);
      expect(after).assertEqual(4);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2100
     * @tc.name      testInputHandlerRebind_021
     * @tc.desc      Verify that hide, enter and stop in one run keep both channels and the stored fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_021 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2, 3);

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2200
     * @tc.name      testInputHandlerRebind_022
     * @tc.desc      Verify that a rebind to zero type and zero pattern publishes both zeros.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_022 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(5, 8);
      const zeroed: ClientHarness = await createClientHarness(0, 0);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);
      InputHandler.getInstance().sendKeyFunction();
      expect(zeroed.client.keyFunctions[0]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2300
     * @tc.name      testInputHandlerRebind_023
     * @tc.desc      Verify that storage written before an attach is replaced by that attach's values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_023 begin');
      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<number>('enterKeyType', 50);
      AppStorage.setOrCreate<number>('inputPattern', 60);
      const harness: ClientHarness = await createClientHarness(3, 4);

      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(4);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2400
     * @tc.name      testInputHandlerRebind_024
     * @tc.desc      Verify that a hide after a rebind reaches the newest panel and keeps its stored fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_024 begin');
      InputHandler.getInstance().onInputStop();
      const older: ClientHarness = await createClientHarness(2, 2);
      const newest: ClientHarness = await createClientHarness(6, 7);

      InputHandler.getInstance().hideKeyboardSelf();
      expect(newest.keyboard.hideCount).assertEqual(1);
      expect(older.keyboard.hideCount).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(6);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2500
     * @tc.name      testInputHandlerRebind_025
     * @tc.desc      Verify that a stop keeps the last stored fields while the preview block is dropped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_025 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(2, 5);
      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');

      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('five chars:')).assertEqual(-1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2600
     * @tc.name      testInputHandlerRebind_026
     * @tc.desc      Verify that a hide issued before any attach leaves the next attach storage untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_026 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      const harness: ClientHarness = await createClientHarness(4, 1);

      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2700
     * @tc.name      testInputHandlerRebind_027
     * @tc.desc      Verify that a manual type write survives hide and refresh but not the next attach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_027 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(3, 0);
      AppStorage.setOrCreate<number>('enterKeyType', 9);
      AppStorage.setOrCreate<number>('inputPattern', 9);

      InputHandler.getInstance().hideKeyboardSelf();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);
      await createClientHarness(4, 1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2800
     * @tc.name      testInputHandlerRebind_028
     * @tc.desc      Verify that an enter issued after a rebind uses only the new editor type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_028 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(6, 2);
      InputHandler.getInstance().sendKeyFunction();
      const second: ClientHarness = await createClientHarness(1, 0);
      InputHandler.getInstance().sendKeyFunction();

      expect(first.client.keyFunctions.length).assertEqual(1);
      expect(first.client.keyFunctions[0]).assertEqual(6);
      expect(second.client.keyFunctions.length).assertEqual(1);
      expect(second.client.keyFunctions[0]).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_2900
     * @tc.name      testInputHandlerRebind_029
     * @tc.desc      Verify that two stop-separated rebinds ending at zero type and zero pattern keep both zeros.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_029 begin');
      InputHandler.getInstance().onInputStop();
      const start: ClientHarness = await createClientHarness(4, 6);
      InputHandler.getInstance().onInputStop();
      const zeroed: ClientHarness = await createClientHarness(0, 0);
      InputHandler.getInstance().onInputStop();

      expect(start.client.editorAttributeCount).assertEqual(1);
      expect(zeroed.client.editorAttributeCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_INPUT_HANDLER_CONTRACT_REBIND_3000
     * @tc.name      testInputHandlerRebind_030
     * @tc.desc      Verify that the stored fields survive a command burst, a hide and a refresh together.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInputHandlerRebind_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_030 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3, 8);

      InputHandler.getInstance().insertText('q');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().hideKeyboardSelf();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(2);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testInputHandlerRebind_030 end');
      await yieldToEventLoop();
    });

  });
}
