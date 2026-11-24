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
import { yieldToEventLoop } from '../../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { progressText } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for progressText (24 cases). */
export default function progressText2Test(): void {
  describe('ProgressText2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0097
     * @tc.name      PageLoading_ProgressText_0097
     * @tc.desc      progressText(progress=4846163) returns "?????4846163%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0097 begin`);
      const actual: string = progressText(4846163);
      logInfo(`progressText(progress=4846163): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4846163%');
      logInfo(`${BUNDLE}ProgressText_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0098
     * @tc.name      PageLoading_ProgressText_0098
     * @tc.desc      progressText(progress=6524107) returns "?????6524107%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0098 begin`);
      const actual: string = progressText(6524107);
      logInfo(`progressText(progress=6524107): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6524107%');
      logInfo(`${BUNDLE}ProgressText_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0099
     * @tc.name      PageLoading_ProgressText_0099
     * @tc.desc      progressText(progress=-2955976) returns "?????-2955976%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0099 begin`);
      const actual: string = progressText(-2955976);
      logInfo(`progressText(progress=-2955976): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-2955976%');
      logInfo(`${BUNDLE}ProgressText_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0100
     * @tc.name      PageLoading_ProgressText_0100
     * @tc.desc      progressText(progress=463387) returns "?????463387%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0100 begin`);
      const actual: string = progressText(463387);
      logInfo(`progressText(progress=463387): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d463387%');
      logInfo(`${BUNDLE}ProgressText_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0101
     * @tc.name      PageLoading_ProgressText_0101
     * @tc.desc      progressText(progress=2922280.14) returns "?????2922280.14%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0101 begin`);
      const actual: string = progressText(2922280.14);
      logInfo(`progressText(progress=2922280.14): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2922280.14%');
      logInfo(`${BUNDLE}ProgressText_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0102
     * @tc.name      PageLoading_ProgressText_0102
     * @tc.desc      progressText(progress=5275541) returns "?????5275541%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0102 begin`);
      const actual: string = progressText(5275541);
      logInfo(`progressText(progress=5275541): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5275541%');
      logInfo(`${BUNDLE}ProgressText_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0103
     * @tc.name      PageLoading_ProgressText_0103
     * @tc.desc      progressText(progress=1000215.61) returns "?????1000215.61%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0103 begin`);
      const actual: string = progressText(1000215.61);
      logInfo(`progressText(progress=1000215.61): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1000215.61%');
      logInfo(`${BUNDLE}ProgressText_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0104
     * @tc.name      PageLoading_ProgressText_0104
     * @tc.desc      progressText(progress=701868.83) returns "?????701868.83%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0104 begin`);
      const actual: string = progressText(701868.83);
      logInfo(`progressText(progress=701868.83): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d701868.83%');
      logInfo(`${BUNDLE}ProgressText_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0105
     * @tc.name      PageLoading_ProgressText_0105
     * @tc.desc      progressText(progress=-603036) returns "?????-603036%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0105 begin`);
      const actual: string = progressText(-603036);
      logInfo(`progressText(progress=-603036): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-603036%');
      logInfo(`${BUNDLE}ProgressText_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0106
     * @tc.name      PageLoading_ProgressText_0106
     * @tc.desc      progressText(progress=-20732) returns "?????-20732%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0106 begin`);
      const actual: string = progressText(-20732);
      logInfo(`progressText(progress=-20732): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-20732%');
      logInfo(`${BUNDLE}ProgressText_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0107
     * @tc.name      PageLoading_ProgressText_0107
     * @tc.desc      progressText(progress=2990671) returns "?????2990671%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0107 begin`);
      const actual: string = progressText(2990671);
      logInfo(`progressText(progress=2990671): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2990671%');
      logInfo(`${BUNDLE}ProgressText_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0108
     * @tc.name      PageLoading_ProgressText_0108
     * @tc.desc      progressText(progress=5697351) returns "?????5697351%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0108 begin`);
      const actual: string = progressText(5697351);
      logInfo(`progressText(progress=5697351): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5697351%');
      logInfo(`${BUNDLE}ProgressText_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0109
     * @tc.name      PageLoading_ProgressText_0109
     * @tc.desc      progressText(progress=1482476.54) returns "?????1482476.54%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0109 begin`);
      const actual: string = progressText(1482476.54);
      logInfo(`progressText(progress=1482476.54): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1482476.54%');
      logInfo(`${BUNDLE}ProgressText_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0110
     * @tc.name      PageLoading_ProgressText_0110
     * @tc.desc      progressText(progress=277349) returns "?????277349%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0110 begin`);
      const actual: string = progressText(277349);
      logInfo(`progressText(progress=277349): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d277349%');
      logInfo(`${BUNDLE}ProgressText_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0111
     * @tc.name      PageLoading_ProgressText_0111
     * @tc.desc      progressText(progress=267518) returns "?????267518%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0111 begin`);
      const actual: string = progressText(267518);
      logInfo(`progressText(progress=267518): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d267518%');
      logInfo(`${BUNDLE}ProgressText_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0112
     * @tc.name      PageLoading_ProgressText_0112
     * @tc.desc      progressText(progress=5141764) returns "?????5141764%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0112 begin`);
      const actual: string = progressText(5141764);
      logInfo(`progressText(progress=5141764): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5141764%');
      logInfo(`${BUNDLE}ProgressText_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0113
     * @tc.name      PageLoading_ProgressText_0113
     * @tc.desc      progressText(progress=1869627) returns "?????1869627%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0113 begin`);
      const actual: string = progressText(1869627);
      logInfo(`progressText(progress=1869627): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1869627%');
      logInfo(`${BUNDLE}ProgressText_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0114
     * @tc.name      PageLoading_ProgressText_0114
     * @tc.desc      progressText(progress=77478) returns "?????77478%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0114 begin`);
      const actual: string = progressText(77478);
      logInfo(`progressText(progress=77478): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d77478%');
      logInfo(`${BUNDLE}ProgressText_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0115
     * @tc.name      PageLoading_ProgressText_0115
     * @tc.desc      progressText(progress=-1834259) returns "?????-1834259%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0115 begin`);
      const actual: string = progressText(-1834259);
      logInfo(`progressText(progress=-1834259): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-1834259%');
      logInfo(`${BUNDLE}ProgressText_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0116
     * @tc.name      PageLoading_ProgressText_0116
     * @tc.desc      progressText(progress=2172101.54) returns "?????2172101.54%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0116 begin`);
      const actual: string = progressText(2172101.54);
      logInfo(`progressText(progress=2172101.54): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2172101.54%');
      logInfo(`${BUNDLE}ProgressText_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0117
     * @tc.name      PageLoading_ProgressText_0117
     * @tc.desc      progressText(progress=2119899.66) returns "?????2119899.66%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0117 begin`);
      const actual: string = progressText(2119899.66);
      logInfo(`progressText(progress=2119899.66): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2119899.66%');
      logInfo(`${BUNDLE}ProgressText_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0118
     * @tc.name      PageLoading_ProgressText_0118
     * @tc.desc      progressText(progress=-1175535) returns "?????-1175535%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0118 begin`);
      const actual: string = progressText(-1175535);
      logInfo(`progressText(progress=-1175535): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-1175535%');
      logInfo(`${BUNDLE}ProgressText_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0119
     * @tc.name      PageLoading_ProgressText_0119
     * @tc.desc      progressText(progress=-553856) returns "?????-553856%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0119 begin`);
      const actual: string = progressText(-553856);
      logInfo(`progressText(progress=-553856): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-553856%');
      logInfo(`${BUNDLE}ProgressText_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0120
     * @tc.name      PageLoading_ProgressText_0120
     * @tc.desc      progressText(progress=2138855) returns "?????2138855%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0120 begin`);
      const actual: string = progressText(2138855);
      logInfo(`progressText(progress=2138855): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2138855%');
      logInfo(`${BUNDLE}ProgressText_0120 end`);
    });
  });
}
