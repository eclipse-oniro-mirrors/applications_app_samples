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
import { InputHandler, KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness } from '../support/ClientHarness';
import {
  createKeyboardController,
  inputHardKeyValue,
  isShiftHeld,
  pressHardKey,
  releaseHardKey,
  translateShiftToken
} from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputPhysicalKeyJourney]';

function tap(controller: KeyboardController, keyCode: number): void {
  pressHardKey(controller, keyCode);
  releaseHardKey(controller, keyCode);
}

export default function PhysicalKeyJourneyTestTest(): void {
  describe('PhysicalKeyJourneyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_JOURNEY_0100
     * @tc.name      testPhysicalKeyJourney_001
     * @tc.desc      Verify that a letter, a caret move, a delete and enter reach the editor in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyJourney_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_001 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'q', 2017);
      inputHardKeyValue(controller, 'KEYCODE_DPAD_LEFT', 2050);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join(',')).assertEqual('insert:q,move:3,forward:1,enter:0');
      expect(harness.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_JOURNEY_0200
     * @tc.name      testPhysicalKeyJourney_002
     * @tc.desc      Verify that shift tokens do not disturb an uppercase then lowercase letter pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyJourney_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_002 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      translateShiftToken(controller, 'KEYCODE_SHIFT_LEFT');
      inputHardKeyValue(controller, 'Q', 2017);
      translateShiftToken(controller, 'KEYCODE_SHIFT_RIGHT');
      inputHardKeyValue(controller, 'q', 2017);
      expect(harness.client.insertedTexts.join('')).assertEqual('Qq');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_JOURNEY_0300
     * @tc.name      testPhysicalKeyJourney_003
     * @tc.desc      Verify that a mystery token then delete leaves the five-character window readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyJourney_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_003 begin');
      await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_MYSTERY', 4100);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('FWD5') >= 0).assertTrue();
      expect(summary.indexOf('BWD5') >= 0).assertTrue();
      expect(summary.indexOf('five chars:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_JOURNEY_0400
     * @tc.name      testPhysicalKeyJourney_004
     * @tc.desc      Verify that a stop between two letter keys keeps the first editor frozen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyJourney_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_004 begin');
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'a', 2017);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      inputHardKeyValue(controller, 'b', 2018);
      expect(first.client.insertedTexts.join('')).assertEqual('a');
      expect(second.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_JOURNEY_0500
     * @tc.name      testPhysicalKeyJourney_005
     * @tc.desc      Verify that a right move, a backward delete and an up move form one ordered stream.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyJourney_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_005 begin');
      const harness: ClientHarness = await createClientHarness(2);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_DPAD_RIGHT', 2051);
      inputHardKeyValue(controller, 'KEYCODE_FORWARD_DEL', 2071);
      inputHardKeyValue(controller, 'KEYCODE_DPAD_UP', 2049);
      expect(harness.client.journal.join('|')).assertEqual('move:4|back:1|move:1');
      expect(harness.client.movedDirections.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_JOURNEY_0600
     * @tc.name      testPhysicalKeyJourney_006
     * @tc.desc      Verify that diagnostics set before a key press survive into the refreshed summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyJourney_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_006 begin');
      const harness: ClientHarness = await createClientHarness(5);
      InputHandler.getInstance().setCursorInfo({ x: 7, y: 8, height: 9 });
      InputHandler.getInstance().setSelectInfo('SEL-journey');
      InputHandler.getInstance().setTextInfo('TXT-journey');
      InputHandler.getInstance().setInputInfo('INP-journey');
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'z', 2042);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('SEL-journey') >= 0).assertTrue();
      expect(summary.indexOf('INP-journey') >= 0).assertTrue();
      expect(harness.client.journal.join('')).assertEqual('insert:z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyJourney_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0100
     * @tc.name      testPhysicalKeyExtra_001
     * @tc.desc      Verify that a digit, a comma, a space and a handler enter keep four consecutive journal slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_001 begin');
      const harness: ClientHarness = await createClientHarness(4);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, '7', 2007);
      inputHardKeyValue(controller, ',', 2043);
      inputHardKeyValue(controller, ' ', 2050);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.journal.join('|')).assertEqual('insert:7|insert:,|insert: |enter:4');
      expect(harness.client.insertedTexts.join('')).assertEqual('7, ');
      expect(harness.client.keyFunctions.join('')).assertEqual('4');
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0200
     * @tc.name      testPhysicalKeyExtra_002
     * @tc.desc      Verify that a raw DPAD_UP press is intercepted as a cursor move and inserts no text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_002 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const down: boolean = pressHardKey(controller, 2012);
      const up: boolean = releaseHardKey(controller, 2012);
      expect(down).assertTrue();
      expect(up).assertFalse();
      expect(harness.client.journal.join('')).assertEqual(
        'move:' + inputMethodEngine.Direction.CURSOR_UP);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.movedDirections.join('')).assertEqual(
        '' + inputMethodEngine.Direction.CURSOR_UP);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0300
     * @tc.name      testPhysicalKeyExtra_003
     * @tc.desc      Verify that a second shift key swallows the next letter and both releases restore the latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_003 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      pressHardKey(controller, 2048);
      releaseHardKey(controller, 2048);
      const blocked: boolean = pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2047);
      const after: boolean = pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      expect(blocked).assertFalse();
      expect(after).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('b');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0400
     * @tc.name      testPhysicalKeyExtra_004
     * @tc.desc      Verify that three physical delete presses after two letters forward three one-unit deletions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_004 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'h', 2024);
      inputHardKeyValue(controller, 'i', 2025);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      expect(harness.client.insertedTexts.join('')).assertEqual('hi');
      expect(harness.client.forwardLengths.join('|')).assertEqual('1|1|1');
      expect(harness.client.backwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0500
     * @tc.name      testPhysicalKeyExtra_005
     * @tc.desc      Verify that four direction tokens produce four distinct cursor directions and no text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_005 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'KEYCODE_DPAD_UP', 2012);
      inputHardKeyValue(controller, 'KEYCODE_DPAD_DOWN', 2013);
      inputHardKeyValue(controller, 'KEYCODE_DPAD_LEFT', 2014);
      inputHardKeyValue(controller, 'KEYCODE_DPAD_RIGHT', 2015);
      const expected: number[] = [inputMethodEngine.Direction.CURSOR_UP,
        inputMethodEngine.Direction.CURSOR_DOWN, inputMethodEngine.Direction.CURSOR_LEFT,
        inputMethodEngine.Direction.CURSOR_RIGHT];
      expect(harness.client.movedDirections.join('|')).assertEqual(expected.join('|'));
      expect(harness.client.journal.length).assertEqual(4);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0600
     * @tc.name      testPhysicalKeyExtra_006
     * @tc.desc      Verify that a shift pressed after a letter does not uppercase the following letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_006 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2017);
      pressHardKey(controller, 2047);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2047);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:b');
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0700
     * @tc.name      testPhysicalKeyExtra_007
     * @tc.desc      Verify that releasing shift before a held letter drops the latch for the next letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_007 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      const upper: boolean = pressHardKey(controller, 2017);
      releaseHardKey(controller, 2047);
      const latch: boolean = isShiftHeld(controller);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      releaseHardKey(controller, 2017);
      expect(upper).assertTrue();
      expect(latch).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('Ab');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0800
     * @tc.name      testPhysicalKeyExtra_008
     * @tc.desc      Verify that a shift held across an input stop uppercases the first key of the next session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_008 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      InputHandler.getInstance().onInputStop();
      const next: ClientHarness = await createClientHarness(0);
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      releaseHardKey(controller, 2047);
      expect(next.client.insertedTexts.join('')).assertEqual('A');
      expect(harness.client.journal.length).assertEqual(0);
      expect(next.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_0900
     * @tc.name      testPhysicalKeyExtra_009
     * @tc.desc      Verify that an unmapped raw code blocks the next letter until both codes are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_009 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const unknown: boolean = pressHardKey(controller, 9999);
      const blocked: boolean = pressHardKey(controller, 2017);
      releaseHardKey(controller, 9999);
      releaseHardKey(controller, 2017);
      const after: boolean = pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      expect(unknown).assertFalse();
      expect(blocked).assertFalse();
      expect(after).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1000
     * @tc.name      testPhysicalKeyExtra_010
     * @tc.desc      Verify that a refreshed summary has five lines while attached and four lines after a stop.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_010 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_DPAD_LEFT', 2014);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const attached: string[] = (AppStorage.get<string>('showLog') ?? '').split('\n');

      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const detached: string[] = (AppStorage.get<string>('showLog') ?? '').split('\n');
      expect(attached.length).assertEqual(5);
      expect(detached.length).assertEqual(4);
      expect(harness.client.journal.join('')).assertEqual(
        'move:' + inputMethodEngine.Direction.CURSOR_LEFT);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1100
     * @tc.name      testPhysicalKeyExtra_011
     * @tc.desc      Verify that a caret move between a space and a delete preserves all three command kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_011 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, ' ', 2050);
      inputHardKeyValue(controller, 'KEYCODE_DPAD_LEFT', 2014);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      expect(harness.client.journal.join('|')).assertEqual('insert: |move:3|forward:1');
      expect(harness.client.insertedTexts[0]).assertEqual(' ');
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1200
     * @tc.name      testPhysicalKeyExtra_012
     * @tc.desc      Verify that a copy action between two physical letters keeps the action in the middle slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_012 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'a', 2017);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      inputHardKeyValue(controller, 'b', 2018);
      const expected: string = 'insert:a|extend:' + inputMethodEngine.ExtendAction.COPY + '|insert:b';
      expect(harness.client.journal.join('|')).assertEqual(expected);
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1300
     * @tc.name      testPhysicalKeyExtra_013
     * @tc.desc      Verify that a physical DEL and a handler backward deletion land in their own delete lists.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_013 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      InputHandler.getInstance().deleteBackward(2);
      expect(harness.client.journal.join('|')).assertEqual('forward:1|back:2');
      expect(harness.client.forwardLengths.join('')).assertEqual('1');
      expect(harness.client.backwardLengths.join('')).assertEqual('2');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1400
     * @tc.name      testPhysicalKeyExtra_014
     * @tc.desc      Verify that the preview block leads the three diagnostic markers after a physical deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_014 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      InputHandler.getInstance().setSelectInfo('SEC-A');
      InputHandler.getInstance().setTextInfo('TXT-A');
      InputHandler.getInstance().setInputInfo('INP-A');

      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      const selectAt: number = summary.indexOf('SEC-A');
      const textAt: number = summary.indexOf('TXT-A');
      const inputAt: number = summary.indexOf('INP-A');
      expect(summary.indexOf('five chars:')).assertEqual(0);
      expect(selectAt < textAt).assertTrue();
      expect(textAt < inputAt).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1500
     * @tc.name      testPhysicalKeyExtra_015
     * @tc.desc      Verify that a delete token issued in a stopped gap leaves no trace and works after the restart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_015 begin');
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      InputHandler.getInstance().onInputStop();
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      const second: ClientHarness = await createClientHarness(0);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      expect(first.client.journal.length).assertEqual(0);
      expect(second.client.forwardLengths.join('')).assertEqual('1');
      expect(second.client.journal.join('')).assertEqual('forward:1');
      expect(first.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1600
     * @tc.name      testPhysicalKeyExtra_016
     * @tc.desc      Verify that a cut between a shifted letter and its lowercase partner keeps both cases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_016 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      tap(controller, 2033);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      releaseHardKey(controller, 2047);
      tap(controller, 2033);
      const expected: string = 'insert:Q|extend:' + inputMethodEngine.ExtendAction.CUT + '|insert:q';
      expect(harness.client.journal.join('|')).assertEqual(expected);
      expect(harness.client.insertedTexts.join('')).assertEqual('Qq');
      expect(harness.client.extendActions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1700
     * @tc.name      testPhysicalKeyExtra_017
     * @tc.desc      Verify that two physical spaces around a letter keep the spaces at both ends of the payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_017 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, ' ', 2050);
      inputHardKeyValue(controller, 'q', 2033);
      inputHardKeyValue(controller, ' ', 2050);
      expect(harness.client.insertedTexts.length).assertEqual(3);
      expect(harness.client.insertedTexts[0]).assertEqual(' ');
      expect(harness.client.insertedTexts[2]).assertEqual(' ');
      expect(harness.client.insertedTexts.join('')).assertEqual(' q ');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1800
     * @tc.name      testPhysicalKeyExtra_018
     * @tc.desc      Verify that a handler cursor-down before two letters stays the first journal entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_018 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      inputHardKeyValue(controller, 'h', 2024);
      inputHardKeyValue(controller, 'i', 2025);
      expect(harness.client.journal[0]).assertEqual(
        'move:' + inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.journal.join('|')).assertEqual(
        'move:' + inputMethodEngine.Direction.CURSOR_DOWN + '|insert:h|insert:i');
      expect(harness.client.movedDirections.join('')).assertEqual(
        '' + inputMethodEngine.Direction.CURSOR_DOWN);
      expect(harness.client.insertedTexts.join('')).assertEqual('hi');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_1900
     * @tc.name      testPhysicalKeyExtra_019
     * @tc.desc      Verify that a glyph typed between two left arrows occupies the middle of three journal slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_019 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'KEYCODE_DPAD_LEFT', 2014);
      inputHardKeyValue(controller, '.', 2044);
      inputHardKeyValue(controller, 'KEYCODE_DPAD_LEFT', 2014);
      const expected: string = 'move:' + inputMethodEngine.Direction.CURSOR_LEFT + '|insert:.|move:' +
        inputMethodEngine.Direction.CURSOR_LEFT;
      expect(harness.client.journal.join('|')).assertEqual(expected);
      expect(harness.client.insertedTexts.join('')).assertEqual('.');
      expect(harness.client.movedDirections.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_2000
     * @tc.name      testPhysicalKeyExtra_020
     * @tc.desc      Verify that a physical delete after two letters precedes a handler insertion in the journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_020 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'a', 2017);
      inputHardKeyValue(controller, 'b', 2018);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      InputHandler.getInstance().insertText('z');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:b|forward:1|insert:z');
      expect(harness.client.insertedTexts.join('')).assertEqual('abz');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_2100
     * @tc.name      testPhysicalKeyExtra_021
     * @tc.desc      Verify that a copy action ahead of a shifted letter stays first and does not change its case.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_021 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.COPY);
      pressHardKey(controller, 2047);
      tap(controller, 2033);
      releaseHardKey(controller, 2047);
      expect(harness.client.journal[0]).assertEqual(
        'extend:' + inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.insertedTexts.join('')).assertEqual('Q');
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.COPY);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_2200
     * @tc.name      testPhysicalKeyExtra_022
     * @tc.desc      Verify that three physical deletes around one handler backward deletion keep four slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_022 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      InputHandler.getInstance().deleteBackward(2);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      expect(harness.client.journal.join('|')).assertEqual('forward:1|back:2|forward:1|forward:1');
      expect(harness.client.forwardLengths.join('|')).assertEqual('1|1|1');
      expect(harness.client.backwardLengths.join('')).assertEqual('2');
      expect(harness.client.journal.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_2300
     * @tc.name      testPhysicalKeyExtra_023
     * @tc.desc      Verify that a space typed after a shift release stays one lowercase unit after an uppercase letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_023 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      pressHardKey(controller, 2047);
      tap(controller, 2017);
      releaseHardKey(controller, 2047);
      tap(controller, 2050);
      expect(harness.client.insertedTexts.join('')).assertEqual('A ');
      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(65);
      expect(harness.client.insertedTexts[1].charCodeAt(0)).assertEqual(32);
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PHYSICAL_KEY_EXTRA_2400
     * @tc.name      testPhysicalKeyExtra_024
     * @tc.desc      Verify that a repeated key-down without a release still forwards the same glyph twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPhysicalKeyExtra_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_024 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const firstDown: boolean = pressHardKey(controller, 2017);
      const repeatedDown: boolean = pressHardKey(controller, 2017);
      const released: boolean = releaseHardKey(controller, 2017);
      expect(firstDown).assertTrue();
      expect(repeatedDown).assertTrue();
      expect(released).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('aa');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:a');
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhysicalKeyExtra_024 end');
      await yieldToEventLoop();
    });

  });
}
