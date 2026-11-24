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
import { pressHardKey, releaseHardKey } from '../support/TestSupport';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodSessionMatrix]';

export default function sessionMatrixTest(): void {
  describe('SessionMatrixTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0001
     * @tc.name      testSessionMatrixTest_001
     * @tc.desc      Verify that DEL under shift is blocked and releases without deleting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_001 begin');
      // Shift changes the meaning of the next key, so DEL must not act while it is held.
      const harness: PreviewHarness = await createPreviewHarness('abc');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(false);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0002
     * @tc.name      testSessionMatrixTest_002
     * @tc.desc      Verify that alt then a keypad digit leaves the next letter usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_002 begin');
      // A keypad digit has no glyph, so it latches until both modifier and digit are released.
      const harness: PreviewHarness = await createPreviewHarness('');
      const latchResults: boolean[] = [pressHardKey(2045), pressHardKey(2103), releaseHardKey(2103),
        releaseHardKey(2045)];
      expect(latchResults.join(',')).assertEqual('false,false,false,false');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0003
     * @tc.name      testSessionMatrixTest_003
     * @tc.desc      Verify that shift released inside an unknown latch does not clear it early.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_003 begin');
      // The latch belongs to the first unknown key, so releasing shift alone must not reopen typing.
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(harness.client.buffer.length).assertEqual(0);
      const resumePress: boolean = pressHardKey(2017);
      expect(resumePress).assertEqual(true);
      const resumeRelease: boolean = releaseHardKey(2017);
      expect(resumeRelease).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0004
     * @tc.name      testSessionMatrixTest_004
     * @tc.desc      Verify that shift added behind three held letters leaves the next letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_004 begin');
      // Shift capitalises only when it is the earliest held key, so the later press is inert.
      const harness: PreviewHarness = await createPreviewHarness('');
      pressHardKey(2017);
      pressHardKey(2018);
      pressHardKey(2019);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2020)).assertEqual(true);
      releaseHardKey(2020);
      releaseHardKey(2019);
      releaseHardKey(2018);
      releaseHardKey(2047);
      releaseHardKey(2017);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0005
     * @tc.name      testSessionMatrixTest_005
     * @tc.desc      Verify that DEL plus two letters keeps one deletion and two insertions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_005 begin');
      // Function keys act on press, so later letters must not lose the earlier deletion.
      const harness: PreviewHarness = await createPreviewHarness('abc');
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0006
     * @tc.name      testSessionMatrixTest_006
     * @tc.desc      Verify that insert, enter and hide each keep their own counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_006 begin');
      // Each channel has its own consumer, so sharing a counter would hide a routing bug.
      const harness: PreviewHarness = await createPreviewHarness('', 5);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.buffer).assertEqual('a');
      expect(harness.client.keyFunctions[0]).assertEqual(5);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0007
     * @tc.name      testSessionMatrixTest_007
     * @tc.desc      Verify that a rejected private command still allows the preview path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_007 begin');
      // The private command is advisory; preview must not depend on its success.
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      typeSequence(harness, 'hel');
      InputHandler.getInstance().insertText('x');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual('hello worldx');
      expect(harness.client.privateCommandCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0008
     * @tc.name      testSessionMatrixTest_008
     * @tc.desc      Verify that a mid-preview switch sends the finish to the new editor only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionMatrixTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_008 begin');
      // The newest attachment owns later commands, including preview confirmation.
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('xy');
      InputHandler.getInstance().sendKeyFunction();
      expect(second.client.finishCount).assertEqual(1);
      expect(first.client.finishCount).assertEqual(0);
      expect(first.client.buffer).assertEqual('hello world');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0009
     * @tc.name      testSessionMatrixTest_009
     * @tc.desc      Verify that a small x fallback is used for both selections in a one-letter editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionMatrixTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_009 begin');
      // The cursor index is zero, so the recorded x is the only available boundary.
      const harness: PreviewHarness = await createPreviewHarness('a');
      InputHandler.getInstance().setCursorInfo({ x: 2, y: 0, height: 0 });
      await InputHandler.getInstance().selectToBegin();
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.selectedRanges.length).assertEqual(2);
      const beginEnd: number = harness.client.selectedRanges[0].end;
      const endStart: number = harness.client.selectedRanges[1].start;
      expect(beginEnd).assertEqual(2);
      expect(endStart).assertEqual(beginEnd);
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SESSION_MATRIX_0010
     * @tc.name      testSessionMatrixTest_010
     * @tc.desc      Verify that the debug snapshot still sees a hidden preview buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testSessionMatrixTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_010 begin');
      // Hiding the panel must not discard the preview text that the snapshot inspects.
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const snapshot: string = AppStorage.get<string>('showLog') as string;
      expect(snapshot.includes('hello')).assertTrue();
      expect(snapshot.includes('world')).assertTrue();
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionMatrixTest_010 end');
      await yieldToEventLoop();
    });

  });

}
