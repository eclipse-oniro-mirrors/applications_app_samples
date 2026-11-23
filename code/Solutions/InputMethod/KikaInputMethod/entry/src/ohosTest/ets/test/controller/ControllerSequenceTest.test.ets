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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodControllerSequence]';

export default function ControllerSequenceTestTest(): void {
  describe('ControllerSequenceTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0001
     * @tc.name      testControllerSequenceTest_001
     * @tc.desc      Verify that a held shift uppercases one letter and that the shift clears on release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts[0]).assertEqual('A');
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);
      expect(harness.client.buffer).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0002
     * @tc.name      testControllerSequenceTest_002
     * @tc.desc      Verify that alt is swallowed while a following letter still reaches the editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0003
     * @tc.name      testControllerSequenceTest_003
     * @tc.desc      Verify that an unmapped code latches until every held key is released, then typing resumes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0004
     * @tc.name      testControllerSequenceTest_004
     * @tc.desc      Verify that a keypad digit is blocked once and does not poison the following digit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2103)).assertEqual(false);
      expect(releaseHardKey(2103)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0005
     * @tc.name      testControllerSequenceTest_005
     * @tc.desc      Verify that the DEL key is consumed on key-down and sends one backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0006
     * @tc.name      testControllerSequenceTest_006
     * @tc.desc      Verify that the four direction-pad keys emit caret moves in press order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const codes: number[] = [2012, 2013, 2014, 2015];
      const directions: number[] = [
        inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN,
        inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT
      ];

      for (let i = 0; i < codes.length; i++) {
        expect(pressHardKey(codes[i])).assertEqual(true);
        expect(releaseHardKey(codes[i])).assertEqual(true);
      }
      expect(harness.client.movedDirections.length).assertEqual(4);
      for (let i = 0; i < directions.length; i++) {
        expect(harness.client.movedDirections[i]).assertEqual(directions[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0007
     * @tc.name      testControllerSequenceTest_007
     * @tc.desc      Verify that the unhandled center-pad token is inserted literally instead of moving the caret.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0008
     * @tc.name      testControllerSequenceTest_008
     * @tc.desc      Verify that comma, at-sign and space are inserted with their exact glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2043)).assertEqual(true);
      expect(releaseHardKey(2043)).assertEqual(true);
      expect(pressHardKey(2065)).assertEqual(true);
      expect(releaseHardKey(2065)).assertEqual(true);
      expect(pressHardKey(2050)).assertEqual(true);
      expect(releaseHardKey(2050)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.insertedTexts[0]).assertEqual(',');
      expect(harness.client.insertedTexts[1]).assertEqual('@');
      expect(harness.client.insertedTexts[2]).assertEqual(' ');
      expect(harness.client.buffer).assertEqual(',@ ');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0009
     * @tc.name      testControllerSequenceTest_009
     * @tc.desc      Verify that a repeated key-down is intercepted for bookkeeping but still inserts a glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(2);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      expect(harness.client.insertedTexts[1]).assertEqual('a');
      expect(harness.client.buffer).assertEqual('aa');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0010
     * @tc.name      testControllerSequenceTest_010
     * @tc.desc      Verify that releasing a key that was never pressed is ignored without inserting text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0011
     * @tc.name      testControllerSequenceTest_011
     * @tc.desc      Verify that a single shift stays held after one letter is released and clears afterward.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0012
     * @tc.name      testControllerSequenceTest_012
     * @tc.desc      Verify that two letters typed under one shift both use the shifted glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerSequenceTest_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');
      expect(harness.client.buffer).assertEqual('AB');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0013
     * @tc.name      testControllerSequenceTest_013
     * @tc.desc      Verify that the first-held key decides shift state when alt precedes shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceTest_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2045)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_0014
     * @tc.name      testControllerSequenceTest_014
     * @tc.desc      Verify that DEL is blocked while shift is held and therefore deletes nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceTest_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(false);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceTest_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0001
     * @tc.name      testControllerSequenceState_001
     * @tc.desc      Verify that releasing shift between two held letters shifts only the first glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('Ab');
      expect(harness.client.buffer).assertEqual('Ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0002
     * @tc.name      testControllerSequenceState_002
     * @tc.desc      Verify that DEL deletes forward while a letter is still held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0003
     * @tc.name      testControllerSequenceState_003
     * @tc.desc      Verify that holding both shift keys blocks typing until the second release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2048)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2048)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0004
     * @tc.name      testControllerSequenceState_004
     * @tc.desc      Verify that clearing one of two shifts leaves the hold reported while the block lasts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2048)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(releaseHardKey(2048)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0005
     * @tc.name      testControllerSequenceState_005
     * @tc.desc      Verify that releasing an unmapped code that was never pressed returns handled.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(releaseHardKey(3000)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0006
     * @tc.name      testControllerSequenceState_006
     * @tc.desc      Verify that shift behind a held DEL does not arm the block and repeats still delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(false);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1,1,1');
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0007
     * @tc.name      testControllerSequenceState_007
     * @tc.desc      Verify that the forward-delete code asks the editor for one backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(harness.client.backwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0008
     * @tc.name      testControllerSequenceState_008
     * @tc.desc      Verify that a held space bar never blocks a following letter and never reports shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2050)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2050)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual(' a');
      expect(harness.client.buffer).assertEqual(' a');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0009
     * @tc.name      testControllerSequenceState_009
     * @tc.desc      Verify that releasing the first of two held letters permits a third lowercase letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0010
     * @tc.name      testControllerSequenceState_010
     * @tc.desc      Verify that a doubled shift press is removed by a single release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0011
     * @tc.name      testControllerSequenceState_011
     * @tc.desc      Verify that DEL between two letters keeps forward deletions and insertions apart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1,1');
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0012
     * @tc.name      testControllerSequenceState_012
     * @tc.desc      Verify that releasing a letter that is not held while an unknown key latches is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(3000)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0013
     * @tc.name      testControllerSequenceState_013
     * @tc.desc      Verify that the shift query stays false when a letter was pressed before shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.buffer).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0014
     * @tc.name      testControllerSequenceState_014
     * @tc.desc      Verify that the center-pad token is inserted literally while another key is held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      expect(harness.client.insertedTexts[1]).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.buffer).assertEqual('aKEYCODE_DPAD_CENTER');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0015
     * @tc.name      testControllerSequenceState_015
     * @tc.desc      Verify that a held digit still lets the up direction move the caret.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_015 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2001)).assertEqual(true);
      expect(pressHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(harness.client.movedDirections.join(',')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('1');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0016
     * @tc.name      testControllerSequenceState_016
     * @tc.desc      Verify that repeating an unknown key still needs only one release to clear the latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_016 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(3000)).assertEqual(false);
      expect(pressHardKey(3000)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0017
     * @tc.name      testControllerSequenceState_017
     * @tc.desc      Verify that a second shift key pressed mid-chord never enters the blocked state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_017 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2048)).assertEqual(false);
      expect(isShiftHeld()).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2048)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0018
     * @tc.name      testControllerSequenceState_018
     * @tc.desc      Verify that releasing a held letter twice keeps the other held letter intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_018 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0019
     * @tc.name      testControllerSequenceState_019
     * @tc.desc      Verify that DEL between two letters keeps both insertions and one forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_019 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0020
     * @tc.name      testControllerSequenceState_020
     * @tc.desc      Verify that a shift-first latch over an unknown key clears only on the final release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_020 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0021
     * @tc.name      testControllerSequenceState_021
     * @tc.desc      Verify that the same letter typed before and after a shift cycle changes case.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_021 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts[0]).assertEqual('a');
      expect(harness.client.insertedTexts[1]).assertEqual('A');
      expect(harness.client.buffer).assertEqual('aA');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_STATE_0022
     * @tc.name      testControllerSequenceState_022
     * @tc.desc      Verify that the alt-right key is swallowed yet leaves a following letter reachable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceState_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_022 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2046)).assertEqual(false);
      expect(pressHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2046)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('d');
      expect(harness.client.buffer).assertEqual('d');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceState_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0001
     * @tc.name      testControllerSequenceChord_001
     * @tc.desc      Verify that up and down held together both move the caret in press order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2012)).assertEqual(true);
      expect(pressHardKey(2013)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2013)).assertEqual(true);
      expect(harness.client.movedDirections.join(',')).assertEqual('1,2');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0002
     * @tc.name      testControllerSequenceChord_002
     * @tc.desc      Verify that DEL and the up direction held together use both function channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.movedDirections.join(',')).assertEqual('1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0003
     * @tc.name      testControllerSequenceChord_003
     * @tc.desc      Verify that a digit under a held shift is blocked and types once shift is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(false);
      expect(releaseHardKey(2001)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0004
     * @tc.name      testControllerSequenceChord_004
     * @tc.desc      Verify that a held shift blocks the forward-delete code and both channels stay empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2071)).assertEqual(false);
      expect(releaseHardKey(2071)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0005
     * @tc.name      testControllerSequenceChord_005
     * @tc.desc      Verify that releasing DEL a second time is handled without another deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0006
     * @tc.name      testControllerSequenceChord_006
     * @tc.desc      Verify that an extra release after a completed shift cycle stays harmless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(isShiftHeld()).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      expect(harness.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0007
     * @tc.name      testControllerSequenceChord_007
     * @tc.desc      Verify that a keypad code under alt latches until every key is released and then types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2045)).assertEqual(false);
      expect(pressHardKey(2103)).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2103)).assertEqual(false);
      expect(releaseHardKey(2045)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0008
     * @tc.name      testControllerSequenceChord_008
     * @tc.desc      Verify that a keypad code as the second key under shift latches without deleting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2103)).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2103)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0009
     * @tc.name      testControllerSequenceChord_009
     * @tc.desc      Verify that a second release of the up key adds no further caret move.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_009 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(releaseHardKey(2012)).assertEqual(true);
      expect(harness.client.movedDirections.join(',')).assertEqual('1');
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0010
     * @tc.name      testControllerSequenceChord_010
     * @tc.desc      Verify that DEL still routes when shift and a letter are held before it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');

      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.buffer).assertEqual('abcA');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0011
     * @tc.name      testControllerSequenceChord_011
     * @tc.desc      Verify that DEL and a digit held together fill separate deletion and insertion channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2001)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.insertedTexts.join('')).assertEqual('1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0012
     * @tc.name      testControllerSequenceChord_012
     * @tc.desc      Verify that the center token is typed once even when its release is repeated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(releaseHardKey(2016)).assertEqual(true);
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.buffer).assertEqual('KEYCODE_DPAD_CENTER');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_CHORD_0013
     * @tc.name      testControllerSequenceChord_013
     * @tc.desc      Verify that releasing the most recent letter first still allows a third lowercase letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceChord_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.buffer).assertEqual('abc');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceChord_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_BURST_0001
     * @tc.name      testControllerSequenceBurst_001
     * @tc.desc      Verify that space, DEL and a letter held together fill insertion and forward-deletion channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceBurst_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceBurst_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2050)).assertEqual(true);
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2050)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual(' a');
      expect(harness.client.forwardLengths.join(',')).assertEqual('1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual(' a');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceBurst_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CONTROLLER_SEQUENCE_BURST_0002
     * @tc.name      testControllerSequenceBurst_002
     * @tc.desc      Verify that shift pressed after a finished typing burst capitalizes the next letter only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerSequenceBurst_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceBurst_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abC');
      expect(harness.client.buffer).assertEqual('abC');
      expect(isShiftHeld()).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerSequenceBurst_002 end');
      await yieldToEventLoop();
    });

  });
}
