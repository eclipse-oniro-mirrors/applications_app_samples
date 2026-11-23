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
import { PreviewHarness, createPreviewHarness } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodSummaryStructure]';

function summary(): string {
  return AppStorage.get<string>('showLog') ?? '';
}

export default function summaryStructureTest(): void {
  describe('SummaryStructureTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_STRUCTURE_0001
     * @tc.name      testSummaryStructure_001
     * @tc.desc      Verify that the forward preview text precedes the backward preview text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryStructure_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_001 begin');
      await createPreviewHarness('abcdefghij');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split(String.fromCharCode(10));
      expect(lines[0].indexOf('five chars:')).assertEqual(0);
      expect(lines[0].indexOf('abcde') >= 0).assertTrue();
      expect(lines[0].indexOf('fghij') > lines[0].indexOf('abcde')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_STRUCTURE_0002
     * @tc.name      testSummaryStructure_002
     * @tc.desc      Verify that select, text and input diagnostics keep that order after the preview.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryStructure_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_002 begin');
      await createPreviewHarness('abc');
      InputHandler.getInstance().setSelectInfo('select-A');
      InputHandler.getInstance().setTextInfo('text-B');
      InputHandler.getInstance().setInputInfo('input-C');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split(String.fromCharCode(10));
      expect(lines[2]).assertEqual('select-A');
      expect(lines[3]).assertEqual('text-B');
      expect(lines[4]).assertEqual('input-C');
      expect(lines[0].indexOf('five chars:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_STRUCTURE_0003
     * @tc.name      testSummaryStructure_003
     * @tc.desc      Verify that a longer buffer updates both five-character preview windows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryStructure_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_003 begin');
      const harness: PreviewHarness = await createPreviewHarness('abcdefghij');
      InputHandler.getInstance().insertText('k');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const previewLine: string = summary().split(String.fromCharCode(10))[0];
      expect(harness.client.buffer).assertEqual('abcdefghijk');
      expect(previewLine.indexOf('abcde') >= 0).assertTrue();
      expect(previewLine.indexOf('ghijk') >= 0).assertTrue();
      expect(previewLine.indexOf('fghij')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_STRUCTURE_0004
     * @tc.name      testSummaryStructure_004
     * @tc.desc      Verify that three identical markers appear at three increasing positions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryStructure_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_004 begin');
      await createPreviewHarness('abc');
      InputHandler.getInstance().setSelectInfo('repeat-mark');
      InputHandler.getInstance().setTextInfo('repeat-mark');
      InputHandler.getInstance().setInputInfo('repeat-mark');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split(String.fromCharCode(10));
      expect(lines.slice(2, 5).join('|')).assertEqual('repeat-mark|repeat-mark|repeat-mark');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_STRUCTURE_0005
     * @tc.name      testSummaryStructure_005
     * @tc.desc      Verify that Unicode diagnostics preserve the three-field summary order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryStructure_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_005 begin');
      await createPreviewHarness('abc');
      const diagnostics: string[] = ['选区', '文本', '输入'];
      InputHandler.getInstance().setSelectInfo(diagnostics[0]);
      InputHandler.getInstance().setTextInfo(diagnostics[1]);
      InputHandler.getInstance().setInputInfo(diagnostics[2]);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split(String.fromCharCode(10));
      expect(lines.slice(2, 5).join('|')).assertEqual(diagnostics.join('|'));
      expect(lines[0].indexOf('five chars:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryStructure_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0001
     * @tc.name      testSummaryExtra_001
     * @tc.desc      Verify that an empty editor reports two empty five-character windows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_001 begin');
      await createPreviewHarness('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const line: string = summary().split(String.fromCharCode(10))[0];
      expect(line.indexOf('before：[]') >= 0).assertTrue();
      expect(line.indexOf('after：[]') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0002
     * @tc.name      testSummaryExtra_002
     * @tc.desc      Verify that a four-character buffer fills both windows with the same text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_002 begin');
      await createPreviewHarness('abcd');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const line: string = summary().split(String.fromCharCode(10))[0];
      expect(line.split('abcd').length - 1).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0003
     * @tc.name      testSummaryExtra_003
     * @tc.desc      Verify that a twelve-character buffer splits into its first and last five units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_003 begin');
      await createPreviewHarness('abcdefghijkl');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const line: string = summary().split(String.fromCharCode(10))[0];
      expect(line.indexOf('abcde') >= 0).assertTrue();
      expect(line.indexOf('hijkl') >= 0).assertTrue();
      expect(line.indexOf('hijkl') > line.indexOf('abcde')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0004
     * @tc.name      testSummaryExtra_004
     * @tc.desc      Verify that an empty selection value leaves its summary line blank.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_004 begin');
      await createPreviewHarness('');
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('T1');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const lines: string[] = summary().split(String.fromCharCode(10));
      expect(lines[2]).assertEqual('');
      expect(lines[3]).assertEqual('T1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0005
     * @tc.name      testSummaryExtra_005
     * @tc.desc      Verify that an input-only diagnostic occupies the final summary line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_005 begin');
      await createPreviewHarness('');
      InputHandler.getInstance().setInputInfo('ONLY-INPUT');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().endsWith('ONLY-INPUT')).assertTrue();
      expect(summary().split(String.fromCharCode(10)).length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0006
     * @tc.name      testSummaryExtra_006
     * @tc.desc      Verify that a newline inside the selection value adds a physical summary line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_006 begin');
      await createPreviewHarness('');
      InputHandler.getInstance().setSelectInfo('A' + String.fromCharCode(10) + 'B');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const lines: string[] = summary().split(String.fromCharCode(10));
      expect(lines.length).assertEqual(6);
      expect(lines[2]).assertEqual('A');
      expect(lines[3]).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0007
     * @tc.name      testSummaryExtra_007
     * @tc.desc      Verify that a two-line text value keeps the input field after both lines.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_007 begin');
      await createPreviewHarness('');
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('X' + String.fromCharCode(10) + 'Y');
      InputHandler.getInstance().setInputInfo('TAIL');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const lines: string[] = summary().split(String.fromCharCode(10));
      expect(lines[3]).assertEqual('X');
      expect(lines[4]).assertEqual('Y');
      expect(lines[5]).assertEqual('TAIL');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0008
     * @tc.name      testSummaryExtra_008
     * @tc.desc      Verify that emoji diagnostics survive the summary round trip unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_008 begin');
      await createPreviewHarness('');
      InputHandler.getInstance().setSelectInfo('S' + String.fromCharCode(0x1F600));
      InputHandler.getInstance().setTextInfo('T' + String.fromCharCode(0x1F601));
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf(String.fromCharCode(0x1F600)) >= 0).assertTrue();
      expect(summary().indexOf(String.fromCharCode(0x1F601)) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0009
     * @tc.name      testSummaryExtra_009
     * @tc.desc      Verify that setting the selection twice leaves only the newest value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_009 begin');
      await createPreviewHarness('');
      InputHandler.getInstance().setSelectInfo('OLD');
      InputHandler.getInstance().setSelectInfo('NEW');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf('OLD')).assertEqual(-1);
      expect(summary().split(String.fromCharCode(10))[2]).assertEqual('NEW');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0010
     * @tc.name      testSummaryExtra_010
     * @tc.desc      Verify that two refreshes without edits produce the same summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_010 begin');
      await createPreviewHarness('abcde');
      InputHandler.getInstance().setInputInfo('KEEP');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const first: string = summary();
      InputHandler.getInstance().refreshInfo();
      expect(summary()).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0011
     * @tc.name      testSummaryExtra_011
     * @tc.desc      Verify that an insertion between refreshes updates the five-character window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      InputHandler.getInstance().insertText('abcde');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf('abcde') >= 0).assertTrue();
      expect(harness.client.buffer).assertEqual('abcde');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0012
     * @tc.name      testSummaryExtra_012
     * @tc.desc      Verify that hiding the keyboard does not rewrite the last summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_012 begin');
      const harness: PreviewHarness = await createPreviewHarness('hello');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const before: string = summary();
      InputHandler.getInstance().hideKeyboardSelf();
      expect(summary()).assertEqual(before);
      expect(harness.keyboard.hideCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0013
     * @tc.name      testSummaryExtra_013
     * @tc.desc      Verify that entering text does not append to the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_013 begin');
      const harness: PreviewHarness = await createPreviewHarness('hel');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const count: number = summary().split(String.fromCharCode(10)).length;
      InputHandler.getInstance().sendKeyFunction();
      expect(summary().split(String.fromCharCode(10)).length).assertEqual(count);
      expect(harness.client.finishCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0014
     * @tc.name      testSummaryExtra_014
     * @tc.desc      Verify that a new editor overwrites the window text of the previous editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_014 begin');
      await createPreviewHarness('oldold');
      await createPreviewHarness('newnew');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const line: string = summary().split(String.fromCharCode(10))[0];
      expect(line.indexOf('newne') >= 0).assertTrue();
      expect(line.indexOf('oldol')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0015
     * @tc.name      testSummaryExtra_015
     * @tc.desc      Verify that a shorter replacement editor leaves no tail of the longer one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_015 begin');
      await createPreviewHarness('abcdefghij');
      await createPreviewHarness('xy');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const line: string = summary().split(String.fromCharCode(10))[0];
      expect(line.includes('xy')).assertTrue();
      expect(line.includes('abcde')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SUMMARY_EXTRA_0016
     * @tc.name      testSummaryExtra_016
     * @tc.desc      Verify that pattern values do not appear in the refreshed summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSummaryExtra_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_016 begin');
      await createPreviewHarness('', 0, 7);
      InputHandler.getInstance().setInputInfo('P7');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      expect(summary().indexOf('P7') >= 0).assertTrue();
      expect(summary().indexOf('inputPattern')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummaryExtra_016 end');
      await yieldToEventLoop();
    });

  });
}
