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
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMore]';

export default function CommandJournal1TestTest(): void {
  describe('CommandJournal1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0001
     * @tc.name      testCommandJournal_1001
     * @tc.desc      Verify the command journal insert(a), insert(b), back(1), fwd(0), insert(c).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1001 begin');
      // The handler forwards command kinds verbatim, so channel order is observable.
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('a');
      handler.insertText('b');
      handler.deleteBackward(1);
      handler.deleteForward(0);
      handler.insertText('c');
      // Channels are independent, so each command array is checked separately.
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.buffer.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0002
     * @tc.name      testCommandJournal_1002
     * @tc.desc      Verify the command journal insert(1), back(2), insert(2), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('x');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('1');
      handler.deleteBackward(2);
      handler.insertText('2');
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('12');
      expect(harness.client.backwardLengths.join(',')).assertEqual('2,1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('x12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0003
     * @tc.name      testCommandJournal_1003
     * @tc.desc      Verify the command journal move(3), move(4), back(1), fwd(2).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(3);
      handler.moveCursor(4);
      handler.deleteBackward(1);
      handler.deleteForward(2);
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0004
     * @tc.name      testCommandJournal_1004
     * @tc.desc      Verify the command journal insert( ), insert(q), back(0), back(5).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText(' ');
      handler.insertText('q');
      handler.deleteBackward(0);
      handler.deleteBackward(5);
      expect(harness.client.insertedTexts.join('')).assertEqual(' q');
      expect(harness.client.backwardLengths.join(',')).assertEqual('0,5');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual(' q');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0005
     * @tc.name      testCommandJournal_1005
     * @tc.desc      Verify the command journal insert(l), insert(x), back(1), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1005 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('l');
      handler.insertText('x');
      handler.deleteBackward(1);
      handler.deleteBackward(1);
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.buffer.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0006
     * @tc.name      testCommandJournal_1006
     * @tc.desc      Verify the command journal smove(1), smove(2), smove(3), smove(4).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(1);
      handler.selectByMovement(2);
      handler.selectByMovement(3);
      handler.selectByMovement(4);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0007
     * @tc.name      testCommandJournal_1007
     * @tc.desc      Verify the command journal extend(0), extend(3), extend(4), extend(5).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1007 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();
      handler.sendExtendAction(0);
      handler.sendExtendAction(3);
      handler.sendExtendAction(4);
      handler.sendExtendAction(5);
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('0,3,4,5');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0008
     * @tc.name      testCommandJournal_1008
     * @tc.desc      Verify the command journal insert(a), fwd(1), insert(b), fwd(1), insert(c).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('a');
      handler.deleteForward(1);
      handler.insertText('b');
      handler.deleteForward(1);
      handler.insertText('c');
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1,1');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0009
     * @tc.name      testCommandJournal_1009
     * @tc.desc      Verify the command journal back(1), back(1), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('zz');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteBackward(1);
      handler.deleteBackward(1);
      handler.deleteBackward(1);
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_0010
     * @tc.name      testCommandJournal_1010
     * @tc.desc      Verify the command journal move(1), move(2), insert(k), back(2).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(1);
      handler.moveCursor(2);
      handler.insertText('k');
      handler.deleteBackward(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('k');
      expect(harness.client.backwardLengths.join(',')).assertEqual('2');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('1,2');
      expect(harness.client.buffer).assertEqual('k');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0001
     * @tc.name      testCommandJournal1Preview_001
     * @tc.desc      Verify that typing h, e and l overwrites the window zero through three with the preview text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');

      expect(harness.client.insertedTexts.join('')).assertEqual('hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].text).assertEqual('hello world');
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.cursor).assertEqual(10);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0002
     * @tc.name      testCommandJournal1Preview_002
     * @tc.desc      Verify that a character typed after the preview appends without a second preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('a');

      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worlda');
      expect(harness.client.cursor).assertEqual(11);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0003
     * @tc.name      testCommandJournal1Preview_003
     * @tc.desc      Verify that a leading x shifts the preview window to indices one through four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'xhel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('xhello world');
      expect(harness.client.insertedTexts.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0004
     * @tc.name      testCommandJournal1Preview_004
     * @tc.desc      Verify that a stored a is preserved in front of the preview when h, e and l follow it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');

      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('ahello world');
      expect(harness.client.buffer.charAt(0)).assertEqual('a');
      expect(harness.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0005
     * @tc.name      testCommandJournal1Preview_005
     * @tc.desc      Verify that one payload of h, e and l previews over indices two through three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText('hel');

      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(2);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hehello world');
      expect(harness.client.cursor).assertEqual(12);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0006
     * @tc.name      testCommandJournal1Preview_006
     * @tc.desc      Verify that two letters alone start no preview but still commit on the enter key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'he');
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions.join(',')).assertEqual('0');
      expect(harness.client.buffer).assertEqual('he');
      expect(harness.client.cursor).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0007
     * @tc.name      testCommandJournal1Preview_007
     * @tc.desc      Verify that h, l and e do not trigger the preview because the window is not hel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hle');

      expect(harness.client.previewCalls.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hle');
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0008
     * @tc.name      testCommandJournal1Preview_008
     * @tc.desc      Verify that an empty payload after the preview requests the window zero through eleven.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('');

      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(0);
      expect(harness.client.previewCalls[1].end).assertEqual(11);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.insertedTexts[harness.client.insertedTexts.length - 1].length).assertEqual(0);
      expect(harness.client.cursor).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0009
     * @tc.name      testCommandJournal1Preview_009
     * @tc.desc      Verify that a two-character payload after the preview appends without re-previewing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('lo');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.insertedTexts[3]).assertEqual('lo');
      expect(harness.client.buffer).assertEqual('hello worldlo');
      expect(harness.client.cursor).assertEqual(12);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0010
     * @tc.name      testCommandJournal1Preview_010
     * @tc.desc      Verify that a preview survives a backward deletion and a following insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(3);
      InputHandler.getInstance().insertText('z');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.backwardLengths.join(',')).assertEqual('3');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello worldz');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0011
     * @tc.name      testCommandJournal1Preview_011
     * @tc.desc      Verify that a left move and a cut during the preview use their own channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);

      expect(harness.client.movedDirections.join(',')).assertEqual('3');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0012
     * @tc.name      testCommandJournal1Preview_012
     * @tc.desc      Verify that hiding the keyboard during the preview does not commit it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0013
     * @tc.name      testCommandJournal1Preview_013
     * @tc.desc      Verify that two enter presses after the preview count two finishes and two key requests.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.finishCount).assertEqual(2);
      expect(harness.client.keyFunctions.join(',')).assertEqual('0,0');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0014
     * @tc.name      testCommandJournal1Preview_014
     * @tc.desc      Verify that an insertion before the enter keeps the preview text as the base.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.insertedTexts[3]).assertEqual('a');
      expect(harness.client.buffer).assertEqual('hello worlda');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0015
     * @tc.name      testCommandJournal1Preview_015
     * @tc.desc      Verify that a typed h after the stored hello overwrites it through the preview content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_015 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');

      InputHandler.getInstance().insertText('h');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.insertedTexts.join('')).assertEqual('h');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0016
     * @tc.name      testCommandJournal1Preview_016
     * @tc.desc      Verify that a forward deletion during the preview leaves the preview text untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_016 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteForward(2);

      expect(harness.client.forwardLengths.join(',')).assertEqual('2');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0017
     * @tc.name      testCommandJournal1Preview_017
     * @tc.desc      Verify that a downward move and an insertion during the preview stay in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_017 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().insertText('m');

      expect(harness.client.movedDirections.join(',')).assertEqual('2');
      expect(harness.client.buffer).assertEqual('hello worldm');
      expect(harness.client.insertedTexts[3]).assertEqual('m');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0018
     * @tc.name      testCommandJournal1Preview_018
     * @tc.desc      Verify that two edit actions during the preview keep their order and start no commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_018 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);

      const expected: number[] = [
        inputMethodEngine.ExtendAction.COPY,
        inputMethodEngine.ExtendAction.SELECT_ALL
      ];
      expect(harness.client.extendActions.join(',')).assertEqual(expected.join(','));
      expect(harness.client.finishCount).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.insertedTexts[2]).assertEqual('l');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0019
     * @tc.name      testCommandJournal1Preview_019
     * @tc.desc      Verify that a two-letter payload followed by l previews over zero through three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_019 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText('he');
      InputHandler.getInstance().insertText('l');

      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.insertedTexts[0]).assertEqual('he');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0020
     * @tc.name      testCommandJournal1Preview_020
     * @tc.desc      Verify that a fourth letter p after the preview appends and never re-triggers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_020 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'help');

      expect(harness.client.insertedTexts.join('')).assertEqual('help');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldp');
      expect(harness.client.cursor).assertEqual(11);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0021
     * @tc.name      testCommandJournal1Preview_021
     * @tc.desc      Verify that opposite deletions during the preview both record and the next insertion appends.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_021 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().insertText('q');

      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('hello worldq');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_0022
     * @tc.name      testCommandJournal1Preview_022
     * @tc.desc      Verify that hide, enter and insertion after the preview leave three independent counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Preview_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_022 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('r');

      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldr');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Preview_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0001
     * @tc.name      testCommandJournal1Routing_001
     * @tc.desc      Verify that an insertion before and after a new attach lands on the corresponding client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_001 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('a');
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('b');

      expect(first.client.insertedTexts.join('')).assertEqual('a');
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(first.client.editorAttributeCount).assertEqual(1);
      expect(second.client.editorAttributeCount).assertEqual(1);
      expect(first.client.buffer).assertEqual('a');
      expect(second.client.buffer).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0002
     * @tc.name      testCommandJournal1Routing_002
     * @tc.desc      Verify that a preview opened in one session is not replayed into the next session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_002 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('x');

      expect(first.client.previewCalls.length).assertEqual(1);
      expect(second.client.previewCalls.length).assertEqual(0);
      expect(first.client.buffer).assertEqual('hello world');
      expect(second.client.buffer).assertEqual('x');
      expect(first.client.finishCount).assertEqual(0);
      expect(second.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0003
     * @tc.name      testCommandJournal1Routing_003
     * @tc.desc      Verify that a begin selection after a new attach uses the new client cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_003 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('ab');

      await InputHandler.getInstance().selectToBegin();

      expect(first.client.selectedRanges.length).assertEqual(0);
      expect(second.client.selectedRanges.length).assertEqual(1);
      expect(second.client.selectedRanges[0].start).assertEqual(0);
      expect(second.client.selectedRanges[0].end).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0004
     * @tc.name      testCommandJournal1Routing_004
     * @tc.desc      Verify that the debug refresh reads from the newest client and none from the old one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_004 begin');
      const first: PreviewHarness = await createPreviewHarness('old');
      const second: PreviewHarness = await createPreviewHarness('new');

      InputHandler.getInstance().refreshInfo();

      expect(first.client.forwardQueries.length).assertEqual(0);
      expect(first.client.backwardQueries.length).assertEqual(0);
      expect(second.client.forwardQueries.join(',')).assertEqual('5');
      expect(second.client.backwardQueries.join(',')).assertEqual('5');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0005
     * @tc.name      testCommandJournal1Routing_005
     * @tc.desc      Verify that the enter request after a new attach reaches only the newest client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_005 begin');
      const first: PreviewHarness = await createPreviewHarness('', 3);
      const second: PreviewHarness = await createPreviewHarness('', 4);

      InputHandler.getInstance().sendKeyFunction();

      expect(first.client.finishCount).assertEqual(0);
      expect(first.client.keyFunctions.length).assertEqual(0);
      expect(second.client.finishCount).assertEqual(1);
      expect(second.client.keyFunctions.join(',')).assertEqual('4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0006
     * @tc.name      testCommandJournal1Routing_006
     * @tc.desc      Verify that each attach sends one private command carrying the underline preview style.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.privateCommands.length).assertEqual(1);
      const style: inputMethodEngine.CommandDataType | undefined =
        harness.client.privateCommands[0]['previewTextStyle'];
      expect(style).assertEqual('underline');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0007
     * @tc.name      testCommandJournal1Routing_007
     * @tc.desc      Verify that a backward deletion after a new attach leaves the old deletion channel empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_007 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(1);
      const second: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(3);

      expect(first.client.backwardLengths.join(',')).assertEqual('1');
      expect(second.client.backwardLengths.join(',')).assertEqual('2');
      expect(second.client.forwardLengths.join(',')).assertEqual('3');
      expect(first.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_ROUTING_0008
     * @tc.name      testCommandJournal1Routing_008
     * @tc.desc      Verify that after three attaches only the third client records the insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Routing_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_008 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('');
      const third: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText('c');

      expect(first.client.insertedTexts.length).assertEqual(0);
      expect(second.client.insertedTexts.length).assertEqual(0);
      expect(third.client.insertedTexts.join('')).assertEqual('c');
      expect(third.client.buffer).assertEqual('c');
      expect(first.client.privateCommandCount + second.client.privateCommandCount +
        third.client.privateCommandCount).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Routing_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0001
     * @tc.name      testCommandJournal1PreviewMore_001
     * @tc.desc      Verify that typing h, e and l after the stored hello opens two previews at zero and ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');

      typeSequence(harness, 'hel');

      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(6);
      expect(harness.client.previewCalls[1].start).assertEqual(10);
      expect(harness.client.previewCalls[1].end).assertEqual(13);
      expect(harness.client.buffer).assertEqual('hello worlhello world');
      expect(harness.client.cursor).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0002
     * @tc.name      testCommandJournal1PreviewMore_002
     * @tc.desc      Verify that a doubled h before e and l shifts the preview window to one through four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hhel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(1);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('hhello world');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.buffer.charAt(0)).assertEqual('h');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0003
     * @tc.name      testCommandJournal1PreviewMore_003
     * @tc.desc      Verify that a single hel payload after a stored x previews over three through four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('x');

      InputHandler.getInstance().insertText('hel');

      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(3);
      expect(harness.client.previewCalls[0].end).assertEqual(4);
      expect(harness.client.buffer).assertEqual('xhehello world');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.cursor).assertEqual(13);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0004
     * @tc.name      testCommandJournal1PreviewMore_004
     * @tc.desc      Verify that a zero forward deletion during the preview records a call and keeps the text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteForward(0);

      expect(harness.client.forwardLengths.join(',')).assertEqual('0');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0005
     * @tc.name      testCommandJournal1PreviewMore_005
     * @tc.desc      Verify that a literal hel after the preview opens a second window at thirteen through fourteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('hel');

      expect(harness.client.previewCalls.length).assertEqual(2);
      expect(harness.client.previewCalls[1].start).assertEqual(13);
      expect(harness.client.previewCalls[1].end).assertEqual(14);
      expect(harness.client.buffer).assertEqual('hello worldhehello world');
      expect(harness.client.insertedTexts[3]).assertEqual('hel');
      expect(harness.client.cursor).assertEqual(23);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0006
     * @tc.name      testCommandJournal1PreviewMore_006
     * @tc.desc      Verify that a caret-begin range during the preview precedes the appended insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      await InputHandler.getInstance().moveCursorToBegin();
      InputHandler.getInstance().insertText('x');

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.buffer).assertEqual('hello worldx');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0007
     * @tc.name      testCommandJournal1PreviewMore_007
     * @tc.desc      Verify that selecting to the end during the preview starts at the cursor index ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      await InputHandler.getInstance().selectToEnd();
      InputHandler.getInstance().insertText('y');

      expect(harness.client.selectedRanges.length).assertEqual(1);
      expect(harness.client.selectedRanges[0].start).assertEqual(10);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      expect(harness.client.buffer).assertEqual('hello worldy');
      expect(harness.client.insertedTexts.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0008
     * @tc.name      testCommandJournal1PreviewMore_008
     * @tc.desc      Verify that a zero backward deletion before the enter does not stop the commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.backwardLengths.join(',')).assertEqual('0');
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0009
     * @tc.name      testCommandJournal1PreviewMore_009
     * @tc.desc      Verify that two hides then an enter after the preview keep two hides and one commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0010
     * @tc.name      testCommandJournal1PreviewMore_010
     * @tc.desc      Verify that a copy action and an enter after the preview keep separate action and commit counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      InputHandler.getInstance().sendKeyFunction();

      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0011
     * @tc.name      testCommandJournal1PreviewMore_011
     * @tc.desc      Verify that an enter after a new attach commits on the new client and not the previewing one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_011 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().sendKeyFunction();

      expect(first.client.previewCalls.length).assertEqual(1);
      expect(first.client.finishCount).assertEqual(0);
      expect(second.client.previewCalls.length).assertEqual(0);
      expect(second.client.finishCount).assertEqual(1);
      expect(second.client.keyFunctions.join(',')).assertEqual('0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_PREVIEW_MORE_0012
     * @tc.name      testCommandJournal1PreviewMore_012
     * @tc.desc      Verify that insert, delete and insert after the preview keep the channels and the new text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1PreviewMore_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().insertText('b');

      expect(harness.client.insertedTexts.length).assertEqual(5);
      expect(harness.client.insertedTexts[3]).assertEqual('a');
      expect(harness.client.insertedTexts[4]).assertEqual('b');
      expect(harness.client.backwardLengths.join(',')).assertEqual('2');
      expect(harness.client.buffer).assertEqual('hello worldab');
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1PreviewMore_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL1_INTERLOCK_0001
     * @tc.name      testCommandJournal1Interlock_001
     * @tc.desc      Verify that a deletion between he and l does not prevent the preview window zero through three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal1Interlock_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Interlock_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      typeSequence(harness, 'he');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().insertText('l');

      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.previewCalls[0].start).assertEqual(0);
      expect(harness.client.previewCalls[0].end).assertEqual(3);
      expect(harness.client.buffer).assertEqual('hello world');
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal1Interlock_001 end');
      await yieldToEventLoop();
    });

  });
}
