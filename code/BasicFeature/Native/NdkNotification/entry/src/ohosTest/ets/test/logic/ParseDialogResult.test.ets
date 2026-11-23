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
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { parseDialogResult } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for parseDialogResult (30 cases). */
export default function parseDialogResultTest(): void {
  describe('ParseDialogResultTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0001
     * @tc.name      NdkNotification_ParseDialogResult_0001
     * @tc.desc      parseDialogResult(text="true") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_ParseDialogResult_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0001 begin`);
      const actual: number = parseDialogResult('true');
      logInfo(`parseDialogResult(text="true"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0002
     * @tc.name      NdkNotification_ParseDialogResult_0002
     * @tc.desc      parseDialogResult(text="false") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_ParseDialogResult_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0002 begin`);
      const actual: number = parseDialogResult('false');
      logInfo(`parseDialogResult(text="false"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0003
     * @tc.name      NdkNotification_ParseDialogResult_0003
     * @tc.desc      parseDialogResult(text="TRUE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0003 begin`);
      const actual: number = parseDialogResult('TRUE');
      logInfo(`parseDialogResult(text="TRUE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0004
     * @tc.name      NdkNotification_ParseDialogResult_0004
     * @tc.desc      parseDialogResult(text="tru") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0004 begin`);
      const actual: number = parseDialogResult('tru');
      logInfo(`parseDialogResult(text="tru"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0005
     * @tc.name      NdkNotification_ParseDialogResult_0005
     * @tc.desc      parseDialogResult(text="truex") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0005 begin`);
      const actual: number = parseDialogResult('truex');
      logInfo(`parseDialogResult(text="truex"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0006
     * @tc.name      NdkNotification_ParseDialogResult_0006
     * @tc.desc      parseDialogResult(text="FALSE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0006 begin`);
      const actual: number = parseDialogResult('FALSE');
      logInfo(`parseDialogResult(text="FALSE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0007
     * @tc.name      NdkNotification_ParseDialogResult_0007
     * @tc.desc      parseDialogResult(text="fals") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0007 begin`);
      const actual: number = parseDialogResult('fals');
      logInfo(`parseDialogResult(text="fals"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0008
     * @tc.name      NdkNotification_ParseDialogResult_0008
     * @tc.desc      parseDialogResult(text="falsex") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0008 begin`);
      const actual: number = parseDialogResult('falsex');
      logInfo(`parseDialogResult(text="falsex"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0009
     * @tc.name      NdkNotification_ParseDialogResult_0009
     * @tc.desc      parseDialogResult(text="Hello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0009 begin`);
      const actual: number = parseDialogResult('Hello');
      logInfo(`parseDialogResult(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0010
     * @tc.name      NdkNotification_ParseDialogResult_0010
     * @tc.desc      parseDialogResult(text="hello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0010 begin`);
      const actual: number = parseDialogResult('hello world');
      logInfo(`parseDialogResult(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0011
     * @tc.name      NdkNotification_ParseDialogResult_0011
     * @tc.desc      parseDialogResult(text="") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0011 begin`);
      const actual: number = parseDialogResult('');
      logInfo(`parseDialogResult(text=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0012
     * @tc.name      NdkNotification_ParseDialogResult_0012
     * @tc.desc      parseDialogResult(text=" ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0012 begin`);
      const actual: number = parseDialogResult(' ');
      logInfo(`parseDialogResult(text=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0013
     * @tc.name      NdkNotification_ParseDialogResult_0013
     * @tc.desc      parseDialogResult(text="A") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0013 begin`);
      const actual: number = parseDialogResult('A');
      logInfo(`parseDialogResult(text="A"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0014
     * @tc.name      NdkNotification_ParseDialogResult_0014
     * @tc.desc      parseDialogResult(text="Sample Title 123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0014 begin`);
      const actual: number = parseDialogResult('Sample Title 123');
      logInfo(`parseDialogResult(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0015
     * @tc.name      NdkNotification_ParseDialogResult_0015
     * @tc.desc      parseDialogResult(text="??") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0015 begin`);
      const actual: number = parseDialogResult('\u4e2d\u6587');
      logInfo(`parseDialogResult(text="??"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0016
     * @tc.name      NdkNotification_ParseDialogResult_0016
     * @tc.desc      parseDialogResult(text="a") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0016 begin`);
      const actual: number = parseDialogResult('a');
      logInfo(`parseDialogResult(text="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0017
     * @tc.name      NdkNotification_ParseDialogResult_0017
     * @tc.desc      parseDialogResult(text="abc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0017 begin`);
      const actual: number = parseDialogResult('abc');
      logInfo(`parseDialogResult(text="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0018
     * @tc.name      NdkNotification_ParseDialogResult_0018
     * @tc.desc      parseDialogResult(text="Hello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0018 begin`);
      const actual: number = parseDialogResult('Hello World');
      logInfo(`parseDialogResult(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0019
     * @tc.name      NdkNotification_ParseDialogResult_0019
     * @tc.desc      parseDialogResult(text="123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0019 begin`);
      const actual: number = parseDialogResult('123');
      logInfo(`parseDialogResult(text="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0020
     * @tc.name      NdkNotification_ParseDialogResult_0020
     * @tc.desc      parseDialogResult(text=" true ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0020 begin`);
      const actual: number = parseDialogResult(' true ');
      logInfo(`parseDialogResult(text=" true "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0021
     * @tc.name      NdkNotification_ParseDialogResult_0021
     * @tc.desc      parseDialogResult(text="truetrue") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0021 begin`);
      const actual: number = parseDialogResult('truetrue');
      logInfo(`parseDialogResult(text="truetrue"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0022
     * @tc.name      NdkNotification_ParseDialogResult_0022
     * @tc.desc      parseDialogResult(text="true_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0022 begin`);
      const actual: number = parseDialogResult('true_1');
      logInfo(`parseDialogResult(text="true_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0023
     * @tc.name      NdkNotification_ParseDialogResult_0023
     * @tc.desc      parseDialogResult(text="xtrue") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0023 begin`);
      const actual: number = parseDialogResult('xtrue');
      logInfo(`parseDialogResult(text="xtrue"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0024
     * @tc.name      NdkNotification_ParseDialogResult_0024
     * @tc.desc      parseDialogResult(text=" false ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0024 begin`);
      const actual: number = parseDialogResult(' false ');
      logInfo(`parseDialogResult(text=" false "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0025
     * @tc.name      NdkNotification_ParseDialogResult_0025
     * @tc.desc      parseDialogResult(text="falsefalse") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0025 begin`);
      const actual: number = parseDialogResult('falsefalse');
      logInfo(`parseDialogResult(text="falsefalse"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0026
     * @tc.name      NdkNotification_ParseDialogResult_0026
     * @tc.desc      parseDialogResult(text="false_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0026 begin`);
      const actual: number = parseDialogResult('false_1');
      logInfo(`parseDialogResult(text="false_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0027
     * @tc.name      NdkNotification_ParseDialogResult_0027
     * @tc.desc      parseDialogResult(text="xfalse") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0027 begin`);
      const actual: number = parseDialogResult('xfalse');
      logInfo(`parseDialogResult(text="xfalse"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0028
     * @tc.name      NdkNotification_ParseDialogResult_0028
     * @tc.desc      parseDialogResult(text=" TRUE ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_ParseDialogResult_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0028 begin`);
      const actual: number = parseDialogResult(' TRUE ');
      logInfo(`parseDialogResult(text=" TRUE "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0029
     * @tc.name      NdkNotification_ParseDialogResult_0029
     * @tc.desc      parseDialogResult(text="TRUETRUE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0029 begin`);
      const actual: number = parseDialogResult('TRUETRUE');
      logInfo(`parseDialogResult(text="TRUETRUE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PARSE_DIALOG_RESULT_0030
     * @tc.name      NdkNotification_ParseDialogResult_0030
     * @tc.desc      parseDialogResult(text="TRUE_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_ParseDialogResult_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParseDialogResult_0030 begin`);
      const actual: number = parseDialogResult('TRUE_1');
      logInfo(`parseDialogResult(text="TRUE_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ParseDialogResult_0030 end`);
    });
  });
}
