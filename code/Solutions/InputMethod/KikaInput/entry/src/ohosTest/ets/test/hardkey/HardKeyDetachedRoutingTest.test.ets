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
  releaseHardKey
} from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputHardKeyDetachedRouting]';

export default function hardKeyDetachedRoutingTest(): void {
  describe('HardKeyDetachedRoutingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0100
     * @tc.name      testHardKeyDetachedRouting_001
     * @tc.desc      Verify that a shift token arriving before any editor is consumed without error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_001 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      const consumed: boolean = inputHardKeyValue(controller, 'KEYCODE_SHIFT_RIGHT', 2048);
      expect(consumed).assertFalse();
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0200
     * @tc.name      testHardKeyDetachedRouting_002
     * @tc.desc      Verify that a delete token before attach is consumed but records no editor command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_002 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, 'KEYCODE_DEL', 2055)).assertTrue();
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0300
     * @tc.name      testHardKeyDetachedRouting_003
     * @tc.desc      Verify that an unknown token before attach does not leak text into the next editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_003 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      expect(inputHardKeyValue(controller, 'KEYCODE_BEFORE_ATTACH', 3001)).assertTrue();
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0400
     * @tc.name      testHardKeyDetachedRouting_004
     * @tc.desc      Verify that an unknown token after stop never reaches the released editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_004 begin');
      const harness: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_LITERAL', 3002);
      InputHandler.getInstance().onInputStop();
      inputHardKeyValue(controller, 'KEYCODE_LITERAL', 3002);
      expect(harness.client.insertedTexts.join('')).assertEqual('KEYCODE_LITERAL');
      expect(harness.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0500
     * @tc.name      testHardKeyDetachedRouting_005
     * @tc.desc      Verify that a three-token stream after stop leaves the previous journal unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_005 begin');
      const harness: ClientHarness = await createClientHarness(3);
      const controller: KeyboardController = createKeyboardController();
      const tokens: string[] = ['KEYCODE_DPAD_LEFT', 'KEYCODE_DEL', 'KEYCODE_DPAD_DOWN'];
      for (let i = 0; i < tokens.length; i++) {
        inputHardKeyValue(controller, tokens[i], 2050 + i);
      }
      const beforeStop: number = harness.client.journal.length;
      InputHandler.getInstance().onInputStop();
      for (let i = 0; i < tokens.length; i++) {
        inputHardKeyValue(controller, tokens[i], 2050 + i);
      }
      expect(beforeStop).assertEqual(3);
      expect(harness.client.journal.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0600
     * @tc.name      testHardKeyDetachedRouting_006
     * @tc.desc      Verify that hard keys after reattach land only in the newest editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_006 begin');
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_OLD', 3003);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      inputHardKeyValue(controller, 'KEYCODE_NEW', 3004);
      expect(first.client.insertedTexts.join('')).assertEqual('KEYCODE_OLD');
      expect(second.client.insertedTexts.join('')).assertEqual('KEYCODE_NEW');
      expect(first.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0700
     * @tc.name      testHardKeyDetachedRouting_007
     * @tc.desc      Verify that a shift down and up while detached leaves the next controller unshifted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_007 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      releaseHardKey(controller, 2047);
      const next: KeyboardController = createKeyboardController();
      expect(isShiftHeld(next)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0800
     * @tc.name      testHardKeyDetachedRouting_008
     * @tc.desc      Verify that a detached delete token adds no forward length to a later editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_008 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_0900
     * @tc.name      testHardKeyDetachedRouting_009
     * @tc.desc      Verify that an enter request before attach reaches no later editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_009 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendKeyFunction();
      const harness: ClientHarness = await createClientHarness(4);
      expect(harness.client.keyFunctions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1000
     * @tc.name      testHardKeyDetachedRouting_010
     * @tc.desc      Verify that hiding while detached is silent and does not block the next hide.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_010 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      const harness: ClientHarness = await createClientHarness(0);
      const baseline: number = harness.keyboard.hideCount;
      InputHandler.getInstance().hideKeyboardSelf();
      const afterAttachedHide: number = harness.keyboard.hideCount;
      expect(baseline).assertEqual(0);
      expect(afterAttachedHide - baseline).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1100
     * @tc.name      testHardKeyDetachedRouting_011
     * @tc.desc      Verify that two reattaches route a detached literal only to the newest editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_011 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_REBOUND', 3005);
      expect(first.client.insertedTexts.length).assertEqual(0);
      expect(second.client.insertedTexts.join('')).assertEqual('KEYCODE_REBOUND');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1200
     * @tc.name      testHardKeyDetachedRouting_012
     * @tc.desc      Verify that shift held at detach does not carry into a fresh controller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_012 begin');
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      InputHandler.getInstance().onInputStop();
      const fresh: KeyboardController = createKeyboardController();
      releaseHardKey(controller, 2047);
      expect(isShiftHeld(fresh)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1300
     * @tc.name      testHardKeyDetachedRouting_013
     * @tc.desc      Verify that an unknown token before attach leaves the following editor journal empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_013 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_PRE_ATTACH', 3006);
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1400
     * @tc.name      testHardKeyDetachedRouting_014
     * @tc.desc      Verify that an extend action while detached adds no action to a later editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_014 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().sendExtendAction(4 as inputMethodEngine.ExtendAction);
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.extendActions.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1500
     * @tc.name      testHardKeyDetachedRouting_015
     * @tc.desc      Verify that refreshing while detached omits the five-character line but keeps stored fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_015 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setInputInfo('DETACHED-KEEP');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const text: string = AppStorage.get<string>('showLog') ?? '';
      expect(text.indexOf('five chars:')).assertEqual(-1);
      expect(text.indexOf('DETACHED-KEEP') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1600
     * @tc.name      testHardKeyDetachedRouting_016
     * @tc.desc      Verify that two detached delete tokens leave the next editor with no forward lengths.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_016 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      inputHardKeyValue(controller, 'KEYCODE_DEL', 2055);
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.forwardLengths.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1700
     * @tc.name      testHardKeyDetachedRouting_017
     * @tc.desc      Verify that two detached hides do not consume the next editor hide request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_017 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().hideKeyboardSelf();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1800
     * @tc.name      testHardKeyDetachedRouting_018
     * @tc.desc      Verify that a detached shift pair then a literal reaches only the attached editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_018 begin');
      InputHandler.getInstance().onInputStop();
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2047);
      releaseHardKey(controller, 2047);
      inputHardKeyValue(controller, 'KEYCODE_AFTER_PAIR', 3007);
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_DETACHED_1900
     * @tc.name      testHardKeyDetachedRouting_019
     * @tc.desc      Verify that a caret move issued while detached reaches no later editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyDetachedRouting_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_019 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().moveCursor(3 as inputMethodEngine.Direction);
      const harness: ClientHarness = await createClientHarness(0);
      expect(harness.client.movedDirections.length).assertEqual(0);
      expect(harness.client.journal.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyDetachedRouting_019 end');
      await yieldToEventLoop();
    });

  });
}
