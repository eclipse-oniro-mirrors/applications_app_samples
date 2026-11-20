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
import { acceptedCountOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for acceptedCountOf (96 cases). */
export default function acceptedCountOfTest(): void {
  describe('AcceptedCountOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0001
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0001
     * @tc.desc      acceptedCountOf(selectedCount=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_AcceptedCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0001 begin`);
      const actual: number = acceptedCountOf(0);
      logInfo(`acceptedCountOf(selectedCount=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0002
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0002
     * @tc.desc      acceptedCountOf(selectedCount=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_AcceptedCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0002 begin`);
      const actual: number = acceptedCountOf(1);
      logInfo(`acceptedCountOf(selectedCount=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}AcceptedCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0003
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0003
     * @tc.desc      acceptedCountOf(selectedCount=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0003 begin`);
      const actual: number = acceptedCountOf(2);
      logInfo(`acceptedCountOf(selectedCount=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}AcceptedCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0004
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0004
     * @tc.desc      acceptedCountOf(selectedCount=5) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0004 begin`);
      const actual: number = acceptedCountOf(5);
      logInfo(`acceptedCountOf(selectedCount=5): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0005
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0005
     * @tc.desc      acceptedCountOf(selectedCount=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AcceptedCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0005 begin`);
      const actual: number = acceptedCountOf(-1);
      logInfo(`acceptedCountOf(selectedCount=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0006
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0006
     * @tc.desc      acceptedCountOf(selectedCount=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0006 begin`);
      const actual: number = acceptedCountOf(10);
      logInfo(`acceptedCountOf(selectedCount=10): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0007
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0007
     * @tc.desc      acceptedCountOf(selectedCount=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0007 begin`);
      const actual: number = acceptedCountOf(100);
      logInfo(`acceptedCountOf(selectedCount=100): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0008
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0008
     * @tc.desc      acceptedCountOf(selectedCount=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0008 begin`);
      const actual: number = acceptedCountOf(3);
      logInfo(`acceptedCountOf(selectedCount=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0009
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0009
     * @tc.desc      acceptedCountOf(selectedCount=15) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0009 begin`);
      const actual: number = acceptedCountOf(15);
      logInfo(`acceptedCountOf(selectedCount=15): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0010
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0010
     * @tc.desc      acceptedCountOf(selectedCount=20) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0010 begin`);
      const actual: number = acceptedCountOf(20);
      logInfo(`acceptedCountOf(selectedCount=20): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0011
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0011
     * @tc.desc      acceptedCountOf(selectedCount=25) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0011 begin`);
      const actual: number = acceptedCountOf(25);
      logInfo(`acceptedCountOf(selectedCount=25): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0012
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0012
     * @tc.desc      acceptedCountOf(selectedCount=30) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0012 begin`);
      const actual: number = acceptedCountOf(30);
      logInfo(`acceptedCountOf(selectedCount=30): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0013
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0013
     * @tc.desc      acceptedCountOf(selectedCount=35) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0013 begin`);
      const actual: number = acceptedCountOf(35);
      logInfo(`acceptedCountOf(selectedCount=35): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0014
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0014
     * @tc.desc      acceptedCountOf(selectedCount=40) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0014 begin`);
      const actual: number = acceptedCountOf(40);
      logInfo(`acceptedCountOf(selectedCount=40): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0015
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0015
     * @tc.desc      acceptedCountOf(selectedCount=45) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0015 begin`);
      const actual: number = acceptedCountOf(45);
      logInfo(`acceptedCountOf(selectedCount=45): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0016
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0016
     * @tc.desc      acceptedCountOf(selectedCount=50) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0016 begin`);
      const actual: number = acceptedCountOf(50);
      logInfo(`acceptedCountOf(selectedCount=50): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0017
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0017
     * @tc.desc      acceptedCountOf(selectedCount=55) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0017 begin`);
      const actual: number = acceptedCountOf(55);
      logInfo(`acceptedCountOf(selectedCount=55): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0018
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0018
     * @tc.desc      acceptedCountOf(selectedCount=60) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0018 begin`);
      const actual: number = acceptedCountOf(60);
      logInfo(`acceptedCountOf(selectedCount=60): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0019
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0019
     * @tc.desc      acceptedCountOf(selectedCount=65) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0019 begin`);
      const actual: number = acceptedCountOf(65);
      logInfo(`acceptedCountOf(selectedCount=65): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0020
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0020
     * @tc.desc      acceptedCountOf(selectedCount=70) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0020 begin`);
      const actual: number = acceptedCountOf(70);
      logInfo(`acceptedCountOf(selectedCount=70): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0021
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0021
     * @tc.desc      acceptedCountOf(selectedCount=75) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0021 begin`);
      const actual: number = acceptedCountOf(75);
      logInfo(`acceptedCountOf(selectedCount=75): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0022
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0022
     * @tc.desc      acceptedCountOf(selectedCount=80) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0022 begin`);
      const actual: number = acceptedCountOf(80);
      logInfo(`acceptedCountOf(selectedCount=80): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0023
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0023
     * @tc.desc      acceptedCountOf(selectedCount=85) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0023 begin`);
      const actual: number = acceptedCountOf(85);
      logInfo(`acceptedCountOf(selectedCount=85): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0024
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0024
     * @tc.desc      acceptedCountOf(selectedCount=90) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0024 begin`);
      const actual: number = acceptedCountOf(90);
      logInfo(`acceptedCountOf(selectedCount=90): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0025
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0025
     * @tc.desc      acceptedCountOf(selectedCount=95) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0025 begin`);
      const actual: number = acceptedCountOf(95);
      logInfo(`acceptedCountOf(selectedCount=95): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0026
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0026
     * @tc.desc      acceptedCountOf(selectedCount=105) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0026 begin`);
      const actual: number = acceptedCountOf(105);
      logInfo(`acceptedCountOf(selectedCount=105): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0027
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0027
     * @tc.desc      acceptedCountOf(selectedCount=110) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0027 begin`);
      const actual: number = acceptedCountOf(110);
      logInfo(`acceptedCountOf(selectedCount=110): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0028
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0028
     * @tc.desc      acceptedCountOf(selectedCount=115) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0028 begin`);
      const actual: number = acceptedCountOf(115);
      logInfo(`acceptedCountOf(selectedCount=115): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0029
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0029
     * @tc.desc      acceptedCountOf(selectedCount=120) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0029 begin`);
      const actual: number = acceptedCountOf(120);
      logInfo(`acceptedCountOf(selectedCount=120): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0030
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0030
     * @tc.desc      acceptedCountOf(selectedCount=125) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0030 begin`);
      const actual: number = acceptedCountOf(125);
      logInfo(`acceptedCountOf(selectedCount=125): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0031
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0031
     * @tc.desc      acceptedCountOf(selectedCount=130) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0031 begin`);
      const actual: number = acceptedCountOf(130);
      logInfo(`acceptedCountOf(selectedCount=130): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0032
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0032
     * @tc.desc      acceptedCountOf(selectedCount=135) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0032 begin`);
      const actual: number = acceptedCountOf(135);
      logInfo(`acceptedCountOf(selectedCount=135): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0033
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0033
     * @tc.desc      acceptedCountOf(selectedCount=140) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0033 begin`);
      const actual: number = acceptedCountOf(140);
      logInfo(`acceptedCountOf(selectedCount=140): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0034
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0034
     * @tc.desc      acceptedCountOf(selectedCount=145) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0034 begin`);
      const actual: number = acceptedCountOf(145);
      logInfo(`acceptedCountOf(selectedCount=145): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0035
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0035
     * @tc.desc      acceptedCountOf(selectedCount=150) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0035 begin`);
      const actual: number = acceptedCountOf(150);
      logInfo(`acceptedCountOf(selectedCount=150): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0036
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0036
     * @tc.desc      acceptedCountOf(selectedCount=155) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0036 begin`);
      const actual: number = acceptedCountOf(155);
      logInfo(`acceptedCountOf(selectedCount=155): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0037
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0037
     * @tc.desc      acceptedCountOf(selectedCount=160) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0037 begin`);
      const actual: number = acceptedCountOf(160);
      logInfo(`acceptedCountOf(selectedCount=160): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0038
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0038
     * @tc.desc      acceptedCountOf(selectedCount=165) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0038 begin`);
      const actual: number = acceptedCountOf(165);
      logInfo(`acceptedCountOf(selectedCount=165): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0039
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0039
     * @tc.desc      acceptedCountOf(selectedCount=170) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0039 begin`);
      const actual: number = acceptedCountOf(170);
      logInfo(`acceptedCountOf(selectedCount=170): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0040
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0040
     * @tc.desc      acceptedCountOf(selectedCount=175) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0040 begin`);
      const actual: number = acceptedCountOf(175);
      logInfo(`acceptedCountOf(selectedCount=175): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0041
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0041
     * @tc.desc      acceptedCountOf(selectedCount=180) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0041 begin`);
      const actual: number = acceptedCountOf(180);
      logInfo(`acceptedCountOf(selectedCount=180): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0042
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0042
     * @tc.desc      acceptedCountOf(selectedCount=185) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0042 begin`);
      const actual: number = acceptedCountOf(185);
      logInfo(`acceptedCountOf(selectedCount=185): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0043
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0043
     * @tc.desc      acceptedCountOf(selectedCount=190) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0043 begin`);
      const actual: number = acceptedCountOf(190);
      logInfo(`acceptedCountOf(selectedCount=190): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0044
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0044
     * @tc.desc      acceptedCountOf(selectedCount=195) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0044 begin`);
      const actual: number = acceptedCountOf(195);
      logInfo(`acceptedCountOf(selectedCount=195): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0045
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0045
     * @tc.desc      acceptedCountOf(selectedCount=200) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0045 begin`);
      const actual: number = acceptedCountOf(200);
      logInfo(`acceptedCountOf(selectedCount=200): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0046
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0046
     * @tc.desc      acceptedCountOf(selectedCount=-56) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0046 begin`);
      const actual: number = acceptedCountOf(-56);
      logInfo(`acceptedCountOf(selectedCount=-56): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0047
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0047
     * @tc.desc      acceptedCountOf(selectedCount=171) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0047 begin`);
      const actual: number = acceptedCountOf(171);
      logInfo(`acceptedCountOf(selectedCount=171): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0048
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0048
     * @tc.desc      acceptedCountOf(selectedCount=-4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0048 begin`);
      const actual: number = acceptedCountOf(-4);
      logInfo(`acceptedCountOf(selectedCount=-4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0049
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0049
     * @tc.desc      acceptedCountOf(selectedCount=68.75) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0049 begin`);
      const actual: number = acceptedCountOf(68.75);
      logInfo(`acceptedCountOf(selectedCount=68.75): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0050
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0050
     * @tc.desc      acceptedCountOf(selectedCount=-14) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0050 begin`);
      const actual: number = acceptedCountOf(-14);
      logInfo(`acceptedCountOf(selectedCount=-14): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0051
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0051
     * @tc.desc      acceptedCountOf(selectedCount=-84) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0051 begin`);
      const actual: number = acceptedCountOf(-84);
      logInfo(`acceptedCountOf(selectedCount=-84): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0052
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0052
     * @tc.desc      acceptedCountOf(selectedCount=74) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0052 begin`);
      const actual: number = acceptedCountOf(74);
      logInfo(`acceptedCountOf(selectedCount=74): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0053
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0053
     * @tc.desc      acceptedCountOf(selectedCount=-73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0053 begin`);
      const actual: number = acceptedCountOf(-73);
      logInfo(`acceptedCountOf(selectedCount=-73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0054
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0054
     * @tc.desc      acceptedCountOf(selectedCount=7) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0054 begin`);
      const actual: number = acceptedCountOf(7);
      logInfo(`acceptedCountOf(selectedCount=7): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0055
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0055
     * @tc.desc      acceptedCountOf(selectedCount=-49) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0055 begin`);
      const actual: number = acceptedCountOf(-49);
      logInfo(`acceptedCountOf(selectedCount=-49): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0056
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0056
     * @tc.desc      acceptedCountOf(selectedCount=-77) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0056 begin`);
      const actual: number = acceptedCountOf(-77);
      logInfo(`acceptedCountOf(selectedCount=-77): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0057
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0057
     * @tc.desc      acceptedCountOf(selectedCount=-67) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0057 begin`);
      const actual: number = acceptedCountOf(-67);
      logInfo(`acceptedCountOf(selectedCount=-67): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0058
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0058
     * @tc.desc      acceptedCountOf(selectedCount=63) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0058 begin`);
      const actual: number = acceptedCountOf(63);
      logInfo(`acceptedCountOf(selectedCount=63): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0059
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0059
     * @tc.desc      acceptedCountOf(selectedCount=-16) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0059 begin`);
      const actual: number = acceptedCountOf(-16);
      logInfo(`acceptedCountOf(selectedCount=-16): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0060
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0060
     * @tc.desc      acceptedCountOf(selectedCount=179) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0060 begin`);
      const actual: number = acceptedCountOf(179);
      logInfo(`acceptedCountOf(selectedCount=179): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0061
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0061
     * @tc.desc      acceptedCountOf(selectedCount=8) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0061 begin`);
      const actual: number = acceptedCountOf(8);
      logInfo(`acceptedCountOf(selectedCount=8): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0062
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0062
     * @tc.desc      acceptedCountOf(selectedCount=186) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0062 begin`);
      const actual: number = acceptedCountOf(186);
      logInfo(`acceptedCountOf(selectedCount=186): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0063
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0063
     * @tc.desc      acceptedCountOf(selectedCount=132) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0063 begin`);
      const actual: number = acceptedCountOf(132);
      logInfo(`acceptedCountOf(selectedCount=132): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0064
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0064
     * @tc.desc      acceptedCountOf(selectedCount=-54) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0064 begin`);
      const actual: number = acceptedCountOf(-54);
      logInfo(`acceptedCountOf(selectedCount=-54): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0065
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0065
     * @tc.desc      acceptedCountOf(selectedCount=-35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0065 begin`);
      const actual: number = acceptedCountOf(-35);
      logInfo(`acceptedCountOf(selectedCount=-35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0066
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0066
     * @tc.desc      acceptedCountOf(selectedCount=4) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0066 begin`);
      const actual: number = acceptedCountOf(4);
      logInfo(`acceptedCountOf(selectedCount=4): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0067
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0067
     * @tc.desc      acceptedCountOf(selectedCount=42.9) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0067 begin`);
      const actual: number = acceptedCountOf(42.9);
      logInfo(`acceptedCountOf(selectedCount=42.9): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0068
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0068
     * @tc.desc      acceptedCountOf(selectedCount=116) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0068 begin`);
      const actual: number = acceptedCountOf(116);
      logInfo(`acceptedCountOf(selectedCount=116): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0069
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0069
     * @tc.desc      acceptedCountOf(selectedCount=79) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0069 begin`);
      const actual: number = acceptedCountOf(79);
      logInfo(`acceptedCountOf(selectedCount=79): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0070
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0070
     * @tc.desc      acceptedCountOf(selectedCount=152) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0070 begin`);
      const actual: number = acceptedCountOf(152);
      logInfo(`acceptedCountOf(selectedCount=152): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0071
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0071
     * @tc.desc      acceptedCountOf(selectedCount=9.05) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0071 begin`);
      const actual: number = acceptedCountOf(9.05);
      logInfo(`acceptedCountOf(selectedCount=9.05): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0072
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0072
     * @tc.desc      acceptedCountOf(selectedCount=184) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0072 begin`);
      const actual: number = acceptedCountOf(184);
      logInfo(`acceptedCountOf(selectedCount=184): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0073
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0073
     * @tc.desc      acceptedCountOf(selectedCount=9) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0073 begin`);
      const actual: number = acceptedCountOf(9);
      logInfo(`acceptedCountOf(selectedCount=9): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0074
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0074
     * @tc.desc      acceptedCountOf(selectedCount=93) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0074 begin`);
      const actual: number = acceptedCountOf(93);
      logInfo(`acceptedCountOf(selectedCount=93): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0075
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0075
     * @tc.desc      acceptedCountOf(selectedCount=74.94) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0075 begin`);
      const actual: number = acceptedCountOf(74.94);
      logInfo(`acceptedCountOf(selectedCount=74.94): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0076
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0076
     * @tc.desc      acceptedCountOf(selectedCount=-94) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0076 begin`);
      const actual: number = acceptedCountOf(-94);
      logInfo(`acceptedCountOf(selectedCount=-94): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0077
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0077
     * @tc.desc      acceptedCountOf(selectedCount=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0077 begin`);
      const actual: number = acceptedCountOf(-13);
      logInfo(`acceptedCountOf(selectedCount=-13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0078
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0078
     * @tc.desc      acceptedCountOf(selectedCount=72) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0078 begin`);
      const actual: number = acceptedCountOf(72);
      logInfo(`acceptedCountOf(selectedCount=72): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0079
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0079
     * @tc.desc      acceptedCountOf(selectedCount=119) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0079 begin`);
      const actual: number = acceptedCountOf(119);
      logInfo(`acceptedCountOf(selectedCount=119): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0080
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0080
     * @tc.desc      acceptedCountOf(selectedCount=88.89) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0080 begin`);
      const actual: number = acceptedCountOf(88.89);
      logInfo(`acceptedCountOf(selectedCount=88.89): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0081
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0081
     * @tc.desc      acceptedCountOf(selectedCount=167) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0081 begin`);
      const actual: number = acceptedCountOf(167);
      logInfo(`acceptedCountOf(selectedCount=167): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0082
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0082
     * @tc.desc      acceptedCountOf(selectedCount=-29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0082 begin`);
      const actual: number = acceptedCountOf(-29);
      logInfo(`acceptedCountOf(selectedCount=-29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0083
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0083
     * @tc.desc      acceptedCountOf(selectedCount=-21) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0083 begin`);
      const actual: number = acceptedCountOf(-21);
      logInfo(`acceptedCountOf(selectedCount=-21): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0084
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0084
     * @tc.desc      acceptedCountOf(selectedCount=109) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0084 begin`);
      const actual: number = acceptedCountOf(109);
      logInfo(`acceptedCountOf(selectedCount=109): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0085
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0085
     * @tc.desc      acceptedCountOf(selectedCount=22.64) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0085 begin`);
      const actual: number = acceptedCountOf(22.64);
      logInfo(`acceptedCountOf(selectedCount=22.64): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0086
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0086
     * @tc.desc      acceptedCountOf(selectedCount=48.66) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0086 begin`);
      const actual: number = acceptedCountOf(48.66);
      logInfo(`acceptedCountOf(selectedCount=48.66): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0087
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0087
     * @tc.desc      acceptedCountOf(selectedCount=188) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0087 begin`);
      const actual: number = acceptedCountOf(188);
      logInfo(`acceptedCountOf(selectedCount=188): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0088
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0088
     * @tc.desc      acceptedCountOf(selectedCount=106) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0088 begin`);
      const actual: number = acceptedCountOf(106);
      logInfo(`acceptedCountOf(selectedCount=106): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0089
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0089
     * @tc.desc      acceptedCountOf(selectedCount=67.88) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0089 begin`);
      const actual: number = acceptedCountOf(67.88);
      logInfo(`acceptedCountOf(selectedCount=67.88): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0090
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0090
     * @tc.desc      acceptedCountOf(selectedCount=80.91) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0090 begin`);
      const actual: number = acceptedCountOf(80.91);
      logInfo(`acceptedCountOf(selectedCount=80.91): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0091
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0091
     * @tc.desc      acceptedCountOf(selectedCount=-71) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0091 begin`);
      const actual: number = acceptedCountOf(-71);
      logInfo(`acceptedCountOf(selectedCount=-71): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0092
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0092
     * @tc.desc      acceptedCountOf(selectedCount=72.69) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0092 begin`);
      const actual: number = acceptedCountOf(72.69);
      logInfo(`acceptedCountOf(selectedCount=72.69): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0093
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0093
     * @tc.desc      acceptedCountOf(selectedCount=17) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0093 begin`);
      const actual: number = acceptedCountOf(17);
      logInfo(`acceptedCountOf(selectedCount=17): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0094
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0094
     * @tc.desc      acceptedCountOf(selectedCount=12) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0094 begin`);
      const actual: number = acceptedCountOf(12);
      logInfo(`acceptedCountOf(selectedCount=12): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0095
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0095
     * @tc.desc      acceptedCountOf(selectedCount=177) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0095 begin`);
      const actual: number = acceptedCountOf(177);
      logInfo(`acceptedCountOf(selectedCount=177): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0096
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0096
     * @tc.desc      acceptedCountOf(selectedCount=111) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0096 begin`);
      const actual: number = acceptedCountOf(111);
      logInfo(`acceptedCountOf(selectedCount=111): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0096 end`);
    });
  });
}
