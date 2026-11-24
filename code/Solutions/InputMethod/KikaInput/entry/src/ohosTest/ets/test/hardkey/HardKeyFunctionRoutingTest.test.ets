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
import { KeyboardController, InputHandler } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness, createClientHarness, FakeInputClient } from '../support/ClientHarness';
import {
  createKeyboardController,
  inputHardKeyValue,
  pressHardKey,
  releaseHardKey,
  sendKeyAction,
  sendKeyUpAction,
  isShiftHeld
} from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputHardKeyFunctionRouting]';

export default function HardKeyFunctionRoutingTestTest(): void {
  describe('HardKeyFunctionRoutingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_ROUTING_0100
     * @tc.name      testHardKeyFunctionRouting_001
     * @tc.desc      Verify that the DEL token forwards one forward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyFunctionRouting_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertEqual(true);
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_ROUTING_0200
     * @tc.name      testHardKeyFunctionRouting_002
     * @tc.desc      Verify that the FORWARD_DEL token forwards one backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyFunctionRouting_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_FORWARD_DEL', 2071)).assertTrue();
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_ROUTING_0300
     * @tc.name      testHardKeyFunctionRouting_003
     * @tc.desc      Verify that the four arrow tokens map to the four cursor directions in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyFunctionRouting_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const editorRef: FakeInputClient = harness.client;
      const controller: KeyboardController = createKeyboardController();

      const tokens: string[] = ['KEYCODE_DPAD_UP', 'KEYCODE_DPAD_DOWN',
        'KEYCODE_DPAD_LEFT', 'KEYCODE_DPAD_RIGHT'];
      let i: number = 0;
      while (i < tokens.length) {
        expect(inputHardKeyValue(controller, tokens[i], 2012 + i)).assertTrue();
        i = i + 1;
      }
      expect(editorRef.movedDirections.join('|')).assertEqual('1|2|3|4');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_ROUTING_0400
     * @tc.name      testHardKeyFunctionRouting_004
     * @tc.desc      Verify that an unknown token falls through to literal insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionRouting_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_UNKNOWN', 9999)).assertEqual(true);
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_UNKNOWN');
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_ROUTING_0500
     * @tc.name      testHardKeyFunctionRouting_005
     * @tc.desc      Verify that both shift tokens are consumed and neither inserted nor moved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionRouting_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const shiftTokens: string[] = ['KEYCODE_SHIFT_LEFT', 'KEYCODE_SHIFT_RIGHT'];
      const shiftCodes: number[] = [2047, 2048];
      let i: number = 0;
      while (i < shiftTokens.length) {
        expect(inputHardKeyValue(controller, shiftTokens[i], shiftCodes[i])).assertFalse();
        expect(harness.client.journal.length).assertEqual(0);
        i = i + 1;
      }
      expect(harness.client.insertedTexts.length + harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_ROUTING_0600
     * @tc.name      testHardKeyFunctionRouting_006
     * @tc.desc      Verify that all six function tokens compose into one ordered command stream.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionRouting_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = new ClientHarness(0);
      await Promise.resolve();
      await Promise.resolve();
      const controller: KeyboardController = createKeyboardController();

      const tokens: string[] = ['KEYCODE_DEL', 'KEYCODE_FORWARD_DEL', 'KEYCODE_DPAD_UP',
        'KEYCODE_DPAD_DOWN', 'KEYCODE_DPAD_LEFT', 'KEYCODE_DPAD_RIGHT'];
      for (let i = 0; i < tokens.length; i++) {
        expect(inputHardKeyValue(controller, tokens[i], 2012 + i)).assertTrue();
      }
      expect(harness.client.journal.join('|'))
        .assertEqual('forward:1|back:1|move:1|move:2|move:3|move:4');
      expect(harness.client.journal.length).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionRouting_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0100
     * @tc.name      testHardKeyFunctionDispatch_001
     * @tc.desc      Verify that a physical DEL down routes one forward deletion through the down handler.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyFunctionDispatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_001 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1');
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0200
     * @tc.name      testHardKeyFunctionDispatch_002
     * @tc.desc      Verify that a physical FORWARD_DEL down routes one backward deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyFunctionDispatch_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_002 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2071)).assertTrue();
      expect(harness.client.backwardLengths[0]).assertEqual(1);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0300
     * @tc.name      testHardKeyFunctionDispatch_003
     * @tc.desc      Verify that four arrow down-up cycles keep the four directions in press order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyFunctionDispatch_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_003 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      const codes: number[] = [2012, 2013, 2014, 2015];
      let i: number = 0;
      while (i < codes.length) {
        expect(pressHardKey(controller, codes[i])).assertTrue();
        expect(releaseHardKey(controller, codes[i])).assertFalse();
        i = i + 1;
      }
      expect(harness.client.movedDirections.join('|')).assertEqual('1|2|3|4');
      expect(harness.client.journal.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0400
     * @tc.name      testHardKeyFunctionDispatch_004
     * @tc.desc      Verify that three DEL downs while the key is held each forward one deletion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_004 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(3);
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0500
     * @tc.name      testHardKeyFunctionDispatch_005
     * @tc.desc      Verify that two separated DEL taps produce two deletions and one release check.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_005 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(2);
      expect(harness.client.journal.join('|')).assertEqual('forward:1|forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0600
     * @tc.name      testHardKeyFunctionDispatch_006
     * @tc.desc      Verify that a DEL pressed while shift is held is blocked and recovers after both releases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0700
     * @tc.name      testHardKeyFunctionDispatch_007
     * @tc.desc      Verify that shift plus a letter inserts uppercase and a fresh tap returns to lowercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyFunctionDispatch_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_007 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('A');
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('Aa');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0800
     * @tc.name      testHardKeyFunctionDispatch_008
     * @tc.desc      Verify that a lone shift down and up inserts nothing and leaves the next letter plain.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_008 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_0900
     * @tc.name      testHardKeyFunctionDispatch_009
     * @tc.desc      Verify that an alt tap emits nothing and does not prevent the next letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_009 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2045)).assertFalse();
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(harness.client.insertedTexts.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1000
     * @tc.name      testHardKeyFunctionDispatch_010
     * @tc.desc      Verify that an unmapped key latches the next letter off until the unmapped key is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_010 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 3000)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 3000)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1100
     * @tc.name      testHardKeyFunctionDispatch_011
     * @tc.desc      Verify that a key-up without a matching down emits nothing and keeps the handler usable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_011 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1200
     * @tc.name      testHardKeyFunctionDispatch_012
     * @tc.desc      Verify that the DPAD_CENTER key falls through both stages and inserts its token text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_012 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2016)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:KEYCODE_DPAD_CENTER');
      expect(harness.client.forwardLengths.length +
        harness.client.backwardLengths.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1300
     * @tc.name      testHardKeyFunctionDispatch_013
     * @tc.desc      Verify that a second shift press latches both shifts until the last one is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_013 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2048)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2048)).assertFalse();
      expect(isShiftHeld(controller)).assertTrue();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(isShiftHeld(controller)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1400
     * @tc.name      testHardKeyFunctionDispatch_014
     * @tc.desc      Verify that a third letter in a shift chord still inserts uppercase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_014 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('AB');
      expect(harness.client.journal.length).assertEqual(2);
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1500
     * @tc.name      testHardKeyFunctionDispatch_015
     * @tc.desc      Verify that a function token is dispatched for an arbitrary companion code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_015 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 1234)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.journal.join('|')).assertEqual('forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1600
     * @tc.name      testHardKeyFunctionDispatch_016
     * @tc.desc      Verify that a literal token paired with the DEL code inserts without deleting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(inputHardKeyValue(controller, 'z', 2055)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('z');
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.journal.join('|')).assertEqual('insert:z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1700
     * @tc.name      testHardKeyFunctionDispatch_017
     * @tc.desc      Verify that a deletion, a left move and a deletion keep the move in the middle slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_017 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(pressHardKey(controller, 2014)).assertTrue();
      expect(releaseHardKey(controller, 2014)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('forward:1|move:3|forward:1');
      expect(harness.client.forwardLengths.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1800
     * @tc.name      testHardKeyFunctionDispatch_018
     * @tc.desc      Verify that key-up reports false for every function key and adds no command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(pressHardKey(controller, 2013)).assertTrue();
      expect(harness.client.journal.length).assertEqual(3);
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 2012)).assertFalse();
      expect(releaseHardKey(controller, 2013)).assertFalse();
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_1900
     * @tc.name      testHardKeyFunctionDispatch_019
     * @tc.desc      Verify that two held arrows retain both moves when released in reverse order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_019 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(pressHardKey(controller, 2014)).assertTrue();
      expect(harness.client.movedDirections.join('|')).assertEqual('1|3');
      expect(releaseHardKey(controller, 2012)).assertFalse();
      expect(releaseHardKey(controller, 2014)).assertFalse();
      expect(harness.client.journal.join('|')).assertEqual('move:1|move:3');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2000
     * @tc.name      testHardKeyFunctionDispatch_020
     * @tc.desc      Verify that an arrow blocked by shift works again after shift is released.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_020 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2012)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2012)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(harness.client.movedDirections[0]).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2100
     * @tc.name      testHardKeyFunctionDispatch_021
     * @tc.desc      Verify that hard keys after a handler stop emit no editor command but still report handled.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_021 begin');
      InputHandler.getInstance().onInputStop();
      const detached: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      InputHandler.getInstance().onInputStop();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(detached.client.journal.length).assertEqual(0);
      const fresh: ClientHarness = await createClientHarness(0);
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(fresh.client.forwardLengths.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2200
     * @tc.name      testHardKeyFunctionDispatch_022
     * @tc.desc      Verify that a shift-digit latch survives the digit release and clears at the shift release.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_022 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      const heldCodes: number[] = [2047, 2002];
      for (let idx: number = 0; idx < heldCodes.length; idx++) {
        expect(pressHardKey(controller, heldCodes[idx])).assertFalse();
      }
      expect(releaseHardKey(controller, 2002)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertFalse();
      const journalAtBlocked: string[] = harness.client.journal;
      expect(journalAtBlocked.length).assertEqual(0);
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts[0].charCodeAt(0)).assertEqual(97);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2300
     * @tc.name      testHardKeyFunctionDispatch_023
     * @tc.desc      Verify that the down handler ignores the action field and still dispatches DEL.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_023 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      // Action 3 is an up action but the controller only reads the key code.
      expect(sendKeyAction(controller, 2055, 3)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('forward:1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2400
     * @tc.name      testHardKeyFunctionDispatch_024
     * @tc.desc      Verify that the up handler ignores the action field and still removes the held letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_024 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      // Action 2 is a down action but the controller only reads the key code.
      expect(sendKeyUpAction(controller, 2017, 2)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('aa');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2500
     * @tc.name      testHardKeyFunctionDispatch_025
     * @tc.desc      Verify that a DEL added to a shift-letter chord deletes because the two-key block is gone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_025 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      // With three keys held, the two-key shift block no longer applies.
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('A');
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.journal.join('|')).assertEqual('insert:A|forward:1');
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2600
     * @tc.name      testHardKeyFunctionDispatch_026
     * @tc.desc      Verify that a comma and a period tapped in sequence insert in that order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_026 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2043)).assertTrue();
      expect(releaseHardKey(controller, 2043)).assertFalse();
      expect(pressHardKey(controller, 2044)).assertTrue();
      expect(releaseHardKey(controller, 2044)).assertFalse();
      expect(harness.client.insertedTexts.join('')).assertEqual(',.');
      expect(harness.client.forwardLengths.length +
        harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2700
     * @tc.name      testHardKeyFunctionDispatch_027
     * @tc.desc      Verify that equals and plus reach the editor as literals rather than function tokens.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_027 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2058)).assertTrue();
      expect(pressHardKey(controller, 2066)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('=+');
      expect(harness.client.journal.length).assertEqual(2);
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2800
     * @tc.name      testHardKeyFunctionDispatch_028
     * @tc.desc      Verify that releasing a function key twice leaves one release recorded and no command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_028 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2071)).assertTrue();
      expect(releaseHardKey(controller, 2071)).assertFalse();
      expect(releaseHardKey(controller, 2071)).assertFalse();
      expect(harness.client.backwardLengths.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(1);
      expect(pressHardKey(controller, 2071)).assertTrue();
      expect(harness.client.backwardLengths.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_2900
     * @tc.name      testHardKeyFunctionDispatch_029
     * @tc.desc      Verify that a digit added as a third key to a shift chord is inserted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_029 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      // The two-key shift block no longer applies once a third key is held.
      expect(pressHardKey(controller, 2002)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('A2');
      expect(harness.client.journal.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_3000
     * @tc.name      testHardKeyFunctionDispatch_030
     * @tc.desc      Verify that a DEL pressed with alt held still deletes because alt never latches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_030 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2045)).assertFalse();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths[0]).assertEqual(1);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(releaseHardKey(controller, 2055)).assertFalse();
      expect(releaseHardKey(controller, 2045)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_3100
     * @tc.name      testHardKeyFunctionDispatch_031
     * @tc.desc      Verify that a shift-blocked center key becomes a literal insertion after the chord lifts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_031 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2016)).assertFalse();
      expect(harness.client.journal.length).assertEqual(0);
      expect(releaseHardKey(controller, 2016)).assertFalse();
      expect(releaseHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2016)).assertTrue();
      expect(harness.client.insertedTexts[0]).assertEqual('KEYCODE_DPAD_CENTER');
      expect(harness.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_3200
     * @tc.name      testHardKeyFunctionDispatch_032
     * @tc.desc      Verify that a stop between two DEL presses keeps the first and drops the second.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_032 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(1);
      InputHandler.getInstance().onInputStop();
      expect(pressHardKey(controller, 2055)).assertTrue();
      expect(harness.client.forwardLengths.length).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_3300
     * @tc.name      testHardKeyFunctionDispatch_033
     * @tc.desc      Verify that two held letters release in press order without extra commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_033 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(pressHardKey(controller, 2018)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(releaseHardKey(controller, 2017)).assertFalse();
      expect(releaseHardKey(controller, 2018)).assertFalse();
      expect(harness.client.journal.length).assertEqual(2);
      expect(pressHardKey(controller, 2019)).assertTrue();
      expect(harness.client.insertedTexts.join('')).assertEqual('abc');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_FUNCTION_DISPATCH_3400
     * @tc.name      testHardKeyFunctionDispatch_034
     * @tc.desc      Verify that an arrow tap followed by a shift tap yields one move and one uppercase letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyFunctionDispatch_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_034 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();

      expect(pressHardKey(controller, 2012)).assertTrue();
      expect(releaseHardKey(controller, 2012)).assertFalse();
      expect(pressHardKey(controller, 2047)).assertFalse();
      expect(pressHardKey(controller, 2017)).assertTrue();
      expect(harness.client.journal.join('|')).assertEqual('move:1|insert:A');
      expect(harness.client.movedDirections.length).assertEqual(1);
      expect(harness.client.insertedTexts[0]).assertEqual('A');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyFunctionDispatch_034 end');
      await yieldToEventLoop();
    });

  });
}
