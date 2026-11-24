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
import { createKeyboardController, pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputSessionOrder]';

export default function SessionOrderTestTest(): void {
  describe('SessionOrderTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_ORDER_0100
     * @tc.name      testSessionOrder_001
     * @tc.desc      Verify that three alternating sessions read three attributes and keep the last type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_001 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(3);

      const reads: number = first.client.editorAttributeCount + second.client.editorAttributeCount +
        third.client.editorAttributeCount;
      expect(reads).assertEqual(3);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      InputHandler.getInstance().sendKeyFunction();
      expect(third.client.keyFunctions.join('')).assertEqual('3');
      expect(first.client.keyFunctions.length + second.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_ORDER_0200
     * @tc.name      testSessionOrder_002
     * @tc.desc      Verify that a stop before the attribute resolves still commits storage without delivery.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_002 begin');
      InputHandler.getInstance().onInputStop();
      const pending: ClientHarness = new ClientHarness(6);
      InputHandler.getInstance().onInputStop();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('lost');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(6);
      expect(pending.client.journal.length).assertEqual(0);
      expect(pending.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_ORDER_0300
     * @tc.name      testSessionOrder_003
     * @tc.desc      Verify that two starts with one stop leave the second client detached.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_003 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('none');
      expect(first.client.journal.length).assertEqual(0);
      expect(second.client.journal.length).assertEqual(0);
      expect(second.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_ORDER_0400
     * @tc.name      testSessionOrder_004
     * @tc.desc      Verify that a direct reattach to the first client while the second is active wins.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_004 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('b');
      expect(first.client.insertedTexts.join('')).assertEqual('a');
      expect(second.client.journal.length).assertEqual(0);
      expect(first.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_ORDER_0500
     * @tc.name      testSessionOrder_005
     * @tc.desc      Verify that a hide before a start is ignored and a hide after it reaches the panel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_005 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().hideKeyboardSelf();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.journal.length).assertEqual(0);
      expect(harness.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_ORDER_0600
     * @tc.name      testSessionOrder_006
     * @tc.desc      Verify that an insertion in a pending gap never reaches the following session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_006 begin');
      InputHandler.getInstance().onInputStop();
      const pending: ClientHarness = new ClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().insertText('gap');
      const next: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('live');
      expect(pending.client.journal.length).assertEqual(0);
      expect(next.client.insertedTexts.join('')).assertEqual('live');
      expect(next.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_ORDER_0700
     * @tc.name      testSessionOrder_007
     * @tc.desc      Verify that a maximum type followed by a zero type leaves zero as the stored value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionOrder_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_007 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(2147483647, 5);
      InputHandler.getInstance().onInputStop();
      const zero: ClientHarness = await createClientHarness(0, 0);
      InputHandler.getInstance().sendKeyFunction();
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(0);
      expect(AppStorage.get<number>('inputPattern')).assertEqual(0);
      expect(zero.client.keyFunctions.join('')).assertEqual('0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionOrder_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0100
     * @tc.name      testSessionRecovery_001
     * @tc.desc      Verify that recovering the middle session while a third is active routes the next enter to it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_001 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const middle: ClientHarness = await createClientHarness(1);
      const last: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        middle.keyboard as object as inputMethodEngine.KeyboardController,
        middle.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();

      InputHandler.getInstance().insertText('m');
      InputHandler.getInstance().sendKeyFunction();
      expect(middle.client.journal.join('|')).assertEqual('insert:m|enter:1');
      expect(middle.client.editorAttributeCount).assertEqual(2);
      expect(last.client.journal.length).assertEqual(0);
      expect(first.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0200
     * @tc.name      testSessionRecovery_002
     * @tc.desc      Verify that a four-session round trip returns to the first client with both payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_002 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a1');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().insertText('b1');
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().insertText('c1');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('a2');
      expect(first.client.insertedTexts.join('|')).assertEqual('a1|a2');
      expect(second.client.insertedTexts.join('')).assertEqual('b1');
      expect(third.client.insertedTexts.join('')).assertEqual('c1');
      expect(first.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0300
     * @tc.name      testSessionRecovery_003
     * @tc.desc      Verify that recovering the first session after a second one reuses its own enter type twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_003 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions.join('|')).assertEqual('1|1');
      expect(second.client.keyFunctions.join('')).assertEqual('2');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0400
     * @tc.name      testSessionRecovery_004
     * @tc.desc      Verify that two sessions sharing an enter type keep the newest input pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_004 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(3, 1);
      const firstPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(3, 8);
      const secondPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      InputHandler.getInstance().sendKeyFunction();
      expect(firstPattern).assertEqual(1);
      expect(secondPattern).assertEqual(8);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(3);
      expect(second.client.keyFunctions.join('')).assertEqual('3');
      expect(first.client.keyFunctions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0500
     * @tc.name      testSessionRecovery_005
     * @tc.desc      Verify that one physical key per session reaches each session client and the recovered one twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_005 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      pressHardKey(controller, 2019);
      releaseHardKey(controller, 2019);
      expect(first.client.insertedTexts.join('')).assertEqual('ac');
      expect(second.client.insertedTexts.join('')).assertEqual('b');
      expect(second.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0600
     * @tc.name      testSessionRecovery_006
     * @tc.desc      Verify that the preview block disappears at a stop and returns after the session is recovered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_006 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const attached: string = AppStorage.get<string>('showLog') ?? '';
      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const detached: string = AppStorage.get<string>('showLog') ?? '';
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const recovered: string = AppStorage.get<string>('showLog') ?? '';
      expect(attached.indexOf('five chars:')).assertEqual(0);
      expect(detached.indexOf('five chars:')).assertEqual(-1);
      expect(recovered.indexOf('five chars:')).assertEqual(0);
      expect(harness.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0700
     * @tc.name      testSessionRecovery_007
     * @tc.desc      Verify that extend actions are listed in the order their sessions ran, not by value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_007 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(first.client.extendActions.join('|')).assertEqual(
        inputMethodEngine.ExtendAction.CUT + '|' + inputMethodEngine.ExtendAction.SELECT_ALL);
      expect(first.client.extendActions.length).assertEqual(2);
      expect(second.client.extendActions.join('')).assertEqual(
        '' + inputMethodEngine.ExtendAction.PASTE);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0800
     * @tc.name      testSessionRecovery_008
     * @tc.desc      Verify that three sessions keep one deletion kind each with no cross-session leakage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_008 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(2);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().deleteForward(4);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_UP);
      expect(first.client.backwardLengths.join('')).assertEqual('2');
      expect(first.client.forwardLengths.length).assertEqual(0);
      expect(first.client.movedDirections.length).assertEqual(1);
      expect(second.client.forwardLengths.join('')).assertEqual('4');
      expect(second.client.backwardLengths.length).assertEqual(0);
      expect(second.client.movedDirections.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_0900
     * @tc.name      testSessionRecovery_009
     * @tc.desc      Verify that two sessions alternate enters twice and each keeps its own two forwarded types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_009 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(4);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        second.keyboard as object as inputMethodEngine.KeyboardController,
        second.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions.join('|')).assertEqual('1|1');
      expect(second.client.keyFunctions.join('|')).assertEqual('4|4');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1000
     * @tc.name      testSessionRecovery_010
     * @tc.desc      Verify that five commands in the active session leave the stopped session journal empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_010 begin');
      InputHandler.getInstance().onInputStop();
      const dormant: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      const active: ClientHarness = await createClientHarness(7);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().deleteForward(2);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_DOWN);
      InputHandler.getInstance().sendKeyFunction();
      expect(active.client.journal.length).assertEqual(5);
      expect(active.client.keyFunctions.join('')).assertEqual('7');
      expect(dormant.client.journal.length).assertEqual(0);
      expect(dormant.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1100
     * @tc.name      testSessionRecovery_011
     * @tc.desc      Verify that hides counted per session add up when the first session is recovered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_011 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(first.keyboard.hideCount).assertEqual(2);
      expect(second.keyboard.hideCount).assertEqual(1);
      expect(first.client.journal.length + second.client.journal.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1200
     * @tc.name      testSessionRecovery_012
     * @tc.desc      Verify that a first session recovered after two stopped sessions wins the next insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_012 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('back');
      expect(first.client.insertedTexts.join('')).assertEqual('back');
      expect(second.client.journal.length).assertEqual(0);
      expect(third.client.journal.length).assertEqual(0);
      expect(first.client.editorAttributeCount).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1300
     * @tc.name      testSessionRecovery_013
     * @tc.desc      Verify that physical and handler payloads interleave across a recovery on the recovered client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_013 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      const controller: KeyboardController = createKeyboardController();
      pressHardKey(controller, 2017);
      releaseHardKey(controller, 2017);
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('y');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        first.keyboard as object as inputMethodEngine.KeyboardController,
        first.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      pressHardKey(controller, 2018);
      releaseHardKey(controller, 2018);
      expect(first.client.journal.join('|')).assertEqual('insert:a|insert:x|insert:b');
      expect(second.client.journal.join('')).assertEqual('insert:y');
      expect(second.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1400
     * @tc.name      testSessionRecovery_014
     * @tc.desc      Verify that two sessions with one journal entry each still differ by command kind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_014 begin');
      InputHandler.getInstance().onInputStop();
      const typing: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('i');
      InputHandler.getInstance().onInputStop();
      const erasing: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteBackward(1);
      expect(typing.client.journal.join('')).assertEqual('insert:i');
      expect(erasing.client.journal.join('')).assertEqual('back:1');
      expect(typing.client.journal.length).assertEqual(1);
      expect(erasing.client.journal.length).assertEqual(1);
      expect(typing.client.backwardLengths.length).assertEqual(0);
      expect(erasing.client.insertedTexts.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1500
     * @tc.name      testSessionRecovery_015
     * @tc.desc      Verify that a session that only hides leaves an empty editor journal behind.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_015 begin');
      InputHandler.getInstance().onInputStop();
      const hidden: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().onInputStop();
      const typing: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('t');
      expect(hidden.keyboard.hideCount).assertEqual(1);
      expect(hidden.client.journal.length).assertEqual(0);
      expect(hidden.client.editorAttributeCount).assertEqual(1);
      expect(typing.client.journal.join('')).assertEqual('insert:t');
      expect(typing.keyboard.hideCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1600
     * @tc.name      testSessionRecovery_016
     * @tc.desc      Verify that two recoveries of one client read two extra attributes and keep one enter type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_016 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(6);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.editorAttributeCount).assertEqual(3);
      expect(harness.client.keyFunctions.join('')).assertEqual('6');
      expect(harness.client.journal.length).assertEqual(1);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1700
     * @tc.name      testSessionRecovery_017
     * @tc.desc      Verify that two started sessions with no commands each read exactly one attribute.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_017 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(2);
      const second: ClientHarness = await createClientHarness(5);
      const reads: number = first.client.editorAttributeCount + second.client.editorAttributeCount;
      expect(reads).assertEqual(2);
      expect(first.client.journal.length).assertEqual(0);
      expect(second.client.journal.length).assertEqual(0);
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1800
     * @tc.name      testSessionRecovery_018
     * @tc.desc      Verify that a refreshed summary after a recovery holds exactly one preview block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_018 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        harness.keyboard as object as inputMethodEngine.KeyboardController,
        harness.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.split('five chars:').length).assertEqual(2);
      expect(summary.indexOf('FWD5') >= 0).assertTrue();
      expect(summary.indexOf('BWD5') >= 0).assertTrue();
      expect(harness.client.editorAttributeCount).assertEqual(2);
      expect(harness.keyboard.hideCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_1900
     * @tc.name      testSessionRecovery_019
     * @tc.desc      Verify that three sessions each forward one enter with their own type in client order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_019 begin');
      InputHandler.getInstance().onInputStop();
      const first: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const second: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().sendKeyFunction();
      InputHandler.getInstance().onInputStop();
      const third: ClientHarness = await createClientHarness(2);
      InputHandler.getInstance().sendKeyFunction();
      expect(first.client.keyFunctions.join('')).assertEqual('0');
      expect(second.client.keyFunctions.join('')).assertEqual('1');
      expect(third.client.keyFunctions.join('')).assertEqual('2');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_2000
     * @tc.name      testSessionRecovery_020
     * @tc.desc      Verify that a forward-delete session and an insert session keep their lists disjoint.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_020 begin');
      InputHandler.getInstance().onInputStop();
      const erasing: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().deleteForward(1);
      InputHandler.getInstance().onInputStop();
      const typing: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().insertText('b');
      expect(erasing.client.forwardLengths.join('')).assertEqual('1');
      expect(erasing.client.insertedTexts.length).assertEqual(0);
      expect(typing.client.insertedTexts.join('')).assertEqual('b');
      expect(typing.client.forwardLengths.length).assertEqual(0);
      expect(erasing.client.journal.length).assertEqual(1);
      expect(typing.client.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_2100
     * @tc.name      testSessionRecovery_021
     * @tc.desc      Verify that five recovery cycles append five numbered payloads to one client journal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_021 begin');
      InputHandler.getInstance().onInputStop();
      const harness: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('c0');
      let i: number = 1;
      while (i < 5) {
        InputHandler.getInstance().onInputStop();
        InputHandler.getInstance().onInputStart(
          harness.keyboard as object as inputMethodEngine.KeyboardController,
          harness.client as object as inputMethodEngine.InputClient);
        await Promise.resolve();
        await Promise.resolve();
        InputHandler.getInstance().insertText('c' + i);
        i = i + 1;
      }
      expect(harness.client.journal.length).assertEqual(5);
      expect(harness.client.insertedTexts.join('|')).assertEqual('c0|c1|c2|c3|c4');
      expect(harness.client.editorAttributeCount).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_SESSION_RECOVERY_2200
     * @tc.name      testSessionRecovery_022
     * @tc.desc      Verify that a quiet session's journal continues after a busy interim session ends.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSessionRecovery_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_022 begin');
      InputHandler.getInstance().onInputStop();
      const quiet: ClientHarness = await createClientHarness(0);
      InputHandler.getInstance().insertText('a');
      InputHandler.getInstance().onInputStop();
      const busy: ClientHarness = await createClientHarness(1);
      InputHandler.getInstance().insertText('x');
      InputHandler.getInstance().deleteBackward(1);
      InputHandler.getInstance().moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().onInputStart(
        quiet.keyboard as object as inputMethodEngine.KeyboardController,
        quiet.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('b');
      expect(quiet.client.insertedTexts.join('')).assertEqual('ab');
      expect(quiet.client.journal.length).assertEqual(2);
      expect(busy.client.journal.length).assertEqual(3);
      expect(quiet.client.editorAttributeCount).assertEqual(2);
      expect(busy.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSessionRecovery_022 end');
      await yieldToEventLoop();
    });

  });
}
