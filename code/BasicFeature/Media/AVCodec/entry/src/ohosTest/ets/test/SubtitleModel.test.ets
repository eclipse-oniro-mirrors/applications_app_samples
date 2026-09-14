/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium';
import { findSubtitleText, parseSrt } from '../../../main/ets/model/SubtitleModel';
import { runTestCase } from './TestCaseLogger';

export default function subtitleModelTest(): void {
  describe('SubtitleModelTest', () => {
    it('AVCodec_SubtitleModel_ParseAndLocateCue_001', 0, () => {
      runTestCase('AVCodec_SubtitleModel_ParseAndLocateCue_001', () => {
        const cues = parseSrt('1\n00:00:01,000 --> 00:00:03,500\nHello\nWorld\n\n2\n00:00:04.000 --> 00:00:05.000\nBye');
        expect(cues.length).assertEqual(2);
        expect(findSubtitleText(cues, 2000000)).assertEqual('Hello\nWorld');
        expect(findSubtitleText(cues, 3500000)).assertEqual('');
        expect(findSubtitleText(cues, 4500000)).assertEqual('Bye');
      });
    });

    it('AVCodec_SubtitleModel_InvalidContent_002', 0, () => {
      runTestCase('AVCodec_SubtitleModel_InvalidContent_002', () => {
        expect(parseSrt('not a subtitle').length).assertEqual(0);
      });
    });
  });
}
