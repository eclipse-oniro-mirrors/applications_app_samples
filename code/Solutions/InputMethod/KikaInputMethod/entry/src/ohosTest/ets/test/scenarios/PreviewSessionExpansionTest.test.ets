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
import { PreviewHarness, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewSessionExpansion]';

export default function previewSessionExpansionTest(): void {
  describe('PreviewSessionExpansionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0001
     * @tc.name      testPreviewSessionExpansion_001
     * @tc.desc      Verify that a preview can open before a deferred editor attribute is resolved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_001 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 3, 0, true, true);

      typeSequence(harness, 'hel');
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(0);
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(3);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0002
     * @tc.name      testPreviewSessionExpansion_002
     * @tc.desc      Verify that a deletion after a preview request on an unsupported editor is still routed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_002 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0, 0, false);
      typeSequence(harness, 'hel');

      InputHandler.getInstance().deleteBackward(2);
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.backwardLengths[0]).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0003
     * @tc.name      testPreviewSessionExpansion_003
     * @tc.desc      Verify that a client switch after a committed preview keeps both buffers separate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_003 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      typeSequence(first, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const committed: string = first.client.buffer;
      const second: PreviewHarness = await createPreviewHarness('');

      InputHandler.getInstance().insertText('a');
      expect(first.client.finishCount).assertEqual(1);
      expect(first.client.buffer).assertEqual(committed);
      expect(second.client.buffer).assertEqual('a');
      expect(second.client.previewCalls.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0004
     * @tc.name      testPreviewSessionExpansion_004
     * @tc.desc      Verify that a hide before enter during a preview keeps both counters independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_004 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 0);
      typeSequence(harness, 'hel');

      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.keyboard.hideCount).assertEqual(1);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0005
     * @tc.name      testPreviewSessionExpansion_005
     * @tc.desc      Verify that a paste during a preview is forwarded and the enter still finishes once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_005 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 4);
      typeSequence(harness, 'hel');

      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.keyFunctions[0]).assertEqual(4);
      expect(harness.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0006
     * @tc.name      testPreviewSessionExpansion_006
     * @tc.desc      Verify that caret-begin works before a deferred attribute resolves and enter still works later.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_006 begin');
      const harness: PreviewHarness = await createPreviewHarness('', 5, 0, true, true);

      await InputHandler.getInstance().moveCursorToBegin();
      expect(harness.client.selectedRanges[0].start).assertEqual(0);
      expect(harness.client.selectedRanges[0].end).assertEqual(0);
      expect(harness.client.finishCount).assertEqual(0);
      harness.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();
      expect(harness.client.keyFunctions[0]).assertEqual(5);
      expect(harness.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0007
     * @tc.name      testPreviewSessionExpansion_007
     * @tc.desc      Verify that a rejected preview leaves only the typed fragment while the next session previews fully.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_007 begin');
      const broken: PreviewHarness = await createPreviewHarness('');
      broken.client.failPreview = true;
      typeSequence(broken, 'hel');
      const healthy: PreviewHarness = await createPreviewHarness('');
      typeSequence(healthy, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const calls: string[] = [broken.client.previewCalls.length.toString(),
        healthy.client.previewCalls.length.toString()];

      expect(calls.join('|')).assertEqual('0|1');
      expect(broken.client.buffer).assertEqual('hel');
      expect(healthy.client.buffer).assertEqual('hello world');
      expect(broken.client.finishCount).assertEqual(0);
      expect(healthy.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0008
     * @tc.name      testPreviewSessionExpansion_008
     * @tc.desc      Verify that three editors with growing prefixes open preview windows one column apart.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_008 begin');
      const bare: PreviewHarness = await createPreviewHarness('');
      typeSequence(bare, 'hel');
      const single: PreviewHarness = await createPreviewHarness('x');
      typeSequence(single, 'hel');
      const double: PreviewHarness = await createPreviewHarness('xy');
      typeSequence(double, 'hel');
      const starts: number[] = [bare.client.previewCalls[0].start, single.client.previewCalls[0].start,
        double.client.previewCalls[0].start];
      const ends: number[] = [bare.client.previewCalls[0].end, single.client.previewCalls[0].end,
        double.client.previewCalls[0].end];

      expect(starts.join('|')).assertEqual('0|1|2');
      expect(ends.join('|')).assertEqual('3|4|5');
      expect(bare.client.buffer).assertEqual('hello world');
      expect(single.client.buffer).assertEqual('xhello world');
      expect(double.client.buffer).assertEqual('xyhello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0009
     * @tc.name      testPreviewSessionExpansion_009
     * @tc.desc      Verify that a commit after a switch is billed to the new session only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_009 begin');
      const earlier: PreviewHarness = await createPreviewHarness('');
      typeSequence(earlier, 'hel');
      const current: PreviewHarness = await createPreviewHarness('', 4);
      InputHandler.getInstance().sendKeyFunction();
      const ledger: string[] = [earlier.client.finishCount.toString(), current.client.finishCount.toString(),
        current.client.keyFunctions[0].toString()];

      expect(ledger.join('|')).assertEqual('0|1|4');
      expect(earlier.client.previewCalls.length).assertEqual(1);
      expect(current.client.previewCalls.length).assertEqual(0);
      expect(earlier.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0010
     * @tc.name      testPreviewSessionExpansion_010
     * @tc.desc      Verify that clearing a fault mid-word restores previewing before the trigger letter lands.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_010 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      first.client.failPreview = true;
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('');
      second.client.failPreview = true;
      InputHandler.getInstance().insertText('h');
      second.client.failPreview = false;
      InputHandler.getInstance().insertText('e');
      InputHandler.getInstance().insertText('l');
      const third: PreviewHarness = await createPreviewHarness('');
      typeSequence(third, 'hel');
      const calls: string[] = [first.client.previewCalls.length.toString(),
        second.client.previewCalls.length.toString(), third.client.previewCalls.length.toString()];

      expect(calls.join('|')).assertEqual('0|1|1');
      expect(second.client.buffer).assertEqual('hello world');
      expect(third.client.buffer).assertEqual('hello world');
      expect(first.client.buffer).assertEqual('hel');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0011
     * @tc.name      testPreviewSessionExpansion_011
     * @tc.desc      Verify that a middle session with a rejected private command does not steal the last session's commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_011 begin');
      const quiet: PreviewHarness = await createPreviewHarness('');
      const noisy: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      const active: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().insertText('k');
      InputHandler.getInstance().sendKeyFunction();
      const commands: string[] = [quiet.client.privateCommandCount.toString(), noisy.client.privateCommandCount.toString(),
        active.client.privateCommandCount.toString()];

      expect(commands.join('|')).assertEqual('1|1|1');
      expect(active.client.buffer).assertEqual('k');
      expect(quiet.client.buffer).assertEqual('');
      expect(noisy.client.buffer).assertEqual('');
      expect(active.client.finishCount).assertEqual(1);
      expect(quiet.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0012
     * @tc.name      testPreviewSessionExpansion_012
     * @tc.desc      Verify that a rejected finish still counts once and a later session commits cleanly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_012 begin');
      const stubborn: PreviewHarness = await createPreviewHarness('', 4);
      stubborn.client.failFinish = true;
      typeSequence(stubborn, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const compliant: PreviewHarness = await createPreviewHarness('', 4);
      typeSequence(compliant, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const finishes: number = stubborn.client.finishCount + compliant.client.finishCount;

      expect(finishes).assertEqual(2);
      expect(stubborn.client.keyFunctions[0]).assertEqual(4);
      expect(compliant.client.keyFunctions[0]).assertEqual(4);
      expect(stubborn.client.buffer).assertEqual('hello world');
      expect(compliant.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0013
     * @tc.name      testPreviewSessionExpansion_013
     * @tc.desc      Verify that a rejected hide stays on its own keyboard while the next session commits normally.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_013 begin');
      const stuck: PreviewHarness = await createPreviewHarness('');
      stuck.keyboard.failHide = true;
      typeSequence(stuck, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      const free: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      typeSequence(free, 'hel');
      InputHandler.getInstance().sendKeyFunction();

      expect(stuck.keyboard.hideCount).assertEqual(1);
      expect(free.keyboard.hideCount).assertEqual(1);
      expect(stuck.client.finishCount).assertEqual(0);
      expect(free.client.finishCount).assertEqual(1);
      expect(free.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0014
     * @tc.name      testPreviewSessionExpansion_014
     * @tc.desc      Verify that diagnostics written in one session reappear in the next session's summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_014 begin');
      const author: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().setSelectInfo('SEL-from-A');
      InputHandler.getInstance().setTextInfo('TXT-from-A');
      const reviewer: PreviewHarness = await createPreviewHarness('cd');
      InputHandler.getInstance().insertText('e');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';

      expect(summary.indexOf('SEL-from-A') >= 0).assertTrue();
      expect(summary.indexOf('TXT-from-A') >= 0).assertTrue();
      expect(summary.indexOf('before：[cde]') >= 0).assertTrue();
      expect(author.client.finishCount).assertEqual(0);
      expect(reviewer.client.insertedTexts.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0015
     * @tc.name      testPreviewSessionExpansion_015
     * @tc.desc      Verify that a still-pending first attribute does not block a second session's preview or commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_015 begin');
      const pending: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      typeSequence(pending, 'hel');
      const ready: PreviewHarness = await createPreviewHarness('', 6);
      typeSequence(ready, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const attributes: string[] = [pending.client.editorAttributeCount.toString(),
        ready.client.editorAttributeCount.toString()];

      expect(attributes.join('|')).assertEqual('1|1');
      expect(pending.client.previewCalls.length).assertEqual(1);
      expect(pending.client.buffer).assertEqual('hello world');
      expect(pending.client.finishCount).assertEqual(0);
      expect(ready.client.finishCount).assertEqual(1);
      expect(ready.client.keyFunctions[0]).assertEqual(6);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0016
     * @tc.name      testPreviewSessionExpansion_016
     * @tc.desc      Verify that a hide-then-commit sequence after a switch keeps each channel on its own session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_016 begin');
      const shown: PreviewHarness = await createPreviewHarness('');
      typeSequence(shown, 'hel');
      const replaced: PreviewHarness = await createPreviewHarness('', 1);
      InputHandler.getInstance().hideKeyboardSelf();
      InputHandler.getInstance().sendKeyFunction();
      const channels: string[] = [shown.keyboard.hideCount.toString(), replaced.keyboard.hideCount.toString(),
        shown.client.finishCount.toString(), replaced.client.finishCount.toString()];

      expect(channels.join('|')).assertEqual('0|1|0|1');
      expect(shown.client.previewCalls.length).assertEqual(1);
      expect(replaced.client.keyFunctions[0]).assertEqual(1);
      expect(replaced.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0017
     * @tc.name      testPreviewSessionExpansion_017
     * @tc.desc      Verify that a deletion in the new session leaves the old preview buffer and call count intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_017 begin');
      const frozen: PreviewHarness = await createPreviewHarness('');
      typeSequence(frozen, 'hel');
      const editor: PreviewHarness = await createPreviewHarness('keep');
      InputHandler.getInstance().deleteBackward(2);
      const calls: string[] = [frozen.client.previewCalls.length.toString(),
        editor.client.previewCalls.length.toString()];

      expect(frozen.client.buffer).assertEqual('hello world');
      expect(frozen.client.finishCount).assertEqual(0);
      expect(editor.client.backwardLengths.join('')).assertEqual('2');
      expect(editor.client.buffer).assertEqual('keep');
      expect(calls.join('|')).assertEqual('1|0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0018
     * @tc.name      testPreviewSessionExpansion_018
     * @tc.desc      Verify that an end selection on a fresh session ignores the previous session's preview cursor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_018 begin');
      const carried: PreviewHarness = await createPreviewHarness('');
      typeSequence(carried, 'hel');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      const fresh: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToEnd();

      expect(carried.client.selectedRanges.length).assertEqual(0);
      expect(fresh.client.selectedRanges.length).assertEqual(1);
      expect(fresh.client.selectedRanges[0].start).assertEqual(0);
      expect(fresh.client.selectedRanges[0].end).assertEqual(1000);
      expect(carried.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0019
     * @tc.name      testPreviewSessionExpansion_019
     * @tc.desc      Verify that two sessions committing with different enter types keep their own typed values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_019 begin');
      const search: PreviewHarness = await createPreviewHarness('', 3);
      typeSequence(search, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const send: PreviewHarness = await createPreviewHarness('', 7);
      typeSequence(send, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const types: number[] = [search.client.keyFunctions[0], send.client.keyFunctions[0]];

      expect(types.join('|')).assertEqual('3|7');
      expect(search.client.finishCount).assertEqual(1);
      expect(send.client.finishCount).assertEqual(1);
      expect(search.client.previewCalls.length).assertEqual(1);
      expect(send.client.previewCalls.length).assertEqual(1);
      expect(send.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0020
     * @tc.name      testPreviewSessionExpansion_020
     * @tc.desc      Verify that an unsupported second editor previews the same window and commits on its own client.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_020 begin');
      const capable: PreviewHarness = await createPreviewHarness('');
      typeSequence(capable, 'hel');
      const limited: PreviewHarness = await createPreviewHarness('', 5, 0, false);
      typeSequence(limited, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const windowEnds: string[] = [capable.client.previewCalls[0].end.toString(),
        limited.client.previewCalls[0].end.toString()];

      expect(windowEnds.join('|')).assertEqual('3|3');
      expect(capable.client.previewCalls[0].text).assertEqual('hello world');
      expect(limited.client.previewCalls[0].text).assertEqual('hello world');
      expect(capable.client.finishCount).assertEqual(0);
      expect(limited.client.finishCount).assertEqual(1);
      expect(limited.client.keyFunctions[0]).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0021
     * @tc.name      testPreviewSessionExpansion_021
     * @tc.desc      Verify that plain, trigger and plain sessions produce a zero-one-zero preview tally.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_021 begin');
      const opening: PreviewHarness = await createPreviewHarness('');
      typeSequence(opening, 'abc');
      const middle: PreviewHarness = await createPreviewHarness('');
      typeSequence(middle, 'hel');
      const closing: PreviewHarness = await createPreviewHarness('');
      typeSequence(closing, 'abc');
      const tally: number[] = [opening.client.previewCalls.length, middle.client.previewCalls.length,
        closing.client.previewCalls.length];

      expect(tally.join('|')).assertEqual('0|1|0');
      expect(opening.client.buffer).assertEqual('abc');
      expect(middle.client.buffer).assertEqual('hello world');
      expect(closing.client.buffer).assertEqual('abc');
      expect(middle.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0022
     * @tc.name      testPreviewSessionExpansion_022
     * @tc.desc      Verify that re-attaching the first editor redirects later typing back to its stored buffer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_022 begin');
      const original: PreviewHarness = await createPreviewHarness('ab');
      typeSequence(original, 'hel');
      const visitor: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('z');
      InputHandler.getInstance().onInputStart(
        original.keyboard as object as inputMethodEngine.KeyboardController,
        original.client as object as inputMethodEngine.InputClient);
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('q');

      expect(original.client.insertedTexts.length).assertEqual(4);
      expect(original.client.buffer).assertEqual('abhello worldq');
      expect(original.client.previewCalls.length).assertEqual(1);
      expect(visitor.client.insertedTexts.join('')).assertEqual('z');
      expect(visitor.client.buffer).assertEqual('z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0023
     * @tc.name      testPreviewSessionExpansion_023
     * @tc.desc      Verify that two failed sessions precede a third session that previews and commits normally.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_023 begin');
      const first: PreviewHarness = await createPreviewHarness('');
      first.client.failPreview = true;
      typeSequence(first, 'hel');
      const second: PreviewHarness = await createPreviewHarness('');
      second.client.failPreview = true;
      typeSequence(second, 'hel');
      const third: PreviewHarness = await createPreviewHarness('');
      typeSequence(third, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const previews: number[] = [first.client.previewCalls.length, second.client.previewCalls.length,
        third.client.previewCalls.length];

      expect(previews.join('|')).assertEqual('0|0|1');
      expect(first.client.buffer).assertEqual('hel');
      expect(second.client.buffer).assertEqual('hel');
      expect(third.client.buffer).assertEqual('hello world');
      expect(third.client.finishCount).assertEqual(1);
      expect(first.client.finishCount + second.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0024
     * @tc.name      testPreviewSessionExpansion_024
     * @tc.desc      Verify that a commit, then a preview left open after a hide, keep the finish count at one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_024 begin');
      const opener: PreviewHarness = await createPreviewHarness('');
      typeSequence(opener, 'hel');
      const closer: PreviewHarness = await createPreviewHarness('');
      typeSequence(closer, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const parked: PreviewHarness = await createPreviewHarness('');
      typeSequence(parked, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      const steps: string[] = [opener.client.finishCount.toString(), closer.client.finishCount.toString(),
        parked.client.finishCount.toString(), parked.keyboard.hideCount.toString()];

      expect(steps.join('|')).assertEqual('0|1|0|1');
      expect(parked.client.previewCalls.length).assertEqual(1);
      expect(parked.client.buffer).assertEqual('hello world');
      expect(closer.client.keyFunctions.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0025
     * @tc.name      testPreviewSessionExpansion_025
     * @tc.desc      Verify that two committing preview sessions followed by two hiding ones split the outcome trace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_025 begin');
      let finishes: number = 0;
      let hides: number = 0;
      const trace: string[] = [];
      for (let round = 0; round < 4; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', 1);
        typeSequence(harness, 'hel');
        if (round < 2) {
          InputHandler.getInstance().sendKeyFunction();
          finishes = finishes + harness.client.finishCount;
          trace.push('f');
        } else {
          InputHandler.getInstance().hideKeyboardSelf();
          hides = hides + harness.keyboard.hideCount;
          trace.push('h');
        }
      }
      const totals: number[] = [finishes, hides];

      expect(trace.join('')).assertEqual('ffhh');
      expect(totals.join('|')).assertEqual('2|2');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0026
     * @tc.name      testPreviewSessionExpansion_026
     * @tc.desc      Verify that prefix-bearing editors keep their own final buffer length after the same trigger.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_026 begin');
      const bare: PreviewHarness = await createPreviewHarness('');
      typeSequence(bare, 'hel');
      const prefixed: PreviewHarness = await createPreviewHarness('abc');
      typeSequence(prefixed, 'hel');
      const single: PreviewHarness = await createPreviewHarness('x');
      typeSequence(single, 'hel');
      const lengths: number[] = [bare.client.buffer.length, prefixed.client.buffer.length,
        single.client.buffer.length];

      expect(lengths.join('|')).assertEqual('11|14|12');
      expect(prefixed.client.buffer).assertEqual('abchello world');
      expect(single.client.buffer).assertEqual('xhello world');
      expect(prefixed.client.previewCalls.length).assertEqual(1);
      expect(single.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0027
     * @tc.name      testPreviewSessionExpansion_027
     * @tc.desc      Verify that a preview opened on a pending editor survives until another session takes the commit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_027 begin');
      const waiting: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      typeSequence(waiting, 'hel');
      const successor: PreviewHarness = await createPreviewHarness('', 3);
      waiting.client.resolveAttribute();
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().sendKeyFunction();

      expect(waiting.client.previewCalls.length).assertEqual(1);
      expect(waiting.client.buffer).assertEqual('hello world');
      expect(waiting.client.finishCount).assertEqual(0);
      expect(successor.client.finishCount).assertEqual(1);
      expect(successor.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0028
     * @tc.name      testPreviewSessionExpansion_028
     * @tc.desc      Verify that a doubly faulted first session still leaves the second session fully editable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_028 begin');
      const muffled: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      muffled.client.failPreview = true;
      typeSequence(muffled, 'hel');
      const audible: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      typeSequence(audible, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const quietCalls: string[] = [muffled.client.previewCalls.length.toString(),
        audible.client.previewCalls.length.toString()];

      expect(quietCalls.join('|')).assertEqual('0|1');
      expect(muffled.client.privateCommandCount).assertEqual(1);
      expect(muffled.client.buffer).assertEqual('hel');
      expect(audible.client.privateCommandCount).assertEqual(1);
      expect(audible.client.buffer).assertEqual('hello world');
      expect(audible.client.finishCount).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0029
     * @tc.name      testPreviewSessionExpansion_029
     * @tc.desc      Verify that an extend action and a tail selection issued in different sessions stay in their channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_029 begin');
      const acting: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      const selecting: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      await InputHandler.getInstance().selectToEnd();

      expect(acting.client.extendActions.length).assertEqual(1);
      expect(acting.client.selectedRanges.length).assertEqual(0);
      expect(selecting.client.selectedRanges.length).assertEqual(1);
      expect(selecting.client.selectedRanges[0].start).assertEqual(0);
      expect(selecting.client.selectedRanges[0].end).assertEqual(1000);
      expect(selecting.client.extendActions.length).assertEqual(0);
      expect(acting.client.finishCount + selecting.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0030
     * @tc.name      testPreviewSessionExpansion_030
     * @tc.desc      Verify that paste and cut issued under two open previews are recorded once on each session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_030 begin');
      const paster: PreviewHarness = await createPreviewHarness('');
      typeSequence(paster, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.PASTE);
      const cutter: PreviewHarness = await createPreviewHarness('');
      typeSequence(cutter, 'hel');
      InputHandler.getInstance().sendExtendAction(inputMethodEngine.ExtendAction.CUT);

      expect(paster.client.extendActions.length).assertEqual(1);
      expect(paster.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.PASTE);
      expect(cutter.client.extendActions.length).assertEqual(1);
      expect(cutter.client.extendActions[0]).assertEqual(inputMethodEngine.ExtendAction.CUT);
      expect(paster.client.buffer).assertEqual('hello world');
      expect(cutter.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0031
     * @tc.name      testPreviewSessionExpansion_031
     * @tc.desc      Verify that a hide on the middle session and an enter on the last one stay one each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_031 begin');
      const opener: PreviewHarness = await createPreviewHarness('');
      typeSequence(opener, 'hel');
      const middle: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const last: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();

      expect(middle.keyboard.hideCount).assertEqual(1);
      expect(opener.keyboard.hideCount).assertEqual(0);
      expect(last.keyboard.hideCount).assertEqual(0);
      expect(last.client.finishCount).assertEqual(1);
      expect(opener.client.finishCount).assertEqual(0);
      expect(last.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0032
     * @tc.name      testPreviewSessionExpansion_032
     * @tc.desc      Verify that successive attachments publish their own input patterns in attach order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_032 begin');
      await createPreviewHarness('', 0, 1);
      const firstPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      await createPreviewHarness('', 0, 4);
      const secondPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      const published: number[] = [firstPattern, secondPattern];

      expect(published.join('|')).assertEqual('1|4');
      expect(AppStorage.get<number>('inputPattern')).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0033
     * @tc.name      testPreviewSessionExpansion_033
     * @tc.desc      Verify that the prefix trigger and the terminal trigger open previews at different offsets across sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_033 begin');
      const prefixed: PreviewHarness = await createPreviewHarness('ab');
      typeSequence(prefixed, 'hel');
      const seeded: PreviewHarness = await createPreviewHarness('he');
      InputHandler.getInstance().insertText('l');
      const offsets: number[] = [prefixed.client.previewCalls[0].start, seeded.client.previewCalls[0].start];

      expect(offsets.join('|')).assertEqual('2|0');
      expect(prefixed.client.previewCalls[0].end).assertEqual(5);
      expect(seeded.client.previewCalls[0].end).assertEqual(3);
      expect(prefixed.client.buffer).assertEqual('abhello world');
      expect(seeded.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0034
     * @tc.name      testPreviewSessionExpansion_034
     * @tc.desc      Verify that alternating trigger and plain sessions raise a cumulative preview checkpoint at every other attach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_034 begin');
      let running: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 6; round++) {
        const harness: PreviewHarness = await createPreviewHarness('');
        if (round % 2 === 0) {
          typeSequence(harness, 'hel');
        } else {
          typeSequence(harness, 'abc');
        }
        running = running + harness.client.previewCalls.length;
        checkpoints.push(running);
      }

      expect(checkpoints.join('|')).assertEqual('1|1|2|2|3|3');
      expect(running).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0035
     * @tc.name      testPreviewSessionExpansion_035
     * @tc.desc      Verify that three sessions which hide before committing record one hide and one finish each.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_035 begin');
      const records: string[] = [];
      for (let round = 0; round < 3; round++) {
        const harness: PreviewHarness = await createPreviewHarness('', round + 1);
        typeSequence(harness, 'hel');
        InputHandler.getInstance().hideKeyboardSelf();
        InputHandler.getInstance().sendKeyFunction();
        records.push(harness.keyboard.hideCount.toString() + ':' + harness.client.finishCount.toString());
      }

      expect(records.join('|')).assertEqual('1:1|1:1|1:1');
      expect(records.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_035 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0036
     * @tc.name      testPreviewSessionExpansion_036
     * @tc.desc      Verify that a three-level attach chain charges the only commit to the newest session.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_036 begin');
      const oldest: PreviewHarness = await createPreviewHarness('');
      typeSequence(oldest, 'hel');
      const middle: PreviewHarness = await createPreviewHarness('', 1);
      const newest: PreviewHarness = await createPreviewHarness('', 8);
      InputHandler.getInstance().sendKeyFunction();
      const finishes: number = oldest.client.finishCount + middle.client.finishCount + newest.client.finishCount;

      expect(finishes).assertEqual(1);
      expect(newest.client.finishCount).assertEqual(1);
      expect(newest.client.keyFunctions[0]).assertEqual(8);
      expect(middle.client.keyFunctions.length).assertEqual(0);
      expect(oldest.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_036 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0037
     * @tc.name      testPreviewSessionExpansion_037
     * @tc.desc      Verify that a preview cursor and an empty session cursor produce different begin ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_037 begin');
      const previewed: PreviewHarness = await createPreviewHarness('');
      typeSequence(previewed, 'hel');
      await InputHandler.getInstance().selectToBegin();
      InputHandler.getInstance().setCursorInfo({ x: 0, y: 0, height: 0 });
      const sparse: PreviewHarness = await createPreviewHarness('');
      await InputHandler.getInstance().selectToBegin();

      expect(previewed.client.selectedRanges[0].end).assertEqual(10);
      expect(sparse.client.selectedRanges[0].start).assertEqual(0);
      expect(sparse.client.selectedRanges[0].end).assertEqual(0);
      expect(previewed.client.selectedRanges.length).assertEqual(1);
      expect(previewed.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_037 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0038
     * @tc.name      testPreviewSessionExpansion_038
     * @tc.desc      Verify that normal, rejected and normal private commands total three while the last session edits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_038 begin');
      const plain: PreviewHarness = await createPreviewHarness('');
      const rejected: PreviewHarness = await createPreviewHarness('', 0, 0, true, false, true);
      const working: PreviewHarness = await createPreviewHarness('', 0);
      typeSequence(working, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const commands: number = plain.client.privateCommandCount + rejected.client.privateCommandCount +
        working.client.privateCommandCount;

      expect(commands).assertEqual(3);
      expect(working.client.previewCalls.length).assertEqual(1);
      expect(working.client.buffer).assertEqual('hello world');
      expect(working.client.finishCount).assertEqual(1);
      expect(rejected.client.buffer).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_038 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0039
     * @tc.name      testPreviewSessionExpansion_039
     * @tc.desc      Verify that a hidden preview in one session and a committed preview in the next keep separate counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_039 begin');
      const concealed: PreviewHarness = await createPreviewHarness('');
      typeSequence(concealed, 'hel');
      InputHandler.getInstance().hideKeyboardSelf();
      const confirmed: PreviewHarness = await createPreviewHarness('');
      typeSequence(confirmed, 'hel');
      InputHandler.getInstance().sendKeyFunction();

      expect(concealed.keyboard.hideCount).assertEqual(1);
      expect(confirmed.keyboard.hideCount).assertEqual(0);
      expect(concealed.client.finishCount).assertEqual(0);
      expect(confirmed.client.finishCount).assertEqual(1);
      expect(concealed.client.previewCalls.length).assertEqual(1);
      expect(confirmed.client.previewCalls.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_039 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0040
     * @tc.name      testPreviewSessionExpansion_040
     * @tc.desc      Verify that an unresolved first attach does not disturb the second and third session attributes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_040 begin');
      const abandoned: PreviewHarness = await createPreviewHarness('', 0, 0, true, true);
      const second: PreviewHarness = await createPreviewHarness('', 9);
      const third: PreviewHarness = await createPreviewHarness('', 5);
      InputHandler.getInstance().sendKeyFunction();
      const attributes: number[] = [abandoned.client.editorAttributeCount, second.client.editorAttributeCount,
        third.client.editorAttributeCount];

      expect(attributes.join('|')).assertEqual('1|1|1');
      expect(AppStorage.get<number>('enterKeyType')).assertEqual(5);
      expect(third.client.keyFunctions[0]).assertEqual(5);
      expect(third.client.finishCount).assertEqual(1);
      expect(abandoned.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_040 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0041
     * @tc.name      testPreviewSessionExpansion_041
     * @tc.desc      Verify that four plain sessions each accept three characters without opening a preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_041 begin');
      let inserted: number = 0;
      let previews: number = 0;
      const checkpoints: number[] = [];
      for (let round = 0; round < 4; round++) {
        const harness: PreviewHarness = await createPreviewHarness('abc');
        typeSequence(harness, 'abc');
        inserted = inserted + harness.client.insertedTexts.length;
        previews = previews + harness.client.previewCalls.length;
        if (round === 1 || round === 3) {
          checkpoints.push(inserted);
        }
      }

      expect(inserted).assertEqual(12);
      expect(previews).assertEqual(0);
      expect(checkpoints.join('|')).assertEqual('6|12');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_041 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0042
     * @tc.name      testPreviewSessionExpansion_042
     * @tc.desc      Verify that a zero forward deletion then a single insertion belongs to the middle session only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_042 begin');
      const untouched: PreviewHarness = await createPreviewHarness('');
      typeSequence(untouched, 'hel');
      const middle: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().deleteForward(0);
      InputHandler.getInstance().insertText('m');
      const closer: PreviewHarness = await createPreviewHarness('', 2);
      InputHandler.getInstance().sendKeyFunction();

      expect(untouched.client.previewCalls.length).assertEqual(1);
      expect(untouched.client.finishCount).assertEqual(0);
      expect(middle.client.forwardLengths.length).assertEqual(1);
      expect(middle.client.buffer).assertEqual('m');
      expect(closer.client.finishCount).assertEqual(1);
      expect(closer.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_042 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0043
     * @tc.name      testPreviewSessionExpansion_043
     * @tc.desc      Verify that commit, hide and a fresh preview issued in that order land on three different sessions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_043 begin');
      const committer: PreviewHarness = await createPreviewHarness('', 2);
      typeSequence(committer, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const hider: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().hideKeyboardSelf();
      const latecomer: PreviewHarness = await createPreviewHarness('', 3);
      typeSequence(latecomer, 'hel');
      const ordered: number[] = [committer.client.finishCount, hider.keyboard.hideCount,
        latecomer.client.previewCalls.length];

      expect(ordered.join('|')).assertEqual('1|1|1');
      expect(hider.client.previewCalls.length).assertEqual(0);
      expect(latecomer.client.finishCount).assertEqual(0);
      expect(committer.client.keyFunctions[0]).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_043 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0044
     * @tc.name      testPreviewSessionExpansion_044
     * @tc.desc      Verify that two sessions sharing an enter type still publish and commit their own input patterns.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_044 begin');
      const first: PreviewHarness = await createPreviewHarness('', 4, 1);
      const firstPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      typeSequence(first, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const second: PreviewHarness = await createPreviewHarness('', 4, 2);
      const secondPattern: number = AppStorage.get<number>('inputPattern') ?? -1;
      typeSequence(second, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const patterns: number[] = [firstPattern, secondPattern];
      const types: number[] = [first.client.keyFunctions[0], second.client.keyFunctions[0]];

      expect(patterns.join('|')).assertEqual('1|2');
      expect(types.join('|')).assertEqual('4|4');
      expect(first.client.finishCount).assertEqual(1);
      expect(second.client.finishCount).assertEqual(1);
      expect(second.client.buffer).assertEqual('hello world');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_044 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_SESSION_0045
     * @tc.name      testPreviewSessionExpansion_045
     * @tc.desc      Verify that an unsupported middle session previews without committing while the third commits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewSessionExpansion_045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_045 begin');
      const quiet: PreviewHarness = await createPreviewHarness('', 1);
      typeSequence(quiet, 'hel');
      const limited: PreviewHarness = await createPreviewHarness('', 2, 0, false);
      typeSequence(limited, 'hel');
      const committer: PreviewHarness = await createPreviewHarness('', 3);
      typeSequence(committer, 'hel');
      InputHandler.getInstance().sendKeyFunction();
      const finishTotal: number = quiet.client.finishCount + limited.client.finishCount +
        committer.client.finishCount;
      const previews: number[] = [quiet.client.previewCalls.length, limited.client.previewCalls.length,
        committer.client.previewCalls.length];

      expect(finishTotal).assertEqual(1);
      expect(previews.join('|')).assertEqual('1|1|1');
      expect(limited.client.buffer).assertEqual('hello world');
      expect(limited.client.finishCount).assertEqual(0);
      expect(committer.client.keyFunctions[0]).assertEqual(3);
      expect(quiet.client.finishCount).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSessionExpansion_045 end');
      await yieldToEventLoop();
    });

  });
}
