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
import { createPreviewHarness, PreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPrivateCommand]';

export default function privateCommandTest(): void {
  describe('PrivateCommandTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0001
     * @tc.name      testPrivateCommandTest_001
     * @tc.desc      Verify that attaching sends one private command carrying the underline preview style.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommandTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');

      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.privateCommands.length).assertEqual(1);
      expect(harness.client.privateCommands[0]['previewTextStyle']).assertEqual('underline');
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0002
     * @tc.name      testPrivateCommandTest_002
     * @tc.desc      Verify that editor operations after attach send no additional private commands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommandTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('abc');
      const handler: InputHandler = InputHandler.getInstance();

      handler.insertText('d');
      handler.deleteBackward(1);
      handler.moveCursor(inputMethodEngine.Direction.CURSOR_LEFT);
      handler.sendKeyFunction();
      handler.hideKeyboardSelf();

      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.privateCommands.length).assertEqual(1);
      expect(harness.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0003
     * @tc.name      testPrivateCommandTest_003
     * @tc.desc      Verify that re-attaching sends a fresh private command to the new editor only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommandTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_003 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      const second: PreviewHarness = await createPreviewHarness('');

      expect(first.client.privateCommandCount).assertEqual(1);
      expect(second.client.privateCommandCount).assertEqual(1);
      expect(second.client.privateCommands[0]['previewTextStyle']).assertEqual('underline');
      expect(second.client.editorAttributeCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0004
     * @tc.name      testPrivateCommandTest_004
     * @tc.desc      Verify that the preview command payload has exactly one non-empty string entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommandTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const payload: Record<string, inputMethodEngine.CommandDataType> = harness.client.privateCommands[0];
      const keys: string[] = Object.keys(payload);

      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('previewTextStyle');
      expect((payload[keys[0]] as string).length > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommandTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0500
     * @tc.name      testPrivateCommand_005
     * @tc.desc      Verify that a rejected private command still counts once and does not block typing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      InputHandler.getInstance().insertText('a');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0600
     * @tc.name      testPrivateCommand_006
     * @tc.desc      Verify that an unsupported preview editor still receives one underline command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.privateCommands[0]['previewTextStyle']).assertEqual('underline');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0700
     * @tc.name      testPrivateCommand_007
     * @tc.desc      Verify that three alternating editors each receive their own command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_007 begin');
      const first: PreviewHarness = await createPreviewHarness('', 1);
      const second: PreviewHarness = await createPreviewHarness('', 2);
      const third: PreviewHarness = await createPreviewHarness('', 3);
      expect(first.client.privateCommandCount).assertEqual(1);
      expect(second.client.privateCommandCount).assertEqual(1);
      expect(third.client.privateCommandCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0800
     * @tc.name      testPrivateCommand_008
     * @tc.desc      Verify that the command payload exposes only the preview style key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const payload: Record<string, inputMethodEngine.CommandDataType> = harness.client.privateCommands[0];
      expect(payload['previewTextStyle']).assertEqual('underline');
      expect(payload['fontSize']).assertEqual(undefined);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_0900
     * @tc.name      testPrivateCommand_009
     * @tc.desc      Verify that mutating an old payload does not leak into a later attach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_009 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      first.client.privateCommands[0]['previewTextStyle'] = 'strike';
      const second: PreviewHarness = await createPreviewHarness('');
      expect(second.client.privateCommands[0]['previewTextStyle']).assertEqual('underline');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1000
     * @tc.name      testPrivateCommand_010
     * @tc.desc      Verify that a numeric pattern attach still sends exactly one command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_010 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 9);
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.privateCommands.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1100
     * @tc.name      testPrivateCommand_011
     * @tc.desc      Verify that the command count is unchanged by an enter request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 7);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1200
     * @tc.name      testPrivateCommand_012
     * @tc.desc      Verify that hiding the keyboard sends no second private command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1300
     * @tc.name      testPrivateCommand_013
     * @tc.desc      Verify that an insertion after attach leaves the command count untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('k');
      InputHandler.getInstance().insertText('l');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('kl');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1400
     * @tc.name      testPrivateCommand_014
     * @tc.desc      Verify that a deferred attach sends its command before the attribute settles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_014 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.editorAttributeCount).assertEqual(1);
      harness.client.resolveAttribute();
      await Promise.resolve();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1500
     * @tc.name      testPrivateCommand_015
     * @tc.desc      Verify that opening a preview adds no private command after attach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_015 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      typeSequence(harness, 'hel');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.previewCalls.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1600
     * @tc.name      testPrivateCommand_016
     * @tc.desc      Verify that a failing finish leaves the private command count at one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_016 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      harness.client.failFinish = true;
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1700
     * @tc.name      testPrivateCommand_017
     * @tc.desc      Verify that a begin selection after attach adds no private command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_017 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToBegin();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.selectedRanges.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1800
     * @tc.name      testPrivateCommand_018
     * @tc.desc      Verify that an empty insertion after attach keeps one command and one editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_018 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('');
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_2000
     * @tc.name      testPrivateCommand_020
     * @tc.desc      Verify that a zero-length backward deletion adds no private command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_020 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteBackward(0);
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_COMMAND_1900
     * @tc.name      testPrivateCommand_019
     * @tc.desc      Verify that an end selection after attach adds no private command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivateCommand_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_019 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToEnd();
      expect(harness.client.privateCommandCount).assertEqual(1);
      expect(harness.client.selectedRanges[0].end).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivateCommand_019 end');
      await yieldToEventLoop();
    });

  });

}
