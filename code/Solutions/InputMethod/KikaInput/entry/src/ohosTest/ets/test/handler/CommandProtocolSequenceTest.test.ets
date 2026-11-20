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
import { ClientHarness, createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputCommandProtocolSequence]';

export default function commandProtocolSequenceTest(): void {
  describe('CommandProtocolSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0100
     * @tc.name      testCommandProtocolSequence_001
     * @tc.desc      Verify that a deletion, an insertion, a move and a forward deletion keep order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteForward(1);
      expect(harness.client.journal.join('|')).assertEqual('back:2|insert:x|move:3|forward:1');
      expect(harness.client.backwardLengths.join('')).assertEqual('2');
      expect(harness.client.forwardLengths.join('')).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0200
     * @tc.name      testCommandProtocolSequence_002
     * @tc.desc      Verify that two zero deletions around an insertion keep three entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().insertText('b');
      InputHandler.getInstance().deleteForward(0);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|back:0|insert:b|forward:0');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.backwardLengths.length + harness.client.forwardLengths.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0300
     * @tc.name      testCommandProtocolSequence_003
     * @tc.desc      Verify that a cut, an insertion and a three-unit deletion keep three kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().insertText('y');
      InputHandler.getInstance().deleteBackward(3);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(3);
      expect(harness.client.journal.length).assertEqual(3);
      expect(harness.client.journal[1]).assertEqual('insert:y');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0400
     * @tc.name      testCommandProtocolSequence_004
     * @tc.desc      Verify that four caret directions followed by a copy keep five entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.movedDirections.join('|')).assertEqual('1|2|3|4');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0500
     * @tc.name      testCommandProtocolSequence_005
     * @tc.desc      Verify that enter, hide, insertion and stop split the last command by boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(4);

      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('after');
      expect(harness.client.journal.join('|')).assertEqual('enter:4|insert:z');
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0600
     * @tc.name      testCommandProtocolSequence_006
     * @tc.desc      Verify that forward and backward zero deletions precede a following insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().insertText('q');
      expect(harness.client.journal.join('|')).assertEqual('forward:0|back:0|insert:q');
      expect(harness.client.forwardLengths[0]).assertEqual(0);
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('q');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0700
     * @tc.name      testCommandProtocolSequence_007
     * @tc.desc      Verify that a long insertion followed by two five-unit deletions keeps three entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().insertText('long text');
      InputHandler.getInstance().deleteForward(5);
      InputHandler.getInstance().deleteBackward(5);
      expect(harness.client.insertedTexts[0]).assertEqual('long text');
      expect(harness.client.forwardLengths[0]).assertEqual(5);
      expect(harness.client.backwardLengths[0]).assertEqual(5);
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0800
     * @tc.name      testCommandProtocolSequence_008
     * @tc.desc      Verify that two right moves and two insertions alternate in the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().insertText('r');
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().insertText('s');
      expect(harness.client.journal.join('|')).assertEqual('move:4|insert:r|move:4|insert:s');
      expect(harness.client.movedDirections.length).assertEqual(2);
      expect(harness.client.insertedTexts.join('')).assertEqual('rs');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_0900
     * @tc.name      testCommandProtocolSequence_009
     * @tc.desc      Verify that hides around two opposite deletions do not enter the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().deleteForward(1);
      expect(harness.keyboard.hideCount).assertEqual(2);
      expect(harness.client.journal.join('|')).assertEqual('back:1|forward:1');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_COMMAND_PROTOCOL_SEQUENCE_1000
     * @tc.name      testCommandProtocolSequence_010
     * @tc.desc      Verify that a paste, a downward move and select-all keep three distinct slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testCommandProtocolSequence_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(harness.client.extendActions.length).assertEqual(2);
      expect(harness.client.movedDirections.join('')).assertEqual('2');
      expect(harness.client.journal.length).assertEqual(3);
      expect(harness.client.journal[1]).assertEqual('move:2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testCommandProtocolSequence_010 end');
      await yieldToEventLoop();
    });

  });
}
