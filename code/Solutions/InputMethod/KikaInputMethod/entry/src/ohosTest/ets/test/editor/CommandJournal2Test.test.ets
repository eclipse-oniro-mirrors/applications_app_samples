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
const TAG: string = '[Sample_KikaInputMethodMore]';

export default function commandJournal2Test(): void {
  describe('CommandJournal2Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0001
     * @tc.name      testCommandJournal_2001
     * @tc.desc      Verify the command journal insert(!), back(1), insert(?).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2001 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('!');
      handler.deleteBackward(1);
      handler.insertText('?');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.buffer.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0002
     * @tc.name      testCommandJournal_2002
     * @tc.desc      Verify the command journal smove(3), extend(3), back(1), insert(y).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(3);
      handler.sendExtendAction(3);
      handler.deleteBackward(1);
      handler.insertText('y');
      expect(harness.client.insertedTexts.join('')).assertEqual('y');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('y');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0003
     * @tc.name      testCommandJournal_2003
     * @tc.desc      Verify the command journal fwd(0), fwd(0), back(0), insert(z).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2003 begin');
      const harness: PreviewHarness = await createPreviewHarness('ab');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteForward(0);
      handler.deleteForward(0);
      handler.deleteBackward(0);
      handler.insertText('z');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0004
     * @tc.name      testCommandJournal_2004
     * @tc.desc      Verify the command journal insert(a), insert(b), extend(0), back(2).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('a');
      handler.insertText('b');
      handler.sendExtendAction(0);
      handler.deleteBackward(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.backwardLengths.join(',')).assertEqual('2');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0005
     * @tc.name      testCommandJournal_2005
     * @tc.desc      Verify the command journal move(2), move(2), insert(x), fwd(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2005 begin');
      const harness: PreviewHarness = await createPreviewHarness('123');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(2);
      handler.moveCursor(2);
      handler.insertText('x');
      handler.deleteForward(1);
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0006
     * @tc.name      testCommandJournal_2006
     * @tc.desc      Verify the command journal back(0), fwd(0), move(4), smove(4).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteBackward(0);
      handler.deleteForward(0);
      handler.moveCursor(4);
      handler.selectByMovement(4);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.backwardLengths.join(',')).assertEqual('0');
      expect(harness.client.forwardLengths.join(',')).assertEqual('0');
      expect(harness.client.movedDirections.join(',')).assertEqual('4');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0007
     * @tc.name      testCommandJournal_2007
     * @tc.desc      Verify the command journal extend(4), back(9), insert(w).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2007 begin');
      const harness: PreviewHarness = await createPreviewHarness('q');
      const handler: InputHandler = InputHandler.getInstance();
      handler.sendExtendAction(4);
      handler.deleteBackward(9);
      handler.insertText('w');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('4');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.buffer.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0008
     * @tc.name      testCommandJournal_2008
     * @tc.desc      Verify the command journal insert(h), insert(e), insert(l), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('h');
      handler.insertText('e');
      handler.insertText('l');
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('hel');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0009
     * @tc.name      testCommandJournal_2009
     * @tc.desc      Verify the command journal smove(1), smove(2), back(1), fwd(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2009 begin');
      const harness: PreviewHarness = await createPreviewHarness('xy');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(1);
      handler.selectByMovement(2);
      handler.deleteBackward(1);
      handler.deleteForward(1);
      expect(harness.client.movementDirections.join(',')).assertEqual('1,2');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNAL2_0010
     * @tc.name      testCommandJournal_2010
     * @tc.desc      Verify the command journal insert(a), insert(b), insert(c), move(3), move(4).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournal_2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('a');
      handler.insertText('b');
      handler.insertText('c');
      handler.moveCursor(3);
      handler.moveCursor(4);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.movedDirections.join(',')).assertEqual('3,4');
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournal_2010 end');
      await yieldToEventLoop();
    });

  });

}
