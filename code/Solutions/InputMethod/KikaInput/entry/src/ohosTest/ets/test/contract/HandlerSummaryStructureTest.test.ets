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
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { createClientHarness } from '../support/ClientHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputHandlerSummaryStructure]';

function summary(): string {
  return AppStorage.get<string>('showLog') ?? '';
}

export default function HandlerSummaryStructureTestTest(): void {
  describe('HandlerSummaryStructureTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_STRUCTURE_0100
     * @tc.name      testHandlerSummaryStructure_001
     * @tc.desc      Verify that the preview block leads the summary and the diagnostics follow it in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryStructure_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_001 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('sel-first');
      InputHandler.getInstance().setTextInfo('text-second');
      InputHandler.getInstance().setInputInfo('input-third');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const previewAt: number = text.indexOf('five chars:');
      const selectAt: number = text.indexOf('sel-first');
      const textAt: number = text.indexOf('text-second');
      const inputAt: number = text.indexOf('input-third');
      expect(previewAt).assertEqual(0);
      expect(selectAt > previewAt).assertTrue();
      expect(textAt > selectAt).assertTrue();
      expect(inputAt > textAt).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_STRUCTURE_0200
     * @tc.name      testHandlerSummaryStructure_002
     * @tc.desc      Verify that both five-character preview probes keep their bracket format.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryStructure_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_002 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('before：[FWD5];after：[BWD5]') >= 0).assertTrue();
      expect(text.indexOf('FWD5') < text.indexOf('BWD5')).assertTrue();
      expect(text.indexOf('five chars:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_STRUCTURE_0300
     * @tc.name      testHandlerSummaryStructure_003
     * @tc.desc      Verify that a detached handler omits the preview but keeps the diagnostic order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryStructure_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_003 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('detached-select');
      InputHandler.getInstance().setTextInfo('detached-text');
      InputHandler.getInstance().setInputInfo('detached-input');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('five chars:')).assertEqual(-1);
      expect(text.indexOf('detached-select') < text.indexOf('detached-text')).assertTrue();
      expect(text.indexOf('detached-text') < text.indexOf('detached-input')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_STRUCTURE_0400
     * @tc.name      testHandlerSummaryStructure_004
     * @tc.desc      Verify that the same marker in three fields occupies three increasing positions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryStructure_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_004 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('same-marker');
      InputHandler.getInstance().setTextInfo('same-marker');
      InputHandler.getInstance().setInputInfo('same-marker');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const first: number = text.indexOf('same-marker');
      const second: number = text.indexOf('same-marker', first + 1);
      const third: number = text.indexOf('same-marker', second + 1);
      expect(first >= 0).assertTrue();
      expect(second > first).assertTrue();
      expect(third > second).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_STRUCTURE_0500
     * @tc.name      testHandlerSummaryStructure_005
     * @tc.desc      Verify that Unicode diagnostics keep the same three-field order in the summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryStructure_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_005 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('选区');
      InputHandler.getInstance().setTextInfo('文本');
      InputHandler.getInstance().setInputInfo('输入');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('选区') < text.indexOf('文本')).assertTrue();
      expect(text.indexOf('文本') < text.indexOf('输入')).assertTrue();
      expect(text.indexOf('five chars:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryStructure_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0100
     * @tc.name      testHandlerSummaryFrame_001
     * @tc.desc      Verify that the preview block is the exact first line of an attached summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_001 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines.length).assertEqual(5);
      expect(lines[0]).assertEqual('five chars: before：[FWD5];after：[BWD5]');
      expect(lines[0].indexOf('five chars:')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0200
     * @tc.name      testHandlerSummaryFrame_002
     * @tc.desc      Verify that empty diagnostic fields still occupy their three trailing lines.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_002 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines[2]).assertEqual('');
      expect(lines[3]).assertEqual('');
      expect(lines[4]).assertEqual('');
      expect(lines[1]).assertEqual('[object Object]');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0300
     * @tc.name      testHandlerSummaryFrame_003
     * @tc.desc      Verify the exact four-line shape of a detached summary with no diagnostics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_003 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const lines: string[] = text.split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('[object Object]');
      expect(text.indexOf('five chars:')).assertEqual(-1);
      expect(text.endsWith('\n')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0400
     * @tc.name      testHandlerSummaryFrame_004
     * @tc.desc      Verify that the cursor placeholder occurs exactly once in an attached summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_004 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('sel');
      InputHandler.getInstance().setTextInfo('text');
      InputHandler.getInstance().setInputInfo('input');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const marker: string = '[object Object]';
      let occurrences: number = 0;
      let cursor: number = text.indexOf(marker);
      while (cursor >= 0) {
        occurrences = occurrences + 1;
        cursor = text.indexOf(marker, cursor + marker.length);
      }
      expect(occurrences).assertEqual(1);
      expect(text.indexOf(marker) < text.indexOf('sel')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0500
     * @tc.name      testHandlerSummaryFrame_005
     * @tc.desc      Verify that a newline inside the selection field adds a physical line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_005 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('L1\nL2');
      InputHandler.getInstance().setTextInfo('T');
      InputHandler.getInstance().setInputInfo('I');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines.length).assertEqual(5);
      expect(lines[1]).assertEqual('L1');
      expect(lines[2]).assertEqual('L2');
      expect(lines[3]).assertEqual('T');
      expect(lines[4]).assertEqual('I');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0600
     * @tc.name      testHandlerSummaryFrame_006
     * @tc.desc      Verify that a preview marker inside the selection text produces a second occurrence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_006 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('copy of five chars: here');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const first: number = text.indexOf('five chars:');
      const second: number = text.indexOf('five chars:', first + 1);
      expect(first).assertEqual(0);
      expect(second > first).assertTrue();
      expect(second - text.indexOf('copy of')).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0700
     * @tc.name      testHandlerSummaryFrame_007
     * @tc.desc      Verify that refreshing overwrites a stale summary instead of appending to it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_007 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('fresh');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', 'stale-value');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('stale-value')).assertEqual(-1);
      expect(text.indexOf('fresh') >= 0).assertTrue();
      expect(text.split('\n').length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0800
     * @tc.name      testHandlerSummaryFrame_008
     * @tc.desc      Verify that the summary is assembled with bare line feeds only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_008 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('cr-check');
      InputHandler.getInstance().setTextInfo('text');
      InputHandler.getInstance().setInputInfo('input');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('\r')).assertEqual(-1);
      expect(text.indexOf('\n') >= 0).assertTrue();
      expect(text.split('\r').length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_0900
     * @tc.name      testHandlerSummaryFrame_009
     * @tc.desc      Verify the exact editor-info line published by an attach with type three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_009 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(3);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('EditorInfo：enterKeyType = 3;inputPattern = 0') >= 0).assertTrue();
      expect(text.indexOf('EditorInfo：')).assertEqual(text.lastIndexOf('EditorInfo：'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1000
     * @tc.name      testHandlerSummaryFrame_010
     * @tc.desc      Verify that a manual input diagnostic overwrites the automatic editor-info line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_010 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(3);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('manual-input');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('EditorInfo：')).assertEqual(-1);
      expect(text.endsWith('manual-input')).assertTrue();
      expect(text.indexOf('manual-input') > text.indexOf('[object Object]')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1100
     * @tc.name      testHandlerSummaryFrame_011
     * @tc.desc      Verify that an input value found inside the text value sits after the text start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_011 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('alpha-beta');
      InputHandler.getInstance().setInputInfo('beta');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const textAt: number = text.indexOf('alpha-beta');
      const inputAt: number = text.indexOf('beta');
      expect(inputAt > textAt).assertTrue();
      expect(text.lastIndexOf('beta') > inputAt).assertTrue();
      expect(text.endsWith('beta')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1200
     * @tc.name      testHandlerSummaryFrame_012
     * @tc.desc      Verify that leading and trailing spaces in a diagnostic line are preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_012 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('  padded  ');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const line: string = summary().split('\n')[1];
      expect(line).assertEqual('  padded  ');
      expect(line.trim()).assertEqual('padded');
      expect(line.length - line.trim().length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1300
     * @tc.name      testHandlerSummaryFrame_013
     * @tc.desc      Verify that a tab inside a diagnostic line is kept as its own code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_013 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('A\tB');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const line: string = summary().split('\n')[1];
      expect(line).assertEqual('A\tB');
      expect(line.length).assertEqual(3);
      expect(line.charCodeAt(1)).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1400
     * @tc.name      testHandlerSummaryFrame_014
     * @tc.desc      Verify that a detached summary keeps the text value on its third line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_014 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('T');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[1]).assertEqual('');
      expect(lines[2]).assertEqual('T');
      expect(lines[3]).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1500
     * @tc.name      testHandlerSummaryFrame_015
     * @tc.desc      Verify that the editor-info line carries both the enter type and the input pattern.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_015 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(4, 7);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('enterKeyType = 4') >= 0).assertTrue();
      expect(text.indexOf('inputPattern = 7') >= 0).assertTrue();
      expect(text.indexOf('enterKeyType = 4;inputPattern = 7') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1600
     * @tc.name      testHandlerSummaryFrame_016
     * @tc.desc      Verify that a second attach overwrites the editor-info line with the newer type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_016 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(2);
      InputHandler.getInstance().refreshInfo();
      const first: string = summary();
      await createClientHarness(6);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().refreshInfo();

      const second: string = summary();
      expect(first.indexOf('enterKeyType = 2') >= 0).assertTrue();
      expect(second.indexOf('enterKeyType = 6') >= 0).assertTrue();
      expect(second.indexOf('enterKeyType = 2')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1700
     * @tc.name      testHandlerSummaryFrame_017
     * @tc.desc      Verify that a stop shortens an attached summary by the preview line only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_017 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(5);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('keep-me');
      InputHandler.getInstance().setInputInfo('');
      InputHandler.getInstance().onInputStop();
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const lines: string[] = text.split('\n');
      expect(lines.length).assertEqual(4);
      expect(text.indexOf('five chars:')).assertEqual(-1);
      expect(text.indexOf('keep-me') >= 0).assertTrue();
      expect(lines[2]).assertEqual('keep-me');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_1800
     * @tc.name      testHandlerSummaryFrame_018
     * @tc.desc      Verify that the preview returns to the first line after a reattach.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_018 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setTextInfo('persist');
      InputHandler.getInstance().refreshInfo();
      const detached: string = summary();
      await createClientHarness(1);
      InputHandler.getInstance().refreshInfo();
      const attached: string = summary();

      expect(detached.indexOf('five chars:')).assertEqual(-1);
      expect(attached.indexOf('five chars:')).assertEqual(0);
      expect(attached.indexOf('persist') > attached.indexOf('[object Object]')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_2000
     * @tc.name      testHandlerSummaryFrame_020
     * @tc.desc      Verify that an emoji diagnostic keeps its surrogate pair on one line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_020 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('😀');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const line: string = summary().split('\n')[1];
      expect(line).assertEqual('😀');
      expect(line.length).assertEqual(2);
      expect(line.charCodeAt(0)).assertEqual(55357);
      expect(line.charCodeAt(1)).assertEqual(56832);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_2100
     * @tc.name      testHandlerSummaryFrame_021
     * @tc.desc      Verify that populated fields introduce no blank separator lines.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_021 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('sel');
      InputHandler.getInstance().setTextInfo('text');
      InputHandler.getInstance().setInputInfo('input');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.indexOf('\n\n')).assertEqual(-1);
      expect(text.split('\n').length).assertEqual(5);
      expect(text.endsWith('input')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_2200
     * @tc.name      testHandlerSummaryFrame_022
     * @tc.desc      Verify that a carriage return inside a field is preserved without adding a line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_022 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('A\rB');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[1]).assertEqual('A\rB');
      expect(lines[1].length).assertEqual(3);
      expect(lines[1].charCodeAt(1)).assertEqual(13);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_2400
     * @tc.name      testHandlerSummaryFrame_024
     * @tc.desc      Verify that the order in which the three diagnostics are set does not matter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_024 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('S');
      InputHandler.getInstance().setTextInfo('T');
      InputHandler.getInstance().setInputInfo('I');
      InputHandler.getInstance().refreshInfo();
      const forward: string = summary();
      InputHandler.getInstance().setInputInfo('I');
      InputHandler.getInstance().setTextInfo('T');
      InputHandler.getInstance().setSelectInfo('S');
      InputHandler.getInstance().refreshInfo();
      const reverse: string = summary();

      expect(forward).assertEqual(reverse);
      expect(forward.split('\n')[1]).assertEqual('S');
      expect(forward.split('\n')[2]).assertEqual('T');
      expect(forward.split('\n')[3]).assertEqual('I');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_2600
     * @tc.name      testHandlerSummaryFrame_026
     * @tc.desc      Verify that the automatic editor info closes the line sequence when fields are empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_026 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(8);
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines.length).assertEqual(5);
      expect(lines[4].indexOf('EditorInfo：')).assertEqual(0);
      expect(lines[4].indexOf('enterKeyType = 8') >= 0).assertTrue();
      expect(lines[3]).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_2700
     * @tc.name      testHandlerSummaryFrame_027
     * @tc.desc      Verify that the preview line does not depend on the attached editor type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_027 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(1);
      InputHandler.getInstance().setInputInfo('');
      InputHandler.getInstance().refreshInfo();
      const firstLine: string = summary().split('\n')[0];
      await createClientHarness(9);
      InputHandler.getInstance().setInputInfo('');
      InputHandler.getInstance().refreshInfo();
      const secondLine: string = summary().split('\n')[0];

      expect(firstLine).assertEqual(secondLine);
      expect(firstLine.indexOf('FWD5') >= 0).assertTrue();
      expect(secondLine.indexOf('BWD5') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_2900
     * @tc.name      testHandlerSummaryFrame_029
     * @tc.desc      Verify that the automatic editor info stays on the last line beside populated fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_029 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(3);
      InputHandler.getInstance().setSelectInfo('sel');
      InputHandler.getInstance().setTextInfo('text');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines.length).assertEqual(5);
      expect(lines[1]).assertEqual('[object Object]');
      expect(lines[2]).assertEqual('sel');
      expect(lines[4].indexOf('EditorInfo：') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_3000
     * @tc.name      testHandlerSummaryFrame_030
     * @tc.desc      Verify that a field holding the cursor placeholder produces a second occurrence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_030 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('[object Object]');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      const first: number = text.indexOf('[object Object]');
      const second: number = text.indexOf('[object Object]', first + 1);
      expect(first).assertEqual(0);
      expect(second > first).assertTrue();
      expect(text.split('\n')[1]).assertEqual('[object Object]');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_3100
     * @tc.name      testHandlerSummaryFrame_031
     * @tc.desc      Verify that a populated input field closes the summary without a trailing newline.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_031 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('sel');
      InputHandler.getInstance().setTextInfo('text');
      InputHandler.getInstance().setInputInfo('tail');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.endsWith('tail')).assertTrue();
      expect(text.endsWith('\n')).assertFalse();
      expect(text.lastIndexOf('tail')).assertEqual(text.length - 4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_3200
     * @tc.name      testHandlerSummaryFrame_032
     * @tc.desc      Verify that the detached summary is the attached summary without its first line.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_032 begin');
      InputHandler.getInstance().onInputStop();
      await createClientHarness(0);
      InputHandler.getInstance().setSelectInfo('S');
      InputHandler.getInstance().setTextInfo('T');
      InputHandler.getInstance().setInputInfo('I');
      InputHandler.getInstance().refreshInfo();
      const attached: string = summary();
      const previewLine: string = attached.split('\n')[0];
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().refreshInfo();
      const detached: string = summary();

      expect(attached).assertEqual(previewLine + '\n' + detached);
      expect(attached.indexOf(detached)).assertEqual(previewLine.length + 1);
      expect(detached.indexOf('five chars:')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_3300
     * @tc.name      testHandlerSummaryFrame_033
     * @tc.desc      Verify that a leading newline in the selection field opens a blank line before it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_033 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('\nX');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      InputHandler.getInstance().refreshInfo();

      const lines: string[] = summary().split('\n');
      expect(lines.length).assertEqual(5);
      expect(lines[1]).assertEqual('');
      expect(lines[2]).assertEqual('X');
      expect(lines[3]).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_3400
     * @tc.name      testHandlerSummaryFrame_034
     * @tc.desc      Verify that the assembled summary never leaks the undefined literal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_034 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      InputHandler.getInstance().refreshInfo();
      const detached: string = summary();
      await createClientHarness(0);
      InputHandler.getInstance().refreshInfo();
      const attached: string = summary();

      expect(detached.indexOf('undefined')).assertEqual(-1);
      expect(attached.indexOf('undefined')).assertEqual(-1);
      expect(typeof detached).assertEqual('string');
      expect(detached.length > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HANDLER_SUMMARY_FRAME_3500
     * @tc.name      testHandlerSummaryFrame_035
     * @tc.desc      Verify that a detached refresh still publishes a non-empty placeholder summary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHandlerSummaryFrame_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_035 begin');
      InputHandler.getInstance().onInputStop();
      InputHandler.getInstance().setSelectInfo('');
      InputHandler.getInstance().setTextInfo('');
      InputHandler.getInstance().setInputInfo('');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();

      const text: string = summary();
      expect(text.length).assertEqual(18);
      expect(text.indexOf('[object Object]')).assertEqual(0);
      expect(text.replace('[object Object]', '').length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHandlerSummaryFrame_035 end');
      await yieldToEventLoop();
    });

  });
}
