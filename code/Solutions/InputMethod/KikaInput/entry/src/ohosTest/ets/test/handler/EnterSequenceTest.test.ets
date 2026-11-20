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
const TAG: string = '[Sample_KikaInputEnterSequence]';

export default function enterSequenceTest(): void {
  describe('EnterSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0100
     * @tc.name      testEnterSequence_001
     * @tc.desc      Verify that enter, deletion, move and insertion keep their four slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(4);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().insertText('e');
      expect(harness.client.journal.join('|')).assertEqual('enter:4|back:1|move:3|insert:e');
      expect(harness.client.keyFunctions[0]).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0200
     * @tc.name      testEnterSequence_002
     * @tc.desc      Verify that an insertion, enter, and two deletions keep four entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().deleteForward(3);
      expect(harness.client.journal.join('|')).assertEqual('insert:a|enter:1|back:2|forward:3');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0300
     * @tc.name      testEnterSequence_003
     * @tc.desc      Verify that two enters around a cut keep two enter calls and one action.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions.length).assertEqual(2);
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0400
     * @tc.name      testEnterSequence_004
     * @tc.desc      Verify that a move and enter before a hide keep both editor and panel effects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.movedDirections.join('')).assertEqual('2');
      expect(harness.client.keyFunctions.length).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0500
     * @tc.name      testEnterSequence_005
     * @tc.desc      Verify that zero deletions and an empty insertion bracket one enter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('');
      expect(harness.client.journal.join('|')).assertEqual('back:0|enter:2|insert:');
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      expect(harness.client.insertedTexts[0].length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0600
     * @tc.name      testEnterSequence_006
     * @tc.desc      Verify that a maximum enter type followed by an insertion keeps both values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(2147483647);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().insertText('m');
      expect(harness.client.keyFunctions[0]).assertEqual(2147483647);
      expect(harness.client.insertedTexts.join('')).assertEqual('m');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0700
     * @tc.name      testEnterSequence_007
     * @tc.desc      Verify that two enters around a right move keep the move between them.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_RIGHT);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('enter:0|move:4|enter:0');
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.keyFunctions.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ENTER_SEQUENCE_0800
     * @tc.name      testEnterSequence_008
     * @tc.desc      Verify that an enter in one session is not replayed when a new session starts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testEnterSequence_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_008 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(5);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(6);
      InputHandler.getInstance().insertText('n');
      expect(first.client.keyFunctions.join('')).assertEqual('5');
      expect(second.client.keyFunctions.length).assertEqual(0);
      expect(second.client.insertedTexts.join('')).assertEqual('n');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnterSequence_008 end');
      await yieldToEventLoop();
    });

  });
}
