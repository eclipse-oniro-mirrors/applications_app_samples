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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { errorMessageOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for errorMessageOf (74 cases). */
export default function errorMessageOf3Test(): void {
  describe('ErrorMessageOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0193
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0193
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="{}") returns "a_1 DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0193 begin`);
      const actual: string = errorMessageOf('a_1', '{}');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0193 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0194
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0194
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="[]") returns "a_1 DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0194 begin`);
      const actual: string = errorMessageOf('a_1', '[]');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0194 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0195
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0195
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="{?"a?":1}") returns "a_1 DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0195 begin`);
      const actual: string = errorMessageOf('a_1', '{"a":1}');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0195 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0196
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0196
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="invalid") returns "a_1 DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0196 begin`);
      const actual: string = errorMessageOf('a_1', 'invalid');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0196 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0197
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0197
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="") returns "a_1 DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0197 begin`);
      const actual: string = errorMessageOf('a_1', '');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0197 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0198
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0198
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="a") returns "a_1 DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0198 begin`);
      const actual: string = errorMessageOf('a_1', 'a');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0198 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0199
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0199
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="abc") returns "a_1 DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0199 begin`);
      const actual: string = errorMessageOf('a_1', 'abc');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0199 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0200
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0200
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="Hello World") returns "a_1 DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0200 begin`);
      const actual: string = errorMessageOf('a_1', 'Hello World');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0200 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0201
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0201
     * @tc.desc      errorMessageOf(operation="a_1", errorJson=" ") returns "a_1 DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0201 begin`);
      const actual: string = errorMessageOf('a_1', ' ');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0201 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0202
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0202
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="123") returns "a_1 DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0202 begin`);
      const actual: string = errorMessageOf('a_1', '123');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0202 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0203
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0203
     * @tc.desc      errorMessageOf(operation="a_1", errorJson=" {} ") returns "a_1 DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0203 begin`);
      const actual: string = errorMessageOf('a_1', ' {} ');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0203 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0204
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0204
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="{}{}") returns "a_1 DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0204 begin`);
      const actual: string = errorMessageOf('a_1', '{}{}');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0204 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0205
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0205
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="{}_1") returns "a_1 DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0205 begin`);
      const actual: string = errorMessageOf('a_1', '{}_1');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0205 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0206
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0206
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="x{}") returns "a_1 DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0206 begin`);
      const actual: string = errorMessageOf('a_1', 'x{}');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0206 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0207
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0207
     * @tc.desc      errorMessageOf(operation="a_1", errorJson=" [] ") returns "a_1 DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0207 begin`);
      const actual: string = errorMessageOf('a_1', ' [] ');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0207 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0208
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0208
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="[][]") returns "a_1 DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0208 begin`);
      const actual: string = errorMessageOf('a_1', '[][]');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0208 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0209
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0209
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="[]_1") returns "a_1 DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0209 begin`);
      const actual: string = errorMessageOf('a_1', '[]_1');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0209 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0210
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0210
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="x[]") returns "a_1 DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0210 begin`);
      const actual: string = errorMessageOf('a_1', 'x[]');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0210 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0211
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0211
     * @tc.desc      errorMessageOf(operation="a_1", errorJson=" {?"a?":1} ") returns "a_1 DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0211 begin`);
      const actual: string = errorMessageOf('a_1', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0211 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0212
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0212
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="{?"a?":1}{?"a?":1}") returns "a_1 DLP failed {?"a?":1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0212 begin`);
      const actual: string = errorMessageOf('a_1', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0212 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0213
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0213
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="{?"a?":1}_1") returns "a_1 DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0213 begin`);
      const actual: string = errorMessageOf('a_1', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0213 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0214
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0214
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="x{?"a?":1}") returns "a_1 DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0214 begin`);
      const actual: string = errorMessageOf('a_1', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0214 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0215
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0215
     * @tc.desc      errorMessageOf(operation="a_1", errorJson=" invalid ") returns "a_1 DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0215 begin`);
      const actual: string = errorMessageOf('a_1', ' invalid ');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0215 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0216
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0216
     * @tc.desc      errorMessageOf(operation="a_1", errorJson="invalidinvalid") returns "a_1 DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0216 begin`);
      const actual: string = errorMessageOf('a_1', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="a_1", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('a_1 DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0216 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0217
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0217
     * @tc.desc      errorMessageOf(operation="xa", errorJson="{}") returns "xa DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0217 begin`);
      const actual: string = errorMessageOf('xa', '{}');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0217 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0218
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0218
     * @tc.desc      errorMessageOf(operation="xa", errorJson="[]") returns "xa DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0218 begin`);
      const actual: string = errorMessageOf('xa', '[]');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0218 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0219
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0219
     * @tc.desc      errorMessageOf(operation="xa", errorJson="{?"a?":1}") returns "xa DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0219 begin`);
      const actual: string = errorMessageOf('xa', '{"a":1}');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0219 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0220
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0220
     * @tc.desc      errorMessageOf(operation="xa", errorJson="invalid") returns "xa DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0220 begin`);
      const actual: string = errorMessageOf('xa', 'invalid');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0220 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0221
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0221
     * @tc.desc      errorMessageOf(operation="xa", errorJson="") returns "xa DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0221 begin`);
      const actual: string = errorMessageOf('xa', '');
      logInfo(`errorMessageOf(operation="xa", errorJson=""): actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0221 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0222
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0222
     * @tc.desc      errorMessageOf(operation="xa", errorJson="a") returns "xa DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0222 begin`);
      const actual: string = errorMessageOf('xa', 'a');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0222 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0223
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0223
     * @tc.desc      errorMessageOf(operation="xa", errorJson="abc") returns "xa DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0223 begin`);
      const actual: string = errorMessageOf('xa', 'abc');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0223 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0224
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0224
     * @tc.desc      errorMessageOf(operation="xa", errorJson="Hello World") returns "xa DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0224 begin`);
      const actual: string = errorMessageOf('xa', 'Hello World');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0224 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0225
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0225
     * @tc.desc      errorMessageOf(operation="xa", errorJson=" ") returns "xa DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0225 begin`);
      const actual: string = errorMessageOf('xa', ' ');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0225 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0226
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0226
     * @tc.desc      errorMessageOf(operation="xa", errorJson="123") returns "xa DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0226 begin`);
      const actual: string = errorMessageOf('xa', '123');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0226 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0227
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0227
     * @tc.desc      errorMessageOf(operation="xa", errorJson=" {} ") returns "xa DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0227 begin`);
      const actual: string = errorMessageOf('xa', ' {} ');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0227 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0228
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0228
     * @tc.desc      errorMessageOf(operation="xa", errorJson="{}{}") returns "xa DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0228 begin`);
      const actual: string = errorMessageOf('xa', '{}{}');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0228 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0229
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0229
     * @tc.desc      errorMessageOf(operation="xa", errorJson="{}_1") returns "xa DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0229 begin`);
      const actual: string = errorMessageOf('xa', '{}_1');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0229 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0230
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0230
     * @tc.desc      errorMessageOf(operation="xa", errorJson="x{}") returns "xa DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0230 begin`);
      const actual: string = errorMessageOf('xa', 'x{}');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0230 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0231
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0231
     * @tc.desc      errorMessageOf(operation="xa", errorJson=" [] ") returns "xa DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0231 begin`);
      const actual: string = errorMessageOf('xa', ' [] ');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0231 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0232
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0232
     * @tc.desc      errorMessageOf(operation="xa", errorJson="[][]") returns "xa DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0232 begin`);
      const actual: string = errorMessageOf('xa', '[][]');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0232 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0233
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0233
     * @tc.desc      errorMessageOf(operation="xa", errorJson="[]_1") returns "xa DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0233 begin`);
      const actual: string = errorMessageOf('xa', '[]_1');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0233 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0234
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0234
     * @tc.desc      errorMessageOf(operation="xa", errorJson="x[]") returns "xa DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0234 begin`);
      const actual: string = errorMessageOf('xa', 'x[]');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0234 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0235
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0235
     * @tc.desc      errorMessageOf(operation="xa", errorJson=" {?"a?":1} ") returns "xa DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0235 begin`);
      const actual: string = errorMessageOf('xa', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0235 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0236
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0236
     * @tc.desc      errorMessageOf(operation="xa", errorJson="{?"a?":1}{?"a?":1}") returns "xa DLP failed {?"a?":1}{...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0236 begin`);
      const actual: string = errorMessageOf('xa', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0236 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0237
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0237
     * @tc.desc      errorMessageOf(operation="xa", errorJson="{?"a?":1}_1") returns "xa DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0237 begin`);
      const actual: string = errorMessageOf('xa', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0237 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0238
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0238
     * @tc.desc      errorMessageOf(operation="xa", errorJson="x{?"a?":1}") returns "xa DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0238 begin`);
      const actual: string = errorMessageOf('xa', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0238 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0239
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0239
     * @tc.desc      errorMessageOf(operation="xa", errorJson=" invalid ") returns "xa DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0239 begin`);
      const actual: string = errorMessageOf('xa', ' invalid ');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0239 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0240
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0240
     * @tc.desc      errorMessageOf(operation="xa", errorJson="invalidinvalid") returns "xa DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0240 begin`);
      const actual: string = errorMessageOf('xa', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="xa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('xa DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0240 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0241
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0241
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="{}") returns " abc  DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0241 begin`);
      const actual: string = errorMessageOf(' abc ', '{}');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0241 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0242
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0242
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="[]") returns " abc  DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0242 begin`);
      const actual: string = errorMessageOf(' abc ', '[]');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0242 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0243
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0243
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="{?"a?":1}") returns " abc  DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0243 begin`);
      const actual: string = errorMessageOf(' abc ', '{"a":1}');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0243 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0244
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0244
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="invalid") returns " abc  DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0244 begin`);
      const actual: string = errorMessageOf(' abc ', 'invalid');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0244 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0245
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0245
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="") returns " abc  DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0245 begin`);
      const actual: string = errorMessageOf(' abc ', '');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0245 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0246
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0246
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="a") returns " abc  DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0246 begin`);
      const actual: string = errorMessageOf(' abc ', 'a');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0246 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0247
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0247
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="abc") returns " abc  DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0247 begin`);
      const actual: string = errorMessageOf(' abc ', 'abc');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0247 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0248
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0248
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="Hello World") returns " abc  DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0248 begin`);
      const actual: string = errorMessageOf(' abc ', 'Hello World');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0248 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0249
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0249
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson=" ") returns " abc  DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0249 begin`);
      const actual: string = errorMessageOf(' abc ', ' ');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0249 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0250
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0250
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="123") returns " abc  DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0250 begin`);
      const actual: string = errorMessageOf(' abc ', '123');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0250 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0251
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0251
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson=" {} ") returns " abc  DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0251 begin`);
      const actual: string = errorMessageOf(' abc ', ' {} ');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0251 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0252
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0252
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="{}{}") returns " abc  DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0252 begin`);
      const actual: string = errorMessageOf(' abc ', '{}{}');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0252 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0253
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0253
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="{}_1") returns " abc  DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0253 begin`);
      const actual: string = errorMessageOf(' abc ', '{}_1');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0253 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0254
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0254
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="x{}") returns " abc  DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0254 begin`);
      const actual: string = errorMessageOf(' abc ', 'x{}');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0254 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0255
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0255
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson=" [] ") returns " abc  DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0255 begin`);
      const actual: string = errorMessageOf(' abc ', ' [] ');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0255 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0256
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0256
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="[][]") returns " abc  DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0256 begin`);
      const actual: string = errorMessageOf(' abc ', '[][]');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0256 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0257
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0257
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="[]_1") returns " abc  DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0257 begin`);
      const actual: string = errorMessageOf(' abc ', '[]_1');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0257 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0258
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0258
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="x[]") returns " abc  DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0258 begin`);
      const actual: string = errorMessageOf(' abc ', 'x[]');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0258 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0259
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0259
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson=" {?"a?":1} ") returns " abc  DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0259 begin`);
      const actual: string = errorMessageOf(' abc ', ' {"a":1} ');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0259 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0260
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0260
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="{?"a?":1}{?"a?":1}") returns " abc  DLP failed {?"a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0260 begin`);
      const actual: string = errorMessageOf(' abc ', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0260 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0261
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0261
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="{?"a?":1}_1") returns " abc  DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0261 begin`);
      const actual: string = errorMessageOf(' abc ', '{"a":1}_1');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0261 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0262
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0262
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="x{?"a?":1}") returns " abc  DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0262 begin`);
      const actual: string = errorMessageOf(' abc ', 'x{"a":1}');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0262 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0263
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0263
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson=" invalid ") returns " abc  DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0263 begin`);
      const actual: string = errorMessageOf(' abc ', ' invalid ');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0263 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0264
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0264
     * @tc.desc      errorMessageOf(operation=" abc ", errorJson="invalidinvalid") returns " abc  DLP failed invalidi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0264 begin`);
      const actual: string = errorMessageOf(' abc ', 'invalidinvalid');
      logInfo(`errorMessageOf(operation=" abc ", errorJs...: actual=${actual}`);
      expect(actual).assertEqual(' abc  DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0264 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0265
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0265
     * @tc.desc      errorMessageOf(operation="abcabc", errorJson="{}") returns "abcabc DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0265 begin`);
      const actual: string = errorMessageOf('abcabc', '{}');
      logInfo(`errorMessageOf(operation="abcabc", errorJ...: actual=${actual}`);
      expect(actual).assertEqual('abcabc DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0265 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0266
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0266
     * @tc.desc      errorMessageOf(operation="abcabc", errorJson="[]") returns "abcabc DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0266 begin`);
      const actual: string = errorMessageOf('abcabc', '[]');
      logInfo(`errorMessageOf(operation="abcabc", errorJ...: actual=${actual}`);
      expect(actual).assertEqual('abcabc DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0266 end`);
    });
  });
}
