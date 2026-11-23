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

/** Logic checks for progressText (96 cases). */
export default function progressTextTest(): void {
  describe('ProgressTextTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0001
     * @tc.name      PageLoading_ProgressText_0001
     * @tc.desc      progressText(progress=0) returns "?????0%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProgressText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProgressText_0001 begin`);
      const actual: string = progressText(0);
      logInfo(`progressText(progress=0): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}ProgressText_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0002
     * @tc.name      PageLoading_ProgressText_0002
     * @tc.desc      progressText(progress=500) returns "?????500%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProgressText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProgressText_0002 begin`);
      const actual: string = progressText(500);
      logInfo(`progressText(progress=500): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d500%');
      logInfo(`${BUNDLE}ProgressText_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0003
     * @tc.name      PageLoading_ProgressText_0003
     * @tc.desc      progressText(progress=999) returns "?????999%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0003 begin`);
      const actual: string = progressText(999);
      logInfo(`progressText(progress=999): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d999%');
      logInfo(`${BUNDLE}ProgressText_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0004
     * @tc.name      PageLoading_ProgressText_0004
     * @tc.desc      progressText(progress=1000) returns "?????1000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0004 begin`);
      const actual: string = progressText(1000);
      logInfo(`progressText(progress=1000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1000%');
      logInfo(`${BUNDLE}ProgressText_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0005
     * @tc.name      PageLoading_ProgressText_0005
     * @tc.desc      progressText(progress=59999) returns "?????59999%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0005 begin`);
      const actual: string = progressText(59999);
      logInfo(`progressText(progress=59999): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d59999%');
      logInfo(`${BUNDLE}ProgressText_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0006
     * @tc.name      PageLoading_ProgressText_0006
     * @tc.desc      progressText(progress=60000) returns "?????60000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0006 begin`);
      const actual: string = progressText(60000);
      logInfo(`progressText(progress=60000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d60000%');
      logInfo(`${BUNDLE}ProgressText_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0007
     * @tc.name      PageLoading_ProgressText_0007
     * @tc.desc      progressText(progress=61000) returns "?????61000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0007 begin`);
      const actual: string = progressText(61000);
      logInfo(`progressText(progress=61000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d61000%');
      logInfo(`${BUNDLE}ProgressText_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0008
     * @tc.name      PageLoading_ProgressText_0008
     * @tc.desc      progressText(progress=3599000) returns "?????3599000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0008 begin`);
      const actual: string = progressText(3599000);
      logInfo(`progressText(progress=3599000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3599000%');
      logInfo(`${BUNDLE}ProgressText_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0009
     * @tc.name      PageLoading_ProgressText_0009
     * @tc.desc      progressText(progress=3600000) returns "?????3600000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0009 begin`);
      const actual: string = progressText(3600000);
      logInfo(`progressText(progress=3600000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3600000%');
      logInfo(`${BUNDLE}ProgressText_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0010
     * @tc.name      PageLoading_ProgressText_0010
     * @tc.desc      progressText(progress=1) returns "?????1%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0010 begin`);
      const actual: string = progressText(1);
      logInfo(`progressText(progress=1): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1%');
      logInfo(`${BUNDLE}ProgressText_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0011
     * @tc.name      PageLoading_ProgressText_0011
     * @tc.desc      progressText(progress=-1) returns "?????-1%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0011 begin`);
      const actual: string = progressText(-1);
      logInfo(`progressText(progress=-1): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-1%');
      logInfo(`${BUNDLE}ProgressText_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0012
     * @tc.name      PageLoading_ProgressText_0012
     * @tc.desc      progressText(progress=2) returns "?????2%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0012 begin`);
      const actual: string = progressText(2);
      logInfo(`progressText(progress=2): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2%');
      logInfo(`${BUNDLE}ProgressText_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0013
     * @tc.name      PageLoading_ProgressText_0013
     * @tc.desc      progressText(progress=3) returns "?????3%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0013 begin`);
      const actual: string = progressText(3);
      logInfo(`progressText(progress=3): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3%');
      logInfo(`${BUNDLE}ProgressText_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0014
     * @tc.name      PageLoading_ProgressText_0014
     * @tc.desc      progressText(progress=10) returns "?????10%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0014 begin`);
      const actual: string = progressText(10);
      logInfo(`progressText(progress=10): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d10%');
      logInfo(`${BUNDLE}ProgressText_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0015
     * @tc.name      PageLoading_ProgressText_0015
     * @tc.desc      progressText(progress=100) returns "?????100%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0015 begin`);
      const actual: string = progressText(100);
      logInfo(`progressText(progress=100): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d100%');
      logInfo(`${BUNDLE}ProgressText_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0016
     * @tc.name      PageLoading_ProgressText_0016
     * @tc.desc      progressText(progress=180000) returns "?????180000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0016 begin`);
      const actual: string = progressText(180000);
      logInfo(`progressText(progress=180000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d180000%');
      logInfo(`${BUNDLE}ProgressText_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0017
     * @tc.name      PageLoading_ProgressText_0017
     * @tc.desc      progressText(progress=360000) returns "?????360000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0017 begin`);
      const actual: string = progressText(360000);
      logInfo(`progressText(progress=360000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d360000%');
      logInfo(`${BUNDLE}ProgressText_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0018
     * @tc.name      PageLoading_ProgressText_0018
     * @tc.desc      progressText(progress=540000) returns "?????540000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0018 begin`);
      const actual: string = progressText(540000);
      logInfo(`progressText(progress=540000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d540000%');
      logInfo(`${BUNDLE}ProgressText_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0019
     * @tc.name      PageLoading_ProgressText_0019
     * @tc.desc      progressText(progress=720000) returns "?????720000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0019 begin`);
      const actual: string = progressText(720000);
      logInfo(`progressText(progress=720000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d720000%');
      logInfo(`${BUNDLE}ProgressText_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0020
     * @tc.name      PageLoading_ProgressText_0020
     * @tc.desc      progressText(progress=900000) returns "?????900000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0020 begin`);
      const actual: string = progressText(900000);
      logInfo(`progressText(progress=900000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d900000%');
      logInfo(`${BUNDLE}ProgressText_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0021
     * @tc.name      PageLoading_ProgressText_0021
     * @tc.desc      progressText(progress=1080000) returns "?????1080000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0021 begin`);
      const actual: string = progressText(1080000);
      logInfo(`progressText(progress=1080000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1080000%');
      logInfo(`${BUNDLE}ProgressText_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0022
     * @tc.name      PageLoading_ProgressText_0022
     * @tc.desc      progressText(progress=1260000) returns "?????1260000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0022 begin`);
      const actual: string = progressText(1260000);
      logInfo(`progressText(progress=1260000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1260000%');
      logInfo(`${BUNDLE}ProgressText_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0023
     * @tc.name      PageLoading_ProgressText_0023
     * @tc.desc      progressText(progress=1440000) returns "?????1440000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0023 begin`);
      const actual: string = progressText(1440000);
      logInfo(`progressText(progress=1440000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1440000%');
      logInfo(`${BUNDLE}ProgressText_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0024
     * @tc.name      PageLoading_ProgressText_0024
     * @tc.desc      progressText(progress=1620000) returns "?????1620000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0024 begin`);
      const actual: string = progressText(1620000);
      logInfo(`progressText(progress=1620000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1620000%');
      logInfo(`${BUNDLE}ProgressText_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0025
     * @tc.name      PageLoading_ProgressText_0025
     * @tc.desc      progressText(progress=1800000) returns "?????1800000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0025 begin`);
      const actual: string = progressText(1800000);
      logInfo(`progressText(progress=1800000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1800000%');
      logInfo(`${BUNDLE}ProgressText_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0026
     * @tc.name      PageLoading_ProgressText_0026
     * @tc.desc      progressText(progress=1980000) returns "?????1980000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0026 begin`);
      const actual: string = progressText(1980000);
      logInfo(`progressText(progress=1980000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1980000%');
      logInfo(`${BUNDLE}ProgressText_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0027
     * @tc.name      PageLoading_ProgressText_0027
     * @tc.desc      progressText(progress=2160000) returns "?????2160000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0027 begin`);
      const actual: string = progressText(2160000);
      logInfo(`progressText(progress=2160000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2160000%');
      logInfo(`${BUNDLE}ProgressText_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0028
     * @tc.name      PageLoading_ProgressText_0028
     * @tc.desc      progressText(progress=2340000) returns "?????2340000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0028 begin`);
      const actual: string = progressText(2340000);
      logInfo(`progressText(progress=2340000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2340000%');
      logInfo(`${BUNDLE}ProgressText_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0029
     * @tc.name      PageLoading_ProgressText_0029
     * @tc.desc      progressText(progress=2520000) returns "?????2520000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0029 begin`);
      const actual: string = progressText(2520000);
      logInfo(`progressText(progress=2520000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2520000%');
      logInfo(`${BUNDLE}ProgressText_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0030
     * @tc.name      PageLoading_ProgressText_0030
     * @tc.desc      progressText(progress=2700000) returns "?????2700000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0030 begin`);
      const actual: string = progressText(2700000);
      logInfo(`progressText(progress=2700000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2700000%');
      logInfo(`${BUNDLE}ProgressText_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0031
     * @tc.name      PageLoading_ProgressText_0031
     * @tc.desc      progressText(progress=2880000) returns "?????2880000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0031 begin`);
      const actual: string = progressText(2880000);
      logInfo(`progressText(progress=2880000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2880000%');
      logInfo(`${BUNDLE}ProgressText_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0032
     * @tc.name      PageLoading_ProgressText_0032
     * @tc.desc      progressText(progress=3060000) returns "?????3060000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0032 begin`);
      const actual: string = progressText(3060000);
      logInfo(`progressText(progress=3060000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3060000%');
      logInfo(`${BUNDLE}ProgressText_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0033
     * @tc.name      PageLoading_ProgressText_0033
     * @tc.desc      progressText(progress=3240000) returns "?????3240000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0033 begin`);
      const actual: string = progressText(3240000);
      logInfo(`progressText(progress=3240000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3240000%');
      logInfo(`${BUNDLE}ProgressText_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0034
     * @tc.name      PageLoading_ProgressText_0034
     * @tc.desc      progressText(progress=3420000) returns "?????3420000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0034 begin`);
      const actual: string = progressText(3420000);
      logInfo(`progressText(progress=3420000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3420000%');
      logInfo(`${BUNDLE}ProgressText_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0035
     * @tc.name      PageLoading_ProgressText_0035
     * @tc.desc      progressText(progress=3780000) returns "?????3780000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0035 begin`);
      const actual: string = progressText(3780000);
      logInfo(`progressText(progress=3780000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3780000%');
      logInfo(`${BUNDLE}ProgressText_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0036
     * @tc.name      PageLoading_ProgressText_0036
     * @tc.desc      progressText(progress=3960000) returns "?????3960000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0036 begin`);
      const actual: string = progressText(3960000);
      logInfo(`progressText(progress=3960000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3960000%');
      logInfo(`${BUNDLE}ProgressText_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0037
     * @tc.name      PageLoading_ProgressText_0037
     * @tc.desc      progressText(progress=4140000) returns "?????4140000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0037 begin`);
      const actual: string = progressText(4140000);
      logInfo(`progressText(progress=4140000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4140000%');
      logInfo(`${BUNDLE}ProgressText_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0038
     * @tc.name      PageLoading_ProgressText_0038
     * @tc.desc      progressText(progress=4320000) returns "?????4320000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0038 begin`);
      const actual: string = progressText(4320000);
      logInfo(`progressText(progress=4320000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4320000%');
      logInfo(`${BUNDLE}ProgressText_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0039
     * @tc.name      PageLoading_ProgressText_0039
     * @tc.desc      progressText(progress=4500000) returns "?????4500000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0039 begin`);
      const actual: string = progressText(4500000);
      logInfo(`progressText(progress=4500000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4500000%');
      logInfo(`${BUNDLE}ProgressText_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0040
     * @tc.name      PageLoading_ProgressText_0040
     * @tc.desc      progressText(progress=4680000) returns "?????4680000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0040 begin`);
      const actual: string = progressText(4680000);
      logInfo(`progressText(progress=4680000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4680000%');
      logInfo(`${BUNDLE}ProgressText_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0041
     * @tc.name      PageLoading_ProgressText_0041
     * @tc.desc      progressText(progress=4860000) returns "?????4860000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0041 begin`);
      const actual: string = progressText(4860000);
      logInfo(`progressText(progress=4860000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4860000%');
      logInfo(`${BUNDLE}ProgressText_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0042
     * @tc.name      PageLoading_ProgressText_0042
     * @tc.desc      progressText(progress=5040000) returns "?????5040000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0042 begin`);
      const actual: string = progressText(5040000);
      logInfo(`progressText(progress=5040000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5040000%');
      logInfo(`${BUNDLE}ProgressText_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0043
     * @tc.name      PageLoading_ProgressText_0043
     * @tc.desc      progressText(progress=5220000) returns "?????5220000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0043 begin`);
      const actual: string = progressText(5220000);
      logInfo(`progressText(progress=5220000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5220000%');
      logInfo(`${BUNDLE}ProgressText_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0044
     * @tc.name      PageLoading_ProgressText_0044
     * @tc.desc      progressText(progress=5400000) returns "?????5400000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0044 begin`);
      const actual: string = progressText(5400000);
      logInfo(`progressText(progress=5400000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5400000%');
      logInfo(`${BUNDLE}ProgressText_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0045
     * @tc.name      PageLoading_ProgressText_0045
     * @tc.desc      progressText(progress=5580000) returns "?????5580000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0045 begin`);
      const actual: string = progressText(5580000);
      logInfo(`progressText(progress=5580000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5580000%');
      logInfo(`${BUNDLE}ProgressText_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0046
     * @tc.name      PageLoading_ProgressText_0046
     * @tc.desc      progressText(progress=5760000) returns "?????5760000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0046 begin`);
      const actual: string = progressText(5760000);
      logInfo(`progressText(progress=5760000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5760000%');
      logInfo(`${BUNDLE}ProgressText_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0047
     * @tc.name      PageLoading_ProgressText_0047
     * @tc.desc      progressText(progress=5940000) returns "?????5940000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0047 begin`);
      const actual: string = progressText(5940000);
      logInfo(`progressText(progress=5940000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5940000%');
      logInfo(`${BUNDLE}ProgressText_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0048
     * @tc.name      PageLoading_ProgressText_0048
     * @tc.desc      progressText(progress=6120000) returns "?????6120000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0048 begin`);
      const actual: string = progressText(6120000);
      logInfo(`progressText(progress=6120000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6120000%');
      logInfo(`${BUNDLE}ProgressText_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0049
     * @tc.name      PageLoading_ProgressText_0049
     * @tc.desc      progressText(progress=6300000) returns "?????6300000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0049 begin`);
      const actual: string = progressText(6300000);
      logInfo(`progressText(progress=6300000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6300000%');
      logInfo(`${BUNDLE}ProgressText_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0050
     * @tc.name      PageLoading_ProgressText_0050
     * @tc.desc      progressText(progress=6480000) returns "?????6480000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0050 begin`);
      const actual: string = progressText(6480000);
      logInfo(`progressText(progress=6480000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6480000%');
      logInfo(`${BUNDLE}ProgressText_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0051
     * @tc.name      PageLoading_ProgressText_0051
     * @tc.desc      progressText(progress=6660000) returns "?????6660000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0051 begin`);
      const actual: string = progressText(6660000);
      logInfo(`progressText(progress=6660000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6660000%');
      logInfo(`${BUNDLE}ProgressText_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0052
     * @tc.name      PageLoading_ProgressText_0052
     * @tc.desc      progressText(progress=6840000) returns "?????6840000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0052 begin`);
      const actual: string = progressText(6840000);
      logInfo(`progressText(progress=6840000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6840000%');
      logInfo(`${BUNDLE}ProgressText_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0053
     * @tc.name      PageLoading_ProgressText_0053
     * @tc.desc      progressText(progress=7020000) returns "?????7020000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0053 begin`);
      const actual: string = progressText(7020000);
      logInfo(`progressText(progress=7020000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d7020000%');
      logInfo(`${BUNDLE}ProgressText_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0054
     * @tc.name      PageLoading_ProgressText_0054
     * @tc.desc      progressText(progress=7200000) returns "?????7200000%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0054 begin`);
      const actual: string = progressText(7200000);
      logInfo(`progressText(progress=7200000): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d7200000%');
      logInfo(`${BUNDLE}ProgressText_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0055
     * @tc.name      PageLoading_ProgressText_0055
     * @tc.desc      progressText(progress=6293622) returns "?????6293622%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0055 begin`);
      const actual: string = progressText(6293622);
      logInfo(`progressText(progress=6293622): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6293622%');
      logInfo(`${BUNDLE}ProgressText_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0056
     * @tc.name      PageLoading_ProgressText_0056
     * @tc.desc      progressText(progress=-437508) returns "?????-437508%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0056 begin`);
      const actual: string = progressText(-437508);
      logInfo(`progressText(progress=-437508): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-437508%');
      logInfo(`${BUNDLE}ProgressText_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0057
     * @tc.name      PageLoading_ProgressText_0057
     * @tc.desc      progressText(progress=964256) returns "?????964256%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0057 begin`);
      const actual: string = progressText(964256);
      logInfo(`progressText(progress=964256): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d964256%');
      logInfo(`${BUNDLE}ProgressText_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0058
     * @tc.name      PageLoading_ProgressText_0058
     * @tc.desc      progressText(progress=4543631) returns "?????4543631%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0058 begin`);
      const actual: string = progressText(4543631);
      logInfo(`progressText(progress=4543631): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4543631%');
      logInfo(`${BUNDLE}ProgressText_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0059
     * @tc.name      PageLoading_ProgressText_0059
     * @tc.desc      progressText(progress=201825.27) returns "?????201825.27%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0059 begin`);
      const actual: string = progressText(201825.27);
      logInfo(`progressText(progress=201825.27): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d201825.27%');
      logInfo(`${BUNDLE}ProgressText_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0060
     * @tc.name      PageLoading_ProgressText_0060
     * @tc.desc      progressText(progress=5122967) returns "?????5122967%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0060 begin`);
      const actual: string = progressText(5122967);
      logInfo(`progressText(progress=5122967): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5122967%');
      logInfo(`${BUNDLE}ProgressText_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0061
     * @tc.name      PageLoading_ProgressText_0061
     * @tc.desc      progressText(progress=3282507) returns "?????3282507%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0061 begin`);
      const actual: string = progressText(3282507);
      logInfo(`progressText(progress=3282507): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3282507%');
      logInfo(`${BUNDLE}ProgressText_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0062
     * @tc.name      PageLoading_ProgressText_0062
     * @tc.desc      progressText(progress=2398208) returns "?????2398208%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0062 begin`);
      const actual: string = progressText(2398208);
      logInfo(`progressText(progress=2398208): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2398208%');
      logInfo(`${BUNDLE}ProgressText_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0063
     * @tc.name      PageLoading_ProgressText_0063
     * @tc.desc      progressText(progress=3683013) returns "?????3683013%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0063 begin`);
      const actual: string = progressText(3683013);
      logInfo(`progressText(progress=3683013): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3683013%');
      logInfo(`${BUNDLE}ProgressText_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0064
     * @tc.name      PageLoading_ProgressText_0064
     * @tc.desc      progressText(progress=3130594.6) returns "?????3130594.6%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0064 begin`);
      const actual: string = progressText(3130594.6);
      logInfo(`progressText(progress=3130594.6): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3130594.6%');
      logInfo(`${BUNDLE}ProgressText_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0065
     * @tc.name      PageLoading_ProgressText_0065
     * @tc.desc      progressText(progress=609113) returns "?????609113%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0065 begin`);
      const actual: string = progressText(609113);
      logInfo(`progressText(progress=609113): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d609113%');
      logInfo(`${BUNDLE}ProgressText_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0066
     * @tc.name      PageLoading_ProgressText_0066
     * @tc.desc      progressText(progress=1465194.59) returns "?????1465194.59%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0066 begin`);
      const actual: string = progressText(1465194.59);
      logInfo(`progressText(progress=1465194.59): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1465194.59%');
      logInfo(`${BUNDLE}ProgressText_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0067
     * @tc.name      PageLoading_ProgressText_0067
     * @tc.desc      progressText(progress=1826166) returns "?????1826166%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0067 begin`);
      const actual: string = progressText(1826166);
      logInfo(`progressText(progress=1826166): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1826166%');
      logInfo(`${BUNDLE}ProgressText_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0068
     * @tc.name      PageLoading_ProgressText_0068
     * @tc.desc      progressText(progress=4340352) returns "?????4340352%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0068 begin`);
      const actual: string = progressText(4340352);
      logInfo(`progressText(progress=4340352): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4340352%');
      logInfo(`${BUNDLE}ProgressText_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0069
     * @tc.name      PageLoading_ProgressText_0069
     * @tc.desc      progressText(progress=983764.26) returns "?????983764.26%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0069 begin`);
      const actual: string = progressText(983764.26);
      logInfo(`progressText(progress=983764.26): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d983764.26%');
      logInfo(`${BUNDLE}ProgressText_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0070
     * @tc.name      PageLoading_ProgressText_0070
     * @tc.desc      progressText(progress=1861845) returns "?????1861845%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0070 begin`);
      const actual: string = progressText(1861845);
      logInfo(`progressText(progress=1861845): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1861845%');
      logInfo(`${BUNDLE}ProgressText_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0071
     * @tc.name      PageLoading_ProgressText_0071
     * @tc.desc      progressText(progress=-3543653) returns "?????-3543653%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0071 begin`);
      const actual: string = progressText(-3543653);
      logInfo(`progressText(progress=-3543653): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-3543653%');
      logInfo(`${BUNDLE}ProgressText_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0072
     * @tc.name      PageLoading_ProgressText_0072
     * @tc.desc      progressText(progress=6270713) returns "?????6270713%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0072 begin`);
      const actual: string = progressText(6270713);
      logInfo(`progressText(progress=6270713): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6270713%');
      logInfo(`${BUNDLE}ProgressText_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0073
     * @tc.name      PageLoading_ProgressText_0073
     * @tc.desc      progressText(progress=5122364) returns "?????5122364%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0073 begin`);
      const actual: string = progressText(5122364);
      logInfo(`progressText(progress=5122364): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5122364%');
      logInfo(`${BUNDLE}ProgressText_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0074
     * @tc.name      PageLoading_ProgressText_0074
     * @tc.desc      progressText(progress=2581761) returns "?????2581761%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0074 begin`);
      const actual: string = progressText(2581761);
      logInfo(`progressText(progress=2581761): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2581761%');
      logInfo(`${BUNDLE}ProgressText_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0075
     * @tc.name      PageLoading_ProgressText_0075
     * @tc.desc      progressText(progress=5963689) returns "?????5963689%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0075 begin`);
      const actual: string = progressText(5963689);
      logInfo(`progressText(progress=5963689): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5963689%');
      logInfo(`${BUNDLE}ProgressText_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0076
     * @tc.name      PageLoading_ProgressText_0076
     * @tc.desc      progressText(progress=209058.83) returns "?????209058.83%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0076 begin`);
      const actual: string = progressText(209058.83);
      logInfo(`progressText(progress=209058.83): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d209058.83%');
      logInfo(`${BUNDLE}ProgressText_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0077
     * @tc.name      PageLoading_ProgressText_0077
     * @tc.desc      progressText(progress=41472.3) returns "?????41472.3%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0077 begin`);
      const actual: string = progressText(41472.3);
      logInfo(`progressText(progress=41472.3): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d41472.3%');
      logInfo(`${BUNDLE}ProgressText_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0078
     * @tc.name      PageLoading_ProgressText_0078
     * @tc.desc      progressText(progress=2899340.3) returns "?????2899340.3%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0078 begin`);
      const actual: string = progressText(2899340.3);
      logInfo(`progressText(progress=2899340.3): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2899340.3%');
      logInfo(`${BUNDLE}ProgressText_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0079
     * @tc.name      PageLoading_ProgressText_0079
     * @tc.desc      progressText(progress=2708909) returns "?????2708909%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0079 begin`);
      const actual: string = progressText(2708909);
      logInfo(`progressText(progress=2708909): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2708909%');
      logInfo(`${BUNDLE}ProgressText_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0080
     * @tc.name      PageLoading_ProgressText_0080
     * @tc.desc      progressText(progress=4244041) returns "?????4244041%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0080 begin`);
      const actual: string = progressText(4244041);
      logInfo(`progressText(progress=4244041): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4244041%');
      logInfo(`${BUNDLE}ProgressText_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0081
     * @tc.name      PageLoading_ProgressText_0081
     * @tc.desc      progressText(progress=-3271643) returns "?????-3271643%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0081 begin`);
      const actual: string = progressText(-3271643);
      logInfo(`progressText(progress=-3271643): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-3271643%');
      logInfo(`${BUNDLE}ProgressText_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0082
     * @tc.name      PageLoading_ProgressText_0082
     * @tc.desc      progressText(progress=6920218) returns "?????6920218%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0082 begin`);
      const actual: string = progressText(6920218);
      logInfo(`progressText(progress=6920218): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6920218%');
      logInfo(`${BUNDLE}ProgressText_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0083
     * @tc.name      PageLoading_ProgressText_0083
     * @tc.desc      progressText(progress=7155794) returns "?????7155794%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0083 begin`);
      const actual: string = progressText(7155794);
      logInfo(`progressText(progress=7155794): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d7155794%');
      logInfo(`${BUNDLE}ProgressText_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0084
     * @tc.name      PageLoading_ProgressText_0084
     * @tc.desc      progressText(progress=2287191.84) returns "?????2287191.84%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0084 begin`);
      const actual: string = progressText(2287191.84);
      logInfo(`progressText(progress=2287191.84): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2287191.84%');
      logInfo(`${BUNDLE}ProgressText_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0085
     * @tc.name      PageLoading_ProgressText_0085
     * @tc.desc      progressText(progress=6517647) returns "?????6517647%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0085 begin`);
      const actual: string = progressText(6517647);
      logInfo(`progressText(progress=6517647): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6517647%');
      logInfo(`${BUNDLE}ProgressText_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0086
     * @tc.name      PageLoading_ProgressText_0086
     * @tc.desc      progressText(progress=5783480) returns "?????5783480%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0086 begin`);
      const actual: string = progressText(5783480);
      logInfo(`progressText(progress=5783480): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5783480%');
      logInfo(`${BUNDLE}ProgressText_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0087
     * @tc.name      PageLoading_ProgressText_0087
     * @tc.desc      progressText(progress=1739924) returns "?????1739924%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0087 begin`);
      const actual: string = progressText(1739924);
      logInfo(`progressText(progress=1739924): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1739924%');
      logInfo(`${BUNDLE}ProgressText_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0088
     * @tc.name      PageLoading_ProgressText_0088
     * @tc.desc      progressText(progress=2231574.37) returns "?????2231574.37%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0088 begin`);
      const actual: string = progressText(2231574.37);
      logInfo(`progressText(progress=2231574.37): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2231574.37%');
      logInfo(`${BUNDLE}ProgressText_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0089
     * @tc.name      PageLoading_ProgressText_0089
     * @tc.desc      progressText(progress=-460469) returns "?????-460469%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0089 begin`);
      const actual: string = progressText(-460469);
      logInfo(`progressText(progress=-460469): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-460469%');
      logInfo(`${BUNDLE}ProgressText_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0090
     * @tc.name      PageLoading_ProgressText_0090
     * @tc.desc      progressText(progress=2985978) returns "?????2985978%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0090 begin`);
      const actual: string = progressText(2985978);
      logInfo(`progressText(progress=2985978): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d2985978%');
      logInfo(`${BUNDLE}ProgressText_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0091
     * @tc.name      PageLoading_ProgressText_0091
     * @tc.desc      progressText(progress=3764799) returns "?????3764799%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0091 begin`);
      const actual: string = progressText(3764799);
      logInfo(`progressText(progress=3764799): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3764799%');
      logInfo(`${BUNDLE}ProgressText_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0092
     * @tc.name      PageLoading_ProgressText_0092
     * @tc.desc      progressText(progress=6078658) returns "?????6078658%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0092 begin`);
      const actual: string = progressText(6078658);
      logInfo(`progressText(progress=6078658): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6078658%');
      logInfo(`${BUNDLE}ProgressText_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0093
     * @tc.name      PageLoading_ProgressText_0093
     * @tc.desc      progressText(progress=5996443) returns "?????5996443%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0093 begin`);
      const actual: string = progressText(5996443);
      logInfo(`progressText(progress=5996443): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d5996443%');
      logInfo(`${BUNDLE}ProgressText_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0094
     * @tc.name      PageLoading_ProgressText_0094
     * @tc.desc      progressText(progress=1970888.2) returns "?????1970888.2%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0094 begin`);
      const actual: string = progressText(1970888.2);
      logInfo(`progressText(progress=1970888.2): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1970888.2%');
      logInfo(`${BUNDLE}ProgressText_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0095
     * @tc.name      PageLoading_ProgressText_0095
     * @tc.desc      progressText(progress=-706592) returns "?????-706592%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressText_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressText_0095 begin`);
      const actual: string = progressText(-706592);
      logInfo(`progressText(progress=-706592): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d-706592%');
      logInfo(`${BUNDLE}ProgressText_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_TEXT_0096
     * @tc.name      PageLoading_ProgressText_0096
     * @tc.desc      progressText(progress=6121948) returns "?????6121948%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressText_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressText_0096 begin`);
      const actual: string = progressText(6121948);
      logInfo(`progressText(progress=6121948): actual=${actual}`);
      expect(actual).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6121948%');
      logInfo(`${BUNDLE}ProgressText_0096 end`);
    });
  });
}
