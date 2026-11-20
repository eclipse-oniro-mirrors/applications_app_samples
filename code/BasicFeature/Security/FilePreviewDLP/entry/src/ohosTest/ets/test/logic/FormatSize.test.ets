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
import { formatSize } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for formatSize (96 cases). */
export default function formatSizeTest(): void {
  describe('FormatSizeTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0001
     * @tc.name      FilePreviewDLP_FormatSize_0001
     * @tc.desc      formatSize(fraction=0) returns "0.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FormatSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FormatSize_0001 begin`);
      const actual: string = formatSize(0);
      logInfo(`formatSize(fraction=0): actual=${actual}`);
      expect(actual).assertEqual('0.0MB');
      logInfo(`${BUNDLE}FormatSize_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0002
     * @tc.name      FilePreviewDLP_FormatSize_0002
     * @tc.desc      formatSize(fraction=0.25) returns "2.5MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_FormatSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FormatSize_0002 begin`);
      const actual: string = formatSize(0.25);
      logInfo(`formatSize(fraction=0.25): actual=${actual}`);
      expect(actual).assertEqual('2.5MB');
      logInfo(`${BUNDLE}FormatSize_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0003
     * @tc.name      FilePreviewDLP_FormatSize_0003
     * @tc.desc      formatSize(fraction=10) returns "100.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatSize_0003 begin`);
      const actual: string = formatSize(10);
      logInfo(`formatSize(fraction=10): actual=${actual}`);
      expect(actual).assertEqual('100.0MB');
      logInfo(`${BUNDLE}FormatSize_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0004
     * @tc.name      FilePreviewDLP_FormatSize_0004
     * @tc.desc      formatSize(fraction=9) returns "90.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatSize_0004 begin`);
      const actual: string = formatSize(9);
      logInfo(`formatSize(fraction=9): actual=${actual}`);
      expect(actual).assertEqual('90.0MB');
      logInfo(`${BUNDLE}FormatSize_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0005
     * @tc.name      FilePreviewDLP_FormatSize_0005
     * @tc.desc      formatSize(fraction=11) returns "110.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatSize_0005 begin`);
      const actual: string = formatSize(11);
      logInfo(`formatSize(fraction=11): actual=${actual}`);
      expect(actual).assertEqual('110.0MB');
      logInfo(`${BUNDLE}FormatSize_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0006
     * @tc.name      FilePreviewDLP_FormatSize_0006
     * @tc.desc      formatSize(fraction=20) returns "200.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0006 begin`);
      const actual: string = formatSize(20);
      logInfo(`formatSize(fraction=20): actual=${actual}`);
      expect(actual).assertEqual('200.0MB');
      logInfo(`${BUNDLE}FormatSize_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0007
     * @tc.name      FilePreviewDLP_FormatSize_0007
     * @tc.desc      formatSize(fraction=5) returns "50.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0007 begin`);
      const actual: string = formatSize(5);
      logInfo(`formatSize(fraction=5): actual=${actual}`);
      expect(actual).assertEqual('50.0MB');
      logInfo(`${BUNDLE}FormatSize_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0008
     * @tc.name      FilePreviewDLP_FormatSize_0008
     * @tc.desc      formatSize(fraction=1) returns "10.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatSize_0008 begin`);
      const actual: string = formatSize(1);
      logInfo(`formatSize(fraction=1): actual=${actual}`);
      expect(actual).assertEqual('10.0MB');
      logInfo(`${BUNDLE}FormatSize_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0009
     * @tc.name      FilePreviewDLP_FormatSize_0009
     * @tc.desc      formatSize(fraction=2) returns "20.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_FormatSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FormatSize_0009 begin`);
      const actual: string = formatSize(2);
      logInfo(`formatSize(fraction=2): actual=${actual}`);
      expect(actual).assertEqual('20.0MB');
      logInfo(`${BUNDLE}FormatSize_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0010
     * @tc.name      FilePreviewDLP_FormatSize_0010
     * @tc.desc      formatSize(fraction=0.5) returns "5.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0010 begin`);
      const actual: string = formatSize(0.5);
      logInfo(`formatSize(fraction=0.5): actual=${actual}`);
      expect(actual).assertEqual('5.0MB');
      logInfo(`${BUNDLE}FormatSize_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0011
     * @tc.name      FilePreviewDLP_FormatSize_0011
     * @tc.desc      formatSize(fraction=1.5) returns "15.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0011 begin`);
      const actual: string = formatSize(1.5);
      logInfo(`formatSize(fraction=1.5): actual=${actual}`);
      expect(actual).assertEqual('15.0MB');
      logInfo(`${BUNDLE}FormatSize_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0012
     * @tc.name      FilePreviewDLP_FormatSize_0012
     * @tc.desc      formatSize(fraction=-1) returns "-10.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0012 begin`);
      const actual: string = formatSize(-1);
      logInfo(`formatSize(fraction=-1): actual=${actual}`);
      expect(actual).assertEqual('-10.0MB');
      logInfo(`${BUNDLE}FormatSize_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0013
     * @tc.name      FilePreviewDLP_FormatSize_0013
     * @tc.desc      formatSize(fraction=3) returns "30.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0013 begin`);
      const actual: string = formatSize(3);
      logInfo(`formatSize(fraction=3): actual=${actual}`);
      expect(actual).assertEqual('30.0MB');
      logInfo(`${BUNDLE}FormatSize_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0014
     * @tc.name      FilePreviewDLP_FormatSize_0014
     * @tc.desc      formatSize(fraction=100) returns "1000.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0014 begin`);
      const actual: string = formatSize(100);
      logInfo(`formatSize(fraction=100): actual=${actual}`);
      expect(actual).assertEqual('1000.0MB');
      logInfo(`${BUNDLE}FormatSize_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0015
     * @tc.name      FilePreviewDLP_FormatSize_0015
     * @tc.desc      formatSize(fraction=15) returns "150.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0015 begin`);
      const actual: string = formatSize(15);
      logInfo(`formatSize(fraction=15): actual=${actual}`);
      expect(actual).assertEqual('150.0MB');
      logInfo(`${BUNDLE}FormatSize_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0016
     * @tc.name      FilePreviewDLP_FormatSize_0016
     * @tc.desc      formatSize(fraction=25) returns "250.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0016 begin`);
      const actual: string = formatSize(25);
      logInfo(`formatSize(fraction=25): actual=${actual}`);
      expect(actual).assertEqual('250.0MB');
      logInfo(`${BUNDLE}FormatSize_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0017
     * @tc.name      FilePreviewDLP_FormatSize_0017
     * @tc.desc      formatSize(fraction=30) returns "300.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0017 begin`);
      const actual: string = formatSize(30);
      logInfo(`formatSize(fraction=30): actual=${actual}`);
      expect(actual).assertEqual('300.0MB');
      logInfo(`${BUNDLE}FormatSize_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0018
     * @tc.name      FilePreviewDLP_FormatSize_0018
     * @tc.desc      formatSize(fraction=35) returns "350.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0018 begin`);
      const actual: string = formatSize(35);
      logInfo(`formatSize(fraction=35): actual=${actual}`);
      expect(actual).assertEqual('350.0MB');
      logInfo(`${BUNDLE}FormatSize_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0019
     * @tc.name      FilePreviewDLP_FormatSize_0019
     * @tc.desc      formatSize(fraction=40) returns "400.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0019 begin`);
      const actual: string = formatSize(40);
      logInfo(`formatSize(fraction=40): actual=${actual}`);
      expect(actual).assertEqual('400.0MB');
      logInfo(`${BUNDLE}FormatSize_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0020
     * @tc.name      FilePreviewDLP_FormatSize_0020
     * @tc.desc      formatSize(fraction=45) returns "450.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0020 begin`);
      const actual: string = formatSize(45);
      logInfo(`formatSize(fraction=45): actual=${actual}`);
      expect(actual).assertEqual('450.0MB');
      logInfo(`${BUNDLE}FormatSize_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0021
     * @tc.name      FilePreviewDLP_FormatSize_0021
     * @tc.desc      formatSize(fraction=50) returns "500.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0021 begin`);
      const actual: string = formatSize(50);
      logInfo(`formatSize(fraction=50): actual=${actual}`);
      expect(actual).assertEqual('500.0MB');
      logInfo(`${BUNDLE}FormatSize_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0022
     * @tc.name      FilePreviewDLP_FormatSize_0022
     * @tc.desc      formatSize(fraction=55) returns "550.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0022 begin`);
      const actual: string = formatSize(55);
      logInfo(`formatSize(fraction=55): actual=${actual}`);
      expect(actual).assertEqual('550.0MB');
      logInfo(`${BUNDLE}FormatSize_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0023
     * @tc.name      FilePreviewDLP_FormatSize_0023
     * @tc.desc      formatSize(fraction=60) returns "600.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0023 begin`);
      const actual: string = formatSize(60);
      logInfo(`formatSize(fraction=60): actual=${actual}`);
      expect(actual).assertEqual('600.0MB');
      logInfo(`${BUNDLE}FormatSize_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0024
     * @tc.name      FilePreviewDLP_FormatSize_0024
     * @tc.desc      formatSize(fraction=65) returns "650.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0024 begin`);
      const actual: string = formatSize(65);
      logInfo(`formatSize(fraction=65): actual=${actual}`);
      expect(actual).assertEqual('650.0MB');
      logInfo(`${BUNDLE}FormatSize_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0025
     * @tc.name      FilePreviewDLP_FormatSize_0025
     * @tc.desc      formatSize(fraction=70) returns "700.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0025 begin`);
      const actual: string = formatSize(70);
      logInfo(`formatSize(fraction=70): actual=${actual}`);
      expect(actual).assertEqual('700.0MB');
      logInfo(`${BUNDLE}FormatSize_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0026
     * @tc.name      FilePreviewDLP_FormatSize_0026
     * @tc.desc      formatSize(fraction=75) returns "750.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0026 begin`);
      const actual: string = formatSize(75);
      logInfo(`formatSize(fraction=75): actual=${actual}`);
      expect(actual).assertEqual('750.0MB');
      logInfo(`${BUNDLE}FormatSize_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0027
     * @tc.name      FilePreviewDLP_FormatSize_0027
     * @tc.desc      formatSize(fraction=80) returns "800.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0027 begin`);
      const actual: string = formatSize(80);
      logInfo(`formatSize(fraction=80): actual=${actual}`);
      expect(actual).assertEqual('800.0MB');
      logInfo(`${BUNDLE}FormatSize_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0028
     * @tc.name      FilePreviewDLP_FormatSize_0028
     * @tc.desc      formatSize(fraction=85) returns "850.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0028 begin`);
      const actual: string = formatSize(85);
      logInfo(`formatSize(fraction=85): actual=${actual}`);
      expect(actual).assertEqual('850.0MB');
      logInfo(`${BUNDLE}FormatSize_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0029
     * @tc.name      FilePreviewDLP_FormatSize_0029
     * @tc.desc      formatSize(fraction=90) returns "900.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0029 begin`);
      const actual: string = formatSize(90);
      logInfo(`formatSize(fraction=90): actual=${actual}`);
      expect(actual).assertEqual('900.0MB');
      logInfo(`${BUNDLE}FormatSize_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0030
     * @tc.name      FilePreviewDLP_FormatSize_0030
     * @tc.desc      formatSize(fraction=95) returns "950.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0030 begin`);
      const actual: string = formatSize(95);
      logInfo(`formatSize(fraction=95): actual=${actual}`);
      expect(actual).assertEqual('950.0MB');
      logInfo(`${BUNDLE}FormatSize_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0031
     * @tc.name      FilePreviewDLP_FormatSize_0031
     * @tc.desc      formatSize(fraction=105) returns "1050.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0031 begin`);
      const actual: string = formatSize(105);
      logInfo(`formatSize(fraction=105): actual=${actual}`);
      expect(actual).assertEqual('1050.0MB');
      logInfo(`${BUNDLE}FormatSize_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0032
     * @tc.name      FilePreviewDLP_FormatSize_0032
     * @tc.desc      formatSize(fraction=110) returns "1100.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0032 begin`);
      const actual: string = formatSize(110);
      logInfo(`formatSize(fraction=110): actual=${actual}`);
      expect(actual).assertEqual('1100.0MB');
      logInfo(`${BUNDLE}FormatSize_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0033
     * @tc.name      FilePreviewDLP_FormatSize_0033
     * @tc.desc      formatSize(fraction=115) returns "1150.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0033 begin`);
      const actual: string = formatSize(115);
      logInfo(`formatSize(fraction=115): actual=${actual}`);
      expect(actual).assertEqual('1150.0MB');
      logInfo(`${BUNDLE}FormatSize_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0034
     * @tc.name      FilePreviewDLP_FormatSize_0034
     * @tc.desc      formatSize(fraction=120) returns "1200.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0034 begin`);
      const actual: string = formatSize(120);
      logInfo(`formatSize(fraction=120): actual=${actual}`);
      expect(actual).assertEqual('1200.0MB');
      logInfo(`${BUNDLE}FormatSize_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0035
     * @tc.name      FilePreviewDLP_FormatSize_0035
     * @tc.desc      formatSize(fraction=125) returns "1250.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0035 begin`);
      const actual: string = formatSize(125);
      logInfo(`formatSize(fraction=125): actual=${actual}`);
      expect(actual).assertEqual('1250.0MB');
      logInfo(`${BUNDLE}FormatSize_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0036
     * @tc.name      FilePreviewDLP_FormatSize_0036
     * @tc.desc      formatSize(fraction=130) returns "1300.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0036 begin`);
      const actual: string = formatSize(130);
      logInfo(`formatSize(fraction=130): actual=${actual}`);
      expect(actual).assertEqual('1300.0MB');
      logInfo(`${BUNDLE}FormatSize_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0037
     * @tc.name      FilePreviewDLP_FormatSize_0037
     * @tc.desc      formatSize(fraction=135) returns "1350.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0037 begin`);
      const actual: string = formatSize(135);
      logInfo(`formatSize(fraction=135): actual=${actual}`);
      expect(actual).assertEqual('1350.0MB');
      logInfo(`${BUNDLE}FormatSize_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0038
     * @tc.name      FilePreviewDLP_FormatSize_0038
     * @tc.desc      formatSize(fraction=140) returns "1400.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0038 begin`);
      const actual: string = formatSize(140);
      logInfo(`formatSize(fraction=140): actual=${actual}`);
      expect(actual).assertEqual('1400.0MB');
      logInfo(`${BUNDLE}FormatSize_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0039
     * @tc.name      FilePreviewDLP_FormatSize_0039
     * @tc.desc      formatSize(fraction=145) returns "1450.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0039 begin`);
      const actual: string = formatSize(145);
      logInfo(`formatSize(fraction=145): actual=${actual}`);
      expect(actual).assertEqual('1450.0MB');
      logInfo(`${BUNDLE}FormatSize_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0040
     * @tc.name      FilePreviewDLP_FormatSize_0040
     * @tc.desc      formatSize(fraction=150) returns "1500.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0040 begin`);
      const actual: string = formatSize(150);
      logInfo(`formatSize(fraction=150): actual=${actual}`);
      expect(actual).assertEqual('1500.0MB');
      logInfo(`${BUNDLE}FormatSize_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0041
     * @tc.name      FilePreviewDLP_FormatSize_0041
     * @tc.desc      formatSize(fraction=155) returns "1550.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0041 begin`);
      const actual: string = formatSize(155);
      logInfo(`formatSize(fraction=155): actual=${actual}`);
      expect(actual).assertEqual('1550.0MB');
      logInfo(`${BUNDLE}FormatSize_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0042
     * @tc.name      FilePreviewDLP_FormatSize_0042
     * @tc.desc      formatSize(fraction=160) returns "1600.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0042 begin`);
      const actual: string = formatSize(160);
      logInfo(`formatSize(fraction=160): actual=${actual}`);
      expect(actual).assertEqual('1600.0MB');
      logInfo(`${BUNDLE}FormatSize_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0043
     * @tc.name      FilePreviewDLP_FormatSize_0043
     * @tc.desc      formatSize(fraction=165) returns "1650.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0043 begin`);
      const actual: string = formatSize(165);
      logInfo(`formatSize(fraction=165): actual=${actual}`);
      expect(actual).assertEqual('1650.0MB');
      logInfo(`${BUNDLE}FormatSize_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0044
     * @tc.name      FilePreviewDLP_FormatSize_0044
     * @tc.desc      formatSize(fraction=170) returns "1700.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0044 begin`);
      const actual: string = formatSize(170);
      logInfo(`formatSize(fraction=170): actual=${actual}`);
      expect(actual).assertEqual('1700.0MB');
      logInfo(`${BUNDLE}FormatSize_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0045
     * @tc.name      FilePreviewDLP_FormatSize_0045
     * @tc.desc      formatSize(fraction=175) returns "1750.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0045 begin`);
      const actual: string = formatSize(175);
      logInfo(`formatSize(fraction=175): actual=${actual}`);
      expect(actual).assertEqual('1750.0MB');
      logInfo(`${BUNDLE}FormatSize_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0046
     * @tc.name      FilePreviewDLP_FormatSize_0046
     * @tc.desc      formatSize(fraction=180) returns "1800.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0046 begin`);
      const actual: string = formatSize(180);
      logInfo(`formatSize(fraction=180): actual=${actual}`);
      expect(actual).assertEqual('1800.0MB');
      logInfo(`${BUNDLE}FormatSize_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0047
     * @tc.name      FilePreviewDLP_FormatSize_0047
     * @tc.desc      formatSize(fraction=185) returns "1850.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0047 begin`);
      const actual: string = formatSize(185);
      logInfo(`formatSize(fraction=185): actual=${actual}`);
      expect(actual).assertEqual('1850.0MB');
      logInfo(`${BUNDLE}FormatSize_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0048
     * @tc.name      FilePreviewDLP_FormatSize_0048
     * @tc.desc      formatSize(fraction=190) returns "1900.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0048 begin`);
      const actual: string = formatSize(190);
      logInfo(`formatSize(fraction=190): actual=${actual}`);
      expect(actual).assertEqual('1900.0MB');
      logInfo(`${BUNDLE}FormatSize_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0049
     * @tc.name      FilePreviewDLP_FormatSize_0049
     * @tc.desc      formatSize(fraction=195) returns "1950.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0049 begin`);
      const actual: string = formatSize(195);
      logInfo(`formatSize(fraction=195): actual=${actual}`);
      expect(actual).assertEqual('1950.0MB');
      logInfo(`${BUNDLE}FormatSize_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0050
     * @tc.name      FilePreviewDLP_FormatSize_0050
     * @tc.desc      formatSize(fraction=200) returns "2000.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0050 begin`);
      const actual: string = formatSize(200);
      logInfo(`formatSize(fraction=200): actual=${actual}`);
      expect(actual).assertEqual('2000.0MB');
      logInfo(`${BUNDLE}FormatSize_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0051
     * @tc.name      FilePreviewDLP_FormatSize_0051
     * @tc.desc      formatSize(fraction=-27) returns "-270.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0051 begin`);
      const actual: string = formatSize(-27);
      logInfo(`formatSize(fraction=-27): actual=${actual}`);
      expect(actual).assertEqual('-270.0MB');
      logInfo(`${BUNDLE}FormatSize_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0052
     * @tc.name      FilePreviewDLP_FormatSize_0052
     * @tc.desc      formatSize(fraction=86) returns "860.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0052 begin`);
      const actual: string = formatSize(86);
      logInfo(`formatSize(fraction=86): actual=${actual}`);
      expect(actual).assertEqual('860.0MB');
      logInfo(`${BUNDLE}FormatSize_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0053
     * @tc.name      FilePreviewDLP_FormatSize_0053
     * @tc.desc      formatSize(fraction=47) returns "470.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0053 begin`);
      const actual: string = formatSize(47);
      logInfo(`formatSize(fraction=47): actual=${actual}`);
      expect(actual).assertEqual('470.0MB');
      logInfo(`${BUNDLE}FormatSize_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0054
     * @tc.name      FilePreviewDLP_FormatSize_0054
     * @tc.desc      formatSize(fraction=86.03) returns "860.3MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0054 begin`);
      const actual: string = formatSize(86.03);
      logInfo(`formatSize(fraction=86.03): actual=${actual}`);
      expect(actual).assertEqual('860.3MB');
      logInfo(`${BUNDLE}FormatSize_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0055
     * @tc.name      FilePreviewDLP_FormatSize_0055
     * @tc.desc      formatSize(fraction=98) returns "980.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0055 begin`);
      const actual: string = formatSize(98);
      logInfo(`formatSize(fraction=98): actual=${actual}`);
      expect(actual).assertEqual('980.0MB');
      logInfo(`${BUNDLE}FormatSize_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0056
     * @tc.name      FilePreviewDLP_FormatSize_0056
     * @tc.desc      formatSize(fraction=-34) returns "-340.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0056 begin`);
      const actual: string = formatSize(-34);
      logInfo(`formatSize(fraction=-34): actual=${actual}`);
      expect(actual).assertEqual('-340.0MB');
      logInfo(`${BUNDLE}FormatSize_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0057
     * @tc.name      FilePreviewDLP_FormatSize_0057
     * @tc.desc      formatSize(fraction=171) returns "1710.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0057 begin`);
      const actual: string = formatSize(171);
      logInfo(`formatSize(fraction=171): actual=${actual}`);
      expect(actual).assertEqual('1710.0MB');
      logInfo(`${BUNDLE}FormatSize_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0058
     * @tc.name      FilePreviewDLP_FormatSize_0058
     * @tc.desc      formatSize(fraction=-9) returns "-90.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0058 begin`);
      const actual: string = formatSize(-9);
      logInfo(`formatSize(fraction=-9): actual=${actual}`);
      expect(actual).assertEqual('-90.0MB');
      logInfo(`${BUNDLE}FormatSize_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0059
     * @tc.name      FilePreviewDLP_FormatSize_0059
     * @tc.desc      formatSize(fraction=-5) returns "-50.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0059 begin`);
      const actual: string = formatSize(-5);
      logInfo(`formatSize(fraction=-5): actual=${actual}`);
      expect(actual).assertEqual('-50.0MB');
      logInfo(`${BUNDLE}FormatSize_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0060
     * @tc.name      FilePreviewDLP_FormatSize_0060
     * @tc.desc      formatSize(fraction=-20) returns "-200.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0060 begin`);
      const actual: string = formatSize(-20);
      logInfo(`formatSize(fraction=-20): actual=${actual}`);
      expect(actual).assertEqual('-200.0MB');
      logInfo(`${BUNDLE}FormatSize_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0061
     * @tc.name      FilePreviewDLP_FormatSize_0061
     * @tc.desc      formatSize(fraction=78) returns "780.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0061 begin`);
      const actual: string = formatSize(78);
      logInfo(`formatSize(fraction=78): actual=${actual}`);
      expect(actual).assertEqual('780.0MB');
      logInfo(`${BUNDLE}FormatSize_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0062
     * @tc.name      FilePreviewDLP_FormatSize_0062
     * @tc.desc      formatSize(fraction=-99) returns "-990.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0062 begin`);
      const actual: string = formatSize(-99);
      logInfo(`formatSize(fraction=-99): actual=${actual}`);
      expect(actual).assertEqual('-990.0MB');
      logInfo(`${BUNDLE}FormatSize_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0063
     * @tc.name      FilePreviewDLP_FormatSize_0063
     * @tc.desc      formatSize(fraction=117) returns "1170.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0063 begin`);
      const actual: string = formatSize(117);
      logInfo(`formatSize(fraction=117): actual=${actual}`);
      expect(actual).assertEqual('1170.0MB');
      logInfo(`${BUNDLE}FormatSize_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0064
     * @tc.name      FilePreviewDLP_FormatSize_0064
     * @tc.desc      formatSize(fraction=22) returns "220.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0064 begin`);
      const actual: string = formatSize(22);
      logInfo(`formatSize(fraction=22): actual=${actual}`);
      expect(actual).assertEqual('220.0MB');
      logInfo(`${BUNDLE}FormatSize_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0065
     * @tc.name      FilePreviewDLP_FormatSize_0065
     * @tc.desc      formatSize(fraction=57) returns "570.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0065 begin`);
      const actual: string = formatSize(57);
      logInfo(`formatSize(fraction=57): actual=${actual}`);
      expect(actual).assertEqual('570.0MB');
      logInfo(`${BUNDLE}FormatSize_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0066
     * @tc.name      FilePreviewDLP_FormatSize_0066
     * @tc.desc      formatSize(fraction=-22) returns "-220.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0066 begin`);
      const actual: string = formatSize(-22);
      logInfo(`formatSize(fraction=-22): actual=${actual}`);
      expect(actual).assertEqual('-220.0MB');
      logInfo(`${BUNDLE}FormatSize_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0067
     * @tc.name      FilePreviewDLP_FormatSize_0067
     * @tc.desc      formatSize(fraction=40.22) returns "402.2MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0067 begin`);
      const actual: string = formatSize(40.22);
      logInfo(`formatSize(fraction=40.22): actual=${actual}`);
      expect(actual).assertEqual('402.2MB');
      logInfo(`${BUNDLE}FormatSize_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0068
     * @tc.name      FilePreviewDLP_FormatSize_0068
     * @tc.desc      formatSize(fraction=-39) returns "-390.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0068 begin`);
      const actual: string = formatSize(-39);
      logInfo(`formatSize(fraction=-39): actual=${actual}`);
      expect(actual).assertEqual('-390.0MB');
      logInfo(`${BUNDLE}FormatSize_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0069
     * @tc.name      FilePreviewDLP_FormatSize_0069
     * @tc.desc      formatSize(fraction=167) returns "1670.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0069 begin`);
      const actual: string = formatSize(167);
      logInfo(`formatSize(fraction=167): actual=${actual}`);
      expect(actual).assertEqual('1670.0MB');
      logInfo(`${BUNDLE}FormatSize_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0070
     * @tc.name      FilePreviewDLP_FormatSize_0070
     * @tc.desc      formatSize(fraction=26) returns "260.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0070 begin`);
      const actual: string = formatSize(26);
      logInfo(`formatSize(fraction=26): actual=${actual}`);
      expect(actual).assertEqual('260.0MB');
      logInfo(`${BUNDLE}FormatSize_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0071
     * @tc.name      FilePreviewDLP_FormatSize_0071
     * @tc.desc      formatSize(fraction=92) returns "920.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0071 begin`);
      const actual: string = formatSize(92);
      logInfo(`formatSize(fraction=92): actual=${actual}`);
      expect(actual).assertEqual('920.0MB');
      logInfo(`${BUNDLE}FormatSize_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0072
     * @tc.name      FilePreviewDLP_FormatSize_0072
     * @tc.desc      formatSize(fraction=28) returns "280.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0072 begin`);
      const actual: string = formatSize(28);
      logInfo(`formatSize(fraction=28): actual=${actual}`);
      expect(actual).assertEqual('280.0MB');
      logInfo(`${BUNDLE}FormatSize_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0073
     * @tc.name      FilePreviewDLP_FormatSize_0073
     * @tc.desc      formatSize(fraction=83.32) returns "833.2MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0073 begin`);
      const actual: string = formatSize(83.32);
      logInfo(`formatSize(fraction=83.32): actual=${actual}`);
      expect(actual).assertEqual('833.2MB');
      logInfo(`${BUNDLE}FormatSize_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0074
     * @tc.name      FilePreviewDLP_FormatSize_0074
     * @tc.desc      formatSize(fraction=-32) returns "-320.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0074 begin`);
      const actual: string = formatSize(-32);
      logInfo(`formatSize(fraction=-32): actual=${actual}`);
      expect(actual).assertEqual('-320.0MB');
      logInfo(`${BUNDLE}FormatSize_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0075
     * @tc.name      FilePreviewDLP_FormatSize_0075
     * @tc.desc      formatSize(fraction=8.03) returns "80.3MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0075 begin`);
      const actual: string = formatSize(8.03);
      logInfo(`formatSize(fraction=8.03): actual=${actual}`);
      expect(actual).assertEqual('80.3MB');
      logInfo(`${BUNDLE}FormatSize_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0076
     * @tc.name      FilePreviewDLP_FormatSize_0076
     * @tc.desc      formatSize(fraction=-37) returns "-370.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0076 begin`);
      const actual: string = formatSize(-37);
      logInfo(`formatSize(fraction=-37): actual=${actual}`);
      expect(actual).assertEqual('-370.0MB');
      logInfo(`${BUNDLE}FormatSize_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0077
     * @tc.name      FilePreviewDLP_FormatSize_0077
     * @tc.desc      formatSize(fraction=53.3) returns "533.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0077 begin`);
      const actual: string = formatSize(53.3);
      logInfo(`formatSize(fraction=53.3): actual=${actual}`);
      expect(actual).assertEqual('533.0MB');
      logInfo(`${BUNDLE}FormatSize_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0078
     * @tc.name      FilePreviewDLP_FormatSize_0078
     * @tc.desc      formatSize(fraction=104) returns "1040.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0078 begin`);
      const actual: string = formatSize(104);
      logInfo(`formatSize(fraction=104): actual=${actual}`);
      expect(actual).assertEqual('1040.0MB');
      logInfo(`${BUNDLE}FormatSize_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0079
     * @tc.name      FilePreviewDLP_FormatSize_0079
     * @tc.desc      formatSize(fraction=68.34) returns "683.4MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0079 begin`);
      const actual: string = formatSize(68.34);
      logInfo(`formatSize(fraction=68.34): actual=${actual}`);
      expect(actual).assertEqual('683.4MB');
      logInfo(`${BUNDLE}FormatSize_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0080
     * @tc.name      FilePreviewDLP_FormatSize_0080
     * @tc.desc      formatSize(fraction=84) returns "840.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0080 begin`);
      const actual: string = formatSize(84);
      logInfo(`formatSize(fraction=84): actual=${actual}`);
      expect(actual).assertEqual('840.0MB');
      logInfo(`${BUNDLE}FormatSize_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0081
     * @tc.name      FilePreviewDLP_FormatSize_0081
     * @tc.desc      formatSize(fraction=66.39) returns "663.9MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0081 begin`);
      const actual: string = formatSize(66.39);
      logInfo(`formatSize(fraction=66.39): actual=${actual}`);
      expect(actual).assertEqual('663.9MB');
      logInfo(`${BUNDLE}FormatSize_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0082
     * @tc.name      FilePreviewDLP_FormatSize_0082
     * @tc.desc      formatSize(fraction=46.91) returns "469.1MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0082 begin`);
      const actual: string = formatSize(46.91);
      logInfo(`formatSize(fraction=46.91): actual=${actual}`);
      expect(actual).assertEqual('469.1MB');
      logInfo(`${BUNDLE}FormatSize_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0083
     * @tc.name      FilePreviewDLP_FormatSize_0083
     * @tc.desc      formatSize(fraction=4) returns "40.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0083 begin`);
      const actual: string = formatSize(4);
      logInfo(`formatSize(fraction=4): actual=${actual}`);
      expect(actual).assertEqual('40.0MB');
      logInfo(`${BUNDLE}FormatSize_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0084
     * @tc.name      FilePreviewDLP_FormatSize_0084
     * @tc.desc      formatSize(fraction=81) returns "810.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0084 begin`);
      const actual: string = formatSize(81);
      logInfo(`formatSize(fraction=81): actual=${actual}`);
      expect(actual).assertEqual('810.0MB');
      logInfo(`${BUNDLE}FormatSize_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0085
     * @tc.name      FilePreviewDLP_FormatSize_0085
     * @tc.desc      formatSize(fraction=151) returns "1510.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0085 begin`);
      const actual: string = formatSize(151);
      logInfo(`formatSize(fraction=151): actual=${actual}`);
      expect(actual).assertEqual('1510.0MB');
      logInfo(`${BUNDLE}FormatSize_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0086
     * @tc.name      FilePreviewDLP_FormatSize_0086
     * @tc.desc      formatSize(fraction=17.87) returns "178.7MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0086 begin`);
      const actual: string = formatSize(17.87);
      logInfo(`formatSize(fraction=17.87): actual=${actual}`);
      expect(actual).assertEqual('178.7MB');
      logInfo(`${BUNDLE}FormatSize_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0087
     * @tc.name      FilePreviewDLP_FormatSize_0087
     * @tc.desc      formatSize(fraction=61.6) returns "616.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0087 begin`);
      const actual: string = formatSize(61.6);
      logInfo(`formatSize(fraction=61.6): actual=${actual}`);
      expect(actual).assertEqual('616.0MB');
      logInfo(`${BUNDLE}FormatSize_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0088
     * @tc.name      FilePreviewDLP_FormatSize_0088
     * @tc.desc      formatSize(fraction=65.71) returns "657.1MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0088 begin`);
      const actual: string = formatSize(65.71);
      logInfo(`formatSize(fraction=65.71): actual=${actual}`);
      expect(actual).assertEqual('657.1MB');
      logInfo(`${BUNDLE}FormatSize_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0089
     * @tc.name      FilePreviewDLP_FormatSize_0089
     * @tc.desc      formatSize(fraction=7.04) returns "70.4MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0089 begin`);
      const actual: string = formatSize(7.04);
      logInfo(`formatSize(fraction=7.04): actual=${actual}`);
      expect(actual).assertEqual('70.4MB');
      logInfo(`${BUNDLE}FormatSize_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0090
     * @tc.name      FilePreviewDLP_FormatSize_0090
     * @tc.desc      formatSize(fraction=191) returns "1910.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0090 begin`);
      const actual: string = formatSize(191);
      logInfo(`formatSize(fraction=191): actual=${actual}`);
      expect(actual).assertEqual('1910.0MB');
      logInfo(`${BUNDLE}FormatSize_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0091
     * @tc.name      FilePreviewDLP_FormatSize_0091
     * @tc.desc      formatSize(fraction=87.28) returns "872.8MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0091 begin`);
      const actual: string = formatSize(87.28);
      logInfo(`formatSize(fraction=87.28): actual=${actual}`);
      expect(actual).assertEqual('872.8MB');
      logInfo(`${BUNDLE}FormatSize_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0092
     * @tc.name      FilePreviewDLP_FormatSize_0092
     * @tc.desc      formatSize(fraction=158) returns "1580.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0092 begin`);
      const actual: string = formatSize(158);
      logInfo(`formatSize(fraction=158): actual=${actual}`);
      expect(actual).assertEqual('1580.0MB');
      logInfo(`${BUNDLE}FormatSize_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0093
     * @tc.name      FilePreviewDLP_FormatSize_0093
     * @tc.desc      formatSize(fraction=36.91) returns "369.1MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0093 begin`);
      const actual: string = formatSize(36.91);
      logInfo(`formatSize(fraction=36.91): actual=${actual}`);
      expect(actual).assertEqual('369.1MB');
      logInfo(`${BUNDLE}FormatSize_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0094
     * @tc.name      FilePreviewDLP_FormatSize_0094
     * @tc.desc      formatSize(fraction=66) returns "660.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0094 begin`);
      const actual: string = formatSize(66);
      logInfo(`formatSize(fraction=66): actual=${actual}`);
      expect(actual).assertEqual('660.0MB');
      logInfo(`${BUNDLE}FormatSize_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0095
     * @tc.name      FilePreviewDLP_FormatSize_0095
     * @tc.desc      formatSize(fraction=148) returns "1480.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_FormatSize_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FormatSize_0095 begin`);
      const actual: string = formatSize(148);
      logInfo(`formatSize(fraction=148): actual=${actual}`);
      expect(actual).assertEqual('1480.0MB');
      logInfo(`${BUNDLE}FormatSize_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_FORMAT_SIZE_0096
     * @tc.name      FilePreviewDLP_FormatSize_0096
     * @tc.desc      formatSize(fraction=-73) returns "-730.0MB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_FormatSize_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FormatSize_0096 begin`);
      const actual: string = formatSize(-73);
      logInfo(`formatSize(fraction=-73): actual=${actual}`);
      expect(actual).assertEqual('-730.0MB');
      logInfo(`${BUNDLE}FormatSize_0096 end`);
    });
  });
}
