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
const TAG: string = '[Sample_KikaInputHideSequence]';

export default function hideSequenceTest(): void {
  describe('HideSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0100
     * @tc.name      testHideSequence_001
     * @tc.desc      Verify that a hide, a left move and a deletion keep the editor command order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().deleteBackward(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('move:3|back:1');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0200
     * @tc.name      testHideSequence_002
     * @tc.desc      Verify that a hide before an enter and a forward deletion keeps both channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(3);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().deleteForward(4);
      expect(harness.client.keyFunctions.join('')).assertEqual('3');
      expect(harness.client.forwardLengths.join('')).assertEqual('4');
      expect(harness.keyboard.hideCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0300
     * @tc.name      testHideSequence_003
     * @tc.desc      Verify that three hides before an insertion reach the panel three times.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      for (let i = 0; i < 3; i++) {
        InputHandler.getInstance().hideKeyboardSelf();
      }
      InputHandler.getInstance().insertText('h');
      expect(harness.keyboard.hideCount).assertEqual(3);
      expect(harness.client.insertedTexts.join('')).assertEqual('h');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0400
     * @tc.name      testHideSequence_004
     * @tc.desc      Verify that a hide, a cut and an insertion keep one action and one insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().insertText('i');
      expect(harness.client.extendActions.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('i');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0500
     * @tc.name      testHideSequence_005
     * @tc.desc      Verify that a hide before and after a client switch reaches one controller each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(first.keyboard.hideCount).assertEqual(1);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(first.client.journal.length + second.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0600
     * @tc.name      testHideSequence_006
     * @tc.desc      Verify that a hide after a stop reaches no panel controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0700
     * @tc.name      testHideSequence_007
     * @tc.desc      Verify that a zero deletion after a hide and an insertion keep two entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().deleteBackward(0);
      InputHandler.getInstance().insertText('j');
      expect(harness.client.backwardLengths.join('')).assertEqual('0');
      expect(harness.client.insertedTexts.join('')).assertEqual('j');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HIDE_SEQUENCE_0800
     * @tc.name      testHideSequence_008
     * @tc.desc      Verify that a hide, an enter and a downward move keep three effects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHideSequence_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(8);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.keyFunctions.join('')).assertEqual('8');
      expect(harness.client.movedDirections.join('')).assertEqual('2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHideSequence_008 end');
      await yieldToEventLoop();
    });

  });
}
