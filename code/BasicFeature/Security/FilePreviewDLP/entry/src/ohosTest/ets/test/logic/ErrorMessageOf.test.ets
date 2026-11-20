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
export default function errorMessageOfTest(): void {
  describe('ErrorMessageOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0001
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0001
     * @tc.desc      errorMessageOf(operation="", errorJson="{}") returns " DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ErrorMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0001 begin`);
      const actual: string = errorMessageOf('', '{}');
      logInfo(`errorMessageOf(operation="", errorJson="{}"): actual=${actual}`);
      expect(actual).assertEqual(' DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0002
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0002
     * @tc.desc      errorMessageOf(operation="", errorJson="[]") returns " DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ErrorMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0002 begin`);
      const actual: string = errorMessageOf('', '[]');
      logInfo(`errorMessageOf(operation="", errorJson="[]"): actual=${actual}`);
      expect(actual).assertEqual(' DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0003
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0003
     * @tc.desc      errorMessageOf(operation="", errorJson="{?"a?":1}") returns " DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0003 begin`);
      const actual: string = errorMessageOf('', '{"a":1}');
      logInfo(`errorMessageOf(operation="", errorJson="{...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0004
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0004
     * @tc.desc      errorMessageOf(operation="", errorJson="invalid") returns " DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0004 begin`);
      const actual: string = errorMessageOf('', 'invalid');
      logInfo(`errorMessageOf(operation="", errorJson="i...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0005
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0005
     * @tc.desc      errorMessageOf(operation="", errorJson="") returns " DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0005 begin`);
      const actual: string = errorMessageOf('', '');
      logInfo(`errorMessageOf(operation="", errorJson=""): actual=${actual}`);
      expect(actual).assertEqual(' DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0006
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0006
     * @tc.desc      errorMessageOf(operation="", errorJson="a") returns " DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0006 begin`);
      const actual: string = errorMessageOf('', 'a');
      logInfo(`errorMessageOf(operation="", errorJson="a"): actual=${actual}`);
      expect(actual).assertEqual(' DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0007
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0007
     * @tc.desc      errorMessageOf(operation="", errorJson="abc") returns " DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0007 begin`);
      const actual: string = errorMessageOf('', 'abc');
      logInfo(`errorMessageOf(operation="", errorJson="a...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0008
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0008
     * @tc.desc      errorMessageOf(operation="", errorJson="Hello World") returns " DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0008 begin`);
      const actual: string = errorMessageOf('', 'Hello World');
      logInfo(`errorMessageOf(operation="", errorJson="H...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0009
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0009
     * @tc.desc      errorMessageOf(operation="", errorJson=" ") returns " DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0009 begin`);
      const actual: string = errorMessageOf('', ' ');
      logInfo(`errorMessageOf(operation="", errorJson=" "): actual=${actual}`);
      expect(actual).assertEqual(' DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0010
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0010
     * @tc.desc      errorMessageOf(operation="", errorJson="123") returns " DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0010 begin`);
      const actual: string = errorMessageOf('', '123');
      logInfo(`errorMessageOf(operation="", errorJson="1...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0011
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0011
     * @tc.desc      errorMessageOf(operation="", errorJson=" {} ") returns " DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0011 begin`);
      const actual: string = errorMessageOf('', ' {} ');
      logInfo(`errorMessageOf(operation="", errorJson=" ...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0012
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0012
     * @tc.desc      errorMessageOf(operation="", errorJson="{}{}") returns " DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0012 begin`);
      const actual: string = errorMessageOf('', '{}{}');
      logInfo(`errorMessageOf(operation="", errorJson="{...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0013
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0013
     * @tc.desc      errorMessageOf(operation="", errorJson="{}_1") returns " DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0013 begin`);
      const actual: string = errorMessageOf('', '{}_1');
      logInfo(`errorMessageOf(operation="", errorJson="{...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0014
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0014
     * @tc.desc      errorMessageOf(operation="", errorJson="x{}") returns " DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0014 begin`);
      const actual: string = errorMessageOf('', 'x{}');
      logInfo(`errorMessageOf(operation="", errorJson="x...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0015
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0015
     * @tc.desc      errorMessageOf(operation="", errorJson=" [] ") returns " DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0015 begin`);
      const actual: string = errorMessageOf('', ' [] ');
      logInfo(`errorMessageOf(operation="", errorJson=" ...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0016
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0016
     * @tc.desc      errorMessageOf(operation="", errorJson="[][]") returns " DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0016 begin`);
      const actual: string = errorMessageOf('', '[][]');
      logInfo(`errorMessageOf(operation="", errorJson="[...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0017
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0017
     * @tc.desc      errorMessageOf(operation="", errorJson="[]_1") returns " DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0017 begin`);
      const actual: string = errorMessageOf('', '[]_1');
      logInfo(`errorMessageOf(operation="", errorJson="[...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0018
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0018
     * @tc.desc      errorMessageOf(operation="", errorJson="x[]") returns " DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0018 begin`);
      const actual: string = errorMessageOf('', 'x[]');
      logInfo(`errorMessageOf(operation="", errorJson="x...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0019
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0019
     * @tc.desc      errorMessageOf(operation="", errorJson=" {?"a?":1} ") returns " DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0019 begin`);
      const actual: string = errorMessageOf('', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="", errorJson=" ...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0020
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0020
     * @tc.desc      errorMessageOf(operation="", errorJson="{?"a?":1}{?"a?":1}") returns " DLP failed {?"a?":1}{?"a?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0020 begin`);
      const actual: string = errorMessageOf('', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="", errorJson="{...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0021
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0021
     * @tc.desc      errorMessageOf(operation="", errorJson="{?"a?":1}_1") returns " DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0021 begin`);
      const actual: string = errorMessageOf('', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="", errorJson="{...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0022
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0022
     * @tc.desc      errorMessageOf(operation="", errorJson="x{?"a?":1}") returns " DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0022 begin`);
      const actual: string = errorMessageOf('', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="", errorJson="x...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0023
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0023
     * @tc.desc      errorMessageOf(operation="", errorJson=" invalid ") returns " DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0023 begin`);
      const actual: string = errorMessageOf('', ' invalid ');
      logInfo(`errorMessageOf(operation="", errorJson=" ...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0024
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0024
     * @tc.desc      errorMessageOf(operation="", errorJson="invalidinvalid") returns " DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0024 begin`);
      const actual: string = errorMessageOf('', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="", errorJson="i...: actual=${actual}`);
      expect(actual).assertEqual(' DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0025
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0025
     * @tc.desc      errorMessageOf(operation="a", errorJson="{}") returns "a DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0025 begin`);
      const actual: string = errorMessageOf('a', '{}');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0026
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0026
     * @tc.desc      errorMessageOf(operation="a", errorJson="[]") returns "a DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0026 begin`);
      const actual: string = errorMessageOf('a', '[]');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0027
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0027
     * @tc.desc      errorMessageOf(operation="a", errorJson="{?"a?":1}") returns "a DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0027 begin`);
      const actual: string = errorMessageOf('a', '{"a":1}');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0028
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0028
     * @tc.desc      errorMessageOf(operation="a", errorJson="invalid") returns "a DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0028 begin`);
      const actual: string = errorMessageOf('a', 'invalid');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0029
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0029
     * @tc.desc      errorMessageOf(operation="a", errorJson="") returns "a DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0029 begin`);
      const actual: string = errorMessageOf('a', '');
      logInfo(`errorMessageOf(operation="a", errorJson=""): actual=${actual}`);
      expect(actual).assertEqual('a DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0030
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0030
     * @tc.desc      errorMessageOf(operation="a", errorJson="a") returns "a DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0030 begin`);
      const actual: string = errorMessageOf('a', 'a');
      logInfo(`errorMessageOf(operation="a", errorJson="a"): actual=${actual}`);
      expect(actual).assertEqual('a DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0031
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0031
     * @tc.desc      errorMessageOf(operation="a", errorJson="abc") returns "a DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0031 begin`);
      const actual: string = errorMessageOf('a', 'abc');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0032
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0032
     * @tc.desc      errorMessageOf(operation="a", errorJson="Hello World") returns "a DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0032 begin`);
      const actual: string = errorMessageOf('a', 'Hello World');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0033
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0033
     * @tc.desc      errorMessageOf(operation="a", errorJson=" ") returns "a DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0033 begin`);
      const actual: string = errorMessageOf('a', ' ');
      logInfo(`errorMessageOf(operation="a", errorJson=" "): actual=${actual}`);
      expect(actual).assertEqual('a DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0034
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0034
     * @tc.desc      errorMessageOf(operation="a", errorJson="123") returns "a DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0034 begin`);
      const actual: string = errorMessageOf('a', '123');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0035
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0035
     * @tc.desc      errorMessageOf(operation="a", errorJson=" {} ") returns "a DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0035 begin`);
      const actual: string = errorMessageOf('a', ' {} ');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0036
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0036
     * @tc.desc      errorMessageOf(operation="a", errorJson="{}{}") returns "a DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0036 begin`);
      const actual: string = errorMessageOf('a', '{}{}');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0037
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0037
     * @tc.desc      errorMessageOf(operation="a", errorJson="{}_1") returns "a DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0037 begin`);
      const actual: string = errorMessageOf('a', '{}_1');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0038
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0038
     * @tc.desc      errorMessageOf(operation="a", errorJson="x{}") returns "a DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0038 begin`);
      const actual: string = errorMessageOf('a', 'x{}');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0039
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0039
     * @tc.desc      errorMessageOf(operation="a", errorJson=" [] ") returns "a DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0039 begin`);
      const actual: string = errorMessageOf('a', ' [] ');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0040
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0040
     * @tc.desc      errorMessageOf(operation="a", errorJson="[][]") returns "a DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0040 begin`);
      const actual: string = errorMessageOf('a', '[][]');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0041
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0041
     * @tc.desc      errorMessageOf(operation="a", errorJson="[]_1") returns "a DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0041 begin`);
      const actual: string = errorMessageOf('a', '[]_1');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0042
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0042
     * @tc.desc      errorMessageOf(operation="a", errorJson="x[]") returns "a DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0042 begin`);
      const actual: string = errorMessageOf('a', 'x[]');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0043
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0043
     * @tc.desc      errorMessageOf(operation="a", errorJson=" {?"a?":1} ") returns "a DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0043 begin`);
      const actual: string = errorMessageOf('a', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0044
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0044
     * @tc.desc      errorMessageOf(operation="a", errorJson="{?"a?":1}{?"a?":1}") returns "a DLP failed {?"a?":1}{?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0044 begin`);
      const actual: string = errorMessageOf('a', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0045
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0045
     * @tc.desc      errorMessageOf(operation="a", errorJson="{?"a?":1}_1") returns "a DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0045 begin`);
      const actual: string = errorMessageOf('a', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0046
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0046
     * @tc.desc      errorMessageOf(operation="a", errorJson="x{?"a?":1}") returns "a DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0046 begin`);
      const actual: string = errorMessageOf('a', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0047
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0047
     * @tc.desc      errorMessageOf(operation="a", errorJson=" invalid ") returns "a DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0047 begin`);
      const actual: string = errorMessageOf('a', ' invalid ');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0048
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0048
     * @tc.desc      errorMessageOf(operation="a", errorJson="invalidinvalid") returns "a DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0048 begin`);
      const actual: string = errorMessageOf('a', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="a", errorJson="...: actual=${actual}`);
      expect(actual).assertEqual('a DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0049
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0049
     * @tc.desc      errorMessageOf(operation="abc", errorJson="{}") returns "abc DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0049 begin`);
      const actual: string = errorMessageOf('abc', '{}');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0050
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0050
     * @tc.desc      errorMessageOf(operation="abc", errorJson="[]") returns "abc DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0050 begin`);
      const actual: string = errorMessageOf('abc', '[]');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0051
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0051
     * @tc.desc      errorMessageOf(operation="abc", errorJson="{?"a?":1}") returns "abc DLP failed {?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0051 begin`);
      const actual: string = errorMessageOf('abc', '{"a":1}');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0052
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0052
     * @tc.desc      errorMessageOf(operation="abc", errorJson="invalid") returns "abc DLP failed invalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0052 begin`);
      const actual: string = errorMessageOf('abc', 'invalid');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0053
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0053
     * @tc.desc      errorMessageOf(operation="abc", errorJson="") returns "abc DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0053 begin`);
      const actual: string = errorMessageOf('abc', '');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0054
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0054
     * @tc.desc      errorMessageOf(operation="abc", errorJson="a") returns "abc DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0054 begin`);
      const actual: string = errorMessageOf('abc', 'a');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0055
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0055
     * @tc.desc      errorMessageOf(operation="abc", errorJson="abc") returns "abc DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0055 begin`);
      const actual: string = errorMessageOf('abc', 'abc');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0056
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0056
     * @tc.desc      errorMessageOf(operation="abc", errorJson="Hello World") returns "abc DLP failed Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0056 begin`);
      const actual: string = errorMessageOf('abc', 'Hello World');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0057
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0057
     * @tc.desc      errorMessageOf(operation="abc", errorJson=" ") returns "abc DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0057 begin`);
      const actual: string = errorMessageOf('abc', ' ');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0058
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0058
     * @tc.desc      errorMessageOf(operation="abc", errorJson="123") returns "abc DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0058 begin`);
      const actual: string = errorMessageOf('abc', '123');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0059
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0059
     * @tc.desc      errorMessageOf(operation="abc", errorJson=" {} ") returns "abc DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0059 begin`);
      const actual: string = errorMessageOf('abc', ' {} ');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0060
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0060
     * @tc.desc      errorMessageOf(operation="abc", errorJson="{}{}") returns "abc DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0060 begin`);
      const actual: string = errorMessageOf('abc', '{}{}');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0061
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0061
     * @tc.desc      errorMessageOf(operation="abc", errorJson="{}_1") returns "abc DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0061 begin`);
      const actual: string = errorMessageOf('abc', '{}_1');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0062
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0062
     * @tc.desc      errorMessageOf(operation="abc", errorJson="x{}") returns "abc DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0062 begin`);
      const actual: string = errorMessageOf('abc', 'x{}');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0063
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0063
     * @tc.desc      errorMessageOf(operation="abc", errorJson=" [] ") returns "abc DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0063 begin`);
      const actual: string = errorMessageOf('abc', ' [] ');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0064
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0064
     * @tc.desc      errorMessageOf(operation="abc", errorJson="[][]") returns "abc DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0064 begin`);
      const actual: string = errorMessageOf('abc', '[][]');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0065
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0065
     * @tc.desc      errorMessageOf(operation="abc", errorJson="[]_1") returns "abc DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0065 begin`);
      const actual: string = errorMessageOf('abc', '[]_1');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0066
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0066
     * @tc.desc      errorMessageOf(operation="abc", errorJson="x[]") returns "abc DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0066 begin`);
      const actual: string = errorMessageOf('abc', 'x[]');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0067
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0067
     * @tc.desc      errorMessageOf(operation="abc", errorJson=" {?"a?":1} ") returns "abc DLP failed  {?"a?":1} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0067 begin`);
      const actual: string = errorMessageOf('abc', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0068
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0068
     * @tc.desc      errorMessageOf(operation="abc", errorJson="{?"a?":1}{?"a?":1}") returns "abc DLP failed {?"a?":1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0068 begin`);
      const actual: string = errorMessageOf('abc', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0069
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0069
     * @tc.desc      errorMessageOf(operation="abc", errorJson="{?"a?":1}_1") returns "abc DLP failed {?"a?":1}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0069 begin`);
      const actual: string = errorMessageOf('abc', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0070
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0070
     * @tc.desc      errorMessageOf(operation="abc", errorJson="x{?"a?":1}") returns "abc DLP failed x{?"a?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0070 begin`);
      const actual: string = errorMessageOf('abc', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0071
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0071
     * @tc.desc      errorMessageOf(operation="abc", errorJson=" invalid ") returns "abc DLP failed  invalid "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0071 begin`);
      const actual: string = errorMessageOf('abc', ' invalid ');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0072
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0072
     * @tc.desc      errorMessageOf(operation="abc", errorJson="invalidinvalid") returns "abc DLP failed invalidinvalid"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0072 begin`);
      const actual: string = errorMessageOf('abc', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="abc", errorJson...: actual=${actual}`);
      expect(actual).assertEqual('abc DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0073
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0073
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="{}") returns "Hello World DLP failed {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0073 begin`);
      const actual: string = errorMessageOf('Hello World', '{}');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed {}');
      logInfo(`${BUNDLE}ErrorMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0074
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0074
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="[]") returns "Hello World DLP failed []"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0074 begin`);
      const actual: string = errorMessageOf('Hello World', '[]');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed []');
      logInfo(`${BUNDLE}ErrorMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0075
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0075
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="{?"a?":1}") returns "Hello World DLP failed {...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0075 begin`);
      const actual: string = errorMessageOf('Hello World', '{"a":1}');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed {"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0076
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0076
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="invalid") returns "Hello World DLP failed inv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0076 begin`);
      const actual: string = errorMessageOf('Hello World', 'invalid');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed invalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0077
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0077
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="") returns "Hello World DLP failed "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0077 begin`);
      const actual: string = errorMessageOf('Hello World', '');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed ');
      logInfo(`${BUNDLE}ErrorMessageOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0078
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0078
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="a") returns "Hello World DLP failed a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0078 begin`);
      const actual: string = errorMessageOf('Hello World', 'a');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed a');
      logInfo(`${BUNDLE}ErrorMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0079
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0079
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="abc") returns "Hello World DLP failed abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0079 begin`);
      const actual: string = errorMessageOf('Hello World', 'abc');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed abc');
      logInfo(`${BUNDLE}ErrorMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0080
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0080
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="Hello World") returns "Hello World DLP failed...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0080 begin`);
      const actual: string = errorMessageOf('Hello World', 'Hello World');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed Hello World');
      logInfo(`${BUNDLE}ErrorMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0081
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0081
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson=" ") returns "Hello World DLP failed  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0081 begin`);
      const actual: string = errorMessageOf('Hello World', ' ');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed  ');
      logInfo(`${BUNDLE}ErrorMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0082
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0082
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="123") returns "Hello World DLP failed 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0082 begin`);
      const actual: string = errorMessageOf('Hello World', '123');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed 123');
      logInfo(`${BUNDLE}ErrorMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0083
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0083
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson=" {} ") returns "Hello World DLP failed  {} "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0083 begin`);
      const actual: string = errorMessageOf('Hello World', ' {} ');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed  {} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0084
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0084
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="{}{}") returns "Hello World DLP failed {}{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0084 begin`);
      const actual: string = errorMessageOf('Hello World', '{}{}');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed {}{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0085
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0085
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="{}_1") returns "Hello World DLP failed {}_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0085 begin`);
      const actual: string = errorMessageOf('Hello World', '{}_1');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed {}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0086
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0086
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="x{}") returns "Hello World DLP failed x{}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0086 begin`);
      const actual: string = errorMessageOf('Hello World', 'x{}');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed x{}');
      logInfo(`${BUNDLE}ErrorMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0087
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0087
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson=" [] ") returns "Hello World DLP failed  [] "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0087 begin`);
      const actual: string = errorMessageOf('Hello World', ' [] ');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed  [] ');
      logInfo(`${BUNDLE}ErrorMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0088
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0088
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="[][]") returns "Hello World DLP failed [][]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0088 begin`);
      const actual: string = errorMessageOf('Hello World', '[][]');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed [][]');
      logInfo(`${BUNDLE}ErrorMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0089
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0089
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="[]_1") returns "Hello World DLP failed []_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0089 begin`);
      const actual: string = errorMessageOf('Hello World', '[]_1');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed []_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0090
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0090
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="x[]") returns "Hello World DLP failed x[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0090 begin`);
      const actual: string = errorMessageOf('Hello World', 'x[]');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed x[]');
      logInfo(`${BUNDLE}ErrorMessageOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0091
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0091
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson=" {?"a?":1} ") returns "Hello World DLP failed...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0091 begin`);
      const actual: string = errorMessageOf('Hello World', ' {"a":1} ');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed  {"a":1} ');
      logInfo(`${BUNDLE}ErrorMessageOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0092
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0092
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="{?"a?":1}{?"a?":1}") returns "Hello World DLP...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0092 begin`);
      const actual: string = errorMessageOf('Hello World', '{"a":1}{"a":1}');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed {"a":1}{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0093
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0093
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="{?"a?":1}_1") returns "Hello World DLP failed...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0093 begin`);
      const actual: string = errorMessageOf('Hello World', '{"a":1}_1');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed {"a":1}_1');
      logInfo(`${BUNDLE}ErrorMessageOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0094
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0094
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="x{?"a?":1}") returns "Hello World DLP failed ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0094 begin`);
      const actual: string = errorMessageOf('Hello World', 'x{"a":1}');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed x{"a":1}');
      logInfo(`${BUNDLE}ErrorMessageOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0095
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0095
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson=" invalid ") returns "Hello World DLP failed  ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ErrorMessageOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0095 begin`);
      const actual: string = errorMessageOf('Hello World', ' invalid ');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed  invalid ');
      logInfo(`${BUNDLE}ErrorMessageOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ERROR_MESSAGE_OF_0096
     * @tc.name      FilePreviewDLP_ErrorMessageOf_0096
     * @tc.desc      errorMessageOf(operation="Hello World", errorJson="invalidinvalid") returns "Hello World DLP fai...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ErrorMessageOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorMessageOf_0096 begin`);
      const actual: string = errorMessageOf('Hello World', 'invalidinvalid');
      logInfo(`errorMessageOf(operation="Hello World", e...: actual=${actual}`);
      expect(actual).assertEqual('Hello World DLP failed invalidinvalid');
      logInfo(`${BUNDLE}ErrorMessageOf_0096 end`);
    });
  });
}
