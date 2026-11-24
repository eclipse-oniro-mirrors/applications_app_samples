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

export default function commandJournalDeep2Test(): void {
  describe('CommandJournalDeep2Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0001
     * @tc.name      testCommandJournalDeep_2001
     * @tc.desc      Verify the extended command journal insert(1), insert(2), insert(3), insert(4), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('1');
      handler.insertText('2');
      handler.insertText('3');
      handler.insertText('4');
      handler.deleteBackward(1);
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0002
     * @tc.name      testCommandJournalDeep_2002
     * @tc.desc      Verify the extended command journal move(2), smove(2), extend(5), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(2);
      handler.selectByMovement(2);
      handler.sendExtendAction(5);
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0003
     * @tc.name      testCommandJournalDeep_2003
     * @tc.desc      Verify the extended command journal insert(a), back(9), insert(b).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2003 begin');
      const harness: PreviewHarness = await createPreviewHarness('zz');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('a');
      handler.deleteBackward(9);
      handler.insertText('b');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.backwardLengths.join(',')).assertEqual('9');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('zzab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0004
     * @tc.name      testCommandJournalDeep_2004
     * @tc.desc      Verify the extended command journal back(5), fwd(5), move(1), move(2).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteBackward(5);
      handler.deleteForward(5);
      handler.moveCursor(1);
      handler.moveCursor(2);
      expect(harness.client.movedDirections.join(',')).assertEqual('1,2');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0005
     * @tc.name      testCommandJournalDeep_2005
     * @tc.desc      Verify the extended command journal insert(h), insert(e), insert(l), insert(x).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('h');
      handler.insertText('e');
      handler.insertText('l');
      handler.insertText('x');
      expect(harness.client.insertedTexts.length).assertEqual(4);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0006
     * @tc.name      testCommandJournalDeep_2006
     * @tc.desc      Verify the extended command journal smove(1), smove(4), back(1), insert(z).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2006 begin');
      const harness: PreviewHarness = await createPreviewHarness('a');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(1);
      handler.selectByMovement(4);
      handler.deleteBackward(1);
      handler.insertText('z');
      expect(harness.client.insertedTexts.join('')).assertEqual('z');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('az');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0007
     * @tc.name      testCommandJournalDeep_2007
     * @tc.desc      Verify the extended command journal extend(5), insert(k), back(1), fwd(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.sendExtendAction(5);
      handler.insertText('k');
      handler.deleteBackward(1);
      handler.deleteForward(1);
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('5');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0008
     * @tc.name      testCommandJournalDeep_2008
     * @tc.desc      Verify the extended command journal move(4), move(3), insert(?), back(2).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2008 begin');
      const harness: PreviewHarness = await createPreviewHarness('long');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(4);
      handler.moveCursor(3);
      handler.insertText('?');
      handler.deleteBackward(2);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0009
     * @tc.name      testCommandJournalDeep_2009
     * @tc.desc      Verify the extended command journal insert(r), insert(s), move(3), move(4), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('r');
      handler.insertText('s');
      handler.moveCursor(3);
      handler.moveCursor(4);
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('rs');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('rs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0010
     * @tc.name      testCommandJournalDeep_2010
     * @tc.desc      Verify the extended command journal back(0), insert(a), fwd(0), insert(b).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteBackward(0);
      handler.insertText('a');
      handler.deleteForward(0);
      handler.insertText('b');
      expect(harness.client.movedDirections.join(',')).assertEqual('');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0011
     * @tc.name      testCommandJournalDeep_2011
     * @tc.desc      Verify the extended command journal smove(3), extend(0), back(2), insert(c).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2011 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(3);
      handler.sendExtendAction(0);
      handler.deleteBackward(2);
      handler.insertText('c');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0012
     * @tc.name      testCommandJournalDeep_2012
     * @tc.desc      Verify the extended command journal insert(w), insert(x), insert(y), insert(z).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.insertText('w');
      handler.insertText('x');
      handler.insertText('y');
      handler.insertText('z');
      expect(harness.client.insertedTexts.join('')).assertEqual('wxyz');
      expect(harness.client.backwardLengths.join(',')).assertEqual('');
      expect(harness.client.forwardLengths.join(',')).assertEqual('');
      expect(harness.client.buffer).assertEqual('wxyz');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0013
     * @tc.name      testCommandJournalDeep_2013
     * @tc.desc      Verify the extended command journal move(1), back(1), insert(a), fwd(1), insert(b).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2013 begin');
      const harness: PreviewHarness = await createPreviewHarness('x');
      const handler: InputHandler = InputHandler.getInstance();
      handler.moveCursor(1);
      handler.deleteBackward(1);
      handler.insertText('a');
      handler.deleteForward(1);
      handler.insertText('b');
      expect(harness.client.movedDirections.join(',')).assertEqual('1');
      expect(harness.client.movementDirections.join(',')).assertEqual('');
      expect(harness.client.extendActions.join(',')).assertEqual('');
      expect(harness.client.insertedTexts.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0014
     * @tc.name      testCommandJournalDeep_2014
     * @tc.desc      Verify the extended command journal smove(1), extend(4), move(2), back(1).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const handler: InputHandler = InputHandler.getInstance();
      handler.selectByMovement(1);
      handler.sendExtendAction(4);
      handler.moveCursor(2);
      handler.deleteBackward(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_COMMANDJOURNALDEEP2_0015
     * @tc.name      testCommandJournalDeep_2015
     * @tc.desc      Verify the extended command journal back(1), insert(!), fwd(1), insert(?).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandJournalDeep_2015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2015 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      const handler: InputHandler = InputHandler.getInstance();
      handler.deleteBackward(1);
      handler.insertText('!');
      handler.deleteForward(1);
      handler.insertText('?');
      expect(harness.client.insertedTexts.join('')).assertEqual('!?');
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('hello world?');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandJournalDeep_2015 end');
      await yieldToEventLoop();
    });

  });

}
