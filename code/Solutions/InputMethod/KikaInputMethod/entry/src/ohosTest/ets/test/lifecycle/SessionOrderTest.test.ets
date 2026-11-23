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
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodSessionOrder]';

export default function sessionOrderTest(): void {
  describe('SessionOrderTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0001
     * @tc.name      testSessionOrder_001
     * @tc.desc      Verify that a preview committed in the second session leaves the first buffer untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_001 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      const second: PreviewHarness = await createPreviewHarness('');
      typeSequence(second, 'hel');
      InputHandler.getInstance().sendKeyFunction();

      expect(first.client.buffer).assertEqual('a');
      expect(first.client.finishCount).assertEqual(0);
      expect(second.client.finishCount).assertEqual(1);
      expect(second.client.buffer.indexOf('hello world') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0002
     * @tc.name      testSessionOrder_002
     * @tc.desc      Verify that five attaches each accept exactly one character in their own buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_002 begin');
      const sessions: PreviewHarness[] = [];
      for (let i = 0; i < 5; i++) {
        const session: PreviewHarness = await createPreviewHarness('', i);
        InputHandler.getInstance().insertText(String.fromCharCode(97 + i));
        sessions.push(session);
      }
      let oneUnitBuffers: number = 0;
      for (let i = 0; i < sessions.length; i++) {
        if (sessions[i].client.buffer.length === 1) {
          oneUnitBuffers = oneUnitBuffers + 1;
        }
      }
      expect(oneUnitBuffers).assertEqual(5);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);
      expect(sessions[4].client.buffer).assertEqual('e');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0003
     * @tc.name      testSessionOrder_003
     * @tc.desc      Verify that two hides in one session and one in the next stay on their own controllers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_003 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();

      expect(first.keyboard.hideCount).assertEqual(2);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(second.client.buffer).assertEqual('');
      expect(first.client.finishCount + second.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0004
     * @tc.name      testSessionOrder_004
     * @tc.desc      Verify that a direct second attach redirects enter to the newest type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_004 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1);
      const second: PreviewHarness = await createPreviewHarness('', 9);
      InputHandler.getInstance().sendKeyFunction();

      expect(second.client.keyFunctions.join('')).assertEqual('9');
      expect(first.client.keyFunctions.length).assertEqual(0);
      expect(second.client.finishCount).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0005
     * @tc.name      testSessionOrder_005
     * @tc.desc      Verify that switching during a preview keeps the old preview call and the new buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_005 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('x');

      expect(first.client.previewCalls.length).assertEqual(1);
      expect(first.client.buffer.indexOf('hello world') >= 0).assertTrue();
      expect(first.client.finishCount).assertEqual(0);
      expect(second.client.buffer).assertEqual('x');
      expect(second.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0006
     * @tc.name      testSessionOrder_006
     * @tc.desc      Verify that enter on the newest session then a letter keeps both outcomes local.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_006 begin');
      const first: PreviewHarness = await createPreviewHarness('', 2);
      const second: PreviewHarness = await createPreviewHarness('', 0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('x');

      expect(second.client.keyFunctions.join('')).assertEqual('0');
      expect(second.client.finishCount).assertEqual(1);
      expect(second.client.buffer).assertEqual('x');
      expect(first.client.buffer).assertEqual('');
      expect(first.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0007
     * @tc.name      testSessionOrder_007
     * @tc.desc      Verify that two settled attaches publish their enter types in attach order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_007 begin');
      await createPreviewHarness('', 5);
      const afterFirst: number = AppStorage.get<number>('enterKeyType') ?? -1;
      await createPreviewHarness('', 9);
      const afterSecond: number = AppStorage.get<number>('enterKeyType') ?? -1;
      const sequence: number[] = [afterFirst, afterSecond];

      expect(sequence.join('|')).assertEqual('5|9');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0008
     * @tc.name      testSessionOrder_008
     * @tc.desc      Verify that two deferred attributes publish in resolution order rather than attach order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_008 begin');
      const earlier: PreviewHarness = await createPreviewHarness('', 3, 0, true, true);
      const later: PreviewHarness = await createPreviewHarness('', 8, 0, true, true);
      later.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      const afterLater: number = AppStorage.get<number>('enterKeyType') ?? -1;
      earlier.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      const afterEarlier: number = AppStorage.get<number>('enterKeyType') ?? -1;
      const published: number[] = [afterLater, afterEarlier];

      expect(published.join('|')).assertEqual('8|3');
      expect(earlier.client.editorAttributeCount).assertEqual(1);
      expect(later.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0009
     * @tc.name      testSessionOrder_009
     * @tc.desc      Verify that the private command is recorded before the deferred attribute callback settles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4, 0, true, true);
      const earlyCommand: number = harness.client.privateCommandCount;
      const earlyQuery: number = harness.client.editorAttributeCount;
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();

      expect(earlyCommand).assertEqual(1);
      expect(earlyQuery).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0010
     * @tc.name      testSessionOrder_010
     * @tc.desc      Verify that an enter issued before an insertion records the key before the buffer character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();
      const keysBeforeTyping: number = harness.client.keyFunctions.length;
      InputHandler.getInstance().insertText('q');

      expect(keysBeforeTyping).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('q');
      expect(harness.client.buffer).assertEqual('q');
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0011
     * @tc.name      testSessionOrder_011
     * @tc.desc      Verify that a return attach sends the next deletion to the first editor instead of the second.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_011 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().deleteBackward(1);

      expect(first.client.backwardLengths.length).assertEqual(1);
      expect(second.client.backwardLengths.length).assertEqual(0);
      expect(first.client.buffer).assertEqual('a');
      expect(second.client.buffer).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0012
     * @tc.name      testSessionOrder_012
     * @tc.desc      Verify that enters issued between three attaches land on the first and the third clients only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_012 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1);
      InputHandler.getInstance().sendKeyFunction();
      const middle: PreviewHarness = await createPreviewHarness('', 2);
      const last: PreviewHarness = await createPreviewHarness('', 4);
      InputHandler.getInstance().sendKeyFunction();
      const finishes: number[] = [first.client.finishCount, middle.client.finishCount, last.client.finishCount];

      expect(finishes.join('|')).assertEqual('1|0|1');
      expect(first.client.keyFunctions.join('')).assertEqual('1');
      expect(middle.client.keyFunctions.length).assertEqual(0);
      expect(last.client.keyFunctions.join('')).assertEqual('4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0013
     * @tc.name      testSessionOrder_013
     * @tc.desc      Verify that two hides before a switch and three after it stay with their own keyboard controllers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_013 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      const counts: number[] = [first.keyboard.hideCount, second.keyboard.hideCount];

      expect(counts.join('|')).assertEqual('2|3');
      expect(first.client.finishCount + second.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0014
     * @tc.name      testSessionOrder_014
     * @tc.desc      Verify that a deferred second attribute leaves the first enter type in force until it settles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_014 begin');
      const settled: PreviewHarness = await createPreviewHarness('', 5);
      const pending: PreviewHarness = await createPreviewHarness('', 9, 0, true, true);
      InputHandler.getInstance().sendKeyFunction();
      const firstKey: number = pending.client.keyFunctions[0];
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      const keys: number[] = [firstKey, pending.client.keyFunctions[1]];

      expect(keys.join('|')).assertEqual('5|9');
      expect(pending.client.finishCount).assertEqual(2);
      expect(settled.client.finishCount).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0015
     * @tc.name      testSessionOrder_015
     * @tc.desc      Verify that a begin selection then a fixed end move keep their issue order before one enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_015 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().moveCursorToEnd();
      InputHandler.getInstance().sendKeyFunction();
      const starts: number[] = [harness.client.selectedRanges[0].start, harness.client.selectedRanges[1].start];
      const ends: number[] = [harness.client.selectedRanges[0].end, harness.client.selectedRanges[1].end];

      expect(starts.join('|')).assertEqual('0|1000');
      expect(ends.join('|')).assertEqual('10|1000');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0016
     * @tc.name      testSessionOrder_016
     * @tc.desc      Verify that a hide before and after a switch reaches only the keyboard that was current then.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_016 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const second: PreviewHarness = await createPreviewHarness('');
      const beforeSecondHide: number = second.keyboard.hideCount;
      InputHandler.getInstance().hideKeyboardSelf();

      expect(first.keyboard.hideCount).assertEqual(1);
      expect(beforeSecondHide).assertEqual(0);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(first.client.buffer).assertEqual('');
      expect(second.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0017
     * @tc.name      testSessionOrder_017
     * @tc.desc      Verify that a commit without a hide and a hide before a commit keep distinct hide counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_017 begin');
      const plain: PreviewHarness = await createPreviewHarness('', 1);
      InputHandler.getInstance().sendKeyFunction();
      const concealed: PreviewHarness = await createPreviewHarness('', 1);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      const outcomes: string[] = [plain.client.finishCount.toString(), plain.keyboard.hideCount.toString(),
        concealed.client.finishCount.toString(), concealed.keyboard.hideCount.toString()];

      expect(outcomes.join('|')).assertEqual('1|0|1|1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0018
     * @tc.name      testSessionOrder_018
     * @tc.desc      Verify that re-attaching the first editor adds a second private command there and none elsewhere.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_018 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      const commands: number[] = [first.client.privateCommandCount, second.client.privateCommandCount];

      expect(commands.join('|')).assertEqual('2|1');
      expect(first.client.editorAttributeCount).assertEqual(2);
      expect(second.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0019
     * @tc.name      testSessionOrder_019
     * @tc.desc      Verify that enter, insertion and enter interleave two keys around one buffer character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_019 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 6);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('b');
      expect(harness.client.buffer).assertEqual('b');
      expect(harness.client.keyFunctions[0]).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0020
     * @tc.name      testSessionOrder_020
     * @tc.desc      Verify that three attaches publish patterns one, three and five in attach order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_020 begin');
      const published: number[] = [];
      await createPreviewHarness('', 0, 1);
      published.push(AppStorage.get<number>('inputPattern') ?? -1);
      await createPreviewHarness('', 0, 3);
      published.push(AppStorage.get<number>('inputPattern') ?? -1);
      await createPreviewHarness('', 0, 5);
      published.push(AppStorage.get<number>('inputPattern') ?? -1);

      expect(published.join('|')).assertEqual('1|3|5');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0021
     * @tc.name      testSessionOrder_021
     * @tc.desc      Verify that a cursor position set under one session anchors the next session's empty begin selection.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_021 begin');
      const author: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().setCursorInfo({ x: 7, y: 0, height: 0 });
      const reader: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToBegin();

      expect(author.client.selectedRanges.length).assertEqual(0);
      expect(reader.client.selectedRanges.length).assertEqual(1);
      expect(reader.client.selectedRanges[0].start).assertEqual(0);
      expect(reader.client.selectedRanges[0].end).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0022
     * @tc.name      testSessionOrder_022
     * @tc.desc      Verify that an end selection after returning to the preview editor uses that editor's cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_022 begin');
      const previewed: PreviewHarness = await createPreviewHarness('');
      typeSequence(previewed, 'hel');
      const interloper: PreviewHarness = await createPreviewHarness('zz');
      InputHandler.getInstance().onInputStart(
        previewed.keyboard as object as inputMethodEngine.KeyboardController,
        previewed.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      await InputHandler.getInstance().selectToEnd();

      expect(previewed.client.selectedRanges.length).assertEqual(1);
      expect(previewed.client.selectedRanges[0].start).assertEqual(10);
      expect(previewed.client.selectedRanges[0].end).assertEqual(1000);
      expect(interloper.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0023
     * @tc.name      testSessionOrder_023
     * @tc.desc      Verify that a hide on the previous session leaves the newest keyboard visible and able to commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_023 begin');
      const concealed: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const open: PreviewHarness = await createPreviewHarness('', 3);
      InputHandler.getInstance().sendKeyFunction();

      expect(concealed.keyboard.hideCount).assertEqual(1);
      expect(open.keyboard.hideCount).assertEqual(0);
      expect(open.client.finishCount).assertEqual(1);
      expect(open.client.keyFunctions[0]).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0024
     * @tc.name      testSessionOrder_024
     * @tc.desc      Verify that a preview opened before attribute settlement is committed once after the callback runs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_024 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2, 0, true, true);
      typeSequence(harness, 'hel');
      const previewsBefore: number = harness.client.previewCalls.length;
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();

      expect(previewsBefore).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(2);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0025
     * @tc.name      testSessionOrder_025
     * @tc.desc      Verify that three chained sessions keep one editorial verb each after the final enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_025 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      const writer: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('i');
      const eraser: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteForward(2);
      const selector: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().sendKeyFunction();

      expect(writer.client.insertedTexts.length).assertEqual(1);
      expect(eraser.client.forwardLengths.join('')).assertEqual('2');
      expect(selector.client.selectedRanges[0].end).assertEqual(1000);
      expect(selector.client.finishCount).assertEqual(1);
      expect(writer.client.finishCount).assertEqual(0);
      expect(eraser.client.finishCount).assertEqual(0);
      expect(writer.client.buffer).assertEqual('i');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0026
     * @tc.name      testSessionOrder_026
     * @tc.desc      Verify that an attach publishes its enter type and input pattern as a paired update.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_026 begin');
      const pairs: string[] = [];
      for (let round = 0; round < 2; round++) {
        await createPreviewHarness('', 5 + round * 2, 6 + round * 2);
        const type: number = AppStorage.get<number>('enterKeyType') ?? -1;
        const pattern: number = AppStorage.get<number>('inputPattern') ?? -1;
        pairs.push(type.toString() + ':' + pattern.toString());
      }

      expect(pairs.join('|')).assertEqual('5:6|7:8');
      expect(pairs.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0027
     * @tc.name      testSessionOrder_027
     * @tc.desc      Verify that a rejected finish on the first session and a clean finish on the second total two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_027 begin');
      const broken: PreviewHarness = await createPreviewHarness('', 1);
      broken.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      const repaired: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();
      const finishes: number = broken.client.finishCount + repaired.client.finishCount;

      expect(finishes).assertEqual(2);
      expect(broken.client.keyFunctions[0]).assertEqual(1);
      expect(repaired.client.keyFunctions[0]).assertEqual(2);
      expect(repaired.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0028
     * @tc.name      testSessionOrder_028
     * @tc.desc      Verify that a preview left open on the first session is not committed by the second session's enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_028 begin');
      const abandoned: PreviewHarness = await createPreviewHarness('');
      typeSequence(abandoned, 'hel');
      const successor: PreviewHarness = await createPreviewHarness('', 3);
      InputHandler.getInstance().sendKeyFunction();

      expect(abandoned.client.previewCalls.length).assertEqual(1);
      expect(abandoned.client.finishCount).assertEqual(0);
      expect(abandoned.client.buffer).assertEqual('hello world');
      expect(successor.client.previewCalls.length).assertEqual(0);
      expect(successor.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0029
     * @tc.name      testSessionOrder_029
     * @tc.desc      Verify that two hidden sessions precede a visible third session that commits once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_029 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const third: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();
      const hides: number[] = [first.keyboard.hideCount, second.keyboard.hideCount, third.keyboard.hideCount];
      const finishes: number[] = [first.client.finishCount, second.client.finishCount, third.client.finishCount];

      expect(hides.join('|')).assertEqual('1|1|0');
      expect(finishes.join('|')).assertEqual('0|0|1');
      expect(third.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0030
     * @tc.name      testSessionOrder_030
     * @tc.desc      Verify that a zero backward deletion and a zero forward deletion stay on separate sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_030 begin');
      const backwardSession: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      const forwardSession: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteForward(0);

      expect(backwardSession.client.backwardLengths.join('')).assertEqual('0');
      expect(backwardSession.client.forwardLengths.length).assertEqual(0);
      expect(forwardSession.client.forwardLengths.join('')).assertEqual('0');
      expect(forwardSession.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0031
     * @tc.name      testSessionOrder_031
     * @tc.desc      Verify that a hide issued before any deferred attribute settles stays on the pending client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_031 begin');
      const authoritative: PreviewHarness = await createPreviewHarness('', 5, 0, true, true);
      const pending: PreviewHarness = await createPreviewHarness('', 9, 0, true, true);
      InputHandler.getInstance().hideKeyboardSelf();
      pending.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      const channels: number[] = [pending.keyboard.hideCount, pending.client.finishCount,
        pending.client.keyFunctions[0]];
      const precedent: number[] = [authoritative.keyboard.hideCount, authoritative.client.finishCount];

      expect(channels.join('|')).assertEqual('1|1|9');
      expect(precedent.join('|')).assertEqual('0|0');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0032
     * @tc.name      testSessionOrder_032
     * @tc.desc      Verify that an end selection followed by a begin selection records the tail before the origin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_032 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToEnd();
      await InputHandler.getInstance().selectToBegin();
      const starts: number[] = [harness.client.selectedRanges[0].start, harness.client.selectedRanges[1].start];
      const ends: number[] = [harness.client.selectedRanges[0].end, harness.client.selectedRanges[1].end];

      expect(starts.join('|')).assertEqual('10|0');
      expect(ends.join('|')).assertEqual('1000|10');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0033
     * @tc.name      testSessionOrder_033
     * @tc.desc      Verify that an extend action, an insertion and an enter are recorded in that issue order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_033 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 1);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().sendKeyFunction();
      const channels: number[] = [harness.client.extendActions.length, harness.client.insertedTexts.length,
        harness.client.finishCount];

      expect(channels.join('|')).assertEqual('1|1|1');
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.insertedTexts[0]).assertEqual('e');
      expect(harness.client.buffer).assertEqual('e');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0034
     * @tc.name      testSessionOrder_034
     * @tc.desc      Verify that returning to an earlier editor reissues its attribute and commits with its enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_034 begin');
      const first: PreviewHarness = await createPreviewHarness('', 3);
      const second: PreviewHarness = await createPreviewHarness('', 9);
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();

      expect(first.client.finishCount).assertEqual(1);
      expect(second.client.finishCount).assertEqual(0);
      expect(first.client.keyFunctions[0]).assertEqual(3);
      expect(second.client.keyFunctions.length).assertEqual(0);
      expect(first.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0035
     * @tc.name      testSessionOrder_035
     * @tc.desc      Verify that an empty snapshot precedes a one-character snapshot after a single insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_035 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const emptySummary: string = AppStorage.get<string>('showLog') ?? '';
      InputHandler.getInstance().insertText('r');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const filledSummary: string = AppStorage.get<string>('showLog') ?? '';

      expect(emptySummary.indexOf('before：[]') >= 0).assertTrue();
      expect(filledSummary.indexOf('before：[r]') >= 0).assertTrue();
      expect(filledSummary.indexOf('before：[]')).assertEqual(-1);
      expect(harness.client.forwardQueries.length).assertEqual(2);
      expect(harness.client.buffer).assertEqual('r');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_035 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0036
     * @tc.name      testSessionOrder_036
     * @tc.desc      Verify that hide, enter and hide across three sessions leave exactly one finish.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_036 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const second: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();
      const third: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const channels: string[] = [first.keyboard.hideCount.toString(), second.client.finishCount.toString(),
        third.keyboard.hideCount.toString()];

      expect(channels.join('|')).assertEqual('1|1|1');
      expect(second.client.keyFunctions[0]).assertEqual(2);
      expect(first.client.finishCount + third.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_036 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0037
     * @tc.name      testSessionOrder_037
     * @tc.desc      Verify that four alternating insert and hide attaches progress as insert, hide, insert, hide.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_037 begin');
      const trace: string[] = [];
      let inserts: number = 0;
      let hides: number = 0;
      for (let round = 0; round < 4; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          InputHandler.getInstance().insertText('h');
          inserts = inserts + harness.client.insertedTexts.length;
          trace.push('i');
        } else {
          InputHandler.getInstance().hideKeyboardSelf();
          hides = hides + harness.keyboard.hideCount;
          trace.push('h');
        }
      }
      const totals: number[] = [inserts, hides];

      expect(trace.join('')).assertEqual('ihih');
      expect(totals.join('|')).assertEqual('2|2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_037 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0038
     * @tc.name      testSessionOrder_038
     * @tc.desc      Verify that three attach-only sessions journal one attribute query each while leaving no edits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_038 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('');
      const third: PreviewHarness = await createPreviewHarness('');
      const queries: number[] = [first.client.editorAttributeCount, second.client.editorAttributeCount,
        third.client.editorAttributeCount];
      const finishes: number = first.client.finishCount + second.client.finishCount + third.client.finishCount;

      expect(queries.join('|')).assertEqual('1|1|1');
      expect(finishes).assertEqual(0);
      expect(first.client.buffer + second.client.buffer + third.client.buffer).assertEqual('');
      expect(first.client.privateCommandCount + second.client.privateCommandCount +
        third.client.privateCommandCount).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_038 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0039
     * @tc.name      testSessionOrder_039
     * @tc.desc      Verify that two sessions with different prefixes open previews at their own offsets and only the second commits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_039 begin');
      const bare: PreviewHarness = await createPreviewHarness('');
      typeSequence(bare, 'hel');
      const prefixed: PreviewHarness = await createPreviewHarness('ab');
      typeSequence(prefixed, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const offsets: number[] = [bare.client.previewCalls[0].start, prefixed.client.previewCalls[0].start];

      expect(offsets.join('|')).assertEqual('0|2');
      expect(bare.client.finishCount).assertEqual(0);
      expect(prefixed.client.finishCount).assertEqual(1);
      expect(bare.client.buffer).assertEqual('hello world');
      expect(prefixed.client.buffer).assertEqual('abhello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_039 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0040
     * @tc.name      testSessionOrder_040
     * @tc.desc      Verify that an enter before and after a preview counts two keys while the preview stays at one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_040 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3);
      InputHandler.getInstance().sendKeyFunction();
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const channels: number[] = [harness.client.finishCount, harness.client.previewCalls.length,
        harness.client.keyFunctions.length];

      expect(channels.join('|')).assertEqual('2|1|2');
      expect(harness.client.keyFunctions[0]).assertEqual(3);
      expect(harness.client.keyFunctions[1]).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_040 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0041
     * @tc.name      testSessionOrder_041
     * @tc.desc      Verify that an unsupported replacement editor still receives the commit and its own enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_041 begin');
      const supported: PreviewHarness = await createPreviewHarness('', 1);
      const unsupported: PreviewHarness = await createPreviewHarness('', 6, 0, false);
      InputHandler.getInstance().sendKeyFunction();

      expect(unsupported.client.finishCount).assertEqual(1);
      expect(unsupported.client.keyFunctions[0]).assertEqual(6);
      expect(supported.client.finishCount).assertEqual(0);
      expect(supported.client.keyFunctions.length).assertEqual(0);
      expect(supported.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_041 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0042
     * @tc.name      testSessionOrder_042
     * @tc.desc      Verify that a caret move, a movement selection and a tail range occupy three separate channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_042 begin');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().selectByMovement(inputMethodEngine.Direction.CURSOR_LEFT);
      await InputHandler.getInstance().selectToEnd();
      const channels: number[] = [harness.client.movedDirections.length, harness.client.movementDirections.length,
        harness.client.selectedRanges.length];

      expect(channels.join('|')).assertEqual('1|1|1');
      expect(harness.client.movedDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.movementDirections[0]).assertEqual(inputMethodEngine.Direction.CURSOR_LEFT);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_042 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_ORDER_0043
     * @tc.name      testSessionOrder_043
     * @tc.desc      Verify that an unsupported editor still journals one attribute query, one command and one preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_043 begin');
      const limited: PreviewHarness = await createPreviewHarness('', 4, 0, false);
      typeSequence(limited, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const journal: number[] = [limited.client.editorAttributeCount, limited.client.privateCommandCount,
        limited.client.previewCalls.length];
      const successor: PreviewHarness = await createPreviewHarness('');

      expect(journal.join('|')).assertEqual('1|1|1');
      expect(limited.client.finishCount).assertEqual(1);
      expect(limited.client.keyFunctions[0]).assertEqual(4);
      expect(successor.client.privateCommandCount).assertEqual(1);
      expect(successor.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_043 end');
      await yieldToEventLoop();
    });

  });
}
