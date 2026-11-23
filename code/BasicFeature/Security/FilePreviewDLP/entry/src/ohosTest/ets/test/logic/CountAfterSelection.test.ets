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
import { countAfterSelection } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for countAfterSelection (96 cases). */
export default function countAfterSelectionTest(): void {
  describe('CountAfterSelectionTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0001
     * @tc.name      FilePreviewDLP_CountAfterSelection_0001
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_CountAfterSelection_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0001 begin`);
      const actual: number = countAfterSelection(0, 0);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CountAfterSelection_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0002
     * @tc.name      FilePreviewDLP_CountAfterSelection_0002
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_CountAfterSelection_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0002 begin`);
      const actual: number = countAfterSelection(0, 1);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CountAfterSelection_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0003
     * @tc.name      FilePreviewDLP_CountAfterSelection_0003
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0003 begin`);
      const actual: number = countAfterSelection(0, 2);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}CountAfterSelection_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0004
     * @tc.name      FilePreviewDLP_CountAfterSelection_0004
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=5) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0004 begin`);
      const actual: number = countAfterSelection(0, 5);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0005
     * @tc.name      FilePreviewDLP_CountAfterSelection_0005
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=0) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0005 begin`);
      const actual: number = countAfterSelection(500, 0);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}CountAfterSelection_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0006
     * @tc.name      FilePreviewDLP_CountAfterSelection_0006
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=1) returns 501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0006 begin`);
      const actual: number = countAfterSelection(500, 1);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(501);
      logInfo(`${BUNDLE}CountAfterSelection_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0007
     * @tc.name      FilePreviewDLP_CountAfterSelection_0007
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=2) returns 502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0007 begin`);
      const actual: number = countAfterSelection(500, 2);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(502);
      logInfo(`${BUNDLE}CountAfterSelection_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0008
     * @tc.name      FilePreviewDLP_CountAfterSelection_0008
     * @tc.desc      countAfterSelection(currentCount=500, selectedCount=5) returns 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0008 begin`);
      const actual: number = countAfterSelection(500, 5);
      logInfo(`countAfterSelection(currentCount=500, sel...: actual=${actual}`);
      expect(actual).assertEqual(503);
      logInfo(`${BUNDLE}CountAfterSelection_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0009
     * @tc.name      FilePreviewDLP_CountAfterSelection_0009
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=0) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0009 begin`);
      const actual: number = countAfterSelection(999, 0);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}CountAfterSelection_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0010
     * @tc.name      FilePreviewDLP_CountAfterSelection_0010
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=1) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0010 begin`);
      const actual: number = countAfterSelection(999, 1);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}CountAfterSelection_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0011
     * @tc.name      FilePreviewDLP_CountAfterSelection_0011
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=2) returns 1001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0011 begin`);
      const actual: number = countAfterSelection(999, 2);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1001);
      logInfo(`${BUNDLE}CountAfterSelection_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0012
     * @tc.name      FilePreviewDLP_CountAfterSelection_0012
     * @tc.desc      countAfterSelection(currentCount=999, selectedCount=5) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0012 begin`);
      const actual: number = countAfterSelection(999, 5);
      logInfo(`countAfterSelection(currentCount=999, sel...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}CountAfterSelection_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0013
     * @tc.name      FilePreviewDLP_CountAfterSelection_0013
     * @tc.desc      countAfterSelection(currentCount=1000, selectedCount=5) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0013 begin`);
      const actual: number = countAfterSelection(1000, 5);
      logInfo(`countAfterSelection(currentCount=1000, se...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}CountAfterSelection_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0014
     * @tc.name      FilePreviewDLP_CountAfterSelection_0014
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=0) returns 59999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0014 begin`);
      const actual: number = countAfterSelection(59999, 0);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(59999);
      logInfo(`${BUNDLE}CountAfterSelection_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0015
     * @tc.name      FilePreviewDLP_CountAfterSelection_0015
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=1) returns 60000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0015 begin`);
      const actual: number = countAfterSelection(59999, 1);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60000);
      logInfo(`${BUNDLE}CountAfterSelection_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0016
     * @tc.name      FilePreviewDLP_CountAfterSelection_0016
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=2) returns 60001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0016 begin`);
      const actual: number = countAfterSelection(59999, 2);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60001);
      logInfo(`${BUNDLE}CountAfterSelection_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0017
     * @tc.name      FilePreviewDLP_CountAfterSelection_0017
     * @tc.desc      countAfterSelection(currentCount=59999, selectedCount=5) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0017 begin`);
      const actual: number = countAfterSelection(59999, 5);
      logInfo(`countAfterSelection(currentCount=59999, s...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}CountAfterSelection_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0018
     * @tc.name      FilePreviewDLP_CountAfterSelection_0018
     * @tc.desc      countAfterSelection(currentCount=60000, selectedCount=5) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0018 begin`);
      const actual: number = countAfterSelection(60000, 5);
      logInfo(`countAfterSelection(currentCount=60000, s...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}CountAfterSelection_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0019
     * @tc.name      FilePreviewDLP_CountAfterSelection_0019
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=0) returns 61000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0019 begin`);
      const actual: number = countAfterSelection(61000, 0);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61000);
      logInfo(`${BUNDLE}CountAfterSelection_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0020
     * @tc.name      FilePreviewDLP_CountAfterSelection_0020
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=1) returns 61001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0020 begin`);
      const actual: number = countAfterSelection(61000, 1);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61001);
      logInfo(`${BUNDLE}CountAfterSelection_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0021
     * @tc.name      FilePreviewDLP_CountAfterSelection_0021
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=2) returns 61002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0021 begin`);
      const actual: number = countAfterSelection(61000, 2);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61002);
      logInfo(`${BUNDLE}CountAfterSelection_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0022
     * @tc.name      FilePreviewDLP_CountAfterSelection_0022
     * @tc.desc      countAfterSelection(currentCount=61000, selectedCount=5) returns 61003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0022 begin`);
      const actual: number = countAfterSelection(61000, 5);
      logInfo(`countAfterSelection(currentCount=61000, s...: actual=${actual}`);
      expect(actual).assertEqual(61003);
      logInfo(`${BUNDLE}CountAfterSelection_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0023
     * @tc.name      FilePreviewDLP_CountAfterSelection_0023
     * @tc.desc      countAfterSelection(currentCount=3599000, selectedCount=0) returns 3599000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0023 begin`);
      const actual: number = countAfterSelection(3599000, 0);
      logInfo(`countAfterSelection(currentCount=3599000,...: actual=${actual}`);
      expect(actual).assertEqual(3599000);
      logInfo(`${BUNDLE}CountAfterSelection_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0024
     * @tc.name      FilePreviewDLP_CountAfterSelection_0024
     * @tc.desc      countAfterSelection(currentCount=3599000, selectedCount=1) returns 3599001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0024 begin`);
      const actual: number = countAfterSelection(3599000, 1);
      logInfo(`countAfterSelection(currentCount=3599000,...: actual=${actual}`);
      expect(actual).assertEqual(3599001);
      logInfo(`${BUNDLE}CountAfterSelection_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0025
     * @tc.name      FilePreviewDLP_CountAfterSelection_0025
     * @tc.desc      countAfterSelection(currentCount=3599000, selectedCount=2) returns 3599002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0025 begin`);
      const actual: number = countAfterSelection(3599000, 2);
      logInfo(`countAfterSelection(currentCount=3599000,...: actual=${actual}`);
      expect(actual).assertEqual(3599002);
      logInfo(`${BUNDLE}CountAfterSelection_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0026
     * @tc.name      FilePreviewDLP_CountAfterSelection_0026
     * @tc.desc      countAfterSelection(currentCount=3599000, selectedCount=5) returns 3599003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0026 begin`);
      const actual: number = countAfterSelection(3599000, 5);
      logInfo(`countAfterSelection(currentCount=3599000,...: actual=${actual}`);
      expect(actual).assertEqual(3599003);
      logInfo(`${BUNDLE}CountAfterSelection_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0027
     * @tc.name      FilePreviewDLP_CountAfterSelection_0027
     * @tc.desc      countAfterSelection(currentCount=3600000, selectedCount=0) returns 3600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0027 begin`);
      const actual: number = countAfterSelection(3600000, 0);
      logInfo(`countAfterSelection(currentCount=3600000,...: actual=${actual}`);
      expect(actual).assertEqual(3600000);
      logInfo(`${BUNDLE}CountAfterSelection_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0028
     * @tc.name      FilePreviewDLP_CountAfterSelection_0028
     * @tc.desc      countAfterSelection(currentCount=3600000, selectedCount=1) returns 3600001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0028 begin`);
      const actual: number = countAfterSelection(3600000, 1);
      logInfo(`countAfterSelection(currentCount=3600000,...: actual=${actual}`);
      expect(actual).assertEqual(3600001);
      logInfo(`${BUNDLE}CountAfterSelection_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0029
     * @tc.name      FilePreviewDLP_CountAfterSelection_0029
     * @tc.desc      countAfterSelection(currentCount=3600000, selectedCount=2) returns 3600002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0029 begin`);
      const actual: number = countAfterSelection(3600000, 2);
      logInfo(`countAfterSelection(currentCount=3600000,...: actual=${actual}`);
      expect(actual).assertEqual(3600002);
      logInfo(`${BUNDLE}CountAfterSelection_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0030
     * @tc.name      FilePreviewDLP_CountAfterSelection_0030
     * @tc.desc      countAfterSelection(currentCount=3600000, selectedCount=5) returns 3600003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0030 begin`);
      const actual: number = countAfterSelection(3600000, 5);
      logInfo(`countAfterSelection(currentCount=3600000,...: actual=${actual}`);
      expect(actual).assertEqual(3600003);
      logInfo(`${BUNDLE}CountAfterSelection_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0031
     * @tc.name      FilePreviewDLP_CountAfterSelection_0031
     * @tc.desc      countAfterSelection(currentCount=1, selectedCount=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0031 begin`);
      const actual: number = countAfterSelection(1, 5);
      logInfo(`countAfterSelection(currentCount=1, selec...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}CountAfterSelection_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0032
     * @tc.name      FilePreviewDLP_CountAfterSelection_0032
     * @tc.desc      countAfterSelection(currentCount=-1, selectedCount=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0032 begin`);
      const actual: number = countAfterSelection(-1, 0);
      logInfo(`countAfterSelection(currentCount=-1, sele...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}CountAfterSelection_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0033
     * @tc.name      FilePreviewDLP_CountAfterSelection_0033
     * @tc.desc      countAfterSelection(currentCount=2, selectedCount=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0033 begin`);
      const actual: number = countAfterSelection(2, 5);
      logInfo(`countAfterSelection(currentCount=2, selec...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}CountAfterSelection_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0034
     * @tc.name      FilePreviewDLP_CountAfterSelection_0034
     * @tc.desc      countAfterSelection(currentCount=3, selectedCount=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0034 begin`);
      const actual: number = countAfterSelection(3, 5);
      logInfo(`countAfterSelection(currentCount=3, selec...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}CountAfterSelection_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0035
     * @tc.name      FilePreviewDLP_CountAfterSelection_0035
     * @tc.desc      countAfterSelection(currentCount=10, selectedCount=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0035 begin`);
      const actual: number = countAfterSelection(10, 0);
      logInfo(`countAfterSelection(currentCount=10, sele...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}CountAfterSelection_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0036
     * @tc.name      FilePreviewDLP_CountAfterSelection_0036
     * @tc.desc      countAfterSelection(currentCount=10, selectedCount=1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0036 begin`);
      const actual: number = countAfterSelection(10, 1);
      logInfo(`countAfterSelection(currentCount=10, sele...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}CountAfterSelection_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0037
     * @tc.name      FilePreviewDLP_CountAfterSelection_0037
     * @tc.desc      countAfterSelection(currentCount=10, selectedCount=2) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0037 begin`);
      const actual: number = countAfterSelection(10, 2);
      logInfo(`countAfterSelection(currentCount=10, sele...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}CountAfterSelection_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0038
     * @tc.name      FilePreviewDLP_CountAfterSelection_0038
     * @tc.desc      countAfterSelection(currentCount=10, selectedCount=5) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0038 begin`);
      const actual: number = countAfterSelection(10, 5);
      logInfo(`countAfterSelection(currentCount=10, sele...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}CountAfterSelection_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0039
     * @tc.name      FilePreviewDLP_CountAfterSelection_0039
     * @tc.desc      countAfterSelection(currentCount=100, selectedCount=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0039 begin`);
      const actual: number = countAfterSelection(100, 0);
      logInfo(`countAfterSelection(currentCount=100, sel...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CountAfterSelection_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0040
     * @tc.name      FilePreviewDLP_CountAfterSelection_0040
     * @tc.desc      countAfterSelection(currentCount=100, selectedCount=1) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0040 begin`);
      const actual: number = countAfterSelection(100, 1);
      logInfo(`countAfterSelection(currentCount=100, sel...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}CountAfterSelection_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0041
     * @tc.name      FilePreviewDLP_CountAfterSelection_0041
     * @tc.desc      countAfterSelection(currentCount=100, selectedCount=2) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0041 begin`);
      const actual: number = countAfterSelection(100, 2);
      logInfo(`countAfterSelection(currentCount=100, sel...: actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}CountAfterSelection_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0042
     * @tc.name      FilePreviewDLP_CountAfterSelection_0042
     * @tc.desc      countAfterSelection(currentCount=100, selectedCount=5) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0042 begin`);
      const actual: number = countAfterSelection(100, 5);
      logInfo(`countAfterSelection(currentCount=100, sel...: actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}CountAfterSelection_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0043
     * @tc.name      FilePreviewDLP_CountAfterSelection_0043
     * @tc.desc      countAfterSelection(currentCount=180000, selectedCount=0) returns 180000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0043 begin`);
      const actual: number = countAfterSelection(180000, 0);
      logInfo(`countAfterSelection(currentCount=180000, ...: actual=${actual}`);
      expect(actual).assertEqual(180000);
      logInfo(`${BUNDLE}CountAfterSelection_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0044
     * @tc.name      FilePreviewDLP_CountAfterSelection_0044
     * @tc.desc      countAfterSelection(currentCount=180000, selectedCount=1) returns 180001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0044 begin`);
      const actual: number = countAfterSelection(180000, 1);
      logInfo(`countAfterSelection(currentCount=180000, ...: actual=${actual}`);
      expect(actual).assertEqual(180001);
      logInfo(`${BUNDLE}CountAfterSelection_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0045
     * @tc.name      FilePreviewDLP_CountAfterSelection_0045
     * @tc.desc      countAfterSelection(currentCount=180000, selectedCount=2) returns 180002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0045 begin`);
      const actual: number = countAfterSelection(180000, 2);
      logInfo(`countAfterSelection(currentCount=180000, ...: actual=${actual}`);
      expect(actual).assertEqual(180002);
      logInfo(`${BUNDLE}CountAfterSelection_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0046
     * @tc.name      FilePreviewDLP_CountAfterSelection_0046
     * @tc.desc      countAfterSelection(currentCount=180000, selectedCount=5) returns 180003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0046 begin`);
      const actual: number = countAfterSelection(180000, 5);
      logInfo(`countAfterSelection(currentCount=180000, ...: actual=${actual}`);
      expect(actual).assertEqual(180003);
      logInfo(`${BUNDLE}CountAfterSelection_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0047
     * @tc.name      FilePreviewDLP_CountAfterSelection_0047
     * @tc.desc      countAfterSelection(currentCount=360000, selectedCount=0) returns 360000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0047 begin`);
      const actual: number = countAfterSelection(360000, 0);
      logInfo(`countAfterSelection(currentCount=360000, ...: actual=${actual}`);
      expect(actual).assertEqual(360000);
      logInfo(`${BUNDLE}CountAfterSelection_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0048
     * @tc.name      FilePreviewDLP_CountAfterSelection_0048
     * @tc.desc      countAfterSelection(currentCount=360000, selectedCount=1) returns 360001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0048 begin`);
      const actual: number = countAfterSelection(360000, 1);
      logInfo(`countAfterSelection(currentCount=360000, ...: actual=${actual}`);
      expect(actual).assertEqual(360001);
      logInfo(`${BUNDLE}CountAfterSelection_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0049
     * @tc.name      FilePreviewDLP_CountAfterSelection_0049
     * @tc.desc      countAfterSelection(currentCount=360000, selectedCount=2) returns 360002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0049 begin`);
      const actual: number = countAfterSelection(360000, 2);
      logInfo(`countAfterSelection(currentCount=360000, ...: actual=${actual}`);
      expect(actual).assertEqual(360002);
      logInfo(`${BUNDLE}CountAfterSelection_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0050
     * @tc.name      FilePreviewDLP_CountAfterSelection_0050
     * @tc.desc      countAfterSelection(currentCount=360000, selectedCount=5) returns 360003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0050 begin`);
      const actual: number = countAfterSelection(360000, 5);
      logInfo(`countAfterSelection(currentCount=360000, ...: actual=${actual}`);
      expect(actual).assertEqual(360003);
      logInfo(`${BUNDLE}CountAfterSelection_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0051
     * @tc.name      FilePreviewDLP_CountAfterSelection_0051
     * @tc.desc      countAfterSelection(currentCount=540000, selectedCount=0) returns 540000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0051 begin`);
      const actual: number = countAfterSelection(540000, 0);
      logInfo(`countAfterSelection(currentCount=540000, ...: actual=${actual}`);
      expect(actual).assertEqual(540000);
      logInfo(`${BUNDLE}CountAfterSelection_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0052
     * @tc.name      FilePreviewDLP_CountAfterSelection_0052
     * @tc.desc      countAfterSelection(currentCount=540000, selectedCount=1) returns 540001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0052 begin`);
      const actual: number = countAfterSelection(540000, 1);
      logInfo(`countAfterSelection(currentCount=540000, ...: actual=${actual}`);
      expect(actual).assertEqual(540001);
      logInfo(`${BUNDLE}CountAfterSelection_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0053
     * @tc.name      FilePreviewDLP_CountAfterSelection_0053
     * @tc.desc      countAfterSelection(currentCount=540000, selectedCount=2) returns 540002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0053 begin`);
      const actual: number = countAfterSelection(540000, 2);
      logInfo(`countAfterSelection(currentCount=540000, ...: actual=${actual}`);
      expect(actual).assertEqual(540002);
      logInfo(`${BUNDLE}CountAfterSelection_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0054
     * @tc.name      FilePreviewDLP_CountAfterSelection_0054
     * @tc.desc      countAfterSelection(currentCount=540000, selectedCount=5) returns 540003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0054 begin`);
      const actual: number = countAfterSelection(540000, 5);
      logInfo(`countAfterSelection(currentCount=540000, ...: actual=${actual}`);
      expect(actual).assertEqual(540003);
      logInfo(`${BUNDLE}CountAfterSelection_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0055
     * @tc.name      FilePreviewDLP_CountAfterSelection_0055
     * @tc.desc      countAfterSelection(currentCount=720000, selectedCount=0) returns 720000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0055 begin`);
      const actual: number = countAfterSelection(720000, 0);
      logInfo(`countAfterSelection(currentCount=720000, ...: actual=${actual}`);
      expect(actual).assertEqual(720000);
      logInfo(`${BUNDLE}CountAfterSelection_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0056
     * @tc.name      FilePreviewDLP_CountAfterSelection_0056
     * @tc.desc      countAfterSelection(currentCount=720000, selectedCount=1) returns 720001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0056 begin`);
      const actual: number = countAfterSelection(720000, 1);
      logInfo(`countAfterSelection(currentCount=720000, ...: actual=${actual}`);
      expect(actual).assertEqual(720001);
      logInfo(`${BUNDLE}CountAfterSelection_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0057
     * @tc.name      FilePreviewDLP_CountAfterSelection_0057
     * @tc.desc      countAfterSelection(currentCount=720000, selectedCount=2) returns 720002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0057 begin`);
      const actual: number = countAfterSelection(720000, 2);
      logInfo(`countAfterSelection(currentCount=720000, ...: actual=${actual}`);
      expect(actual).assertEqual(720002);
      logInfo(`${BUNDLE}CountAfterSelection_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0058
     * @tc.name      FilePreviewDLP_CountAfterSelection_0058
     * @tc.desc      countAfterSelection(currentCount=720000, selectedCount=5) returns 720003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0058 begin`);
      const actual: number = countAfterSelection(720000, 5);
      logInfo(`countAfterSelection(currentCount=720000, ...: actual=${actual}`);
      expect(actual).assertEqual(720003);
      logInfo(`${BUNDLE}CountAfterSelection_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0059
     * @tc.name      FilePreviewDLP_CountAfterSelection_0059
     * @tc.desc      countAfterSelection(currentCount=900000, selectedCount=0) returns 900000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0059 begin`);
      const actual: number = countAfterSelection(900000, 0);
      logInfo(`countAfterSelection(currentCount=900000, ...: actual=${actual}`);
      expect(actual).assertEqual(900000);
      logInfo(`${BUNDLE}CountAfterSelection_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0060
     * @tc.name      FilePreviewDLP_CountAfterSelection_0060
     * @tc.desc      countAfterSelection(currentCount=900000, selectedCount=1) returns 900001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0060 begin`);
      const actual: number = countAfterSelection(900000, 1);
      logInfo(`countAfterSelection(currentCount=900000, ...: actual=${actual}`);
      expect(actual).assertEqual(900001);
      logInfo(`${BUNDLE}CountAfterSelection_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0061
     * @tc.name      FilePreviewDLP_CountAfterSelection_0061
     * @tc.desc      countAfterSelection(currentCount=900000, selectedCount=2) returns 900002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0061 begin`);
      const actual: number = countAfterSelection(900000, 2);
      logInfo(`countAfterSelection(currentCount=900000, ...: actual=${actual}`);
      expect(actual).assertEqual(900002);
      logInfo(`${BUNDLE}CountAfterSelection_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0062
     * @tc.name      FilePreviewDLP_CountAfterSelection_0062
     * @tc.desc      countAfterSelection(currentCount=900000, selectedCount=5) returns 900003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0062 begin`);
      const actual: number = countAfterSelection(900000, 5);
      logInfo(`countAfterSelection(currentCount=900000, ...: actual=${actual}`);
      expect(actual).assertEqual(900003);
      logInfo(`${BUNDLE}CountAfterSelection_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0063
     * @tc.name      FilePreviewDLP_CountAfterSelection_0063
     * @tc.desc      countAfterSelection(currentCount=1080000, selectedCount=0) returns 1080000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0063 begin`);
      const actual: number = countAfterSelection(1080000, 0);
      logInfo(`countAfterSelection(currentCount=1080000,...: actual=${actual}`);
      expect(actual).assertEqual(1080000);
      logInfo(`${BUNDLE}CountAfterSelection_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0064
     * @tc.name      FilePreviewDLP_CountAfterSelection_0064
     * @tc.desc      countAfterSelection(currentCount=1080000, selectedCount=1) returns 1080001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0064 begin`);
      const actual: number = countAfterSelection(1080000, 1);
      logInfo(`countAfterSelection(currentCount=1080000,...: actual=${actual}`);
      expect(actual).assertEqual(1080001);
      logInfo(`${BUNDLE}CountAfterSelection_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0065
     * @tc.name      FilePreviewDLP_CountAfterSelection_0065
     * @tc.desc      countAfterSelection(currentCount=1080000, selectedCount=2) returns 1080002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0065 begin`);
      const actual: number = countAfterSelection(1080000, 2);
      logInfo(`countAfterSelection(currentCount=1080000,...: actual=${actual}`);
      expect(actual).assertEqual(1080002);
      logInfo(`${BUNDLE}CountAfterSelection_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0066
     * @tc.name      FilePreviewDLP_CountAfterSelection_0066
     * @tc.desc      countAfterSelection(currentCount=1080000, selectedCount=5) returns 1080003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0066 begin`);
      const actual: number = countAfterSelection(1080000, 5);
      logInfo(`countAfterSelection(currentCount=1080000,...: actual=${actual}`);
      expect(actual).assertEqual(1080003);
      logInfo(`${BUNDLE}CountAfterSelection_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0067
     * @tc.name      FilePreviewDLP_CountAfterSelection_0067
     * @tc.desc      countAfterSelection(currentCount=1260000, selectedCount=0) returns 1260000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0067 begin`);
      const actual: number = countAfterSelection(1260000, 0);
      logInfo(`countAfterSelection(currentCount=1260000,...: actual=${actual}`);
      expect(actual).assertEqual(1260000);
      logInfo(`${BUNDLE}CountAfterSelection_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0068
     * @tc.name      FilePreviewDLP_CountAfterSelection_0068
     * @tc.desc      countAfterSelection(currentCount=1260000, selectedCount=1) returns 1260001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0068 begin`);
      const actual: number = countAfterSelection(1260000, 1);
      logInfo(`countAfterSelection(currentCount=1260000,...: actual=${actual}`);
      expect(actual).assertEqual(1260001);
      logInfo(`${BUNDLE}CountAfterSelection_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0069
     * @tc.name      FilePreviewDLP_CountAfterSelection_0069
     * @tc.desc      countAfterSelection(currentCount=1260000, selectedCount=2) returns 1260002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0069 begin`);
      const actual: number = countAfterSelection(1260000, 2);
      logInfo(`countAfterSelection(currentCount=1260000,...: actual=${actual}`);
      expect(actual).assertEqual(1260002);
      logInfo(`${BUNDLE}CountAfterSelection_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0070
     * @tc.name      FilePreviewDLP_CountAfterSelection_0070
     * @tc.desc      countAfterSelection(currentCount=1260000, selectedCount=5) returns 1260003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0070 begin`);
      const actual: number = countAfterSelection(1260000, 5);
      logInfo(`countAfterSelection(currentCount=1260000,...: actual=${actual}`);
      expect(actual).assertEqual(1260003);
      logInfo(`${BUNDLE}CountAfterSelection_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0071
     * @tc.name      FilePreviewDLP_CountAfterSelection_0071
     * @tc.desc      countAfterSelection(currentCount=1440000, selectedCount=0) returns 1440000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0071 begin`);
      const actual: number = countAfterSelection(1440000, 0);
      logInfo(`countAfterSelection(currentCount=1440000,...: actual=${actual}`);
      expect(actual).assertEqual(1440000);
      logInfo(`${BUNDLE}CountAfterSelection_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0072
     * @tc.name      FilePreviewDLP_CountAfterSelection_0072
     * @tc.desc      countAfterSelection(currentCount=1440000, selectedCount=1) returns 1440001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0072 begin`);
      const actual: number = countAfterSelection(1440000, 1);
      logInfo(`countAfterSelection(currentCount=1440000,...: actual=${actual}`);
      expect(actual).assertEqual(1440001);
      logInfo(`${BUNDLE}CountAfterSelection_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0073
     * @tc.name      FilePreviewDLP_CountAfterSelection_0073
     * @tc.desc      countAfterSelection(currentCount=1440000, selectedCount=2) returns 1440002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0073 begin`);
      const actual: number = countAfterSelection(1440000, 2);
      logInfo(`countAfterSelection(currentCount=1440000,...: actual=${actual}`);
      expect(actual).assertEqual(1440002);
      logInfo(`${BUNDLE}CountAfterSelection_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0074
     * @tc.name      FilePreviewDLP_CountAfterSelection_0074
     * @tc.desc      countAfterSelection(currentCount=1440000, selectedCount=5) returns 1440003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0074 begin`);
      const actual: number = countAfterSelection(1440000, 5);
      logInfo(`countAfterSelection(currentCount=1440000,...: actual=${actual}`);
      expect(actual).assertEqual(1440003);
      logInfo(`${BUNDLE}CountAfterSelection_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0075
     * @tc.name      FilePreviewDLP_CountAfterSelection_0075
     * @tc.desc      countAfterSelection(currentCount=1620000, selectedCount=0) returns 1620000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0075 begin`);
      const actual: number = countAfterSelection(1620000, 0);
      logInfo(`countAfterSelection(currentCount=1620000,...: actual=${actual}`);
      expect(actual).assertEqual(1620000);
      logInfo(`${BUNDLE}CountAfterSelection_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0076
     * @tc.name      FilePreviewDLP_CountAfterSelection_0076
     * @tc.desc      countAfterSelection(currentCount=1620000, selectedCount=1) returns 1620001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0076 begin`);
      const actual: number = countAfterSelection(1620000, 1);
      logInfo(`countAfterSelection(currentCount=1620000,...: actual=${actual}`);
      expect(actual).assertEqual(1620001);
      logInfo(`${BUNDLE}CountAfterSelection_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0077
     * @tc.name      FilePreviewDLP_CountAfterSelection_0077
     * @tc.desc      countAfterSelection(currentCount=1620000, selectedCount=2) returns 1620002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0077 begin`);
      const actual: number = countAfterSelection(1620000, 2);
      logInfo(`countAfterSelection(currentCount=1620000,...: actual=${actual}`);
      expect(actual).assertEqual(1620002);
      logInfo(`${BUNDLE}CountAfterSelection_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0078
     * @tc.name      FilePreviewDLP_CountAfterSelection_0078
     * @tc.desc      countAfterSelection(currentCount=1620000, selectedCount=5) returns 1620003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0078 begin`);
      const actual: number = countAfterSelection(1620000, 5);
      logInfo(`countAfterSelection(currentCount=1620000,...: actual=${actual}`);
      expect(actual).assertEqual(1620003);
      logInfo(`${BUNDLE}CountAfterSelection_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0079
     * @tc.name      FilePreviewDLP_CountAfterSelection_0079
     * @tc.desc      countAfterSelection(currentCount=1800000, selectedCount=0) returns 1800000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0079 begin`);
      const actual: number = countAfterSelection(1800000, 0);
      logInfo(`countAfterSelection(currentCount=1800000,...: actual=${actual}`);
      expect(actual).assertEqual(1800000);
      logInfo(`${BUNDLE}CountAfterSelection_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0080
     * @tc.name      FilePreviewDLP_CountAfterSelection_0080
     * @tc.desc      countAfterSelection(currentCount=1800000, selectedCount=1) returns 1800001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0080 begin`);
      const actual: number = countAfterSelection(1800000, 1);
      logInfo(`countAfterSelection(currentCount=1800000,...: actual=${actual}`);
      expect(actual).assertEqual(1800001);
      logInfo(`${BUNDLE}CountAfterSelection_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0081
     * @tc.name      FilePreviewDLP_CountAfterSelection_0081
     * @tc.desc      countAfterSelection(currentCount=1800000, selectedCount=2) returns 1800002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0081 begin`);
      const actual: number = countAfterSelection(1800000, 2);
      logInfo(`countAfterSelection(currentCount=1800000,...: actual=${actual}`);
      expect(actual).assertEqual(1800002);
      logInfo(`${BUNDLE}CountAfterSelection_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0082
     * @tc.name      FilePreviewDLP_CountAfterSelection_0082
     * @tc.desc      countAfterSelection(currentCount=1800000, selectedCount=5) returns 1800003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0082 begin`);
      const actual: number = countAfterSelection(1800000, 5);
      logInfo(`countAfterSelection(currentCount=1800000,...: actual=${actual}`);
      expect(actual).assertEqual(1800003);
      logInfo(`${BUNDLE}CountAfterSelection_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0083
     * @tc.name      FilePreviewDLP_CountAfterSelection_0083
     * @tc.desc      countAfterSelection(currentCount=1980000, selectedCount=0) returns 1980000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0083 begin`);
      const actual: number = countAfterSelection(1980000, 0);
      logInfo(`countAfterSelection(currentCount=1980000,...: actual=${actual}`);
      expect(actual).assertEqual(1980000);
      logInfo(`${BUNDLE}CountAfterSelection_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0084
     * @tc.name      FilePreviewDLP_CountAfterSelection_0084
     * @tc.desc      countAfterSelection(currentCount=1980000, selectedCount=1) returns 1980001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0084 begin`);
      const actual: number = countAfterSelection(1980000, 1);
      logInfo(`countAfterSelection(currentCount=1980000,...: actual=${actual}`);
      expect(actual).assertEqual(1980001);
      logInfo(`${BUNDLE}CountAfterSelection_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0085
     * @tc.name      FilePreviewDLP_CountAfterSelection_0085
     * @tc.desc      countAfterSelection(currentCount=1980000, selectedCount=2) returns 1980002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0085 begin`);
      const actual: number = countAfterSelection(1980000, 2);
      logInfo(`countAfterSelection(currentCount=1980000,...: actual=${actual}`);
      expect(actual).assertEqual(1980002);
      logInfo(`${BUNDLE}CountAfterSelection_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0086
     * @tc.name      FilePreviewDLP_CountAfterSelection_0086
     * @tc.desc      countAfterSelection(currentCount=1980000, selectedCount=5) returns 1980003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0086 begin`);
      const actual: number = countAfterSelection(1980000, 5);
      logInfo(`countAfterSelection(currentCount=1980000,...: actual=${actual}`);
      expect(actual).assertEqual(1980003);
      logInfo(`${BUNDLE}CountAfterSelection_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0087
     * @tc.name      FilePreviewDLP_CountAfterSelection_0087
     * @tc.desc      countAfterSelection(currentCount=2160000, selectedCount=0) returns 2160000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0087 begin`);
      const actual: number = countAfterSelection(2160000, 0);
      logInfo(`countAfterSelection(currentCount=2160000,...: actual=${actual}`);
      expect(actual).assertEqual(2160000);
      logInfo(`${BUNDLE}CountAfterSelection_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0088
     * @tc.name      FilePreviewDLP_CountAfterSelection_0088
     * @tc.desc      countAfterSelection(currentCount=2160000, selectedCount=1) returns 2160001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0088 begin`);
      const actual: number = countAfterSelection(2160000, 1);
      logInfo(`countAfterSelection(currentCount=2160000,...: actual=${actual}`);
      expect(actual).assertEqual(2160001);
      logInfo(`${BUNDLE}CountAfterSelection_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0089
     * @tc.name      FilePreviewDLP_CountAfterSelection_0089
     * @tc.desc      countAfterSelection(currentCount=2160000, selectedCount=2) returns 2160002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0089 begin`);
      const actual: number = countAfterSelection(2160000, 2);
      logInfo(`countAfterSelection(currentCount=2160000,...: actual=${actual}`);
      expect(actual).assertEqual(2160002);
      logInfo(`${BUNDLE}CountAfterSelection_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0090
     * @tc.name      FilePreviewDLP_CountAfterSelection_0090
     * @tc.desc      countAfterSelection(currentCount=2160000, selectedCount=5) returns 2160003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0090 begin`);
      const actual: number = countAfterSelection(2160000, 5);
      logInfo(`countAfterSelection(currentCount=2160000,...: actual=${actual}`);
      expect(actual).assertEqual(2160003);
      logInfo(`${BUNDLE}CountAfterSelection_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0091
     * @tc.name      FilePreviewDLP_CountAfterSelection_0091
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0091 begin`);
      const actual: number = countAfterSelection(0, 10);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0092
     * @tc.name      FilePreviewDLP_CountAfterSelection_0092
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0092 begin`);
      const actual: number = countAfterSelection(0, 100);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0093
     * @tc.name      FilePreviewDLP_CountAfterSelection_0093
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_CountAfterSelection_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0093 begin`);
      const actual: number = countAfterSelection(0, -1);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CountAfterSelection_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0094
     * @tc.name      FilePreviewDLP_CountAfterSelection_0094
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0094 begin`);
      const actual: number = countAfterSelection(0, 3);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0095
     * @tc.name      FilePreviewDLP_CountAfterSelection_0095
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=15) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0095 begin`);
      const actual: number = countAfterSelection(0, 15);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_COUNT_AFTER_SELECTION_0096
     * @tc.name      FilePreviewDLP_CountAfterSelection_0096
     * @tc.desc      countAfterSelection(currentCount=0, selectedCount=20) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_CountAfterSelection_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountAfterSelection_0096 begin`);
      const actual: number = countAfterSelection(0, 20);
      logInfo(`countAfterSelection(currentCount=0, selec...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CountAfterSelection_0096 end`);
    });
  });
}
