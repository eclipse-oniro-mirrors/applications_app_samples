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
import { yieldToEventLoop } from '../support/AsyncSupport';
import { KeyboardController, InputHandler } from '../../../../main/ets/model/KeyboardController';
import hilog from '@ohos.hilog';
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';
import { createKeyboardController, pressHardKey, releaseHardKey, isShiftHeld } from '../support/TestSupport';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputControllerStageTest]';

export default function ControllerStateTest002Test(): void {
  describe('ControllerStateTest002', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0600
     * @tc.name      testControllerStateTest002Test_001
     * @tc.desc      Verify ten duplicate shift downs keep one hold that a single up clears.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest002Test_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest002Test_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      let i: number = 0;
      while (i < 10) {
        expect(pressHardKey(controller, 2047)).assertEqual(false);
        i = i + 1;
      }
      expect(isShiftHeld(controller)).assertEqual(true);
      expect(releaseHardKey(controller, 2047)).assertEqual(false);
      expect(isShiftHeld(controller)).assertEqual(false);
      expect(pressHardKey(controller, 2017)).assertEqual(true);
      releaseHardKey(controller, 2017);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest002Test_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0700
     * @tc.name      testControllerStateTest002Test_002
     * @tc.desc      Verify all twenty-six letters held at once then released in reverse order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest002Test_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest002Test_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      for (let code = 2017; code <= 2042; code++) {
        expect(pressHardKey(controller, code)).assertTrue();
      }
      for (let code = 2042; code >= 2017; code--) {
        expect(releaseHardKey(controller, code)).assertFalse();
      }
      expect(harness.client.journal.length).assertEqual(26);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcdefghijklmnopqrstuvwxyz');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest002Test_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_STRESS_0800
     * @tc.name      testControllerStateTest002Test_003
     * @tc.desc      Verify fifty held unknown codes released in interleaved order still recover.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateTest002Test_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest002Test_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      for (let code = 3000; code < 3050; code++) {
        pressHardKey(controller, code);
      }
      for (let code = 3000; code < 3050; code = code + 2) {
        releaseHardKey(controller, code);
      }
      for (let code = 3001; code < 3050; code = code + 2) {
        releaseHardKey(controller, code);
      }
      expect(pressHardKey(controller, 2019)).assertTrue();
      releaseHardKey(controller, 2019);
      expect(editorRef.insertedTexts.join('')).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateTest002Test_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0100
     * @tc.name      testControllerStateRebind_001
     * @tc.desc      Verify that four DEL downs across a release each forward one deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(4);
      expect(harness.client.journal.join('|'))
        .assertEqual('forward:1|forward:1|forward:1|forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0200
     * @tc.name      testControllerStateRebind_002
     * @tc.desc      Verify that alternating shift downs keep one hold until the release queue empties.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2048)).assertFalse();
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0300
     * @tc.name      testControllerStateRebind_003
     * @tc.desc      Verify that a shift pressed behind a letter leads after that letter is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      // With the letter gone, the remaining shift becomes the leading key.
      expect(isShiftHeld(controller)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('aB');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0400
     * @tc.name      testControllerStateRebind_004
     * @tc.desc      Verify that two letters held with an unknown code keep the latch until every release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(pressHardKey(controller, 3000)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2019)).assertFalse();
      expect(releaseHardKey(controller, 2019)).assertFalse();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(pressHardKey(controller, 2019)).assertFalse();
      expect(releaseHardKey(controller, 2019)).assertFalse();
      expect(releaseHardKey(controller, 3000)).assertFalse();
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0500
     * @tc.name      testControllerStateRebind_005
     * @tc.desc      Verify that repeated letter attempts stay blocked while the unmapped key is held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 3001)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 3001)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0600
     * @tc.name      testControllerStateRebind_006
     * @tc.desc      Verify that a digit retried after its first release is still blocked while shift stays.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const outcomes: boolean[] = [];
      outcomes.push(pressHardKey(controller, 2047));
      outcomes.push(pressHardKey(controller, 2003));
      outcomes.push(releaseHardKey(controller, 2003));
      outcomes.push(pressHardKey(controller, 2003));
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2003)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2003)).assertTrue();
      expect(outcomes.join(',')).assertEqual('false,false,false,false');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0700
     * @tc.name      testControllerStateRebind_007
     * @tc.desc      Verify that releasing a code that was never pressed keeps a shift hold intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(releaseHardKey(controller, 2042)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('A');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0800
     * @tc.name      testControllerStateRebind_008
     * @tc.desc      Verify that an alt tap inside a shift-letter chord does not block the next letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2045)).assertFalse();
      expect(releaseHardKey(controller, 2045)).assertFalse();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_0900
     * @tc.name      testControllerStateRebind_009
     * @tc.desc      Verify that two held function keys release in reverse without reordering their commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('forward:1|move:1');
      expect(releaseHardKey(controller, 2012)).assertFalse();
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1000
     * @tc.name      testControllerStateRebind_010
     * @tc.desc      Verify that a third arrow pressed after one release appends to the same move stream.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(pressHardKey(controller, 2013)).assertTrue();
      expect(releaseHardKey(controller, 2012)).assertFalse();
      expect(pressHardKey(controller, 2014)).assertTrue();
      expect(harness.client.movedDirections.join('|')).assertEqual('1|2|3');
      expect(harness.client.journal.length).assertEqual(3);
      expect(releaseHardKey(controller, 2013)).assertFalse();
      expect(releaseHardKey(controller, 2014)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1100
     * @tc.name      testControllerStateRebind_011
     * @tc.desc      Verify that a second DEL down under an unmapped latch stays blocked until all lift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 3002)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 3002)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1200
     * @tc.name      testControllerStateRebind_012
     * @tc.desc      Verify that a letter pressed before any attach does not reach the later editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testControllerStateRebind_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_012 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(releaseHardKey(controller, 2017)).assertFalse();

      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.journal.length).assertEqual(0);
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1300
     * @tc.name      testControllerStateRebind_013
     * @tc.desc      Verify that keys from two controllers append to one handler journal in call order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const first: KeyboardController = createKeyboardController();
      const second: KeyboardController = createKeyboardController();

      expect(pressHardKey(first, 2017)).assertTrue();
      expect(pressHardKey(second, 2018)).assertTrue();
      expect(pressHardKey(first, 2019)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');
      expect(harness.client.journal.join('|')).assertEqual('insert:a|insert:b|insert:c');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1400
     * @tc.name      testControllerStateRebind_014
     * @tc.desc      Verify that two unmapped keys keep a letter blocked until both are released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 3010)).assertFalse();
      expect(pressHardKey(controller, 3011)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 3010)).assertFalse();
      expect(pressHardKey(controller, 2018)).assertFalse();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(releaseHardKey(controller, 3011)).assertFalse();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1500
     * @tc.name      testControllerStateRebind_015
     * @tc.desc      Verify that releasing the middle of three held letters leaves the others held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(harness.client.journal.length).assertEqual(3);
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('abcc');
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2019)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1600
     * @tc.name      testControllerStateRebind_016
     * @tc.desc      Verify that a released letter can be pressed again while another letter stays held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('aba');
      expect(harness.client.journal.length).assertEqual(3);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2018)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1700
     * @tc.name      testControllerStateRebind_017
     * @tc.desc      Verify that a duplicate letter down under an unmapped latch inserts nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 3005)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(1);
      expect(releaseHardKey(controller, 3005)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('aa');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1800
     * @tc.name      testControllerStateRebind_018
     * @tc.desc      Verify that a gap code outside the mapping table latches a following digit off.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2060)).assertFalse();
      expect(pressHardKey(controller, 2005)).assertFalse();
      expect(releaseHardKey(controller, 2005)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2060)).assertFalse();
      expect(pressHardKey(controller, 2005)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('5');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_1900
     * @tc.name      testControllerStateRebind_019
     * @tc.desc      Verify that an arrow blocked by a latch moves only after the latch key is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_019 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 3003)).assertFalse();
      expect(pressHardKey(controller, 2012)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2012)).assertFalse();
      expect(releaseHardKey(controller, 3003)).assertFalse();
      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(harness.client.movedDirections[0]).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('move:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2000
     * @tc.name      testControllerStateRebind_020
     * @tc.desc      Verify that alternating letter and digit downs insert in the pressed order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2001)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(pressHardKey(controller, 2002)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a1b2');
      expect(harness.client.journal.length).assertEqual(4);
      expect(releaseHardKey(controller, 2002)).assertFalse();
      expect(releaseHardKey(controller, 2001)).assertFalse();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2100
     * @tc.name      testControllerStateRebind_021
     * @tc.desc      Verify that a letter held across a handler stop and reattach still releases cleanly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_021 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(first.client.insertedTexts.join('')).assertEqual('a');
      InputHandler.getInstance().onInputStop();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      const second: ClientHarness = await createClientHarness(0);
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(first.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2200
     * @tc.name      testControllerStateRebind_022
     * @tc.desc      Verify that lowercase letters before a shift cycle stay lowercase when the cycle ends.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_022 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual('abA');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2300
     * @tc.name      testControllerStateRebind_023
     * @tc.desc      Verify that a duplicate digit down under shift stays blocked while both keys are held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_023 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2003)).assertFalse();
      expect(pressHardKey(controller, 2003)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2003)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2003)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('3');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2400
     * @tc.name      testControllerStateRebind_024
     * @tc.desc      Verify that a shift released before its blocked digit leaves the latch until the digit lifts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_024 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2003)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      const blockedAgain: boolean = pressHardKey(controller, 2017);
      expect(blockedAgain).assertFalse();
      expect(harness.client.journal.join('')).assertEqual('');
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2003)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2500
     * @tc.name      testControllerStateRebind_025
     * @tc.desc      Verify that a letter stays blocked while either of two shift keys is still held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_025 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const shiftCodes: number[] = [2047, 2048];
      for (let idx: number = 0; idx < shiftCodes.length; idx++) {
        expect(pressHardKey(controller, shiftCodes[idx])).assertFalse();
      }
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2048)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2600
     * @tc.name      testControllerStateRebind_026
     * @tc.desc      Verify that a duplicate shift down still allows one uppercase before a double release clears.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_026 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('A');
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('Aa');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2700
     * @tc.name      testControllerStateRebind_027
     * @tc.desc      Verify that deletion, move and both deletion directions keep a four-step journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_027 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(pressHardKey(controller, 2071)).assertTrue();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.journal.join('|'))
        .assertEqual('forward:1|move:1|back:1|forward:1');
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.backwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2800
     * @tc.name      testControllerStateRebind_028
     * @tc.desc      Verify that a held letter survives around two deletions before it is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_028 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.journal.join('|'))
        .assertEqual('insert:a|forward:1|forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_2900
     * @tc.name      testControllerStateRebind_029
     * @tc.desc      Verify that a letter following a blocked DEL stays blocked while shift still holds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_029 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3000
     * @tc.name      testControllerStateRebind_030
     * @tc.desc      Verify that a duplicate letter down inserts again and a release plus re-press appends.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_030 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('bbcb');
      expect(harness.client.journal.length).assertEqual(4);
      expect(releaseHardKey(controller, 2018)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3100
     * @tc.name      testControllerStateRebind_031
     * @tc.desc      Verify that two downs of one letter under shift insert twice with one held entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_031 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('AC');
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('ACB');
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3200
     * @tc.name      testControllerStateRebind_032
     * @tc.desc      Verify that two stops during a held letter leave the stack clearable and the next session usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_032 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStop();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      const fresh: ClientHarness = await createClientHarness(0);
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(fresh.client.insertedTexts.join('')).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3300
     * @tc.name      testControllerStateRebind_033
     * @tc.desc      Verify that a shift held on one controller does not uppercase a letter on another.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_033 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const upper: KeyboardController = createKeyboardController();
      const plain: KeyboardController = createKeyboardController();

      expect(pressHardKey(upper, 2047)).assertFalse();
      expect(pressHardKey(plain, 2017)).assertTrue();
      expect(pressHardKey(upper, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('aB');
      expect(isShiftHeld(plain)).assertFalse();
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3400
     * @tc.name      testControllerStateRebind_034
     * @tc.desc      Verify that a latch armed on one controller is not cleared by a release on another.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_034 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const latched: KeyboardController = createKeyboardController();
      const other: KeyboardController = createKeyboardController();

      expect(pressHardKey(latched, 3007)).assertFalse();
      expect(pressHardKey(latched, 2017)).assertFalse();
      expect(releaseHardKey(other, 3007)).assertFalse();
      expect(pressHardKey(latched, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(latched, 3007)).assertFalse();
      expect(releaseHardKey(latched, 2017)).assertFalse();
      expect(pressHardKey(latched, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3500
     * @tc.name      testControllerStateRebind_035
     * @tc.desc      Verify that releasing several never-pressed codes does not arm the latch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_035 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 3000)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.journal.length).assertEqual(1);
      expect(isShiftHeld(controller)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_035 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3600
     * @tc.name      testControllerStateRebind_036
     * @tc.desc      Verify that a full chord teardown leaves no hold and the next letter lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_036 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('ABC');
      expect(releaseHardKey(controller, 2019)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(pressHardKey(controller, 2020)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('ABCd');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_036 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3700
     * @tc.name      testControllerStateRebind_037
     * @tc.desc      Verify that a deletion, a letter and another deletion keep the letter in the middle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_037 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('forward:1|insert:a|forward:1');
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_037 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_CONTROLLER_KEY_STATE_REBIND_3800
     * @tc.name      testControllerStateRebind_038
     * @tc.desc      Verify that a latched shift-digit chord keeps a third letter blocked until all keys lift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testControllerStateRebind_038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_038 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2003)).assertFalse();
      // The digit armed the latch, so a third key stays blocked unlike an unlatched chord.
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2003)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerStateRebind_038 end');
      await yieldToEventLoop();
    });

  });
}
