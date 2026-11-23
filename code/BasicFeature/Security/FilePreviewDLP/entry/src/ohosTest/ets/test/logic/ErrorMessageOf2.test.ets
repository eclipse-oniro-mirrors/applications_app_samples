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

/** Logic checks for errorMessageOf (96 cases). */
export default function errorMessageOf2Test(): void {
  describe('ErrorMessageOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0097
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0097
     * @tc.desc      errorMessageOf(operation=" ", errorJson="{}") returns "  DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0097 begin`);
      const actual: string = errorMessageOf(' ', '{}');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0098
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0098
     * @tc.desc      errorMessageOf(operation=" ", errorJson="[]") returns "  DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0098 begin`);
      const actual: string = errorMessageOf(' ', '[]');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0099
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0099
     * @tc.desc      errorMessageOf(operation=" ", errorJson="{?"a?":1}") returns "  DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0099 begin`);
      const actual: string = errorMessageOf(' ', '{"a":1}');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0100
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0100
     * @tc.desc      errorMessageOf(operation=" ", errorJson="invalid") returns "  DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0100 begin`);
      const actual: string = errorMessageOf(' ', 'invalid');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0101
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0101
     * @tc.desc      errorMessageOf(operation=" ", errorJson="") returns "  DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0101 begin`);
      const actual: string = errorMessageOf(' ', '');
      logInfo(`errorMessageOf(operation=" ", errorJson=""): actual=${actual}`);
      expect(actual).assertEqual('  DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0102
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0102
     * @tc.desc      errorMessageOf(operation=" ", errorJson="a") returns "  DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0102 begin`);
      const actual: string = errorMessageOf(' ', 'a');
      logInfo(`errorMessageOf(operation=" ", errorJson="a"): actual=${actual}`);
      expect(actual).assertEqual('  DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0103
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0103
     * @tc.desc      errorMessageOf(operation=" ", errorJson="abc") returns "  DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0103 begin`);
      const actual: string = errorMessageOf(' ', 'abc');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0104
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0104
     * @tc.desc      errorMessageOf(operation=" ", errorJson="Hello World") returns "  DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0104 begin`);
      const actual: string = errorMessageOf(' ', 'Hello World');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0105
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0105
     * @tc.desc      errorMessageOf(operation=" ", errorJson=" ") returns "  DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0105 begin`);
      const actual: string = errorMessageOf(' ', ' ');
      logInfo(`errorMessageOf(operation=" ", errorJson=" "): actual=${actual}`);
      expect(actual).assertEqual('  DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0106
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0106
     * @tc.desc      errorMessageOf(operation=" ", errorJson="123") returns "  DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0106 begin`);
      const actual: string = errorMessageOf(' ', '123');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0107
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0107
     * @tc.desc      errorMessageOf(operation=" ", errorJson=" {} ") returns "  DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0107 begin`);
      const actual: string = errorMessageOf(' ', ' {} ');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0108
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0108
     * @tc.desc      errorMessageOf(operation=" ", errorJson="{}{}") returns "  DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0108 begin`);
      const actual: string = errorMessageOf(' ', '{}{}');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0109
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0109
     * @tc.desc      errorMessageOf(operation=" ", errorJson="{}_1") returns "  DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0109 begin`);
      const actual: string = errorMessageOf(' ', '{}_1');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0110
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0110
     * @tc.desc      errorMessageOf(operation=" ", errorJson="x{}") returns "  DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0110 begin`);
      const actual: string = errorMessageOf(' ', 'x{}');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0111
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0111
     * @tc.desc      errorMessageOf(operation=" ", errorJson=" [] ") returns "  DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0111 begin`);
      const actual: string = errorMessageOf(' ', ' [] ');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0112
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0112
     * @tc.desc      errorMessageOf(operation=" ", errorJson="[][]") returns "  DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0112 begin`);
      const actual: string = errorMessageOf(' ', '[][]');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0113
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0113
     * @tc.desc      errorMessageOf(operation=" ", errorJson="[]_1") returns "  DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0113 begin`);
      const actual: string = errorMessageOf(' ', '[]_1');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0114
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0114
     * @tc.desc      errorMessageOf(operation=" ", errorJson="x[]") returns "  DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0114 begin`);
      const actual: string = errorMessageOf(' ', 'x[]');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0115
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0115
     * @tc.desc      errorMessageOf(operation=" ", errorJson=" {?"a?":1} ") returns "  DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0115 begin`);
      const actual: string = errorMessageOf(' ', ' {"a":1} ');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0116
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0116
     * @tc.desc      errorMessageOf(operation=" ", errorJson="{?"a?":1}{?"a?":1}") returns "  DLP failed {?"a?":1}{?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0116 begin`);
      const actual: string = errorMessageOf(' ', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0117
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0117
     * @tc.desc      errorMessageOf(operation=" ", errorJson="{?"a?":1}_1") returns "  DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0117 begin`);
      const actual: string = errorMessageOf(' ', '{"a":1}_1');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0118
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0118
     * @tc.desc      errorMessageOf(operation=" ", errorJson="x{?"a?":1}") returns "  DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0118 begin`);
      const actual: string = errorMessageOf(' ', 'x{"a":1}');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0119
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0119
     * @tc.desc      errorMessageOf(operation=" ", errorJson=" invalid ") returns "  DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0119 begin`);
      const actual: string = errorMessageOf(' ', ' invalid ');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0120
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0120
     * @tc.desc      errorMessageOf(operation=" ", errorJson="invalidinvalid") returns "  DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0120 begin`);
      const actual: string = errorMessageOf(' ', 'invalidinvalid');
      logInfo(`errorMessageOf(operation=" ", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('  DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0120 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0121
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0121
     * @tc.desc      errorMessageOf(operation="123", errorJson="{}") returns "123 DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0121 begin`);
      const actual: string = errorMessageOf('123', '{}');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0121 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0122
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0122
     * @tc.desc      errorMessageOf(operation="123", errorJson="[]") returns "123 DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0122 begin`);
      const actual: string = errorMessageOf('123', '[]');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0122 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0123
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0123
     * @tc.desc      errorMessageOf(operation="123", errorJson="{?"a?":1}") returns "123 DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0123 begin`);
      const actual: string = errorMessageOf('123', '{"a":1}');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0123 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0124
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0124
     * @tc.desc      errorMessageOf(operation="123", errorJson="invalid") returns "123 DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0124 begin`);
      const actual: string = errorMessageOf('123', 'invalid');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0124 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0125
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0125
     * @tc.desc      errorMessageOf(operation="123", errorJson="") returns "123 DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0125 begin`);
      const actual: string = errorMessageOf('123', '');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0125 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0126
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0126
     * @tc.desc      errorMessageOf(operation="123", errorJson="a") returns "123 DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0126 begin`);
      const actual: string = errorMessageOf('123', 'a');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0126 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0127
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0127
     * @tc.desc      errorMessageOf(operation="123", errorJson="abc") returns "123 DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0127 begin`);
      const actual: string = errorMessageOf('123', 'abc');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0127 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0128
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0128
     * @tc.desc      errorMessageOf(operation="123", errorJson="Hello World") returns "123 DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0128 begin`);
      const actual: string = errorMessageOf('123', 'Hello World');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0128 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0129
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0129
     * @tc.desc      errorMessageOf(operation="123", errorJson=" ") returns "123 DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0129 begin`);
      const actual: string = errorMessageOf('123', ' ');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0129 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0130
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0130
     * @tc.desc      errorMessageOf(operation="123", errorJson="123") returns "123 DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0130 begin`);
      const actual: string = errorMessageOf('123', '123');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0130 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0131
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0131
     * @tc.desc      errorMessageOf(operation="123", errorJson=" {} ") returns "123 DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0131 begin`);
      const actual: string = errorMessageOf('123', ' {} ');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0131 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0132
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0132
     * @tc.desc      errorMessageOf(operation="123", errorJson="{}{}") returns "123 DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0132 begin`);
      const actual: string = errorMessageOf('123', '{}{}');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0132 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0133
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0133
     * @tc.desc      errorMessageOf(operation="123", errorJson="{}_1") returns "123 DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0133 begin`);
      const actual: string = errorMessageOf('123', '{}_1');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0133 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0134
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0134
     * @tc.desc      errorMessageOf(operation="123", errorJson="x{}") returns "123 DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0134 begin`);
      const actual: string = errorMessageOf('123', 'x{}');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0134 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0135
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0135
     * @tc.desc      errorMessageOf(operation="123", errorJson=" [] ") returns "123 DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0135 begin`);
      const actual: string = errorMessageOf('123', ' [] ');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0135 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0136
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0136
     * @tc.desc      errorMessageOf(operation="123", errorJson="[][]") returns "123 DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0136 begin`);
      const actual: string = errorMessageOf('123', '[][]');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0136 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0137
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0137
     * @tc.desc      errorMessageOf(operation="123", errorJson="[]_1") returns "123 DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0137 begin`);
      const actual: string = errorMessageOf('123', '[]_1');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0137 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0138
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0138
     * @tc.desc      errorMessageOf(operation="123", errorJson="x[]") returns "123 DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0138 begin`);
      const actual: string = errorMessageOf('123', 'x[]');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0138 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0139
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0139
     * @tc.desc      errorMessageOf(operation="123", errorJson=" {?"a?":1} ") returns "123 DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0139 begin`);
      const actual: string = errorMessageOf('123', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0139 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0140
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0140
     * @tc.desc      errorMessageOf(operation="123", errorJson="{?"a?":1}{?"a?":1}") returns "123 DLP failed {?"a?":1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0140 begin`);
      const actual: string = errorMessageOf('123', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0140 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0141
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0141
     * @tc.desc      errorMessageOf(operation="123", errorJson="{?"a?":1}_1") returns "123 DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0141 begin`);
      const actual: string = errorMessageOf('123', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0141 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0142
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0142
     * @tc.desc      errorMessageOf(operation="123", errorJson="x{?"a?":1}") returns "123 DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0142 begin`);
      const actual: string = errorMessageOf('123', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0142 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0143
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0143
     * @tc.desc      errorMessageOf(operation="123", errorJson=" invalid ") returns "123 DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0143 begin`);
      const actual: string = errorMessageOf('123', ' invalid ');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0143 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0144
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0144
     * @tc.desc      errorMessageOf(operation="123", errorJson="invalidinvalid") returns "123 DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0144 begin`);
      const actual: string = errorMessageOf('123', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="123", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('123 DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0144 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0145
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0145
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="{}") returns " a  DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0145 begin`);
      const actual: string = errorMessageOf(' a ', '{}');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0145 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0146
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0146
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="[]") returns " a  DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0146 begin`);
      const actual: string = errorMessageOf(' a ', '[]');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0146 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0147
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0147
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="{?"a?":1}") returns " a  DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0147 begin`);
      const actual: string = errorMessageOf(' a ', '{"a":1}');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0147 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0148
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0148
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="invalid") returns " a  DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0148 begin`);
      const actual: string = errorMessageOf(' a ', 'invalid');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0148 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0149
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0149
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="") returns " a  DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0149 begin`);
      const actual: string = errorMessageOf(' a ', '');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0149 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0150
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0150
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="a") returns " a  DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0150 begin`);
      const actual: string = errorMessageOf(' a ', 'a');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0150 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0151
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0151
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="abc") returns " a  DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0151 begin`);
      const actual: string = errorMessageOf(' a ', 'abc');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0151 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0152
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0152
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="Hello World") returns " a  DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0152 begin`);
      const actual: string = errorMessageOf(' a ', 'Hello World');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0152 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0153
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0153
     * @tc.desc      errorMessageOf(operation=" a ", errorJson=" ") returns " a  DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0153 begin`);
      const actual: string = errorMessageOf(' a ', ' ');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0153 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0154
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0154
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="123") returns " a  DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0154 begin`);
      const actual: string = errorMessageOf(' a ', '123');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0154 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0155
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0155
     * @tc.desc      errorMessageOf(operation=" a ", errorJson=" {} ") returns " a  DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0155 begin`);
      const actual: string = errorMessageOf(' a ', ' {} ');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0155 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0156
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0156
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="{}{}") returns " a  DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0156 begin`);
      const actual: string = errorMessageOf(' a ', '{}{}');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0156 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0157
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0157
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="{}_1") returns " a  DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0157 begin`);
      const actual: string = errorMessageOf(' a ', '{}_1');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0157 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0158
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0158
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="x{}") returns " a  DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0158 begin`);
      const actual: string = errorMessageOf(' a ', 'x{}');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0158 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0159
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0159
     * @tc.desc      errorMessageOf(operation=" a ", errorJson=" [] ") returns " a  DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0159 begin`);
      const actual: string = errorMessageOf(' a ', ' [] ');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0159 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0160
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0160
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="[][]") returns " a  DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0160 begin`);
      const actual: string = errorMessageOf(' a ', '[][]');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0160 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0161
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0161
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="[]_1") returns " a  DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0161 begin`);
      const actual: string = errorMessageOf(' a ', '[]_1');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0161 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0162
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0162
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="x[]") returns " a  DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0162 begin`);
      const actual: string = errorMessageOf(' a ', 'x[]');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0162 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0163
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0163
     * @tc.desc      errorMessageOf(operation=" a ", errorJson=" {?"a?":1} ") returns " a  DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0163 begin`);
      const actual: string = errorMessageOf(' a ', ' {"a":1} ');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0163 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0164
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0164
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="{?"a?":1}{?"a?":1}") returns " a  DLP failed {?"a?":1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0164 begin`);
      const actual: string = errorMessageOf(' a ', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0164 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0165
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0165
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="{?"a?":1}_1") returns " a  DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0165 begin`);
      const actual: string = errorMessageOf(' a ', '{"a":1}_1');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0165 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0166
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0166
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="x{?"a?":1}") returns " a  DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0166 begin`);
      const actual: string = errorMessageOf(' a ', 'x{"a":1}');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0166 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0167
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0167
     * @tc.desc      errorMessageOf(operation=" a ", errorJson=" invalid ") returns " a  DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0167 begin`);
      const actual: string = errorMessageOf(' a ', ' invalid ');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0167 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0168
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0168
     * @tc.desc      errorMessageOf(operation=" a ", errorJson="invalidinvalid") returns " a  DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0168 begin`);
      const actual: string = errorMessageOf(' a ', 'invalidinvalid');
      logInfo(`errorMessageOf(operation=" a ", errorJson...: actual=${actual}`);
      expect(actual).assertEqual(' a  DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0168 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0169
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0169
     * @tc.desc      errorMessageOf(operation="aa", errorJson="{}") returns "aa DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0169 begin`);
      const actual: string = errorMessageOf('aa', '{}');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0169 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0170
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0170
     * @tc.desc      errorMessageOf(operation="aa", errorJson="[]") returns "aa DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0170 begin`);
      const actual: string = errorMessageOf('aa', '[]');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0170 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0171
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0171
     * @tc.desc      errorMessageOf(operation="aa", errorJson="{?"a?":1}") returns "aa DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0171 begin`);
      const actual: string = errorMessageOf('aa', '{"a":1}');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0171 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0172
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0172
     * @tc.desc      errorMessageOf(operation="aa", errorJson="invalid") returns "aa DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0172 begin`);
      const actual: string = errorMessageOf('aa', 'invalid');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0172 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0173
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0173
     * @tc.desc      errorMessageOf(operation="aa", errorJson="") returns "aa DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0173 begin`);
      const actual: string = errorMessageOf('aa', '');
      logInfo(`errorMessageOf(operation="aa", errorJson=""): actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0173 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0174
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0174
     * @tc.desc      errorMessageOf(operation="aa", errorJson="a") returns "aa DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0174 begin`);
      const actual: string = errorMessageOf('aa', 'a');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0174 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0175
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0175
     * @tc.desc      errorMessageOf(operation="aa", errorJson="abc") returns "aa DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0175 begin`);
      const actual: string = errorMessageOf('aa', 'abc');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0175 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0176
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0176
     * @tc.desc      errorMessageOf(operation="aa", errorJson="Hello World") returns "aa DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0176 begin`);
      const actual: string = errorMessageOf('aa', 'Hello World');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0176 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0177
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0177
     * @tc.desc      errorMessageOf(operation="aa", errorJson=" ") returns "aa DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0177 begin`);
      const actual: string = errorMessageOf('aa', ' ');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0177 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0178
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0178
     * @tc.desc      errorMessageOf(operation="aa", errorJson="123") returns "aa DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0178 begin`);
      const actual: string = errorMessageOf('aa', '123');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0178 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0179
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0179
     * @tc.desc      errorMessageOf(operation="aa", errorJson=" {} ") returns "aa DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0179 begin`);
      const actual: string = errorMessageOf('aa', ' {} ');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0179 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0180
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0180
     * @tc.desc      errorMessageOf(operation="aa", errorJson="{}{}") returns "aa DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0180 begin`);
      const actual: string = errorMessageOf('aa', '{}{}');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0180 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0181
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0181
     * @tc.desc      errorMessageOf(operation="aa", errorJson="{}_1") returns "aa DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0181 begin`);
      const actual: string = errorMessageOf('aa', '{}_1');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0181 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0182
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0182
     * @tc.desc      errorMessageOf(operation="aa", errorJson="x{}") returns "aa DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0182 begin`);
      const actual: string = errorMessageOf('aa', 'x{}');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0182 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0183
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0183
     * @tc.desc      errorMessageOf(operation="aa", errorJson=" [] ") returns "aa DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0183 begin`);
      const actual: string = errorMessageOf('aa', ' [] ');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0183 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0184
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0184
     * @tc.desc      errorMessageOf(operation="aa", errorJson="[][]") returns "aa DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0184 begin`);
      const actual: string = errorMessageOf('aa', '[][]');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0184 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0185
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0185
     * @tc.desc      errorMessageOf(operation="aa", errorJson="[]_1") returns "aa DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0185 begin`);
      const actual: string = errorMessageOf('aa', '[]_1');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0185 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0186
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0186
     * @tc.desc      errorMessageOf(operation="aa", errorJson="x[]") returns "aa DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0186 begin`);
      const actual: string = errorMessageOf('aa', 'x[]');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0186 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0187
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0187
     * @tc.desc      errorMessageOf(operation="aa", errorJson=" {?"a?":1} ") returns "aa DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0187 begin`);
      const actual: string = errorMessageOf('aa', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0187 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0188
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0188
     * @tc.desc      errorMessageOf(operation="aa", errorJson="{?"a?":1}{?"a?":1}") returns "aa DLP failed {?"a?":1}{...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0188 begin`);
      const actual: string = errorMessageOf('aa', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0188 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0189
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0189
     * @tc.desc      errorMessageOf(operation="aa", errorJson="{?"a?":1}_1") returns "aa DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0189 begin`);
      const actual: string = errorMessageOf('aa', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0189 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0190
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0190
     * @tc.desc      errorMessageOf(operation="aa", errorJson="x{?"a?":1}") returns "aa DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0190 begin`);
      const actual: string = errorMessageOf('aa', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0190 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0191
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0191
     * @tc.desc      errorMessageOf(operation="aa", errorJson=" invalid ") returns "aa DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0191 begin`);
      const actual: string = errorMessageOf('aa', ' invalid ');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0191 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0192
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0192
     * @tc.desc      errorMessageOf(operation="aa", errorJson="invalidinvalid") returns "aa DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0192 begin`);
      const actual: string = errorMessageOf('aa', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="aa", errorJson=...: actual=${actual}`);
      expect(actual).assertEqual('aa DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0192 end`);
    });
  });
}
