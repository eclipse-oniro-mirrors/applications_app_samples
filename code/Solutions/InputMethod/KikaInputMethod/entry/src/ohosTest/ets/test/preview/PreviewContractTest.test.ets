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
import { PreviewHarness, PreviewCall, createPreviewHarness, typeSequence } from '../support/PreviewHarness';
import { InputHandler } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';
import { GetHardKeyValue } from '../../../../main/ets/model/HardKeyUtils';

interface PreviewRow {
  initial: string;
  typed: string;
  inserted: number;
  calls: number;
  buffer: string;
  finish: number;
  texts: string[];
  starts: number[];
  ends: number[];
}

const EMPTY_ROWS: PreviewRow[] = [
    { initial: "", typed: " ahel", inserted: 5, calls: 1, buffer: " ahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: " hEl", inserted: 4, calls: 0, buffer: " hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: " he", inserted: 3, calls: 0, buffer: " he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: " hel", inserted: 4, calls: 1, buffer: " hello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: " helhel", inserted: 7, calls: 2, buffer: " hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "#ahel", inserted: 5, calls: 1, buffer: "#ahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "#hEl", inserted: 4, calls: 0, buffer: "#hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "#he", inserted: 3, calls: 0, buffer: "#he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "#hel", inserted: 4, calls: 1, buffer: "#hello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "#helhel", inserted: 7, calls: 2, buffer: "#hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "-ahel", inserted: 5, calls: 1, buffer: "-ahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "-hEl", inserted: 4, calls: 0, buffer: "-hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "-he", inserted: 3, calls: 0, buffer: "-he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "-hel", inserted: 4, calls: 1, buffer: "-hello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "-helhel", inserted: 7, calls: 2, buffer: "-hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "012hel", inserted: 6, calls: 1, buffer: "012hello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "123ahel", inserted: 7, calls: 1, buffer: "123ahello world", finish: 0, texts: ["hello world"], starts: [4], ends: [7] },
    { initial: "", typed: "123hEl", inserted: 6, calls: 0, buffer: "123hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "123he", inserted: 5, calls: 0, buffer: "123he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "123hel", inserted: 6, calls: 1, buffer: "123hello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "123helhel", inserted: 9, calls: 2, buffer: "123hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [3, 14], ends: [6, 17] },
    { initial: "", typed: "12ahel", inserted: 6, calls: 1, buffer: "12ahello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "12hEl", inserted: 5, calls: 0, buffer: "12hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "12he", inserted: 4, calls: 0, buffer: "12he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "12hel", inserted: 5, calls: 1, buffer: "12hello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "12helhel", inserted: 8, calls: 2, buffer: "12hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [2, 13], ends: [5, 16] },
    { initial: "", typed: "1ahel", inserted: 5, calls: 1, buffer: "1ahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "1hEl", inserted: 4, calls: 0, buffer: "1hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "1he", inserted: 3, calls: 0, buffer: "1he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "1hel", inserted: 4, calls: 1, buffer: "1hello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "1helhel", inserted: 7, calls: 2, buffer: "1hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "@ahel", inserted: 5, calls: 1, buffer: "@ahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "@hEl", inserted: 4, calls: 0, buffer: "@hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "@he", inserted: 3, calls: 0, buffer: "@he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "@hel", inserted: 4, calls: 1, buffer: "@hello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "@helhel", inserted: 7, calls: 2, buffer: "@hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "ABahel", inserted: 6, calls: 1, buffer: "ABahello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "ABhEl", inserted: 5, calls: 0, buffer: "ABhEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "ABhe", inserted: 4, calls: 0, buffer: "ABhe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "ABhel", inserted: 5, calls: 1, buffer: "ABhello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "ABhelhel", inserted: 8, calls: 2, buffer: "ABhello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [2, 13], ends: [5, 16] },
    { initial: "", typed: "Aahel", inserted: 5, calls: 1, buffer: "Aahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "AhEl", inserted: 4, calls: 0, buffer: "AhEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "Ahe", inserted: 3, calls: 0, buffer: "Ahe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "Ahel", inserted: 4, calls: 1, buffer: "Ahello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "Ahelhel", inserted: 7, calls: 2, buffer: "Ahello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "HELhel", inserted: 6, calls: 1, buffer: "HELhello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "Hel", inserted: 3, calls: 0, buffer: "Hel", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "Helhel", inserted: 6, calls: 1, buffer: "Helhello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "ZZhel", inserted: 5, calls: 1, buffer: "ZZhello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "_ahel", inserted: 5, calls: 1, buffer: "_ahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "_hEl", inserted: 4, calls: 0, buffer: "_hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "_he", inserted: 3, calls: 0, buffer: "_he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "_hel", inserted: 4, calls: 1, buffer: "_hello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "_helhel", inserted: 7, calls: 2, buffer: "_hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "aahel", inserted: 5, calls: 1, buffer: "aahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "abahel", inserted: 6, calls: 1, buffer: "abahello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "abcahel", inserted: 7, calls: 1, buffer: "abcahello world", finish: 0, texts: ["hello world"], starts: [4], ends: [7] },
    { initial: "", typed: "abchEl", inserted: 6, calls: 0, buffer: "abchEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "abche", inserted: 5, calls: 0, buffer: "abche", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "abchel", inserted: 6, calls: 1, buffer: "abchello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "abchelhel", inserted: 9, calls: 2, buffer: "abchello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [3, 14], ends: [6, 17] },
    { initial: "", typed: "abhEl", inserted: 5, calls: 0, buffer: "abhEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "abhe", inserted: 4, calls: 0, buffer: "abhe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "abhel", inserted: 5, calls: 1, buffer: "abhello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "abhelcd", inserted: 7, calls: 1, buffer: "abhello worldcd", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "abhelhel", inserted: 8, calls: 2, buffer: "abhello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [2, 13], ends: [5, 16] },
    { initial: "", typed: "ahEl", inserted: 4, calls: 0, buffer: "ahEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "ahe", inserted: 3, calls: 0, buffer: "ahe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "ahel", inserted: 4, calls: 1, buffer: "ahello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "ahelhel", inserted: 7, calls: 2, buffer: "ahello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "e", inserted: 1, calls: 0, buffer: "e", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "elhe", inserted: 4, calls: 0, buffer: "elhe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "h", inserted: 1, calls: 0, buffer: "h", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "h e l", inserted: 5, calls: 0, buffer: "h e l", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "hEl", inserted: 3, calls: 0, buffer: "hEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "hElhel", inserted: 6, calls: 1, buffer: "hElhello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "he", inserted: 2, calls: 0, buffer: "he", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "he l", inserted: 4, calls: 1, buffer: "hhello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "heL", inserted: 3, calls: 0, buffer: "heL", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "heLhel", inserted: 6, calls: 1, buffer: "heLhello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "hehel", inserted: 5, calls: 1, buffer: "hehello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "hel", inserted: 3, calls: 1, buffer: "hello world", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel ", inserted: 4, calls: 1, buffer: "hello world ", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel!", inserted: 4, calls: 1, buffer: "hello world!", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel,", inserted: 4, calls: 1, buffer: "hello world,", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel-", inserted: 4, calls: 1, buffer: "hello world-", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel.", inserted: 4, calls: 1, buffer: "hello world.", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel1", inserted: 4, calls: 1, buffer: "hello world1", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel?", inserted: 4, calls: 1, buffer: "hello world?", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel@", inserted: 4, calls: 1, buffer: "hello world@", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hel_", inserted: 4, calls: 1, buffer: "hello world_", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hela", inserted: 4, calls: 1, buffer: "hello worlda", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "helb", inserted: 4, calls: 1, buffer: "hello worldb", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "helc", inserted: 4, calls: 1, buffer: "hello worldc", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "held", inserted: 4, calls: 1, buffer: "hello worldd", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "hele", inserted: 4, calls: 1, buffer: "hello worlde", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "helf", inserted: 4, calls: 1, buffer: "hello worldf", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "helg", inserted: 4, calls: 1, buffer: "hello worldg", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "helhel", inserted: 6, calls: 2, buffer: "hello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [0, 11], ends: [3, 14] },
    { initial: "", typed: "helhelhel", inserted: 9, calls: 3, buffer: "hello worldhello worldhello world", finish: 0, texts: ["hello world", "hello world", "hello world"], starts: [0, 11, 22], ends: [3, 14, 25] },
    { initial: "", typed: "hell", inserted: 4, calls: 2, buffer: "hello worhello world", finish: 0, texts: ["hello world", "hello world"], starts: [0, 9], ends: [3, 12] },
    { initial: "", typed: "helo", inserted: 4, calls: 1, buffer: "hello worldo", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "help", inserted: 4, calls: 1, buffer: "hello worldp", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "helpost", inserted: 7, calls: 1, buffer: "hello worldpost", finish: 0, texts: ["hello world"], starts: [0], ends: [3] },
    { initial: "", typed: "helxhel", inserted: 7, calls: 2, buffer: "hello worldxhello world", finish: 0, texts: ["hello world", "hello world"], starts: [0, 12], ends: [3, 15] },
    { initial: "", typed: "hleh", inserted: 4, calls: 0, buffer: "hleh", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "l", inserted: 1, calls: 0, buffer: "l", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "lhel", inserted: 4, calls: 1, buffer: "lhello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "prehelpost", inserted: 10, calls: 1, buffer: "prehello worldpost", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "qahel", inserted: 5, calls: 1, buffer: "qahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "qhEl", inserted: 4, calls: 0, buffer: "qhEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "qhe", inserted: 3, calls: 0, buffer: "qhe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "qhel", inserted: 4, calls: 1, buffer: "qhello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "qhelhel", inserted: 7, calls: 2, buffer: "qhello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "xahel", inserted: 5, calls: 1, buffer: "xahello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "xhEl", inserted: 4, calls: 0, buffer: "xhEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "xhe", inserted: 3, calls: 0, buffer: "xhe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "xhel", inserted: 4, calls: 1, buffer: "xhello world", finish: 0, texts: ["hello world"], starts: [1], ends: [4] },
    { initial: "", typed: "xhelhel", inserted: 7, calls: 2, buffer: "xhello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [1, 12], ends: [4, 15] },
    { initial: "", typed: "xyahel", inserted: 6, calls: 1, buffer: "xyahello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "xyhEl", inserted: 5, calls: 0, buffer: "xyhEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "xyhe", inserted: 4, calls: 0, buffer: "xyhe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "xyhel", inserted: 5, calls: 1, buffer: "xyhello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
    { initial: "", typed: "xyhelhel", inserted: 8, calls: 2, buffer: "xyhello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [2, 13], ends: [5, 16] },
    { initial: "", typed: "xyzahel", inserted: 7, calls: 1, buffer: "xyzahello world", finish: 0, texts: ["hello world"], starts: [4], ends: [7] },
    { initial: "", typed: "xyzhEl", inserted: 6, calls: 0, buffer: "xyzhEl", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "xyzhe", inserted: 5, calls: 0, buffer: "xyzhe", finish: 0, texts: [], starts: [], ends: [] },
    { initial: "", typed: "xyzhel", inserted: 6, calls: 1, buffer: "xyzhello world", finish: 0, texts: ["hello world"], starts: [3], ends: [6] },
    { initial: "", typed: "xyzhelhel", inserted: 9, calls: 2, buffer: "xyzhello worldhello world", finish: 0, texts: ["hello world", "hello world"], starts: [3, 14], ends: [6, 17] },
    { initial: "", typed: "zzhel", inserted: 5, calls: 1, buffer: "zzhello world", finish: 0, texts: ["hello world"], starts: [2], ends: [5] },
];

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewContract]';

export default function previewContractTest(): void {
  describe('PreviewContractTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CONTRACT_0001
     * @tc.name      testPreviewContractTest_001
     * @tc.desc      Verify the preview rows whose initial editor state is empty editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewContractTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_001 begin');
      const rows: PreviewRow[] = EMPTY_ROWS;

      for (let i = 0; i < rows.length; i++) {
        const row: PreviewRow = rows[i];
        const harness: PreviewHarness = await createPreviewHarness(row.initial);
        typeSequence(harness, row.typed);
        const calls: PreviewCall[] = harness.client.previewCalls;
        expect(harness.client.insertedTexts.length).assertEqual(row.inserted);
        expect(harness.client.editorAttributeCount).assertEqual(1);
        expect(calls.length).assertEqual(row.calls);
        for (let k = 0; k < row.texts.length; k++) {
          expect(calls[k].text).assertEqual(row.texts[k]);
          if (row.starts[k] >= 0) {
            expect(calls[k].start).assertEqual(row.starts[k]);
            expect(calls[k].end).assertEqual(row.ends[k]);
          }
        }
        expect(harness.client.buffer).assertEqual(row.buffer);
        expect(harness.client.finishCount).assertEqual(row.finish);
        if (i % 16 === 15) {
          await yieldToEventLoop();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CONTRACT_0002
     * @tc.name      testPreviewContractTest_002
     * @tc.desc      Verify that finishing a preview keeps the committed buffer and records one finish request.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewContractTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_002 begin');
      const harness: PreviewHarness = await createPreviewHarness("");
      typeSequence(harness, "hel");
      expect(harness.client.previewCalls.length).assertEqual(1);
      expect(harness.client.buffer).assertEqual("hello world");

      await harness.client.finishTextPreview();
      expect(harness.client.finishCount).assertEqual(1);
      expect(harness.client.buffer).assertEqual("hello world");

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CONTRACT_0003
     * @tc.name      testPreviewContractTest_003
     * @tc.desc      Verify that a client switch keeps the old preview and starts a new one on the new editor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPreviewContractTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_003 begin');
      const first: PreviewHarness = await createPreviewHarness("");
      typeSequence(first, "hel");
      expect(first.client.previewCalls.length).assertEqual(1);

      const second: PreviewHarness = await createPreviewHarness("");
      typeSequence(second, "hel");
      expect(second.client.previewCalls.length).assertEqual(1);
      expect(first.client.buffer).assertEqual("hello world");
      expect(second.client.buffer).assertEqual("hello world");

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CONTRACT_0004
     * @tc.name      testPreviewContractTest_004
     * @tc.desc      Confirming the candidate finishes the preview exactly once for every preview-count class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewContractTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_004 begin');

      const initials: string[] = ["", "", "", "", "hello"];
      const sequences: string[] = [" hEl", " ahel", " helhel", "helhelhel", "helhelhel"];
      const expectedCounts: number[] = [0, 1, 2, 3, 4];

      for (let i = 0; i < initials.length; i++) {
        const harness: PreviewHarness = await createPreviewHarness(initials[i]);
        typeSequence(harness, sequences[i]);
        const beforeBuffer: string = harness.client.buffer;
        // Confirmation must finish the active preview once and must not insert the candidate again.
        InputHandler.getInstance().sendKeyFunction();
        expect(harness.client.previewCalls.length).assertEqual(expectedCounts[i]);
        expect(harness.client.finishCount).assertEqual(1);
        expect(harness.client.keyFunctions.length).assertEqual(1);
        expect(harness.client.keyFunctions[0]).assertEqual(0);
        expect(harness.client.buffer).assertEqual(beforeBuffer);
      }

      expect(expectedCounts.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_CONTRACT_0005
     * @tc.name      testPreviewContractTest_005
     * @tc.desc      Verify the mapping tokens used by the editor flow for every preview-related key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPreviewContractTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_005 begin');
      const codes: number[] = [2024, 2021, 2028, 2017, 2018, 2055, 2071, 2012, 2013, 2014, 2015, 2043, 2044, 2050, 2024, 2021, 2028, 2017, 2018];
      const shifts: boolean[] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true];
      const expected: string[] = ["h", "e", "l", "a", "b", "KEYCODE_DEL", "KEYCODE_FORWARD_DEL", "KEYCODE_DPAD_UP", "KEYCODE_DPAD_DOWN", "KEYCODE_DPAD_LEFT", "KEYCODE_DPAD_RIGHT", ",", ".", " ", "H", "E", "L", "A", "B"];

      // Each row is one key/token pair used by the preview flow.
      for (let i = 0; i < codes.length; i++) {
        const actual: string = GetHardKeyValue(codes[i], shifts[i]);
        expect(actual).assertEqual(expected[i]);
        expect(actual.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewContractTest_005 end');
      await yieldToEventLoop();
    });

  });

}
