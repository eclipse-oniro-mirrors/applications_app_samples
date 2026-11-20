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
const TAG: string = '[Sample_KikaInputEditorAttributeExtreme]';

export default function EditorAttributeExtremeTestTest(): void {
  describe('EditorAttributeExtremeTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0100
     * @tc.name      testEditorAttributeExtreme_001
     * @tc.desc      Verify a negative enter type is stored and forwarded without clamping to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(-1, 0);
      InputHandler.getInstance().sendKeyFunction();
      const stored: number | undefined = AppStorage.get<number>('enterKeyType');
      expect(stored).assertEqual(-1);
      expect(harness.client.keyFunctions[0]).assertEqual(-1);
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0200
     * @tc.name      testEditorAttributeExtreme_002
     * @tc.desc      Verify the largest positive enter type survives storage and the enter call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_002 begin');
      handlerRef.onInputStop();
      const maxType: number = 2147483647;
      const harness: ClientHarness = new ClientHarness(maxType, 0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(maxType);
      expect(maxType > 0).assertTrue();
      expect(harness.client.keyFunctions[0] - maxType).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0300
     * @tc.name      testEditorAttributeExtreme_003
     * @tc.desc      Verify three small enter types keep their natural order inside the forwarded values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_003 begin');
      InputHandler.getInstance().onInputStop();
      const types: number[] = [0, 1, 5];
      const forwarded: number[] = [];
      let i: number = 0;
      while (i < types.length) {
        InputHandler.getInstance().onInputStop();
        const harness: ClientHarness = await createClientHarness(types[i], 0);
        const editorRef: FakeInputClient = harness.client;
        InputHandler.getInstance().sendKeyFunction();
        forwarded.push(editorRef.keyFunctions[0]);
        i = i + 1;
      }
      expect(forwarded[1] < forwarded[2]).assertTrue();
      expect(forwarded.join(',')).assertEqual('0,1,5');
      expect(forwarded.length).assertEqual(3);
      expect(forwarded[0] < forwarded[1]).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0400
     * @tc.name      testEditorAttributeExtreme_004
     * @tc.desc      Verify an extreme input pattern is stored without changing the forwarded enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(4, -2147483648);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(AppStorage.get<number>('enterKeyType'));
      expect(AppStorage.get<number>('inputPattern')).assertEqual(-2147483648);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(harness.client.keyFunctions[0]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0500
     * @tc.name      testEditorAttributeExtreme_005
     * @tc.desc      Verify a restart swaps both stored values while the old client keeps its own type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_005 begin');
      handlerRef.onInputStop();
      const oldClient: ClientHarness = await createClientHarness(255, 3);
      handlerRef.sendKeyFunction();
      handlerRef.onInputStop();
      const newClient: ClientHarness = await createClientHarness(1, 65535);
      handlerRef.sendKeyFunction();
      expect(oldClient.client.keyFunctions.join('|')).assertEqual('255');
      expect(newClient.client.keyFunctions.join('|')).assertEqual('1');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(65535);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0600
     * @tc.name      testEditorAttributeExtreme_006
     * @tc.desc      Verify two clients with opposite sign types each forward their own value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_006 begin');
      InputHandler.getInstance().onInputStop();
      const positive: ClientHarness = new ClientHarness(7, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const negative: ClientHarness = await createClientHarness(-7, 0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const delta: number = positive.client.keyFunctions[0] + negative.client.keyFunctions[0];
      expect(positive.client.keyFunctions[0] > negative.client.keyFunctions[0]).assertTrue();
      expect(delta).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0700
     * @tc.name      testEditorAttributeExtreme_007
     * @tc.desc      Verify a stop clears the client but leaves extreme stored values readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(65535, -65535);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendKeyFunction();
      expect(editorRef.keyFunctions.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(65535);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(-65535);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0800
     * @tc.name      testEditorAttributeExtreme_008
     * @tc.desc      Verify a start reads its extreme attribute exactly once before the enter call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_008 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(2147483647, 2147483647);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      handlerRef.sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.keyFunctions[1]).assertEqual(harness.client.keyFunctions[0]);
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_0900
     * @tc.name      testEditorAttributeExtreme_009
     * @tc.desc      Verify five enters with one unusual type keep five identical forwarded values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(-99, 0);
      let i: number = 0;
      while (i < 5) {
        InputHandler.getInstance().sendKeyFunction();
        i = i + 1;
      }
      const distinct: Set<number> = new Set<number>();
      let iW1: number = 0;
      while (iW1 < harness.client.keyFunctions.length) {
        distinct.add(harness.client.keyFunctions[iW1]);
        iW1 = iW1 + 1;
      }
      expect(harness.client.keyFunctions.length).assertEqual(5);
      expect(distinct.size).assertEqual(1);
      expect(distinct.has(-99)).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_1000
     * @tc.name      testEditorAttributeExtreme_010
     * @tc.desc      Verify an enter between edits still carries the stored extreme type in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(4096, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('insert:x|enter:4096|back:2|enter:4096');
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.insertedTexts[0]).assertEqual('x');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_1100
     * @tc.name      testEditorAttributeExtreme_011
     * @tc.desc      Verify equal patterns across two starts keep one stable stored value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_011 begin');
      handlerRef.onInputStop();
      await createClientHarness(3, 42);
      const firstPattern: number | undefined = AppStorage.get<number>('inputPattern');
      handlerRef.onInputStop();
      await createClientHarness(4, 42);
      const secondPattern: number | undefined = AppStorage.get<number>('inputPattern');
      expect(secondPattern).assertEqual(42);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(firstPattern).assertEqual(secondPattern);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_1200
     * @tc.name      testEditorAttributeExtreme_012
     * @tc.desc      Verify a negative type is not coerced into its absolute value during forwarding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(-12, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      const forwarded: number = harness.client.keyFunctions[0];
      expect(forwarded === Math.abs(forwarded)).assertFalse();
      expect(forwarded < 0).assertTrue();
      expect(forwarded).assertEqual(-12);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_1300
     * @tc.name      testEditorAttributeExtreme_013
     * @tc.desc      Verify a large pattern paired with a small type keeps the two fields independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2, 1073741824);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1073741824);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(harness.client.keyFunctions[0] - 2 + 1073741824);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(harness.client.keyFunctions[0]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_1400
     * @tc.name      testEditorAttributeExtreme_014
     * @tc.desc      Verify a later start overwrites a maximum type with an ordinary one in storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_014 begin');
      handlerRef.onInputStop();
      await createClientHarness(2147483647, 9);
      handlerRef.onInputStop();
      const ordinary: ClientHarness = new ClientHarness(6, 9);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      expect(ordinary.client.keyFunctions[0]).assertEqual(6);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(9);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_1500
     * @tc.name      testEditorAttributeExtreme_015
     * @tc.desc      Verify a client with a zero type routes insertions and deletions normally.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0, 0);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().insertText('zero');
      InputHandler.getInstance().deleteForward(3);
      InputHandler.getInstance().sendKeyFunction();
      expect(editorRef.insertedTexts[0].length).assertEqual(4);
      expect(editorRef.journal.join('|')).assertEqual('insert:zero|forward:3|enter:0');
      expect(editorRef.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_ATTRIBUTE_EXTREME_1600
     * @tc.name      testEditorAttributeExtreme_016
     * @tc.desc      Verify reattaching an old client restores its own extreme type after a middle session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtreme_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_016 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(32767, 0);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const middle: ClientHarness = await createClientHarness(1, 0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(-32768, 0);
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(-32768);
      expect(first.client.keyFunctions.join('')).assertEqual('32767');
      expect(middle.client.keyFunctions.join('')).assertEqual('1');
      expect(third.client.keyFunctions.join('')).assertEqual('-32768');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtreme_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0100
     * @tc.name      testEditorAttributeExtra_001
     * @tc.desc      Verify both fields accept negative one and forward the type verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_001 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(-1, -1);
      handlerRef.sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(-1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(-1);
      expect(harness.client.keyFunctions[0]).assertEqual(-1);
      expect(harness.client.journal.join('')).assertEqual('enter:-1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0200
     * @tc.name      testEditorAttributeExtra_002
     * @tc.desc      Verify one/one is stored and forwarded with no rounding or clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(1, 1);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(1);
      expect(harness.client.keyFunctions[0] / 2).assertEqual(0.5);
      expect(harness.client.keyFunctions[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0300
     * @tc.name      testEditorAttributeExtra_003
     * @tc.desc      Verify a zero enter type can pair with the maximum input pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0, 2147483647);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().sendKeyFunction();
      expect(editorRef.keyFunctions[0]).assertEqual(0);
      const pattern: number = AppStorage.get<number>('inputPattern') ?? 0;
      expect(pattern).assertEqual(2147483647);
      expect(pattern > editorRef.keyFunctions[0]).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0400
     * @tc.name      testEditorAttributeExtra_004
     * @tc.desc      Verify a maximum enter type can pair with a zero input pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_004 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = new ClientHarness(2147483647, 0);
      await Promise.resolve();
      await Promise.resolve();
      handlerRef.sendKeyFunction();
      handlerRef.sendKeyFunction();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      expect(harness.client.keyFunctions.join('|')).assertEqual('2147483647|2147483647');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0500
     * @tc.name      testEditorAttributeExtra_005
     * @tc.desc      Verify a restart with the same type but a new pattern updates only the pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(3, 10);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(3, 20);
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.keyFunctions[0]).assertEqual(3);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0600
     * @tc.name      testEditorAttributeExtra_006
     * @tc.desc      Verify two clients sharing an enter type keep different patterns in storage history.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_006 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = new ClientHarness(6, 100);
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(100);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(6, 200);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(200);
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.keyFunctions.join('')).assertEqual('6');
      expect(first.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0700
     * @tc.name      testEditorAttributeExtra_007
     * @tc.desc      Verify a modest two-digit enter type forwards exactly rather than taking a low byte.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_007 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(63, 0);
      const editorRef: FakeInputClient = harness.client;
      handlerRef.sendKeyFunction();
      expect(editorRef.keyFunctions[0] - 63).assertEqual(0);
      expect(editorRef.keyFunctions[0] !== 0).assertTrue();
      expect(editorRef.keyFunctions[0]).assertEqual(63);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0800
     * @tc.name      testEditorAttributeExtra_008
     * @tc.desc      Verify a two-digit input pattern is stored without masking or truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0, 63);
      const pattern: number = AppStorage.get<number>('inputPattern') ?? 0;
      expect(pattern & 31).assertEqual(31);
      expect(pattern).assertEqual(63);
      expect(pattern & 32).assertEqual(32);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_0900
     * @tc.name      testEditorAttributeExtra_009
     * @tc.desc      Verify ordinary insert and delete traffic leaves both stored fields untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_009 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(5, 9);
      InputHandler.getInstance().insertText('text');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      const type: number = AppStorage.get<number>('enterKeyType') ?? 0;
      const pattern: number = AppStorage.get<number>('inputPattern') ?? 0;
      expect(type).assertEqual(5);
      expect(pattern).assertEqual(9);
      expect(type + pattern).assertEqual(14);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1000
     * @tc.name      testEditorAttributeExtra_010
     * @tc.desc      Verify a nonzero type survives a stop with no pending start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_010 begin');
      handlerRef.onInputStop();
      await createClientHarness(17, 18);
      handlerRef.onInputStop();
      handlerRef.onInputStop();
      handlerRef.onInputStop();
      const type: number = AppStorage.get<number>('enterKeyType') ?? 0;
      const pattern: number = AppStorage.get<number>('inputPattern') ?? 0;
      expect(pattern).assertEqual(18);
      expect(type < pattern).assertTrue();
      expect(type).assertEqual(17);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1100
     * @tc.name      testEditorAttributeExtra_011
     * @tc.desc      Verify a reattach reads the type a second time and forwards it again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(4, 0);
      const keyboardRef: FakeKeyboardController = harness.keyboard;
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        keyboardRef as object as inputMethodEngine.KeyboardController,
        editorRef as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(editorRef.editorAttributeCount).assertEqual(2);
      expect(editorRef.keyFunctions.join('|')).assertEqual('4|4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1200
     * @tc.name      testEditorAttributeExtra_012
     * @tc.desc      Verify a negative pattern with a positive type keeps the pair independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(12, -12);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(-12);
      expect(harness.client.keyFunctions[0]).assertEqual(12);
      const pattern: number = AppStorage.get<number>('inputPattern') ?? 0;
      expect(harness.client.keyFunctions[0] + pattern).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1300
     * @tc.name      testEditorAttributeExtra_013
     * @tc.desc      Verify a mid-range type of one hundred forwards unchanged after an edit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_013 begin');
      handlerRef.onInputStop();
      const harness: ClientHarness = await createClientHarness(100, 0);
      handlerRef.insertText('before');
      handlerRef.sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('insert:before|enter:100');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(100);
      expect(harness.client.keyFunctions[0]).assertEqual(100);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1400
     * @tc.name      testEditorAttributeExtra_014
     * @tc.desc      Verify pattern zero and type zero remain distinguishable after a stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_014 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0, 0);
      InputHandler.getInstance().onInputStop();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(AppStorage.get<number>('inputPattern'));
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1500
     * @tc.name      testEditorAttributeExtra_015
     * @tc.desc      Verify a type from a stopped session is not reused by an enter in the stopped gap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(33, 0);
      const editorRef: FakeInputClient = harness.client;
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendKeyFunction();
      expect(editorRef.keyFunctions.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(33);
      const next: ClientHarness = await createClientHarness(44, 0);
      InputHandler.getInstance().sendKeyFunction();
      expect(next.client.keyFunctions.join('')).assertEqual('44');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1600
     * @tc.name      testEditorAttributeExtra_016
     * @tc.desc      Verify a restart after a stop overwrites the maximum pattern with a small one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_016 begin');
      handlerRef.onInputStop();
      await createClientHarness(0, 2147483647);
      handlerRef.onInputStop();
      await createClientHarness(0, 2);
      const pattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      expect(pattern < 3).assertTrue();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(pattern).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1700
     * @tc.name      testEditorAttributeExtra_017
     * @tc.desc      Verify extreme attributes do not disturb a normal hide and insertion path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(-2147483648, 2147483647);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('still');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('still');
      expect(harness.client.keyFunctions[0]).assertEqual(-2147483648);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_EDITOR_EXTRA_1800
     * @tc.name      testEditorAttributeExtra_018
     * @tc.desc      Verify a type stored by a later start wins over an earlier pending start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEditorAttributeExtra_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_018 begin');
      InputHandler.getInstance().onInputStop();
      const early: ClientHarness = new ClientHarness(70, 80);
      const late: ClientHarness = new ClientHarness(71, 81);
      await Promise.resolve();
      await Promise.resolve();
      expect(AppStorage.get<number>('inputPattern')).assertEqual(81);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(71);
      InputHandler.getInstance().sendKeyFunction();
      expect(early.client.keyFunctions.length).assertEqual(0);
      expect(late.client.keyFunctions.join('')).assertEqual('71');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEditorAttributeExtra_018 end');
      await yieldToEventLoop();
    });

  });
}
