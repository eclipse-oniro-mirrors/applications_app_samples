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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMore2]';

export default function commandJournalDeep1Test(): void {
  describe('CommandJournalDeep1Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0001
     * @tc.name      testCommandJournalDeep_1001
     * @tc.desc      Verify the extended command journal insert(a), insert(b), insert(c), back(1), fwd(1), insert(d).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1001 begin');
      // The fake editor keeps every channel separate, so routing can be checked independently.
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('a');
      handler.insertText('b');
      handler.insertText('c');
      handler.deleteBackward(1);
      handler.deleteForward(1);
      handler.insertText('d');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0002
     * @tc.name      testCommandJournalDeep_1002
     * @tc.desc      Verify the extended command journal move(1), move(2), move(3), move(4), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(1);
      handler.moveCursor(2);
      handler.moveCursor(3);
      handler.moveCursor(4);
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0003
     * @tc.name      testCommandJournalDeep_1003
     * @tc.desc      Verify the extended command journal back(1), back(2), back(3), fwd(1), fwd(2).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteBackward(1);
      handler.deleteBackward(2);
      handler.deleteBackward(3);
      handler.deleteForward(1);
      handler.deleteForward(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1,2,3');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1,2');
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0004
     * @tc.name      testCommandJournalDeep_1004
     * @tc.desc      Verify the extended command journal smove(1), smove(2), smove(3), smove(4), extend(0).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(1);
      handler.selectByMovement(2);
      handler.selectByMovement(3);
      handler.selectByMovement(4);
      handler.sendExtendAction(0);
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.movementDirections.join(',')).assertEqual('1,2,3,4');
      expect(harness.client.extendActions.join(',')).assertEqual('0');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0005
     * @tc.name      testCommandJournalDeep_1005
     * @tc.desc      Verify the extended command journal insert(1), insert(2), back(2), insert(3).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1005 begin');
      const harness: PreviewHarness = await createPreviewHarness('x');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('1');
      handler.insertText('2');
      handler.deleteBackward(2);
      handler.insertText('3');
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0006
     * @tc.name      testCommandJournalDeep_1006
     * @tc.desc      Verify the extended command journal extend(0), extend(3), extend(4), extend(5), insert(z).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.sendExtendAction(0);
      handler.sendExtendAction(3);
      handler.sendExtendAction(4);
      handler.sendExtendAction(5);
      handler.insertText('z');
      expect(harness.client.insertedTexts.join('')).assertEqual('z');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('z');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0007
     * @tc.name      testCommandJournalDeep_1007
     * @tc.desc      Verify the extended command journal move(3), back(1), insert(!), fwd(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1007 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(3);
      handler.deleteBackward(1);
      handler.insertText('!');
      handler.deleteForward(1);
      expect(harness.client.movedDirections.join(',')).assertEqual('3');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0008
     * @tc.name      testCommandJournalDeep_1008
     * @tc.desc      Verify the extended command journal insert( ), insert( ), insert( ), back(2).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText(' ');
      handler.insertText(' ');
      handler.insertText(' ');
      handler.deleteBackward(2);
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0009
     * @tc.name      testCommandJournalDeep_1009
     * @tc.desc      Verify the extended command journal fwd(1), insert(c), back(1), fwd(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1009 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteForward(1);
      handler.insertText('c');
      handler.deleteBackward(1);
      handler.deleteForward(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('c');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1,1');
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0010
     * @tc.name      testCommandJournalDeep_1010
     * @tc.desc      Verify the extended command journal smove(4), smove(3), smove(2), smove(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(4);
      handler.selectByMovement(3);
      handler.selectByMovement(2);
      handler.selectByMovement(1);
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.movementDirections.join(',')).assertEqual('4,3,2,1');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0011
     * @tc.name      testCommandJournalDeep_1011
     * @tc.desc      Verify the extended command journal back(0), back(1), back(2), back(3).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1011 begin');
      const harness: PreviewHarness = await createPreviewHarness('123');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteBackward(0);
      handler.deleteBackward(1);
      handler.deleteBackward(2);
      handler.deleteBackward(3);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(4);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0012
     * @tc.name      testCommandJournalDeep_1012
     * @tc.desc      Verify the extended command journal insert(q), move(1), insert(w), extend(4), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('q');
      handler.moveCursor(1);
      handler.insertText('w');
      handler.sendExtendAction(4);
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('qw');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('qw');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0013
     * @tc.name      testCommandJournalDeep_1013
     * @tc.desc      Verify the extended command journal insert(l), insert(l), back(1), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1013 begin');
      const harness: PreviewHarness = await createPreviewHarness('he');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('l');
      handler.insertText('l');
      handler.deleteBackward(1);
      handler.deleteBackward(1);
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0014
     * @tc.name      testCommandJournalDeep_1014
     * @tc.desc      Verify the extended command journal fwd(0), fwd(1), insert(a), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteForward(0);
      handler.deleteForward(1);
      handler.insertText('a');
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.buffer.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP1_0015
     * @tc.name      testCommandJournalDeep_1015
     * @tc.desc      Verify the extended command journal smove(2), extend(3), insert(x).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1015 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(2);
      handler.sendExtendAction(3);
      handler.insertText('x');
      expect(harness.client.insertedTexts.join('')).assertEqual('x');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('abcx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_1015 end');
      await yieldToEventLoop();
    });

  });

}
