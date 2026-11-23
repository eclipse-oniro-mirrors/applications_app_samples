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
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMore2]';

export default function PreviewWindowDeep1TestTest(): void {
  describe('PreviewWindowDeep1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0001
     * @tc.name      testPreviewWindowDeep_1001
     * @tc.desc      Verify the extended preview window after typing he.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1001 begin');
      // The trigger reads the committed prefix, so the expected range is cursor-based.
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'he');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('he');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0002
     * @tc.name      testPreviewWindowDeep_1002
     * @tc.desc      Verify the extended preview window after typing helx.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'helx');
      expect(harness.client.buffer.length).assertEqual(12);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0003
     * @tc.name      testPreviewWindowDeep_1003
     * @tc.desc      Verify the extended preview window after typing xhel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'xhel');
      expect(harness.client.insertedTexts.join('')).assertEqual('xhel');
      expect(harness.client.buffer).assertEqual('xhello world');
      expect(harness.client.previewCalls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0004
     * @tc.name      testPreviewWindowDeep_1004
     * @tc.desc      Verify the extended preview window after typing ahel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1004 begin');
      const initial: string = 'a';
      const typedLetters: string = 'ahel';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, typedLetters);
      const expectedEnd: number = initial.length + typedLetters.length;
      const expectedStart: number = expectedEnd - 3;
      const expectedBuffer: string = initial + typedLetters.substring(0, typedLetters.length - 3) + 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0005
     * @tc.name      testPreviewWindowDeep_1005
     * @tc.desc      Verify the extended preview window after typing abhel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1005 begin');
      const initial: string = 'ab';
      const typed: string = 'abhel';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      typeSequence(harness, typed);
      const expectedLength: number = (initial.length + typed.length - 3) + 'hello world'.length;
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(expectedLength);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0006
     * @tc.name      testPreviewWindowDeep_1006
     * @tc.desc      Verify the extended preview window after typing l.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      InputHandler.getInstance().insertText('l');
      const expectedBuffer: string = 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('l');
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0007
     * @tc.name      testPreviewWindowDeep_1007
     * @tc.desc      Verify the extended preview window after typing el.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1007 begin');
      const harness: PreviewHarness = await createPreviewHarness('h');
      const letters: string = 'el';
      typeSequence(harness, letters);
      const expectedRange: number[] = [0, 3];
      expect(harness.client.previewCalls.length).assertEqual(1);
      const actualRange: number[] = [harness.client.previewCalls[0].start, harness.client.previewCalls[0].end];
      for (let i: number = 0; i < expectedRange.length; i++) {
        expect(actualRange[i]).assertEqual(expectedRange[i]);
      }
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0008
     * @tc.name      testPreviewWindowDeep_1008
     * @tc.desc      Verify the extended preview window and buffer growth for the lowercase hel trigger.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      typeSequence(harness, 'hel');
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.buffer.length).assertEqual(21);
      expect(harness.client.previewCalls[1].start).assertEqual(10);
      expect(harness.client.previewCalls[1].end).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0009
     * @tc.name      testPreviewWindowDeep_1009
     * @tc.desc      Verify that a trailing space after hel keeps one preview request and extends the buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const letters: string[] = ['h', 'e', 'l', ' '];
      for (let i: number = 0; i < letters.length; i++) {
        InputHandler.getInstance().insertText(letters[i]);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('hel ');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world ');
      expect(harness.client.buffer.endsWith(' ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_0010
     * @tc.name      testPreviewWindowDeep_1010
     * @tc.desc      Verify the extended preview window after typing  hel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewWindowDeep_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, ' hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      const actualRangeText: string = harness.client.previewCalls[0].start.toString() + '|' + harness.client.previewCalls[0].end.toString();
      expect(actualRangeText).assertEqual('1|4');
      expect(harness.client.buffer).assertEqual(' hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWindowDeep_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_SETTLED_0001
     * @tc.name      testSettledWindow_001
     * @tc.desc      Verify that a letter typed after a committed preview appends to the buffer without a new window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSettledWindow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('o');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldo');
      expect(harness.client.buffer.length).assertEqual(12);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(11);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_SETTLED_0002
     * @tc.name      testSettledWindow_002
     * @tc.desc      Verify that an extra letter before the second trigger shifts the window start to ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSettledWindow_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('z');
      expect(harness.client.previewCalls.length).assertEqual(1);
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(10);
      expect(harness.client.previewCalls[1].end).assertEqual(13);
      expect(harness.client.buffer).assertEqual('hello worlhello world');
      expect(harness.client.buffer.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_SETTLED_0003
     * @tc.name      testSettledWindow_003
     * @tc.desc      Verify that a committed preview followed by three ordinary letters keeps one window and twelve units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSettledWindow_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      typeSequence(harness, 'xyz');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldxyz');
      expect(harness.client.buffer.length).assertEqual(14);
      expect(harness.client.insertedTexts.join('')).assertEqual('helxyz');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_SETTLED_0004
     * @tc.name      testSettledWindow_004
     * @tc.desc      Verify that a hide and a zero deletion between a commit and the next l keep the window at nine.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSettledWindow_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().insertText('l');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.backwardLengths.join('|')).assertEqual('0');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(9);
      expect(harness.client.previewCalls[1].end).assertEqual(12);
      expect(harness.client.buffer).assertEqual('hello worhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_SETTLED_0005
     * @tc.name      testSettledWindow_005
     * @tc.desc      Verify that a begin selection between a commit and the next l leaves the window at nine to twelve.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSettledWindow_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().insertText('l');
      expect(harness.client.selectedRanges[0].end).assertEqual(10);
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(9);
      expect(harness.client.previewCalls[1].end).assertEqual(12);
      expect(harness.client.buffer).assertEqual('hello worhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSettledWindow_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_GROWTH_0001
     * @tc.name      testWindowGrowth_001
     * @tc.desc      Verify that three consecutive l letters step the window start by nine each time.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowGrowth_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('l');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(3);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[1].start).assertEqual(9);
      expect(harness.client.previewCalls[2].start).assertEqual(18);
      expect(harness.client.previewCalls[2].end).assertEqual(21);
      expect(harness.client.buffer).assertEqual('hello worhello worhello world');
      expect(harness.client.buffer.length).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_GROWTH_0002
     * @tc.name      testWindowGrowth_002
     * @tc.desc      Verify that a settled preview plus e then l opens one window from ten to thirteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowGrowth_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const harness: PreviewHarness = await createPreviewHarness('hello world');
      InputHandler.getInstance().insertText('e');
      const callsBefore: number = harness.client.previewCalls.length;
      InputHandler.getInstance().insertText('l');
      const callsAfter: number = harness.client.previewCalls.length;
      expect(callsBefore).assertEqual(0);
      expect(callsAfter - callsBefore).assertEqual(1);
      expect(harness.client.previewCalls[0].start + harness.client.previewCalls[0].end).assertEqual(23);
      expect(harness.client.buffer.length).assertEqual(21);
      expect(harness.client.buffer.indexOf('hello worlhello world')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_GROWTH_0003
     * @tc.name      testWindowGrowth_003
     * @tc.desc      Verify that hel at offset eleven of a duplicate buffer produces the four-unit window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowGrowth_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_003 begin');
      const initial: string = 'hello worldhel';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      InputHandler.getInstance().insertText('x');
      const expectedStart: number = initial.lastIndexOf('hel');
      const expectedEnd: number = expectedStart + 4;
      const expectedBuffer: string = 'hello world' + 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_GROWTH_0004
     * @tc.name      testWindowGrowth_004
     * @tc.desc      Verify that a split hel in a longer text opens a window from seven to ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowGrowth_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_004 begin');
      const initial: string = 'hello hel';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      InputHandler.getInstance().insertText('l');
      const expectedStart: number = 7;
      const expectedEnd: number = 10;
      const expectedBuffer: string = 'hello h' + 'hello world';
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer).assertEqual(expectedBuffer);
      expect(harness.client.buffer.length).assertEqual(expectedBuffer.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_GROWTH_0005
     * @tc.name      testWindowGrowth_005
     * @tc.desc      Verify that a two-letter prefix keeps one window while two letters are appended.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testWindowGrowth_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('l');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.buffer).assertEqual('abhello worldll');
      expect(harness.client.buffer.length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWindowGrowth_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0001
     * @tc.name      testDeepFault_001
     * @tc.desc      Verify that a rejected overwrite after a commit is retried from index ten once the fault clears.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFault_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      harness.client.failPreview = true;
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldl');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(10);
      expect(harness.client.previewCalls[1].end).assertEqual(13);
      expect(harness.client.buffer).assertEqual('hello worlhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0002
     * @tc.name      testDeepFault_002
     * @tc.desc      Verify that a finish fault cleared between enters finishes the committed preview twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeepFault_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3);
      typeSequence(harness, 'hel');
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      harness.client.failFinish = false;
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0003
     * @tc.name      testDeepFault_003
     * @tc.desc      Verify that a rejected first window on an ab editor is retried at index two after the fault clears.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFault_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abhel');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('x');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.buffer).assertEqual('abhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0004
     * @tc.name      testDeepFault_004
     * @tc.desc      Verify that a rejected attach command does not disturb the second committed window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFault_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('x');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldx');
      expect(harness.client.buffer.length).assertEqual(12);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0005
     * @tc.name      testDeepFault_005
     * @tc.desc      Verify that a rejected hide during a committed window still allows the enter finish and type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeepFault_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 6);
      typeSequence(harness, 'hel');
      harness.keyboard.failHide = true;
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(6);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0006
     * @tc.name      testDeepFault_006
     * @tc.desc      Verify that a one-letter prefix retries a rejected window at index one after the fault clears.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFault_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('x');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      const rejectedCalls: number = harness.client.previewCalls.length;
      expect(rejectedCalls).assertEqual(0);
      expect(harness.client.buffer).assertEqual('xhel');
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('l');
      const expectedStart: number = 1;
      const expectedEnd: number = 5;
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(expectedStart);
      expect(harness.client.previewCalls[0].end).assertEqual(expectedEnd);
      expect(harness.client.buffer.length).assertEqual(expectedEnd + 7);
      expect(harness.client.buffer).assertEqual('xhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0007
     * @tc.name      testDeepFault_007
     * @tc.desc      Verify that a hide and an enter after a chained window keep two windows and one finish.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFault_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 2);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('l');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.keyFunctions.join('|')).assertEqual('2');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FAULT_0008
     * @tc.name      testDeepFault_008
     * @tc.desc      Verify that a hide during a rejected window does not block the retry at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFault_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failPreview = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(0);
      harness.client.failPreview = false;
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFault_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_ORDER_0001
     * @tc.name      testDeepOrder_001
     * @tc.desc      Verify that a switch keeps the old window history and starts the new editor at offset two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepOrder_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_001 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      InputHandler.getInstance().insertText('l');
      expect(first.client.previewCalls.length).assertEqual(2);
      const second: PreviewHarness = await createPreviewHarness('ab');
      expect(second.client.previewCalls.length).assertEqual(0);
      typeSequence(second, 'hel');
      expect(first.client.previewCalls.length).assertEqual(2);
      expect(second.client.previewCalls.length).assertEqual(1);
      expect(second.client.previewCalls[0].start).assertEqual(2);
      expect(first.client.buffer).assertEqual('hello worhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_ORDER_0002
     * @tc.name      testDeepOrder_002
     * @tc.desc      Verify that switching to a he editor opens the first-position window on the new client only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeepOrder_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_002 begin');
      const retired: PreviewHarness = await createPreviewHarness('zz');
      typeSequence(retired, 'hel');
      expect(retired.client.previewCalls[0].start).assertEqual(2);
      const active: PreviewHarness = await createPreviewHarness('he');
      InputHandler.getInstance().insertText('l');
      expect(active.client.previewCalls.length).assertEqual(1);
      expect(active.client.previewCalls[0].start).assertEqual(0);
      expect(active.client.previewCalls[0].end).assertEqual(3);
      expect(retired.client.previewCalls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_ORDER_0003
     * @tc.name      testDeepOrder_003
     * @tc.desc      Verify that two editors observe the same preview text with different window offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepOrder_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_003 begin');
      const first: PreviewHarness = await createPreviewHarness('zz');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('');
      typeSequence(second, 'hel');
      expect(first.client.previewCalls[0].text).assertEqual('hello world');
      expect(second.client.previewCalls[0].text).assertEqual('hello world');
      expect(first.client.previewCalls[0].start).assertEqual(2);
      expect(second.client.previewCalls[0].start).assertEqual(0);
      expect(first.client.buffer).assertEqual('zzhello world');
      expect(second.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_ORDER_0004
     * @tc.name      testDeepOrder_004
     * @tc.desc      Verify that a rejected overwrite followed by enter keeps the appended letter and finishes once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepOrder_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 8);
      typeSequence(harness, 'hel');
      harness.client.failPreview = true;
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldl');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(8);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldl');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepOrder_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FLAG_0001
     * @tc.name      testDeepFlag_001
     * @tc.desc      Verify that a deferred editor keeps the two-letter offset and forwards the type after the settle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFlag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab', 14, 0, true, true);
      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(14);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('abhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FLAG_0002
     * @tc.name      testDeepFlag_002
     * @tc.desc      Verify that an unsupported editor still receives a second window at index ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFlag_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(10);
      expect(harness.client.previewCalls[1].end).assertEqual(13);
      expect(harness.client.buffer).assertEqual('hello worlhello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FLAG_0003
     * @tc.name      testDeepFlag_003
     * @tc.desc      Verify that a zero enter type commits an open window with the literal zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDeepFlag_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('0');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FLAG_0004
     * @tc.name      testDeepFlag_004
     * @tc.desc      Verify that a two-h prefix reaches the window through a start of one instead of the direct branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFlag_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hhel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hhello world');
      expect(harness.client.buffer.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FLAG_0005
     * @tc.name      testDeepFlag_005
     * @tc.desc      Verify that hel followed by o rebuilds the four-unit window without a prior commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFlag_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_005 begin');
      const initial: string = 'hel';
      const harness: PreviewHarness = await createPreviewHarness(initial);
      InputHandler.getInstance().insertText('o');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(initial.length + 1);
      expect(harness.client.getTextIndexAtCursorSync()).assertEqual(10);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FLAG_0006
     * @tc.name      testDeepFlag_006
     * @tc.desc      Verify that an unsupported editor with a finish fault still sends its type nine after a window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFlag_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 9, 0, false);
      harness.client.failFinish = true;
      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.join('|')).assertEqual('9');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEWWINDOWDEEP1_FLAG_0007
     * @tc.name      testDeepFlag_007
     * @tc.desc      Verify that a pending editor with a rejected command still keeps the two-letter window offset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testDeepFlag_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab', 0, 0, true, true, true);
      typeSequence(harness, 'hel');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(5);
      expect(harness.client.buffer).assertEqual('abhello world');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeepFlag_007 end');
      await yieldToEventLoop();
    });

  });
}
